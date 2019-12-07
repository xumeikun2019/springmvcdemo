package com.cf.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.RichTextRun;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFShape;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xslf.usermodel.XSLFTextParagraph;
import org.apache.poi.xslf.usermodel.XSLFTextRun;
import org.apache.poi.xslf.usermodel.XSLFTextShape;

public class PptToJpg_poi {
	/**
	   * ppt2003 文档的转换 后缀名为.ppt
	   * @param pptFile ppt文件
	   * @param imgFile 图片将要保存的目录（不是文件）
	   * @return
	   */
	public static String doPPT2003toImage(File pptFile,File imgFile,String oldpath,String nname) {
		String switchPath = "";
		 List<String> list = new ArrayList<String>();
	    try {
	        FileInputStream is = new FileInputStream(pptFile);
	        SlideShow ppt = new SlideShow(is);
	        //及时关闭掉 输入流
	        is.close();
	        Dimension pgsize = ppt.getPageSize();
	        Slide[] slide = ppt.getSlides();
	        for (int i = 0; i < slide.length; i++) {
	    
	            TextRun[] truns = slide[i].getTextRuns();
	            for (int k = 0; k < truns.length; k++) {
	                RichTextRun[] rtruns = truns[k].getRichTextRuns();
	                for (int l = 0; l < rtruns.length; l++) {
	                    // 原有的字体索引 和 字体名字
	                    int index = rtruns[l].getFontIndex();
	                    String name = rtruns[l].getFontName();
	                   
	                    // 重新设置 字体索引 和 字体名称 是为了防止生成的图片乱码问题
	                    rtruns[l].setFontIndex(1);
	                    rtruns[l].setFontName("宋体");
	                }
	            }
	            //根据幻灯片大小生成图片
	            BufferedImage img = new BufferedImage(pgsize.width,pgsize.height, BufferedImage.TYPE_INT_RGB);
	            Graphics2D graphics = img.createGraphics();
	            graphics.setPaint(Color.white);
	            graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,pgsize.height));
	            slide[i].draw(graphics);
	            // 图片的保存位置
	            String absolutePath = imgFile.getAbsolutePath()+"/"+nname+"_"+ (i + 1) + ".jpeg";
	            switchPath += oldpath+"_"+(i + 1)+".jpeg,";
	            File jpegFile = new File(absolutePath);
	            // 图片路径存放
	            list.add((i + 1) + ".jpeg");
	            // 如果图片存在，则不再生成
	            if (jpegFile.exists()) {
	                continue;
	            }
	            // 这里设置图片的存放路径和图片的格式(jpeg,png,bmp等等),注意生成文件路径
	            FileOutputStream out = new FileOutputStream(jpegFile);
	            ImageIO.write(img, "jpeg", out);
	            out.close();
	        }
	        System.out.println(switchPath);
	        return switchPath;
	    }
	    catch (Exception e) {
	      
	    }
	    return null;
	}
	
	public static Boolean doPPT2007toImage(File pptFile,File imgFile) {
		List<String> list = new ArrayList<String>();
	    FileInputStream is = null ;
	    try {
	        is = new FileInputStream(pptFile);
	        XMLSlideShow xmlSlideShow = new XMLSlideShow(is);
	        is.close();
	        // 获取大小
	        Dimension pgsize = xmlSlideShow.getPageSize();
	        // 获取幻灯片
	        XSLFSlide[] slides = xmlSlideShow.getSlides();
	        for (int i = 0 ; i < slides.length ; i++) {
	            // 解决乱码问题
	            XSLFShape[] shapes = slides[i].getShapes();
	            for (XSLFShape shape : shapes) {
	                if (shape instanceof XSLFTextShape) {
	                    XSLFTextShape sh = (XSLFTextShape) shape;
	                    List<XSLFTextParagraph> textParagraphs = sh.getTextParagraphs();
	                    for (XSLFTextParagraph xslfTextParagraph : textParagraphs) {
	                        List<XSLFTextRun> textRuns = xslfTextParagraph.getTextRuns();
	                        for (XSLFTextRun xslfTextRun : textRuns) {
	                            xslfTextRun.setFontFamily("宋体");
	                        }
	                    }
	                }
	            }
	            //根据幻灯片大小生成图片
	            BufferedImage img = new BufferedImage(pgsize.width,pgsize.height, BufferedImage.TYPE_INT_RGB);
	            Graphics2D graphics = img.createGraphics();
	            graphics.setPaint(Color.white);
	            graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,pgsize.height));
	            // 最核心的代码
	            slides[i].draw(graphics);
	            //图片将要存放的路径
	            String absolutePath = imgFile.getAbsolutePath()+"/"+ (i + 1) + ".jpeg";
	            File jpegFile = new File(absolutePath);
	            // 图片路径存放
	            list.add((i + 1) + ".jpeg");
	            //如果图片存在，则不再生成
	            if (jpegFile.exists()) {
	                continue;
	            }
	            // 这里设置图片的存放路径和图片的格式(jpeg,png,bmp等等),注意生成文件路径
	            FileOutputStream out = new FileOutputStream(jpegFile);
	            // 写入到图片中去
	            ImageIO.write(img, "jpeg", out);
	            out.close();
	        }
	        return true;
	    }
	    catch (Exception e) {
	    }
	    return false;
	}
	
    public static void main(String[] args) {
       String in = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\finance\\/ppt/20191118/20191118114205_208.ppt";
       String out = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\finance\\/ppt/20191118/";
       File pptFile = new File(in);
       File imgFile = new File(out);
     //  doPPT2003toImage(pptFile, imgFile);
    
    }

}