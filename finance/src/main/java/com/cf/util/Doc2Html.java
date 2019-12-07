package com.cf.util;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.w3c.dom.Document;

public class Doc2Html {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws ParserConfigurationException 
	 * @throws TransformerException 
	 */
	public static void convertDocToHtml(String inPath,String inFileName,String outPath,String outFileName) throws IOException,
			ParserConfigurationException, TransformerException {
		try {
			woedToHtml03(inPath, inFileName, outPath, outFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param inPath
	 * @param inFileName
	 * @param outPath
	 * @param outFileName
	 * @throws IOException
	 * @throws ParserConfigurationException
	 * @throws TransformerException
	 */
	public static void woedToHtml03 (String inPath,String inFileName,String outPath,String outFileName)throws IOException, ParserConfigurationException, TransformerException{
		final String outFileNameNoable = outFileName.split(".htm")[0];
		
		File file = new File(outPath+"//"+outFileNameNoable);
		file.mkdirs();
		InputStream input = new FileInputStream(inPath + inFileName);
        HWPFDocument wordDocument = new HWPFDocument(input);
        WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
        wordToHtmlConverter.setPicturesManager(new PicturesManager() {
        	public String savePicture( byte[] content,  
                    PictureType pictureType, String suggestedName,  
                    float widthInches, float heightInches )  
            {  
                return outFileNameNoable+"/"+suggestedName;  
            }  
        });
        wordToHtmlConverter.processDocument(wordDocument);
      //save pictures  
        List pics=wordDocument.getPicturesTable().getAllPictures();  
        if(pics!=null){  
            for(int i=0;i<pics.size();i++){  
                Picture pic = (Picture)pics.get(i);  
                try {  
                    pic.writeImageContent(new FileOutputStream(inPath+outFileNameNoable+"//" //"H:/test/images/"  
                            + pic.suggestFullFileName()));  
                } catch (FileNotFoundException e) {  
                    e.printStackTrace();  
                }    
            }  
        }  
        Document htmlDocument = wordToHtmlConverter.getDocument();
        File htmlFile = new File(outPath + outFileName);
        OutputStream outStream = new FileOutputStream(htmlFile);
        DOMSource domSource = new DOMSource(htmlDocument);
        StreamResult streamResult = new StreamResult(outStream);
 
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer serializer = tf.newTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
        serializer.setOutputProperty(OutputKeys.INDENT, "yes");
        serializer.setOutputProperty(OutputKeys.METHOD, "html");
        serializer.transform(domSource, streamResult);
        outStream.close();
	}
	

}