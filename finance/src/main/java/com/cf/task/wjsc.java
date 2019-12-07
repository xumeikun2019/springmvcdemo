package com.cf.task;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cf.project.mybatis.dao.CMeetingOrderMapper;
@Service 
public class wjsc {
	@Autowired
	private CMeetingOrderMapper cMeetingOrderMapper;
	/**
	 * 定时删除服务器上的会议资料(每天01:00执行)
	 */

	public void wjsc() {
		//查询需要删除的文件
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String sj=sdf.format(new Date());
		System.out.println("sj=="+sj);
		List<Map<String, Object>> wjlist = cMeetingOrderMapper.findwjsc();
		for(int i=0;i<wjlist.size();i++) {
			File file = new File(wjlist.get(i).get("hyzl").toString());  
			if (file.isFile() && file.exists()) {  
				file.delete(); 
			}  
		}
	}

}
