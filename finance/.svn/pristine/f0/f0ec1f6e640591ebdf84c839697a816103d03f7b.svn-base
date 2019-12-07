package com.cf.project.controller.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cf.project.redis.RedisUtil;
import com.cf.util.Doc2HtmlUtil;
import com.cf.util.JsonResult;
@Controller
@RequestMapping("/download")
public class DownLoadController {
	
	@Autowired
	private RedisUtil redisUtil;
	
	
    @RequestMapping("/fileDownLoad")
    public ResponseEntity<byte[]> fileDownLoad(HttpServletRequest request,String originalName,String path) throws Exception{
     
      ServletContext servletContext = request.getServletContext();
      String realPath = servletContext.getRealPath("/upload/"+path);//得到文件所在位置
        InputStream in=new FileInputStream(new File(realPath));//将该文件加入到输入流之中
         byte[] body=null;
         body=new byte[in.available()];// 返回下一次对此输入流调用的方法可以不受阻塞地从此输入流读取（或跳过）的估计剩余字节数
         in.read(body);//读入到输入流里面
        
        originalName = new String(originalName.getBytes("gbk"),"iso8859-1");//防止中文乱码
        HttpHeaders headers=new HttpHeaders();//设置响应头
        headers.add("Content-Disposition", "attachment;filename="+originalName);
        HttpStatus statusCode = HttpStatus.OK;//设置响应吗
        ResponseEntity<byte[]> response=new ResponseEntity<byte[]>(body, headers, statusCode);
        return response;

        //public ResponseEntity（T  body，
        //                       MultiValueMap < String，String > headers，
        //                       HttpStatus  statusCode）
        //HttpEntity使用给定的正文，标题和状态代码创建一个新的。
        //参数：
        //body - 实体机构
        //headers - 实体头
        //statusCode - 状态码
    }
    @RequestMapping("/fileDownLoad3")
    public ResponseEntity<byte[]> fileDownLoad3(HttpServletRequest request,String originalName,String path) throws Exception{
     
      ServletContext servletContext = request.getServletContext();
      String realPath = servletContext.getRealPath("/upload/common/"+path);//得到文件所在位置
        InputStream in=new FileInputStream(new File(realPath));//将该文件加入到输入流之中
         byte[] body=null;
         body=new byte[in.available()];// 返回下一次对此输入流调用的方法可以不受阻塞地从此输入流读取（或跳过）的估计剩余字节数
         in.read(body);//读入到输入流里面
        
        originalName = new String(originalName.getBytes("gbk"),"iso8859-1");//防止中文乱码
        HttpHeaders headers=new HttpHeaders();//设置响应头
        headers.add("Content-Disposition", "attachment;filename="+originalName);
        HttpStatus statusCode = HttpStatus.OK;//设置响应吗
        ResponseEntity<byte[]> response=new ResponseEntity<byte[]>(body, headers, statusCode);
        return response;

        //public ResponseEntity（T  body，
        //                       MultiValueMap < String，String > headers，
        //                       HttpStatus  statusCode）
        //HttpEntity使用给定的正文，标题和状态代码创建一个新的。
        //参数：
        //body - 实体机构
        //headers - 实体头
        //statusCode - 状态码
    }
    @RequestMapping("/fileDownLoad2")
		public String download( String originalName ,String path, HttpServletRequest request, HttpServletResponse response){
					 
			response.setContentType("text/html;charset=utf-8");
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
					
			java.io.BufferedInputStream bis = null;
			java.io.BufferedOutputStream bos = null;
		
			String downLoadPath = "/upload/common/"+path;  //注意不同系统的分隔符
			//downLoadPath =downLoadPath.replaceAll("/", "\\\\\\\\");   //replace replaceAll区别 *****  
			System.out.println(downLoadPath);
			
			try {
				long fileLength = new File(downLoadPath).length();
				response.setContentType("application/x-msdownload;");
				response.setHeader("Content-disposition", "attachment; filename=" + new String(originalName.getBytes("utf-8"), "ISO8859-1"));
				response.setHeader("Content-Length", String.valueOf(fileLength));
				bis = new BufferedInputStream(new FileInputStream(downLoadPath));
				bos = new BufferedOutputStream(response.getOutputStream());
				byte[] buff = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
					bos.write(buff, 0, bytesRead);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (bis != null)
					try {
						bis.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				if (bos != null)
					try {
						bos.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
			return null;	
		}
    
	@SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value= "/convertOffice",method = RequestMethod.POST)
    public JsonResult test(HttpServletRequest request, String path) {
    	ServletContext servletContext = request.getServletContext();
        String realPath = servletContext.getRealPath("/upload/common/"+path);//得到文件所在位置
        String convertPath = servletContext.getRealPath("/upload/convert");
        String type = path.split("\\.")[1];
    	Doc2HtmlUtil Doc2HtmlUtil = new Doc2HtmlUtil();
		Doc2HtmlUtil coc2HtmlUtil = Doc2HtmlUtil.getDoc2HtmlUtilInstance();
        FileInputStream fileInputStream = null;
    	JsonResult result = new JsonResult();
    	String redisKey = path;
    	Object objectFromRedis;
    	System.out.println( "调用从缓存中查询的方法(search cache)，cacheKey=" + redisKey);
		objectFromRedis = redisUtil.getData4Object2Redis(redisKey);
		if (null != objectFromRedis) {
		
			Map<String,Object> cacheMap = (Map<String,Object>)objectFromRedis;
			result.setMessage("" + cacheMap.get("path"));
			return result;
		}
		System.out.println( "没有从缓存中查到数据(no data from cache)");
    	try {
 			fileInputStream = new FileInputStream(new File(realPath));
 	        String fileName = coc2HtmlUtil.file2pdf(fileInputStream, convertPath, type);
 	        result.setMessage(fileName);
 	        Map<String,Object> resultMap = new HashMap<String, Object>();
	        resultMap.put("path", fileName);
	        System.out.println( "添加缓存(add cache)");
	        redisUtil.setData4Object2Redis(redisKey, resultMap);
 		} catch (FileNotFoundException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		} catch (IOException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
    	
        
    	return result;
    }
    
	    
}