package com.lhm.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.pojo.Stu;
import com.lhm.service.StuService;
import com.lhm.vo.StuVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
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
    public String StudentManage() {
        return "views/student/studentManage";
    }

    @GetMapping("/addStudentModel.html")
    @ApiOperation("添加教职工页面跳转")
    public String addStudentModel() {
        return "views/student/addStudentModal";
    }

    @GetMapping("/getAllStudent.json")
    @ApiOperation("获取所有学生接口")
    public Result getAllStduent() {
        List<Stu> allStduent = stuService.getAllStduent();
        return Result.success("获取成功", allStduent);
    }

    /**
     * 分页获取专业列表（
     *
     * @return
     */
    @GetMapping(value = "/studentList.json")
    @ApiOperation("分页获取学生列表接口")
    @ResponseBody
    public Map<String, Object> majorPageHelper(Stu student, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page, limit);
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
     * 添加学生
     *
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
    public String detailStudentModel(@RequestParam("stuNumber") String stuNumber, HttpServletRequest request) {
        StuVo stuVo = stuService.getStuDatailByStuNumber(stuNumber);
        //根据其他的
        request.setAttribute("stu", stuVo);
        return "views/student/detailStudentModal";
    }

    //导出excel
    @RequestMapping("/exportStu.json")
    @ApiOperation("导出Excel")
    public void exportExcelStu(Stu stu,HttpServletResponse response) throws IOException {
            System.out.println(stu);
            //查询出要导出的数据,可以根据条件查询出要导出的数据
            List<Stu> stus = stuService.getAllStduent();
            //生成Excel
            Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("学生信息列表", "学生信息"), Stu.class, stus);
            response.setHeader("content-disposition", "attachment;fileName=" + URLEncoder.encode("学生信息.xls", "UTF-8"));
            ServletOutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            outputStream.close();
            workbook.close();
    }
}
