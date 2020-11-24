package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.pojo.Stu;
import com.lhm.service.StuService;
import com.lhm.vo.StuVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: lhm
 * @Date: 2020/11/15 13:16
 * 4
 */
@Controller
@Api(tags = "学生操作相关接口")
public class StudentController {

    @Autowired
    private StuService stuService;

    @GetMapping("/student.html")
    @ApiOperation("学生页面跳转")
    public String StudentManage(){
        return "views/student/studentManage";
    }

    @GetMapping("/addStudentModel.html")
    @ApiOperation("添加教职工页面跳转")
    public String addStudentModel() {
        return "views/student/addStudentModal";
    }

    @GetMapping("/getAllStudent.json")
    @ApiOperation("获取所有学生接口")
    public Result getAllStduent(){
        return stuService.getAllStduent();
    }

    /**
     * 分页获取专业列表（
     * @return
     */
    @GetMapping(value = "/studentList.json")
    @ApiOperation("分页获取学生列表接口")
    @ResponseBody
    public Map<String, Object> majorPageHelper(Stu student, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<Stu> list = stuService.selectStuByPageHelper(student);
        PageInfo<Stu> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>(4);
        map.put("code", 0);
        map.put("msg", "获取成功");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    /**
     * 添加专业
     * @return
     */
    @RequestMapping(value = "/addStudent.json", method = RequestMethod.POST)
    @ApiOperation("添加学生接口")
    @ResponseBody
    public Result addStudent(Stu student) {
        return stuService.save(student);
    }

    @GetMapping(value = "/detailStudentModel.html")
    @ApiOperation("学生详情页面跳转")
    public String detailStudentModel(@RequestParam("stuNumber") String stuNumber, HttpServletRequest request){
        StuVo stuVo = stuService.getStuDatailByStuNumber(stuNumber);
        //根据其他的
        request.setAttribute("stu",stuVo);
        return "views/student/detailStudentModal";
    }
}
