package com.cf.util.push;

public class PushUtil {

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
}
