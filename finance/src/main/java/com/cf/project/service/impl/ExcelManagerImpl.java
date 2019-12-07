package com.cf.project.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.cf.project.service.ExcelManager;
import com.cf.util.DateTimeUtil;
import com.cf.util.ExcelOperate;

import com.cf.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * 导出excel业务实现
 * @author towery
 *
 */
@Service
public class ExcelManagerImpl extends ExcelOperate implements ExcelManager {

	/**
	 * 导出excel
	 */
	public ByteArrayInputStream exportExcel(String[] titles,String[] cols,String[] widths,
			List<Map<String, Object>> listMap) throws Exception {

		StringBuffer str = new StringBuffer();

		// 生成excel sheet名称
		str.append("{");

		if (widths != null) {
			str.append("'widths':[50");
			int size = widths.length;
			for (int i = 0; i < size; i++) {
				str.append(",").append(widths[i]);
			}
			str.append("],");
		}

		int titlesSize = titles.length;
		int dataSize = listMap.size();

		str.append("'data':[");
		
		// 设置标题
		str.append("{'height':28,'cell':[");
		str.append("{'text':'").append("序号").append("','clazz':'header'}");
		for (int i = 0; i < titlesSize; i++) {
			str.append(",{'text':'").append(titles[i]).append("','clazz':'header'}");
		}
		str.append("]},");

		// 循环数据
		for (int i = 0; i < dataSize; i++) {
			str.append("{'height':20,'cell':[");
			str.append("{'text':'").append((i+1)).append("','clazz':'normal_text'}");

			Map<String, Object> map = listMap.get(i);
			Iterator<Entry<String, Object>> iter = map.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry<String, Object> entry = (Map.Entry<String, Object>) iter.next();
				String key = entry.getKey();
				if (cols != null && cols.length > 0) {
					for (String col : cols) {
						if (StringUtils.equals(col, key)) {
							Object val = entry.getValue();

							// 处理日期类型
							if (val instanceof Timestamp) {
								DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								val = format.format((Timestamp) val);
							}
							if(val instanceof java.util.Date){
								DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								val = format.format((java.util.Date) val);
							}
							
							if (val == null) {
								val = "";
							}
							str.append(",{'text':'").append(val.toString().replaceAll("'", "’")).append("',");
							str.append("'clazz':'normal_text'");
							str.append("}");
						}
					}
				}
				
			}
			str.append("]}");
			
			if (i < dataSize - 1) {
				str.append(",");
			}
		}
		str.append("],");
		str.append("'clazz':'report','style':'width: 798px;','name':'sheet1'");
		str.append("}");
		
		JSONObject jsonObj = JSONObject.fromObject(JsonUtil.string2Json(str.toString()));
		ByteArrayOutputStream fo = new ByteArrayOutputStream();

		buildExcel(jsonObj, fo);
		
		//获取输入流
		byte[] inputByte = fo.toByteArray();  
		ByteArrayInputStream inputStream = new ByteArrayInputStream(inputByte);  
		
        //关闭输出流
		fo.close();
		
