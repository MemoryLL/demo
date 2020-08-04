package com.lhm.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Api(tags = "登录操作相关接口")
public class LoginController {
    @GetMapping("/exit.html")
    @ApiOperation("退出页面跳转")
    public String exit(){
        return "login";
    }

    @RequestMapping("/login.json")
    @ApiOperation("登录接口")
    public String doLogin(){
        return "redirect:/index.html";
    }

    @GetMapping("/index.html")
    @ApiOperation("首页跳转")
    public String toIndex(){
        return "index";
    }
}
