package com.cf.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.aspose.words.Document;
import com.aspose.words.HtmlFixedSaveOptions;
import com.aspose.words.License;
import com.aspose.words.SaveFormat;

/**
 * 
 * 由于ASPOSE比较吃内存，操作大一点的文件就会堆溢出，所以请先设置好java虚拟机参数：-Xms1024m -Xmx1024m(参考值)
 *
 */
public class wordtohtmlTest {

    private static InputStream license;
    private static InputStream fileInput;
    private static File outputFile;

    /**
     * 获取license
     * 
     * @return
     */
    public static boolean getLicense() {
        boolean result = false;
        try {
            ClassLoader loader = Thread.currentThread().getContextClassLoader();
            license = new FileInputStream(loader.getResource("license.xml").getPath());// 凭证文件
            License aposeLic = new License();
            aposeLic.setLicense(license);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 
     * @param filePath 输入文件路径
     * @param htmlPath 输出文件路径
     */
    public static String wordToHtml(String filePath,String htmlPath) {
        // 验证License
        if (!getLicense()) {
            return "";
        }
        try {
        	fileInput = new FileInputStream(filePath);// 待处理的文件
            outputFile = new File(htmlPath);// 输出路径
            long old = System.currentTimeMillis();
            Document doc = new Document(fileInput);
            FileOutputStream fileOS = new FileOutputStream(outputFile);
            HtmlFixedSaveOptions options = new HtmlFixedSaveOptions();
            //指定使用此保存选项对象时将保存文档的格式。只能是SaveFormat.HTML_FIXED。
            options.setSaveFormat(SaveFormat.HTML_FIXED);
            //指定是否将字体嵌入到Base64格式的Html文档中。
            options.setExportEmbeddedFonts(true);
            //	指定图像是否应以Base64格式嵌入到Html文档中。
            options.setExportEmbeddedImages(true);
            //	获取或设置是否将表单字段导出为交互式项目（如“输入”标记），而不是转换为文本或图形。
            options.setExportFormFields(false);
            //指定是否应该显示页面边框。默认是true。
          // options.setShowPageBorder(false);
           //指定是否将CSS（层叠样式表）嵌入到Html文档中。
           options.setExportEmbeddedCss(true);
           doc.save(fileOS,options);
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        return outputFile.getPath();
    }
    
    public static void main(String[] args) {
        String a = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\finance\\word\\20191105\\20191105161752_965.docx"; 
        String b = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\finance\\word\\20191105\\20191105161752_965_1.html";
        wordToHtml(a, b);
    }
}