		return inputStream;
	}
	/**
	 * 生成Excel 用户分别对数据进行传参 1）用户需定义表名称 字段名为：name 2）定义EXCEL列宽 字段名为：widths
	 * 3）定义EXCEL每行的行高 字段名为：height 4）存放数据 字段名为：data， 5）如果有合并单元的话 6) 文件存放位置路径path 7)
	 * 文件style设置表格总宽度 style
	 * 
	 * 注： 1）表名不能为空，如果为空默认名称格式为:新建Excel表+日期 2）Excel表的宽度和行高可以不设，系统自动定义
	 * 格式为："198,222,333,243"; 3）数据存放值需是String[]数组,其中每个数组里面是每个实例进行拼接而成的；
	 * 4)开发人员除了data属性存放的值不能为空，其他的都可不设置数值，采用自动默认的方式
	 * 
	 * @throws IOException
	 * 
	 */
	public boolean outExcel(Map<String, Object> excelMap) throws IOException {
		boolean returnFlag = true;

		if (null != excelMap) {

			FileOutputStream fo = null;

			StringBuffer str = new StringBuffer();
			String clazzValue = "";
			// String rangeValue = "";

			String fileName = "";
			String widths = "";
			int styleTotleWidths = 0;

			String filePath = "./";

			if (null != excelMap.get("path")) {
				filePath = (String) excelMap.get("path");
			}

			if (null != excelMap.get("name")) {
				fileName = (String) excelMap.get("name");
			} else {
				fileName = "新建文件"
						+ DateTimeUtil.dtSimpleFormat(DateTimeUtil.getCurrDate());
			}

			// 生成表名称
			str.append("{'name':");
			str.append("'" + fileName + "',");

			// 获取表宽

			boolean withsFlag = false;
			if (null != excelMap.get("widths")) {
				str.append("'widths':[" + String.valueOf(excelMap.get("widths")) + "],");
				String[] widthsVale = String.valueOf(excelMap.get("widths")).split(",");
				for (int i = 0; i < widthsVale.length; i++) {
					styleTotleWidths += Integer.valueOf(widthsVale[i]);
				}
				withsFlag = true;
			}

			// 开始拼接Excel数据

			// 开始读取数据
			// 穿过来的数据格式为：String s =
			// "height:11,1;clazz:header,34,55,6,7,3,range:1.3,2,3;"
			if (null != excelMap.get("data")) {
				String[] obj = (String[]) excelMap.get("data");
				if (obj.length > 0) {
					str.append("'data':[");
					for (int i = 0; i < obj.length; i++) {

						String objStr = obj[i];// 获取一行信息

						String[] strArray = objStr.split(",");

						for (int j = 0; j < strArray.length; j++) {

							if (!withsFlag && i == 0) {
								widths += "207,";
							}

							boolean flag = true;

							if (j == 0) {
								str.append("{'height':");
								// 判断是否设置行高
								if (strArray[j].startsWith("height")) {
									String[] height = strArray[j].split(":");
									str.append(height[1] + ",'cell':[");
									flag = false;
								} else {
									str.append("25,");
									str.append("'cell':[");
								}
							}
							if (flag) {

								// // 如果数据不包含样式clazz和合并单元格range，直接读取数据
								//
								String[] values = strArray[j].split(";");
								if (values.length > 1) {
									for (int n = 0; n < values.length; n++) {
										if (!values[n].startsWith("clazz")
												&& !values[n].startsWith("range")) {
											str.append("{'text':'" + values[n] + "',");
										}

										if (values[n].startsWith("clazz")) {
											String[] clazz = values[n].split(":");
											clazzValue = clazz[1];
											str.append("'clazz':");
											str.append("'" + clazzValue + "',");
										}

										if (values[n].startsWith("range")) {
											String[] range = values[n].split(":");
											str.append("'range':");
											str.append("'" + range[1] + "',");
										}

									}

									str.append("}");

								} else {
									if (i == 0) {
										clazzValue = "header";
									} else {
										clazzValue = "text_left";
									}
									str.append("{'text':'" + strArray[j] + "',");
									str.append("'clazz':'" + clazzValue + "'}");
								}

								if (j + 1 != strArray.length) {
									str.append(",");
								}
							}
						}
						if (i + 1 != obj.length) {
							str.append("]},");
						} else {
							str.append("]}");
						}

					}
				}
				str.append("],");

				if (!withsFlag) {
					widths = widths.substring(0, widths.length() - 1);
					styleTotleWidths = obj.length * 207;
					str.append("'widths':[" + widths + "],");
				}

			}

			str.append("'clazz':'report',");

			if (null != excelMap.get("style")) {
				str.append("'style':'width: " + excelMap.get("style").toString()
						+ "px;'}");
			} else {
				str.append("'style':'width: " + String.valueOf(styleTotleWidths)
						+ "px;'}");
			}

			System.out.println("str打印出来的数据为:" + str.toString());
			JSONObject jsonObj = JSONObject.fromObject(str.toString());

			String pathName = filePath + fileName;

			fo = new FileOutputStream(pathName + ".xls");

			buildExcel(jsonObj, fo);

			fo.close();

		} else {
			returnFlag = false;
		}

		return returnFlag;
	}

	/**
	 * 读取选定的列信息
	 * 
	 * @param path
	 *          文件路径
	 * @param str
	 *          读取的列 格式如下："1.1 1.3 3.1 ...17.4 "
	 * @return
	 * @throws IOException
	 */
	public Map<String, Object> inputExcel(String path, String str)
			throws IOException {

		FileInputStream fi = new FileInputStream(path);
		Map<String, Object> result = readExcelData(fi, str);
		fi.close();

		return result;
	}

	/**
	 * 读取文件，从某行读取
	 * 
	 * @param path
	 *          文件路径
	 * @param rows
	 *          从第几行读取
	 * @return
	 * @throws IOException
	 */
	public List<Object[]> readAllExcel(String filePath, int rows)
			throws IOException {

		List<Object[]> list = readAllExcels(filePath, rows);
		return list;
	}

	/**
	 * 读取文件
	 * 
	 * @param path
	 *          文件路径
	 * @return
	 * @throws IOException
	 */
	public List<Object[]> readAllExcel(String filePath) throws IOException {

		List<Object[]> list = readAllExcel(filePath, 0);
		return list;
	}
	
	
	public void downloadExcel(HttpServletResponse response, InputStream excelStream, String fileName) {
		try {
			
	   	    response.reset();
	   	    response.setContentType("application/vnd.ms-excel;charset=utf-8");
	   	    response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
	   	    response.setHeader("Pragma", "no-cache");
	        response.setHeader("Cache-Control", "no-cache");
	        response.setDateHeader("Expires", 0);

	   	    ServletOutputStream out = response.getOutputStream();
	   	    BufferedInputStream bis = null;
	   	    BufferedOutputStream bos = null;
	   	    try {
	   	        bis = new BufferedInputStream(excelStream);
	   	        bos = new BufferedOutputStream(out);
	   	        byte[] buff = new byte[2048];
	   	        int bytesRead;
	   	        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
	   	            bos.write(buff, 0, bytesRead);
	   	        }
	   	    } catch (final IOException e) {
	   	        throw e;
	   	    } finally {
	   	        if (bis != null)
	   	            bis.close();
	   	        if (bos != null)
	   	            bos.close();
	   	    }
	   	    
		} catch (Exception e) {
			e.printStackTrace();
		}
   	    
	}
}
