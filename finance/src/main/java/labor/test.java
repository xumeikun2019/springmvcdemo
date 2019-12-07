package labor;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;

import com.cf.util.CommonUploader;

public class test {

	public static void main(String[] args) {
		System.out.println("1111111111111111111111");
//		xthd();
//		cxry();
//		tjkp();
		scry();
	}
	/**
	 * 给考勤设备添加人员
	 * @author Administrator
	 *
	 */
	public static void tjry(){
		String ip="192.168.0.215";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/person/create");
		postmethod.setParameter("pass", "12345678");
		String person="{\"id\":\"11011\",\"name\":\"测试11\",\"idcardNum\":\"370322199509061316\"} ";
		postmethod.setParameter("person", person);
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
	}
	/**
	 * 给考勤设备人员添加卡片信息
	 * @author Administrator
	 *
	 */
	public static void tjkp(){
		String ip="192.168.0.215";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/face/icCardRegist");
		postmethod.setParameter("pass", "12345678");
		postmethod.setParameter("personId", "00e2632dfec811e9b7ff00e081bbbd32");
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
	}
	/**
	 * 给考勤设备设置心跳回调地址
	 * @author Administrator
	 *
	 */
	public static void xthd(){
		String ip="192.168.0.214";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/setDeviceHeartBeat");
		postmethod.setParameter("pass", "12345678");
		postmethod.setParameter("url", "http://192.168.0.6:8080/finance/api/attendance/device/state");
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
	}

	/**
	 * 给考勤设备设置密码
	 * @author Administrator
	 *
	 */
	public void szmm(){
		String ip="192.168.0.213";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/setPassWord");
		postmethod.setParameter("oldPass", "12345678");
		postmethod.setParameter("newPass", "12345678");
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
	}
	/**
	 * 给考勤设备设置识别回调地址
	 * @param postMethod
	 * @return
	 */
	public static void htdz(){
		String callbackUrl="http://192.168.0.121:8080/finance/service/sbhd.do";
		String ip="192.168.0.214";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/setIdentifyCallBack");
		postmethod.setParameter("pass", "12345678");
		postmethod.setParameter("callbackUrl", callbackUrl);
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
	}
	/**
	 * 考勤设备配置
	 * @param postMethod
	 * @return
	 */
	public static void sbpz(){
		String config="{\"saveIdentifyTime\":\"900\",\"ttsModType\":\"2\"}";//900 秒内多次识别只记 录一次;语音播报姓名
		String ip="192.168.0.214";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/setConfig");
		postmethod.setParameter("pass", "12345678");
		postmethod.setParameter("config", config);
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
	}
	/**
	 * 考勤设备删除人员
	 * @param postMethod
	 * @return
	 */
	public static void scry(){
		String ip="192.168.0.214";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/person/delete");
		postmethod.setParameter("pass", "12345678");
		postmethod.setParameter("id", "-1");
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
	}
	/**
	 * 查询人员
	 * @param postMethod
	 * @return
	 */
	public static void cxry(){
		String ip="192.168.0.214";
		PostMethod postmethod=null;
		postmethod=new PostMethod("http://"+ip+":8090/person/find");
		postmethod.setParameter("pass", "12345678");
		postmethod.setParameter("id", "-1");
		String fcjoStr=httpPost(postmethod);
		System.out.println(fcjoStr);
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
