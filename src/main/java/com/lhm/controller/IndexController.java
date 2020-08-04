package com.lhm.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Api(tags = "首页操作相关接口")
public class IndexController {


    @GetMapping({"","/"})
    @ApiOperation("登录页面跳转")
    public String index(){
        return "login";
    }


    @GetMapping("/console.html")
    @ApiOperation("控制台页面跳转")
    public String console(){
        return "views/console/consoleManage";
    }
}
