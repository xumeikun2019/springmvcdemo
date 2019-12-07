package com.cf.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.net.ssl.HttpsURLConnection;

import com.alibaba.fastjson.JSONObject;

public class SendUtil {
	//获取access_token
	private final static String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&";
	//推送url
	//private final static String PUSH_URL = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=";
	
	//private final static String PUSH_URL = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=";
	private final static String PUSH_URL = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=";
	//根据code换取openId
	//本接口应在后端服务器调用
	private final static String CODE_URL = "https://api.weixin.qq.com/sns/jscode2session?appid=";
	
	private final static String APP_ID = "wxa37dffb91d9418b6"; 
	
	private final static String SECRET = "b47138c91da394cdbfc3d69fb3c0e05c";
	
	//private final static String DINING_TEMPLATE = "Os6zE29mvjZJE7a5YV5CW0v-7j__CqZFrzy3-ihlrmM";
	
	private final static String DINING_TEMPLATE = "ev_JctZJzjmA0klN8FqNNiIgGpd5HBdH24w5Rm2VSAE";
	public static String getOpenId(String codeId) {
		String url = CODE_URL + APP_ID + "&secret=" + SECRET + "&js_code=" + codeId + "&grant_type=authorization_code";
		PrintWriter out = null;
		BufferedReader in = null;
		String line;
		StringBuffer sb = new StringBuffer();
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();

			// 设置通用的请求属性 设置请求格式
			//设置返回类型
			conn.setRequestProperty("contentType", "text/plain");
			//设置请求类型
			conn.setRequestProperty("content-type", "application/x-www-form-urlencoded");
			//设置超时时间
			conn.setConnectTimeout(1000);
			conn.setReadTimeout(1000);
			conn.setDoOutput(true);
			conn.connect();
			// 获取URLConnection对象对应的输出流
			out = new PrintWriter(conn.getOutputStream());
			// flush输出流的缓冲
			out.flush();
			// 定义BufferedReader输入流来读取URL的响应    设置接收格式
			in = new BufferedReader(
					new InputStreamReader(conn.getInputStream(), "UTF-8"));
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			JSONObject jsonObject = JSONObject.parseObject(sb.toString());
			return jsonObject.get("openid").toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//使用finally块来关闭输出流、输入流
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}
	
	
	public static JSONObject getAccessToken() {
		String url = ACCESS_TOKEN_URL + "appid=" + APP_ID + "&secret=" + SECRET;
		PrintWriter out = null;
		BufferedReader in = null;
		String line;
		StringBuffer sb = new StringBuffer();
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();

			// 设置通用的请求属性 设置请求格式
			//设置返回类型
			conn.setRequestProperty("contentType", "text/plain");
			//设置请求类型
			conn.setRequestProperty("content-type", "application/x-www-form-urlencoded");
			//设置超时时间
			conn.setConnectTimeout(1000);
			conn.setReadTimeout(1000);
			conn.setDoOutput(true);
			conn.connect();
			// 获取URLConnection对象对应的输出流
			out = new PrintWriter(conn.getOutputStream());
			// flush输出流的缓冲
			out.flush();
			// 定义BufferedReader输入流来读取URL的响应    设置接收格式
			in = new BufferedReader(
					new InputStreamReader(conn.getInputStream(), "UTF-8"));
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			// 将获得的String对象转为JSON格式
			JSONObject jsonObject = JSONObject.parseObject(sb.toString());
			return jsonObject;
		} catch (Exception e) {
			e.printStackTrace();
		}
		//使用finally块来关闭输出流、输入流
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return null;
	}
	
	public static boolean setPush(String params, String accessToken) {
		boolean flag = false;
		String url = PUSH_URL + accessToken;
		OutputStream outputStream = null;
		InputStreamReader inputStreamReader = null;
		InputStream inputStream = null;
		BufferedReader bufferedReader = null;
		HttpsURLConnection connection = null;
		try {
			// 创建URL对象
			URL realUrl = new URL(url);
			// 打开连接 获取连接对象
			connection = (HttpsURLConnection) realUrl.openConnection();
			// 设置请求编码
			connection.addRequestProperty("encoding", "UTF-8");
			// 设置允许输入
			connection.setDoInput(true);
			// 设置允许输出
			connection.setDoOutput(true);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("content-type", "application/x-www-form-urlencoded");
			// 当outputStr不为null时向输出流写数据
			if (null != params) {
				System.out.println(params);
				outputStream = connection.getOutputStream();
				// 注意编码格式
				outputStream.write(params.getBytes("UTF-8"));
				outputStream.close();
			}
			// 从输入流读取返回内容
			inputStream = connection.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			StringBuffer buffer = new StringBuffer();
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			JSONObject jsonObject = JSONObject.parseObject(buffer.toString());
			int errorCode = jsonObject.getInteger("errcode");
			String errorMessage = jsonObject.getString("errmsg");
			if (errorCode == 0) {
				flag = true;
			} else {
				
				System.out.println("模板消息发送失败:" + errorCode + "," + errorMessage);
				flag = false;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 依次关闭打开的输入流
			try {
				connection.disconnect();
				bufferedReader.close();
				inputStreamReader.close();
				inputStream.close();
				// 依次关闭打开的输出流
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	/**
	 * 发送模板消息
	 * 
	 * @param openId
	 *
	 * @param title 会议名称
	 * @param keyword1 会议时间
	 * @param keyword2 会议地点
	 * @param keyword3 会议主持人
	 * @param keyword4 会议内容
	 * @return
	 */
	public boolean pushNoticeUtil(String openId,  String title,String keyword1, String keyword2, String keyword3, String keyword4) {
		JSONObject jsonObject = getAccessToken();
		JSONObject jsonObject1 = new JSONObject();
		jsonObject1.put("touser", openId);
		// DINING_TEMPLATE 模板Id  微信公众平台添加模板时生成的ID
		jsonObject1.put("template_id", DINING_TEMPLATE);
	
		//jsonObject1.put("form_id", formId);
		JSONObject jsonObject2 = new JSONObject();
		JSONObject jsonObject3 = new JSONObject();
		//小程序链接
		jsonObject2.put("appid", "wxf6895363b78538f5");
		jsonObject2.put("page", "pages/login/login");
		jsonObject1.put("miniprogram", jsonObject2);
		jsonObject2 = new JSONObject();
		jsonObject3.put("value", keyword1);
		jsonObject2.put("keyword1", jsonObject3);
		jsonObject3 = new JSONObject();
		jsonObject3.put("value", keyword2);
		jsonObject2.put("keyword2", jsonObject3);
		jsonObject3 = new JSONObject();
		jsonObject3.put("value", keyword3);
		jsonObject2.put("keyword3", jsonObject3);
		jsonObject3 = new JSONObject();
		jsonObject3.put("value", keyword4);
		jsonObject2.put("keyword4", jsonObject3);
		jsonObject3 = new JSONObject();
		jsonObject3.put("value", title);
		jsonObject2.put("first", jsonObject3);
		
		
		jsonObject1.put("data", jsonObject2);
		boolean pushResult = setPush(jsonObject1.toString(), jsonObject.get("access_token").toString());
		System.out.println("结束");
		return pushResult;
	}


}
