package com.cf.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.lang.BooleanUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @Description 功能描述:Json工具类
 * 
 * @author 郑伟彬
 * @date 2013-1-31 下午4:29:34
 */

public class JsonUtil {
	/**
	 * @Description: json字符串转成Java的Array数组
	 * @param json
	 * @param clazz
	 * @return Object[]
	 */
	@SuppressWarnings("rawtypes")
	public static Object[] readJSON2Array(String json, Class clazz) {
		JSONArray jsonArray = JSONArray.fromObject(json);
		Object[] infoList = (Object[]) JSONArray.toArray(jsonArray, clazz);
		return infoList;
	}

	/**
	 * @Description: JSON字符串转成Java的List集合
	 * @param json
	 * @param clazz
	 * @return List<?>
	 */
	@SuppressWarnings("rawtypes")
	public static List<?> readJSON2List(String json, Class clazz) {
		JSONArray jsonArray = JSONArray.fromObject(json);
		List<?> infoList = JSONArray.toList(jsonArray, clazz);
		return infoList;
	}

	/**
	 * @Description: JSON对象反序列化成Java对象
	 * @param json
	 * @param clazz
	 * @return bean
	 */
	@SuppressWarnings("rawtypes")
	public static Object readJSON2Bean(String json, Class clazz) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		Object bean = JSONObject.toBean(jsonObject, clazz);
		return bean;
	}
	
	/**
	 * @Description: JSON对象反序列化成Java对象
	 * @param json
	 * @param clazz
	 * @param classMap
	 * @return bean
	 */
	@SuppressWarnings("rawtypes")
	public static Object readJSON2Bean(String json, Class clazz, Map<String,Class> classMap) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		Object bean = JSONObject.toBean(jsonObject, clazz, classMap);
		return bean;
	}

	
	/**
	 * @Description: JSON对象反序列化成Java对象
	 * @param json
	 * @param clazz
	 * @return bean
	 */
	@SuppressWarnings("rawtypes")
	public static Object getObjectByJsonString(String json, Class clazz) {
		Object bean = null;
		 JSONObject jsonobject = JSONObject.fromObject(json);
		
		return bean;
	}
	
	 /**
     * 将JSONArray对象转换成Map-List集合
     * @param jsonArr
     * @return
     */
    public static Object JsonToList(JSONArray jsonArr){
        List<Object> jsonObjList = new ArrayList<Object> ();
        for(Object obj : jsonArr){
            if(obj instanceof JSONArray){
                jsonObjList.add(JsonToList((JSONArray) obj));
            } else if(obj instanceof JSONObject){
                jsonObjList.add(jsonToMap((JSONObject) obj));
            }else{
                jsonObjList.add(obj);
            }
        }
        return jsonObjList;
    }
	
    /**
     *  将JSONObjec对象转换成Map-List集合
     * @param json
     * @return
     */
     public static Map<String, Object> jsonToMap(JSONObject json){
         Map<String,Object> columnValMap = new HashMap<String,Object>();
         Set<Object> jsonKeys = json.keySet();
         for (Object key : jsonKeys) {
             Object JsonValObj = json.get(key);
             if(JsonValObj instanceof JSONArray){
                columnValMap.put((String)key,  JsonToList((JSONArray) JsonValObj));
             }else if(key instanceof JSONObject){
                columnValMap.put((String)key,  jsonToMap((JSONObject) JsonValObj));
             }else{
                 columnValMap.put((String)key,JsonValObj);
             }
        }
         return columnValMap;
     }
     
     /**
      * 将json对象转换为map集合，通过此方法获取存放map集合键的list集合
      * @param obj
      * @return
      */
     public static List<Object> mapKeys(Object obj){
         List<Object> keysList = new ArrayList<Object>();
         Map<String,Object> columnValMap = new HashMap<String,Object>();
         String columnStr = "column";
         if(obj instanceof JSONArray){
             List<Map<String, Object>> jsonObjList = new ArrayList<Map<String, Object>> ();
             jsonObjList = (List<Map<String, Object>>) JsonToList((JSONArray) obj);
             columnValMap =(Map<String, Object>) (jsonObjList.get(0));
             //以上三句可优化为如下一句
             //columnValMap =(Map<String, Object>)(((List<Object>)JsonToList((JSONArray) obj)).get(0));
         }else if(obj instanceof JSONObject){
             columnValMap =jsonToMap((JSONObject) obj);
         }else{
             keysList.add(obj);
         }
         for(int i=0;i<columnValMap.keySet().size();i++){
             keysList.add(columnStr+(i+1));
         }
         System.out.println(keysList.size());
         return keysList;
     }

	/**
	 * @Description: 生成json格式串
	 * @param 实体类bean
	 * @param isSeri
	 *          :ture序列化flase不序列化
	 * @return 
	 *         {"key1":"value1","key2":"value2"}格式，isFix:true前后有[],isFix:false前后无[]
	 */
	public static String writeBean2JSON(Object bean, boolean isSeri, boolean isFix) {
		if (bean == null) {
			return null;
		}
		String jsonStr = null;
		if (BooleanUtils.isTrue(isSeri)) {
			jsonStr = JSONSerializer.toJSON(bean).toString();
			if (BooleanUtils.isTrue(isFix)) {
				jsonStr = "[" + jsonStr + "]";
			}
		} else {
			if (BooleanUtils.isTrue(isFix)) {
				jsonStr = JSONArray.fromObject(bean).toString();
			} else {
				jsonStr = JSONObject.fromObject(bean).toString();
			}
		}
		return jsonStr;
	}

	/**
	 * 
	 * @Description:List生成Json
	 * @param 参数list数组
	 * @param isSeri
	 *          :ture序列化flase不序列化
	 * @return
	 */
	public static String writeList2JSON(List<?> list, boolean isSeri,
			boolean isFix) {
		if (list == null) {
			return null;
		}
		String jsonStr = null;
		if (BooleanUtils.isTrue(isSeri)) {// 需要序列化
			jsonStr = JSONSerializer.toJSON(list).toString();
			if (BooleanUtils.isTrue(isFix)) {
				jsonStr = "[" + jsonStr + "]";
			}
		} else {
			if (BooleanUtils.isTrue(isFix)) {
				jsonStr = JSONArray.fromObject(list).toString();
			} else {
				jsonStr = JSONObject.fromObject(list).toString();
			}
		}
		return jsonStr;
	}

	/**
	 * @Description:Map生成Json
	 * @param 参数map集合
	 * @param isSeri
	 *          :ture序列化flase不序列化
	 * @param isFix
	 *          :true前后有[],false无
	 * @return
	 * @date 2013-1-31 下午5:04:54
	 */
	public static String writeMap2JSON(Map<String, Object> map, boolean isSeri, boolean isFix) {
		String jsonStr = null;
		if (BooleanUtils.isTrue(isSeri)) {// 序列化
			jsonStr = JSONSerializer.toJSON(map).toString();
			if (BooleanUtils.isTrue(isFix)) {
				jsonStr = "[" + jsonStr + "]";
			}
		} else {
			if (BooleanUtils.isTrue(isFix)) {
				jsonStr = JSONArray.fromObject(map).toString();
			} else {
				jsonStr = JSONObject.fromObject(map).toString();
			}
		}
		return jsonStr;
	}
	
	public static String toJson(Object object) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		try {
			return mapper.writeValueAsString(object);
		} catch (JsonProcessingException e) {
			return "";
		}
	}
	
	/** 
     * JSON字符串特殊字符处理，比如：“\A1;1300” 
     * @param s 
     * @return String 
     */  
    public static String string2Json(String s) {        
        StringBuffer sb = new StringBuffer();        
        for (int i=0; i<s.length(); i++) {  
            char c = s.charAt(i);    
             switch (c){  
             case '\"':        
                 sb.append("\\\"");        
                 break;        
             case '\\':        
                 sb.append("\\\\");        
                 break;        
             case '/':        
                 sb.append("\\/");        
                 break;        
             case '\b':        
                 sb.append("\\b");        
                 break;        
             case '\f':        
                 sb.append("\\f");        
                 break;        
             case '\n':        
                 sb.append("\\n");        
                 break;        
             case '\r':        
                 sb.append("\\r");        
                 break;        
             case '\t':        
                 sb.append("\\t");        
                 break;   
             default:        
                 sb.append(c);     
             }  
         }      
        return sb.toString();     
        }  
}
