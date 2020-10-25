package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.pojo.Department;
import com.lhm.service.DepartmentService;
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
 * @Date: 2020/10/24 14:27
 * 4
 */
@Controller
@Api(tags = "系部操作相关接口")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/department.html")
    @ApiOperation("系部页面跳转")
    public String departmentManage(){
        return "views/department/departmentManage";
    }

    @GetMapping("/getAllDepartment.json")
    @ApiOperation("获取所有系部")
    @ResponseBody
    public Result getAllDep(){
        List<Department> list = departmentService.getAllDep();
        return Result.success("获取成功",list);
    }

    /**
     * 获取系部列表（
     * @return
     */
    @GetMapping(value = "/departmentList.json")
    @ApiOperation("获取系部列表接口")
    @ResponseBody
    public Map<String, Object> userList(Department department, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<Department> list = departmentService.selectDepartmentByPageHelper(department);
        PageInfo<Department> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "获取成功");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    @GetMapping("/addDepartmentModel.html")
    @ApiOperation("添加系部页面跳转")
    public String addDepartmentModel() {
        return "views/department/addDepartmentModal";
    }

    /**
     * 添加系部
     * @return
     */
    @RequestMapping(value = "/addDepartment.json", method = RequestMethod.POST)
    @ApiOperation("添加系部接口")
    @ResponseBody
    public Result addDeparment(Department department) {
        int result = departmentService.saveDepartment(department);
        if (result >= 1){
            return Result.success("添加成功!",null);
        }
        return Result.fail("添加失败!");
    }
}
