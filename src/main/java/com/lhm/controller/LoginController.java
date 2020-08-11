package com.lhm.controller;

import com.lhm.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Api(tags = "登录操作相关接口")
public class LoginController {

    @GetMapping({"","/","/login.html"})
    @ApiOperation("登录页面跳转")
    public String index(){
        return "login2";
    }

    @GetMapping("/noAuth.html")
    @ApiOperation("未授权页面跳转")
    public String noAuth(){
        return "noAuth";
    }

    @GetMapping("/exit.html")
    @ApiOperation("退出页面跳转")
    public String exit(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login.html";
    }

    @RequestMapping(value = "/login.json",method = RequestMethod.POST)
    @ApiOperation("登录接口")
    public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password, RedirectAttributes modelMap){
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
        }catch (IncorrectCredentialsException ice){
            modelMap.addFlashAttribute("msg","密码不正确");
        }catch(UnknownAccountException uae){
            modelMap.addFlashAttribute("msg","账号不存在");
        }catch(AuthenticationException ae){
            modelMap.addFlashAttribute("msg","该用户被禁用");
        }
        if (subject.isAuthenticated()){
            System.out.println("认证成功");
            modelMap.addFlashAttribute("username",username);
            return "redirect:/index.html";
        }else {
            token.clear();
            return "redirect:/login.html";
        }
    }

    @GetMapping("/index.html")
    @ApiOperation("首页跳转")
    public String toIndex(){
        return "index";
    }

}
