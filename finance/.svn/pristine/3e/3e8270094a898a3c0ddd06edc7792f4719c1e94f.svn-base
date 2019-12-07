package com.cf.util.push;

import javax.json.JsonObject;

import com.cf.util.JsonUtil;
import com.sun.javafx.collections.MappingChange.Map;

import net.sf.json.JSONObject;

public class Test {

	public static String sendAndroidUnicasts(String appkey, String appMasterSecret, String deviceToken, String pushUrl, String pushText) throws Exception {
		AndroidUnicast unicast = new AndroidUnicast(appkey,appMasterSecret);
		unicast.setDeviceToken(deviceToken);
		unicast.setTicker("update");
		unicast.setTitle("update");
		unicast.setText(pushText);
		unicast.goCustomAfterOpen("");
		//unicast.goActivityAfterOpen("com.monitorsl.hikvision.open.app.PreviewActivity");
		unicast.setDisplayType(AndroidNotification.DisplayType.MESSAGE);
		unicast.setProductionMode();
		unicast.setExtraField("info", "update");
		return PushClient.send(unicast);
	}
	
	public static void main(String[] args) {
		try {
			String result = sendAndroidUnicasts("5dc3b71b3fc19511fd000609","z7szjlzbomj4jj7rxhue1bxy2lvi3uyw","Ahan1wG3GyXC2yv0cbT3ErTXs-dAPWg8tbD2OdpfUeWM","","");
			JSONObject jsonObject = JSONObject.fromObject(result);
			String ret = (String)jsonObject.get("ret");
			System.out.println(ret);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
