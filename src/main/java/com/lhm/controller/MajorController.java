package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.config.shiro.ShiroUser;
import com.lhm.pojo.Department;
import com.lhm.pojo.Major;
import com.lhm.pojo.SystemLog;
import com.lhm.service.DepartmentService;
import com.lhm.service.MajorService;
import com.lhm.service.SystemLogService;
import com.lhm.utils.Address;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: lhm
 * @Date: 2020/10/24 14:27
 * 4
 */
@Controller
@Api(tags = "专业操作相关接口")
public class MajorController {

    @Autowired
    private MajorService majorService;

    @Autowired
    private SystemLogService systemLogService;

    @GetMapping("/major.html")
    @ApiOperation("专业页面跳转")
    public String majorManage(){
        return "views/major/majorManage";
    }

    @GetMapping("/getAllMajor.json")
    @ApiOperation("查询所有专业")
    @ResponseBody
    public Result getAllMajor(){
        List<Major> list = majorService.getAllMajor();
        return Result.success("获取成功",list);
    }

    @GetMapping("/getMajorByDepId.json")
    @ApiOperation("根据系部id查询专业")
    @ResponseBody
    public Result getMajorByDepId(@RequestParam("depId") Integer depId){
        return majorService.getMajorByDepId(depId);
    }

    /**
     * 分页获取专业列表（
     * @return
     */
    @GetMapping(value = "/majorList.json")
    @ApiOperation("分页获取专业列表接口")
    @ResponseBody
    public Map<String, Object> majorPageHelper(Major major, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<Major> list = majorService.selectMajorByPageHelper(major);
        PageInfo<Major> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "获取成功");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    @GetMapping("/addMajorModel.html")
    @ApiOperation("添加专业页面跳转")
    public String addMajorModel() {
        return "views/major/addMajorModal";
    }

    /**
     * 添加专业
     * @return
     */
    @RequestMapping(value = "/addMajor.json", method = RequestMethod.POST)
    @ApiOperation("添加专业接口")
    @ResponseBody
    public Result addMajor(Major major) {
        int result = majorService.saveMajor(major);
        if (result >= 1){
            Subject subject = SecurityUtils.getSubject();
            ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
            SystemLog systemLog = new SystemLog(Address.getIpAddress(),"添加专业成功","添加专业",shiroUser.getId(),new Date());
            systemLogService.save(systemLog);
            return Result.success("添加成功!",null);
        }
        return Result.fail("添加失败!");
    }
}
