package com.lhm.controller;

import com.lhm.common.Result;
import com.lhm.pojo.Form;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Api(tags = "表单操作相关接口")
public class FormController {

    @GetMapping("/form.html")
    @ApiOperation("表单页面跳转")
    public String form(){
        return "views/form/formManage";
    }

    @PostMapping("/testAdd.json")
    @ApiOperation("表单添加接口")
    @ResponseBody
    public Result testAdd(@RequestBody Form form){
        return Result.success("添加成功！",null);
    }
}
