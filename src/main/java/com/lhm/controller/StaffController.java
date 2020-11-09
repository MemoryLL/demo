package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.config.shiro.ShiroUser;
import com.lhm.pojo.Staff;
import com.lhm.pojo.SystemLog;
import com.lhm.service.StaffService;
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
 * @Date: 2020/10/26 19:29
 * 4
 */
@Controller
@Api(tags = "教职工操作相关接口")
public class StaffController {

    @Autowired
    private StaffService staffService;

    @Autowired
    private SystemLogService systemLogService;

    @GetMapping("/staff.html")
    @ApiOperation("教职工页面跳转")
    public String majorManage(){
        return "views/staff/staffManage";
    }

    @GetMapping("/getAllStaff.json")
    @ApiOperation("获取所有教职工")
    @ResponseBody
    public Result getAllStaff(){
        List<Staff> list = staffService.getAllStaff();
        return Result.success("获取成功",list);
    }

    @GetMapping("/staffList.json")
    @ApiOperation("分页获取教职工列表接口")
    @ResponseBody
    public Map<String, Object> userList(Staff staff, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<Staff> list = staffService.selectStaffByPageHelper(staff);
        PageInfo<Staff> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "获取成功");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    @GetMapping("/addStaffModel.html")
    @ApiOperation("添加教职工页面跳转")
    public String addStaffModel() {
        return "views/staff/addStaffModal";
    }

    /**
     * 添加教职工
     * @return
     */
    @RequestMapping(value = "/addStaff.json", method = RequestMethod.POST)
    @ApiOperation("添加教职工接口")
    @ResponseBody
    public Result addStaff(Staff staff) {
        int result = staffService.saveStaff(staff);
        if (result >= 1){
            Subject subject = SecurityUtils.getSubject();
            ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
            SystemLog systemLog = new SystemLog(Address.getIpAddress(),"添加教职工成功","添加教职工",shiroUser.getId(),new Date());
            systemLogService.save(systemLog);
            return Result.success("添加成功!",null);
        }
        return Result.fail("添加失败!");
    }
}
