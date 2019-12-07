package com.cf.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import sun.misc.BASE64Decoder;

import com.alibaba.fastjson.JSONObject;

/**
 * UEditor文件上传辅助类
 */
public class UEditorUploader {
    // 输出文件地址
    private String url = "";
    // 上传文件名
    private String fileName = "";
    // 状态
    private String state = "";
    // 文件类型
    private String type = "";
    // 原始文件名
    private String originalName = "";
    // 文件大小
    private long size = 0;

    private HttpServletRequest request = null;
    private String title = "";

    // 默认保存路径
    private String savePath = "";
    // 文件允许格式
    private String[] allowFiles = {".rar", ".doc", ".docx", ".zip", ".pdf", ".txt", ".swf", ".wmv", ".gif", ".png", ".jpg", ".jpeg", ".bmp"};
    // 默认文件大小限制，单位KB
    private int maxSize = 10240;

    private static HashMap<String, String> errorInfo = new HashMap<String, String>();
    
    static {
    	errorInfo.put("SUCCESS", "SUCCESS"); //默认成功
        errorInfo.put("NOFILE", "未包含文件上传域");
        errorInfo.put("TYPE", "不允许的文件格式");
        errorInfo.put("SIZE", "文件大小超出限制");
        errorInfo.put("ENTYPE", "请求类型ENTYPE错误");
        errorInfo.put("REQUEST", "上传请求异常");
        errorInfo.put("IO", "IO异常");
        errorInfo.put("DIR", "目录创建失败");
        errorInfo.put("UNKNOWN", "未知错误");
    }

    public UEditorUploader(HttpServletRequest request) {
        this.request = request;
    }

    /**
     * 上传文件，只会上传第一个符合格式的文件，该方法适用于SpringMVC
     * @author Arvin.Z
     * @date 2017年3月3日 下午4:09:19
     */
    public void upload() throws Exception {
    	if (this.request instanceof MultipartHttpServletRequest) {
    		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) this.request;
    		Map<String, MultipartFile> map = multiRequest.getFileMap();
    		Iterator<String> it = map.keySet().iterator();
    		String savePath = this.getFolder(this.savePath);
			try {
				while (it.hasNext()) {
					MultipartFile attach = map.get(it.next());
					this.originalName = attach.getOriginalFilename();
					// 判断文件类型，不符合的文件不上传
					if (!this.checkFileType(originalName)) {
						this.state = errorInfo.get("TYPE");
				        continue;
					}
					// 大于上传限制的文件不上传
					if (attach.getSize() > this.maxSize * 1024) {
						this.state = errorInfo.get("SIZE");
						continue;
					}
					this.fileName = this.getName(this.originalName);
					this.type = this.getFileExt(this.fileName);
				    this.url = savePath + "/" + this.fileName;
				    // 创建流上传文件
				    BufferedInputStream in = new BufferedInputStream(attach.getInputStream());
				    File file = new File(this.getPhysicalPath(this.url));
				    FileOutputStream out = new FileOutputStream(file);
				    BufferedOutputStream output = new BufferedOutputStream(out);
				    
				    Streams.copy(in, output, true);
				    this.state = errorInfo.get("SUCCESS");
				    this.size = file.length();
				    // UE中只会处理单张上传，完成后即退出
					break;
				}
			} catch (Exception e) {
	            this.state = errorInfo.get("UNKNOWN");
	        }
    	} else {
    		this.state = errorInfo.get("NOFILE");
    	}
    }

    /**
     * 接受并保存以base64格式上传的文件
     */
    public void uploadBase64(String fieldName) {
        String savePath = this.getFolder(this.savePath);
        String base64Data = this.request.getParameter(fieldName);
        this.fileName = this.getName("test.png");
        this.url = savePath + "/" + this.fileName;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            File outFile = new File(this.getPhysicalPath(this.url));
            OutputStream ro = new FileOutputStream(outFile);
            byte[] b = decoder.decodeBuffer(base64Data);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            ro.write(b);
            ro.flush();
            ro.close();
            this.state = errorInfo.get("SUCCESS");
        } catch (Exception e) {
            this.state = errorInfo.get("IO");
        }
    }

    /**
     * 文件类型判断
     *
     * @param fileName
     */
    private boolean checkFileType(String fileName) {
        Iterator<String> type = Arrays.asList(this.allowFiles).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileName.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件扩展名
     */
    private String getFileExt(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

    /**
     * 依据原始文件名生成新文件名
     */
    private String getName(String fileName) {
        Random random = new Random();
        return this.fileName = "" + random.nextInt(10000)
                + System.currentTimeMillis() + this.getFileExt(fileName);
    }

    /**
     * 根据字符串创建本地目录 并按照日期建立子目录返回
     */
    private String getFolder(String path) {
        SimpleDateFormat formater = new SimpleDateFormat("yyyyMMdd");
        path += "/" + formater.format(new Date());
        File dir = new File(this.getPhysicalPath(path));
        if (!dir.exists()) {
            try {
                dir.mkdirs();
            } catch (Exception e) {
                this.state = errorInfo.get("DIR");
                return "";
            }
        }
        return path;
    }

    /**
     * 根据传入的虚拟路径获取物理路径
     */
    private String getPhysicalPath(String path) {
        String servletPath = this.request.getServletPath();
        String realPath = this.request.getSession().getServletContext()
                .getRealPath(servletPath);
        return new File(realPath).getParent() + "/" + path;
    }

    /**
     * 返回JSON数据
     */
    public String getJsonResult(String callback) {
    	Map<String , Object> map = new LinkedHashMap<String, Object>();
    	map.put("name", this.getFileName());
    	map.put("originalName", this.getOriginalName());
    	map.put("size", this.getSize());
    	map.put("type", this.getType());
    	map.put("state", this.getState());
    	map.put("url", this.getUrl());
    	if (callback == null || "".equals(callback)) {
    		return JSONObject.toJSONString(map);
    	}
    	return String.format("%s(%s)", callback, map);
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public void setAllowFiles(String[] allowFiles) {
        this.allowFiles = allowFiles;
    }

    public void setMaxSize(int size) {
        this.maxSize = size;
    }

    public long getSize() {
        return this.size;
    }

    public String getUrl() {
        return this.url;
    }

    public String getFileName() {
        return this.fileName;
    }

    public String getState() {
        return this.state;
    }

    public String getTitle() {
        return this.title;
    }

    public String getType() {
        return this.type;
    }

    public String getOriginalName() {
        return this.originalName;
    }

}
