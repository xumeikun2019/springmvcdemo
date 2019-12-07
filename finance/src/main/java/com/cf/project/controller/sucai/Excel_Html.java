/*
 * package com.cf.project.controller.sucai;
 * 
 * import java.io.BufferedReader; import java.io.File; import
 * java.io.FileReader; import java.io.IOException; import java.io.PrintWriter;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam;
 * 
 * import com.sd.cloud.constant.SDConstants; import
 * com.sd.sdcj.util.excel.POIReadExcelToHtml;
 * 
 * @Controller
 * 
 * @RequestMapping(value="/excel_html") public class Excel_Html {
 * 
 * @RequestMapping(value="/look") public void look(HttpServletRequest
 * request,HttpServletResponse response,
 * 
 * @RequestParam(value="fileName") String fileName ){
 * System.out.println(fileName); if(fileName!=null){
 * fileName=SDConstants.fileDir+fileName.substring(fileName.indexOf("fileName=")
 * +9,fileName.indexOf("?oldFileName=")); //excel名字 String excle=fileName; //转换
 * String fileType = excle.substring(excle.lastIndexOf(".")+1);
 * System.out.println(fileType);
 * if("xls".equalsIgnoreCase(fileType)||"xlsx".equalsIgnoreCase(fileType)||
 * "xlsm".equalsIgnoreCase(fileType)){ //读取显示 //以下是读取excel
 * fileName=fileName.substring(0,fileName.lastIndexOf("."))+".html";
 * System.out.println(""); //判断是否已经转换过 if(!new File(fileName).exists()){
 * POIReadExcelToHtml.pdf2html(excle); }
 * 
 * System.out.println(fileName); PrintWriter writer=null; BufferedReader
 * br=null; try { request.setCharacterEncoding("utf-8");
 * response.setHeader("Content-type", "text/html;charset=UTF-8");
 * response.setCharacterEncoding("utf-8"); writer = response.getWriter(); br=new
 * BufferedReader(new FileReader(new File(fileName))); String html=null;
 * while((html = br.readLine()) != null){ writer.write(html); }
 * 
 * 
 * } catch (IOException e) { e.printStackTrace(); }finally{ if(writer!=null){
 * writer.close(); } if(br!=null){ try { br.close(); } catch (IOException e) {
 * e.printStackTrace(); } }
 * 
 * } } } } }
 */