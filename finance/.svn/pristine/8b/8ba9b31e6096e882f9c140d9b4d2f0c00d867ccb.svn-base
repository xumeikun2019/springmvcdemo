package com.cf.project.redis;


import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cf.util.SerializeUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * Redis连接池工具类
 */
@Component("redisPool")
public class RedisPool implements RedisUtil {

	private static final Logger logger = LoggerFactory.getLogger(RedisPool.class);
	
	private static final int EXPIRETIME = 86400; // 一天
	
    @Autowired
    private JedisPool jedisPool;

    /** 
     * 获取Jedis对象 
     * @return 
     */  
    private synchronized Jedis getJedis(){  
        Jedis jedis = null;  
        if(jedisPool != null){  
            try{  
                if(jedis == null ){  
                     jedis = jedisPool.getResource();  
                }  
            }catch(Exception e){  
                logger.error(e.getMessage(),e);  
            }  
        }  
        return jedis;  
    }  
    
    /** 
     * 回收Jedis对象资源 
     * @param jedis 
     */  
    @SuppressWarnings("deprecation")
	private synchronized void releaseJedis(Jedis jedis){  
        if(jedis != null){  
        	jedisPool.returnResourceObject(jedis);
        }  
    }  
    
   /* private RedisPool() {
    	
    }

    private static class RedisUtilHolder {
        private static RedisPool instance = new RedisPool();
    }

    public static RedisPool getInstance() {
        return RedisUtilHolder.instance;
    }

    */
    public void set(String key, String value) {
        Jedis jedis = this.getJedis();
        //jedis.set(key, value);
        jedis.setex(key, EXPIRETIME, value);
        this.releaseJedis(jedis);
    }
    
    public void setData4Object2Redis(String key, Object object) {
        //序列化
        byte[] bytes = SerializeUtil.serialize(object);

        //存入redis
        Jedis jedis = this.getJedis();
        //jedis.set(key.getBytes(), bytes);
        jedis.setex(key.getBytes(), EXPIRETIME, bytes);
        this.releaseJedis(jedis);
    }


    public Object getData4Object2Redis(String key) {
        //查询
        Jedis jedis = this.getJedis();
        byte[] result = jedis.get(key.getBytes());
        this.releaseJedis(jedis);
        //如果查询没有为空
        if(null == result){
            return null;
        }
        //查询到了，反序列化
        return SerializeUtil.unSerialize(result);

    }

    public void set(String key, String value, Integer seconds) {
        Jedis jedis = this.getJedis();
        jedis.set(key, value);
        jedis.expire(key, seconds);
        this.releaseJedis(jedis);
    }

    public String get(String key) {
        Jedis jedis = this.getJedis();
        String result = jedis.get(key);
        this.releaseJedis(jedis);
        return result;
    }

    public void del(String key) {
        Jedis jedis = this.getJedis();
        jedis.del(key);
        this.releaseJedis(jedis);
    }

    /**
     * 删除匹配的key<br>
     * 如以my为前缀的则 参数为"my*"
     * @param key
     */
    private void deleteKeys(String pattern){
        //列出所有匹配的key
        Jedis jedis = this.getJedis();
        Set<String> keySet = jedis.keys(pattern);
        this.releaseJedis(jedis);
        if(keySet == null || keySet.size()<=0){
            return;
        }
        String keyArr[] = new String[keySet.size()];
        int i =0;
        for (String keys : keySet) {
            keyArr[i] = keys;
            i++;
        }
        
        deleteKey(keyArr);
    }

     /* 删除key，可以是一个，也可以是多个key
	 * @param keys
	 */
    private void deleteKey(String ... keys ){
        Jedis jedis = this.getJedis();
        jedis.del(keys);
        this.releaseJedis(jedis);
    }

    /**
     * 删除前缀为{参数}的所有key
     * @param prefix
     */
    public void deleteKeyByPrefix(String prefix){
        deleteKeys(prefix+"*");
    }


    /**
     * 删除包含{参数}的所有key
     * @param contain
     */
    public void deleteKeyByContain(String contain){
        deleteKeys("*"+contain+"*");
    }

    public void expire(String key, Integer seconds) {
        Jedis jedis = this.getJedis();
        jedis.expire(key, seconds);
        this.releaseJedis(jedis);
    }

    public Long incr(String key) {
        Jedis jedis = this.getJedis();
        Long count = jedis.incr(key);
        this.releaseJedis(jedis);
        return count;
    }

    /**
     * 获取Jedis连接
     *
     * @return Jedis连接
     */
    /*private Jedis getJedis() {
        return this.jedisPool.getResource();
    }*/

    
    /**
     * 释放Jedis连接,返还到连接池
     *
     * @param jedis
     *            jedis连接
     */
   /* private void releaseJedis(Jedis jedis) {
        jedis.close();
    }*/
}