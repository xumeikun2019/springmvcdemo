package com.cf.util;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.core.FileURIResolver;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;



public class Docx2Html
{
	 public static boolean doGenerateSysOut(String inPath,String inFileName,String outPath,String outFileName)
     throws IOException
     {	
		 	boolean flag = true;
		    try {
				//例：outFileName = aa.html,outFileNameNoable = aa
				String outFileNameNoable = outFileName.split(".htm")[0];
				String fileOutName = outPath + outFileName;
				long startTime = System.currentTimeMillis();
				XWPFDocument document = new XWPFDocument(new FileInputStream(
						inPath + inFileName));
				XHTMLOptions options = XHTMLOptions.create().indent(4);
				// Extract image 创建存储图片文件夹
				File imageFolder = new File(outPath + outFileNameNoable);
				options.setExtractor(new FileImageExtractor(imageFolder));
				// URI resolver
				options.URIResolver(new FileURIResolver(imageFolder));
				File outFile = new File(fileOutName);
				outFile.getParentFile().mkdirs();
				OutputStream out = new FileOutputStream(outFile);
				XHTMLConverter.getInstance().convert(document, out, options);
			} catch (Exception e) {
				flag = false;
				e.printStackTrace();
			}
		    return flag;
     }

	 /**
      * 读取html文件到字符串
      * @param filename
      * @return
      * @throws Exception
      */
     public static String readFile(String filename) throws Exception {
            StringBuffer buffer = new StringBuffer("");
            BufferedReader br = null;
            try {
                   br = new BufferedReader(new FileReader(filename));
                   buffer = new StringBuffer();
                   while (br.ready())
                          buffer.append((char) br.read());
            } catch (Exception e) {
                   e.printStackTrace();
            } finally {
                   if(br!=null) br.close();
            }
            return buffer.toString();
     }
	
     
     private static String convertToChinese(String dataStr) {  
         if(dataStr == null || dataStr.length() == 0) {  
             return dataStr;  
         }  
         int start = 0;  
         int end = 0;  
         final StringBuffer buffer = new StringBuffer();  
         while (start > -1) {  
             int system = 10;// 进制  
             if (start == 0) {  
                 int t = dataStr.indexOf("&#");  
                 if (start != t)  
                     start = t;  
                 if(start > 0) {  
                     buffer.append(dataStr.substring(0, start));  
                 }  
                 if(start == -1) {  
                     return dataStr;  
                 }  
             }  
             end = dataStr.indexOf(";", start + 2);  
             String charStr = "";  
             if (end != -1) {  
                 charStr = dataStr.substring(start + 2, end);  
                 // 判断进制  
                 char s = charStr.charAt(0);  
                 if (s == 'x' || s == 'X') {  
                     system = 16;  
                     charStr = charStr.substring(1);  
                 }  
                 // 转换  
                 try {  
                     char letter = (char) Integer.parseInt(charStr, system);  
                     buffer.append(new Character(letter).toString());  
                 } catch (NumberFormatException e) {  
                     e.printStackTrace();  
                 }  
             }  
               
             // 处理当前unicode字符到下一个unicode字符之间的非unicode字符  
             start = dataStr.indexOf("&#", end);  
             if (start - end > 1) {  
                 buffer.append(dataStr.substring(end + 1, start));  
             }  
             // 处理最后面的非 unicode字符  
             if (start == -1) {  
                 int length = dataStr.length();  
                 if (end + 1 != length) {  
                     buffer.append(dataStr.substring(end + 1, length));  
                 }  
             }  
         }  
         return buffer.toString();  
     }
     public static void writeToFile2(String path,String str) throws IOException{
        try {
            File file = new File(path);
            PrintStream ps = new PrintStream(new FileOutputStream(file));
            ps.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");// 往文件里写入字符串,解决编码问题，语法不正规
            ps.append(str);// 在已有的基础上添加字符串
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
     }
     
	/**
     * replace image src
     * @param htmlStr
     * @return String
	 * @throws Exception 
     */
	
	public static void convertDocxToHtml(String inPath,String inFileName,String outPath,String outFileName) throws Exception{
		if(doGenerateSysOut(inPath, inFileName, outPath, outFileName)){
			writeToFile2(outPath+outFileName, convertToChinese(readFile(outPath+outFileName)));
		}
	}
}