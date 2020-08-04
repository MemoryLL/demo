package com.lhm.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Api(tags = "权限操作相关接口")
public class OperateruleController {

    @GetMapping("/operaterule.html")
    @ApiOperation("权限页面跳转")
    public String operaterule(){
        return "views/operaterule/operateruleManage";
    }
}
