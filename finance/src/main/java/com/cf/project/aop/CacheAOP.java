package com.cf.project.aop;

import com.cf.project.annotation.CacheClear;
import com.cf.project.redis.RedisUtil;
import com.cf.util.EntyPage;
import com.cf.util.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by towery on 2018/10/10.
 */
@Component
@Aspect
public class CacheAOP {
    private static final Logger logger = LoggerFactory.getLogger(CacheAOP.class);

    @Autowired
    private RedisUtil redisUtil;

  //  @Pointcut("execution(* *..dao..*Mapper.*HD*(..)) || @annotation(com.cf.project.annotation.Cache)")
//    @Pointcut("execution(* *..dao..*Mapper.*HD*(..))")
//    @Pointcut("execution(* *..service..*Service.*find*(..))")
    //@Pointcut("execution(* com.cf.project.service..*Service.find*(..))")
    @Pointcut("@annotation(com.cf.project.annotation.Cache)")
    public void pointcut(){}

    @Pointcut("@annotation(com.cf.project.annotation.CacheClear)")
    public void cacheClear(){}

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        //获取目标方法参数
        Object[] args = joinPoint.getArgs();
        String applId = "";
        StringBuilder builder = new StringBuilder();
        if (args != null && args.length > 0) {
        	builder.append(".");
            for(Object arg : args){
               if (arg instanceof Map) {
                   Map<String,Object> map = (Map<String,Object>)arg;
                   for (Map.Entry<String, Object> entry : map.entrySet()) {
                  //     System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
                       String key = entry.getKey();
                       Object value = entry.getValue();
                       // 兼容dataTables
                       if (!StringUtils.equals(key, "draw") && !StringUtils.equals(key, "page")) {
                    	   builder.append(key).append(StringUtil.checkCountName(value.toString()) ? string2Unicode(value.toString()) : value.toString());
                       }
                       
                       if (value instanceof Map) {
                           Map<String,Object> paramMap = (Map<String,Object>)value;
                           for (Map.Entry<String, Object> paramEntry : paramMap.entrySet()) {
                             //  System.out.println("Key = " + paramEntry.getKey() + ", Value = " + paramEntry.getValue());
                               String paramkey = paramEntry.getKey();
                               String paramValue = paramEntry.getValue().toString();
                               builder.append(paramkey).append(StringUtil.checkCountName(paramValue) ? paramValue : string2Unicode(paramValue));
                           }
                       } 
                   }
               } else {
            	   if (arg != null) {
            		   builder.append(arg.toString());
            	   }
               }
            }
            applId = builder.toString();
        }

      //  logger.debug("applId----------------" + applId);

        // 请求类名称
        String targetName = joinPoint.getTarget().getClass().getName();
        // 请求方法
        String methodName = joinPoint.getSignature().getName();

        //redis中key格式：请求类名称 + 请求方法 + 目标方法参数
        String redisKey = targetName + methodName + applId;
        logger.info("调用从缓存中查询的方法(search cache)，cacheKey=" + redisKey);
        //获取从redis中查询到的对象
        Object objectFromRedis;
		try {
			objectFromRedis = redisUtil.getData4Object2Redis(redisKey);
			 //如果查询到了
	        if(null != objectFromRedis){
	            logger.info("从缓存中获取数据(from cache)，cacheKey=" + redisKey);
	            Map<String,Object> cacheMap = (Map<String,Object>)objectFromRedis;
	            if (cacheMap.containsKey("page")) {
	            	EntyPage cachePage = (EntyPage)cacheMap.get("page");
	            	for(Object arg : args){
	                    if (arg instanceof Map) {
	                    	 Map<String,Object> map = (Map<String,Object>)arg;
	                    	 EntyPage page = (EntyPage)map.get("page");
	                    	 page.setTotalNumber(cachePage.getTotalNumber());
	                    	 break;
	                    }
	                }
	            }
	            
	            Object dataObj = cacheMap.get("data");
	            return dataObj;
	        }
	        
	        logger.info("没有从缓存中查到数据(no data from cache)");

	        //前置 没有查到，那么查询数据库
	        Object object = null;
	        object = joinPoint.proceed(args);
	        
	        Map<String,Object> resultMap = new HashMap<String, Object>();
	        resultMap.put("data", object);
	        
	        // 添加分页数据
	        for(Object arg : args){
	            if (arg instanceof Map) {
	            	 Map<String,Object> map = (Map<String,Object>)arg;
	            	 if (map.containsKey("page")) {
	            		 EntyPage page = (EntyPage)map.get("page");
	                	 resultMap.put("page", page);
	            	 }
	            	 break;
	            }
	        }
	                
	        //后置：将数据库中查询的数据放到redis中
	        logger.info("把数据库查询的数据存储到缓存中(put data to cache)");

//	        redisUtil.setData4Object2Redis(redisKey, object);
	        redisUtil.setData4Object2Redis(redisKey, resultMap);
	        //将查询到的数据返回
	        return object;
	        
		} catch (Exception e) {
			logger.info("缓存获取失败，从数据库获取数据(cache from fail,search in database)");
			Object object = null;
			object = joinPoint.proceed(args);
			return object;
		} 
    }

    @After(value = "cacheClear() && @annotation(cacheClear)", argNames = "joinPoint, cacheClear")
    public void methodAfter(JoinPoint joinPoint, CacheClear cacheClear) throws Throwable {
    	String targetName = joinPoint.getTarget().getClass().getSimpleName();
        if (StringUtils.isNotBlank(targetName)) {
        	targetName = StringUtils.replace(targetName, "ServiceImpl", "");
        }
        String cacheKey = cacheClear.key();
        if (StringUtils.isNotBlank(cacheKey)) {
            targetName = cacheKey;
        }
        try {
			redisUtil.deleteKeyByContain(targetName);
		} catch (Exception e) {
			logger.info("key包含" + targetName + "的缓存清除失败(cache clean fail)");
		}
    }

    private String string2Unicode(String string) {
        StringBuffer unicode = new StringBuffer();
        for (int i = 0; i < string.length(); i++) {
            // 取出每一个字符
            char c = string.charAt(i);
            // 转换为unicode
            unicode.append("\\u" + Integer.toHexString(c));
        }
        return unicode.toString();
    }
}
