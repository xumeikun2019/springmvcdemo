package com.cf.project.controller;

import com.cf.project.mybatis.model.CMeetingVerify;
import com.cf.project.service.CMeetingVerifyService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/main/meetingVerify")
public class CMeetingVerifyController extends GridController {
    @Autowired
    private CMeetingVerifyService cMeetingVerifyService;

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/meetingVerify/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CMeetingVerify pojo) {
        JsonResult result = new JsonResult();
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();
    }
}