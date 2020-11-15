package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.pojo.Class;
import com.lhm.service.ClassService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: lhm
 * @Date: 2020/11/11 14:56
 * 4
 */
@Controller
@Api(tags = "班级管理操作相关接口")
public class ClassController {
    @Autowired
    private ClassService classService;

    @GetMapping("/class.html")
    @ApiOperation("班级页面跳转")
    public String classManage(){
        return "views/class/classManage";
    }

    @GetMapping("/addClassModel.html")
    @ApiOperation("新增班级页面跳转")
    public String addClassManage(){
        return "views/class/addClassModal";
    }

    /**
     * 获取所有的班级
     */
    @GetMapping("/getAllClass.json")
    @ApiOperation("获取所有的班级列表接口")
    @ResponseBody
    public Result getAllClass(){
        return classService.getAllClass();
    }

    @GetMapping("/getClassByMajorId.json")
    @ApiOperation("根据专业id获取班级")
    @ResponseBody
    public Result getClassByMajorId(@RequestParam("majorId") Integer majorId){
        return classService.getClassByMajorId(majorId);
    }

    /**
     * 分页获取专业列表
     * @return
     */
    @GetMapping(value = "/classList.json")
    @ApiOperation("分页获取班级列表接口")
    @ResponseBody
    public Map<String, Object> classPageHelper(Class c,@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<Class> list = classService.selectClassByPageHelper(c);
        PageInfo<Class> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>(4);
        map.put("code", 0);
        map.put("msg", "获取成功");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    @RequestMapping(value = "/addClass.json",method = RequestMethod.POST)
    @ApiOperation("新增班级")
    @ResponseBody
    public Result addClass(Class c){
        return classService.addClass(c);
    }
}
