package labor;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;

import sun.misc.BASE64Encoder;

public class test1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		System.out.println(ftpbase64("D:\\76731571736256820.jpg"));
		PostMethod postmethod=new PostMethod("http://192.168.0.213:8090/face/create");
		postmethod.setParameter("pass", "12345678");
		postmethod.setParameter("personId", "9e39a9dfad684967b431cb1a3f6c930e");
		postmethod.setParameter("faceId", "");
		postmethod.setParameter("imgBase64", ftpbase64("D:\\76731571736256820.jpg"));
		postmethod.setParameter("isEasyWay", "true");
		String fcjoStr=httpPost(postmethod);
		System.out.println("==="+fcjoStr);
//		return fcjoStr;
	}
	public static String ftpbase64(String file) {
    	FileInputStream fin=null;
        BufferedInputStream bin=null;
        ByteArrayOutputStream baos=null;
        BufferedOutputStream bout=null;
        BASE64Encoder encoder = new BASE64Encoder();  
        try{
        	fin=new FileInputStream(file);
            bin=new BufferedInputStream(fin);
            baos=new ByteArrayOutputStream();
            bout=new BufferedOutputStream(baos);
            byte[] buffer=new byte[1024];
            int len=bin.read(buffer);
            while(len!=-1){
                bout.write(buffer,0,len);
                len=bin.read(buffer);
            }
            //读取完毕
            bout.flush();
            byte[] bytes = baos.toByteArray();
            
            return encoder.encodeBuffer(bytes).trim();  
//            return res;
        }catch (Exception e) {
			// TODO: handle exception
		}finally {
			try{
                fin.close();
                bin.close();
                bout.close();
            }catch (IOException e){
                e.printStackTrace();
            }

		}
         
        return null;
    }
	 private static String httpPost(PostMethod postMethod){	
			String strRtn="";
			try{			
				HttpClient client =new HttpClient();
				client.getParams().setContentCharset("UTF-8");
				client.executeMethod(postMethod);
				strRtn=postMethod.getResponseBodyAsString();
			}catch(Exception e){
				
			}
			return strRtn;
		}
}
