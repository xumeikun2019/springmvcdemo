package com.cf.project.controller.common;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.cf.project.service.ExcelManager;
import com.cf.project.service.SysDepartmentService;
import com.cf.util.CommonUploader;
import com.cf.util.KitFileUtil;
import com.cf.util.UEditorUploader;

/**
 * 文本编辑器上传图片controller
 * @author towery
 * @date 2018年12月6日上午9:04:42
 */
@Controller
@RequestMapping("/upload")
public class UploadController {
	@Autowired
	private ExcelManager excelManager;

	@Autowired
    private SysDepartmentService sysDepartmentService;

	/**
	 * UEditor上传图片
	 * @param callback
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/image")
    @ResponseBody
    public String doUploadImage(@RequestParam(required = false) String callback, HttpServletRequest request) throws Exception {
        UEditorUploader uploader = new UEditorUploader(request);
        uploader.setAllowFiles(new String[] { ".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp" });
        uploader.setSavePath("/upload");
        uploader.setMaxSize(5120);
        uploader.upload();
        String result = uploader.getJsonResult(callback);
        return result;
    }
    
    /**
	 * UEditor上传图片
	 * @param callback
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @RequestMapping("/common/image")
    @ResponseBody
    public String doUploadImageCommon(@RequestParam(required = false) String callback, HttpServletRequest request) throws Exception {
        CommonUploader uploader = new CommonUploader(request);
        uploader.setAllowFiles(new String[] { ".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp" });
        uploader.setMaxSize(5120);
        uploader.upload();
        String result = uploader.getJsonResult(callback);
        return result;
    }
    /**
	 * 视频上传
	 * @param callback
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadVideo",method = RequestMethod.POST)
    @ResponseBody
    public Object uploadVideo(@RequestParam("layuiVideo") MultipartFile[] layuiFile, HttpServletRequest request, HttpServletResponse response){
        System.out.println("进入mk的layui视频上传接口》》》》》》》》》》》》》》》");
        Map<String,Object> map=new HashMap<String,Object>();
        Map<String,Object> map2=new HashMap<String,Object>();
        KitFileUtil kitFileUtil=new KitFileUtil();
        map = kitFileUtil.kitFileUtil(layuiFile, request, response);
        String error = map.get("error").toString();
        if("101".equals(error)){
            map2.put("error",101);
            map2.put("message",map.get("message"));
            return map;
        }
        map2.put("name", map.get("name"));
        map2.put("error",0);
        String url[]=(String[])map.get("url");
        map2.put("url",url[0]);
        return JSONObject.toJSON(map2);
    }
	
    @RequestMapping("/common/files")
    @ResponseBody
    public String doUploadFilesCommon(@RequestParam(required = false) String callback, HttpServletRequest request) throws Exception {
        CommonUploader uploader = new CommonUploader(request);
        uploader.setAllowFiles(new String[] { ".doc",".docx" ,".pdf", ".xlx",".txt",".jpg",".ppt",".ppts" });
        uploader.setMaxSize(1024000);
        uploader.upload();
        String result = uploader.getJsonResult(callback);
        return result;
    }
	
	@RequestMapping("/common/ryfiles")
    @ResponseBody
    public String doUploadRyFilesCommon(@RequestParam(required = false) String callback, HttpServletRequest request) throws Exception {
        CommonUploader uploader = new CommonUploader(request);
        uploader.setAllowFiles(new String[] { ".xls" });
        uploader.setMaxSize(102400);
        uploader.upload();
        
        String url = uploader.getUrl();
        String realPath = request.getSession().getServletContext()
                .getRealPath("/");
        List<Object[]> readAllExcel = excelManager.readAllExcel(realPath+url);
        String xx=sysDepartmentService.importContract(readAllExcel);
        
       
        String result = uploader.getJsonResult1(callback,xx);
        
//        this.deleteFile(realPath+url);
        return result;
    }
    public static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                System.out.println("删除单个文件" + fileName + "成功！");
                return true;
            } else {
                System.out.println("删除单个文件" + fileName + "失败！");
                return false;
            }
        } else {
            System.out.println("删除单个文件失败：" + fileName + "不存在！");
            return false;
        }
    }
}
