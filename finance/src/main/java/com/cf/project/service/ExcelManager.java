package com.cf.project.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

/**
 * 导出Excel业务接口
 * @author towery
 *
 */
public interface ExcelManager {

	/**
	 * 生成Excel 用户分别对数据进行传参 
	 * 1）用户需定义表名称 字段名为：name 
	 * 2）定义EXCEL列宽 字段名为：widths
	 * 3）定义EXCEL每行的行高 字段名为：height 
	 * 4）存放数据 字段名为：data，
	 * 5）如果有合并单元的话 
	 * 6) 文件存放位置路径path 
	 * 7) 文件style设置表格总宽度 style
	 * 
	 * 注： 
	 * 1）表名不能为空，如果为空默认名称格式为:新建Excel表+日期
	 * 2）Excel表的宽度和行高可以不设，系统自动定义 格式为："198,222,333,243";
	 * 3）数据存放值需是String[]数组,其中每个数组里面是每个实例进行拼接而成的；
	 * 4)开发人员除了data属性存放的值不能为空，其他的都可不设置数值，采用自动默认的方式
	 * @throws IOException 
	 * 
	 */
	public boolean outExcel(Map<String, Object> excelMap) throws IOException;
	
	/**
	 * 读取选定的列信息
	 * 
	 * @param path 文件路径
	 * @param str 读取的列 格式如下："1.1 1.3 3.1 ...17.4 "
	 * @return
	 * @throws IOException
	 */
	
	public Map<String, Object> inputExcel(String path, String str)
			throws IOException;
	
	/**
	 * 读取文件，在某行中读取
	 * 
	 * @param path 文件路径
	 * @param rows 从第几行读取数据
	 * @return
	 * @throws IOException
	 */

	public List<Object[]> readAllExcel(String filePath, int rows)
			throws IOException;
	/**
	 * 读取文件
	 * 
	 * @param path 文件路径
	 * @return
	 * @throws IOException
	 */

	public List<Object[]> readAllExcel(String filePath) throws IOException;
	
	/**
	 * 导出excel
	 * @param titles
	 * @param widths
	 * @param listMap
	 * @return
	 * @throws Exception
	 */
	public ByteArrayInputStream exportExcel(String[] titles,String[] cols,String[] widths,List<Map<String, Object>> listMap) throws Exception;
	
	/**
	 * 下载excel文件
	 * @param response
	 * @param excelStream
	 * @param fileName
	 */
	void downloadExcel(HttpServletResponse response, InputStream excelStream, String fileName);
}
