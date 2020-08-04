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
        if (form.getSw()==null||form.getSw().equals("")){
            form.setSw("no");
        }else {
            form.setSw("yes");
        }
        if (form.getWrite()==null||form.getWrite().equals("")){
            form.setWrite("no");
        }else {
            form.setWrite("yes");
        }
        if (form.getRead()==null||form.getRead().equals("")){
            form.setRead("no");
        }else {
            form.setRead("yes");
        }
        if (form.getDai()==null||form.getDai().equals("")){
            form.setDai("no");
        }else {
            form.setDai("yes");
        }
        return Result.success("添加成功！",null);
    }
}
