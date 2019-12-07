package com.cf.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import org.apache.poi.hslf.HSLFSlideShow;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.RichTextRun;
import org.apache.poi.hslf.usermodel.SlideShow;

public class Ppt2Image {
// 图片默认存放路径 
// public final static String path = "D:\\ppt\\ppt"; 

	/*
	 * public Document getDocument(Index index, String url, String title,
	 * InputStream is)throws Exception { StringBuffer content = new
	 * StringBuffer(""); try{ SlideShow ss = new SlideShow(new
	 * HSLFSlideShow(is));//is 为文件的InputStream，建立SlideShow Slide[] slides =
	 * ss.getSlides();//获得每一张幻灯片 for(int i=0;i<slides.length;i++){ TextRun[] t =
	 * slides[i].getTextRuns();//为了取得幻灯片的文字内容，建立TextRun for(int j=0;j<t.length;j++){
	 * content.append(t[j].getText());//这里会将文字内容加到content中去 }
	 * content.append(slides[i].getTitle()); } index.AddIndex(url, title,
	 * content.toString()); }catch(Exception ex){ System.out.println(ex.toString());
	 * } return null; }
	 */

	/*
	 * public static void main(String[] args) throws Exception { // 加载PPT
	 * HSLFSlideShow _hslf = new HSLFSlideShow("D:\\数据库建模.ppt"); SlideShow
	 * _slideShow = new SlideShow(_hslf);
	 * 
	 * // 获取PPT文件中的图片数据 PictureData[] _pictures = _slideShow.getPictureData();
	 * 
	 * // 循环读取图片数据 for (int i = 0; i < _pictures.length; i++) { StringBuilder
	 * fileName = new StringBuilder(path); PictureData pic_data = _pictures[i];
	 * fileName.append(i+".png"); // 设置格式
	 * 
	 * // 输出文件 FileOutputStream fileOut = new FileOutputStream(new
	 * File(fileName.toString())); fileOut.write(pic_data.getData());
	 * System.out.println("成功生成。。。"); fileOut.close(); } } }
	 */
	public static BufferedImage showPPT(String str, int order) throws IOException {
		SlideShow ppt = new SlideShow(new HSLFSlideShow(str));
		Dimension pgsize = ppt.getPageSize();
		Slide[] slide = ppt.getSlides();

		TextRun[] truns = slide[order].getTextRuns(); // 修改字体 使之全部变成宋体
		for (int k = 0; k < truns.length; k++) {
			RichTextRun[] rtruns = truns[k].getRichTextRuns();
			for (int l = 0; l < rtruns.length; l++) {
				int index = rtruns[l].getFontIndex();
				String name = rtruns[l].getFontName();
				rtruns[l].setFontIndex(1);
				rtruns[l].setFontName("新宋体");
			}
		}

		BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics = img.createGraphics();
		graphics.setPaint(Color.white);
		graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
		slide[order].draw(graphics);
		return img;
	}

	public static void main(String[] args) throws IOException {
		FileInputStream is = new FileInputStream("D:\\1.pptX");
		SlideShow ppt = new SlideShow(is);

		is.close();
		Dimension pgsize = ppt.getPageSize();
		Slide[] slide = ppt.getSlides();
		TextRun[] truns = slide[0].getTextRuns(); // 修改字体 使之全部变成新宋体
		for (int k = 0; k < truns.length; k++) {
			RichTextRun[] rtruns = truns[k].getRichTextRuns();
			for (int l = 0; l < rtruns.length; l++) {
				int index = rtruns[l].getFontIndex();
				String name = rtruns[l].getFontName();
				rtruns[l].setFontIndex(1);
				rtruns[l].setFontName("新宋体");
			}
		}
		for (int i = 0; i < slide.length; i++) {
			BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics = img.createGraphics();
// clear the drawing area
			graphics.setPaint(Color.white);
			graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));
// render
			slide[i].draw(graphics);
// save the output
			FileOutputStream out = new FileOutputStream("D:\\" + (i + 1) + ".png");
			javax.imageio.ImageIO.write(img, "png", out);
			System.out.println("成功生成png。。。。");
			out.close();
		}
	}
}
