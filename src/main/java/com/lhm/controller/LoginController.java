package com.lhm.controller;

import com.lhm.config.shiro.ShiroUser;
import com.lhm.pojo.SystemLog;
import com.lhm.service.SystemLogService;
import com.lhm.utils.Address;
import com.lhm.utils.MD5Utils;
import com.lhm.utils.RandomValidateCodeUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@Api(tags = "登录操作相关接口")
public class LoginController {

    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private HttpServletRequest request;

    /**
     * 登录页面跳转
     * @return
     */
    @GetMapping({"", "/", "/login.html"})
    @ApiOperation("登录页面跳转")
    public String index() {
        return "login3";
    }

    /**
     * 未授权页面跳转
     * @return
     */
    @GetMapping("/noAuth.html")
    @ApiOperation("未授权页面跳转")
    public String noAuth() {
        return "noAuth";
    }

    /**
     * 退出页面跳转
     * @return
     */
    @GetMapping("/exit.html")
    @ApiOperation("退出页面跳转")
    public String exit() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login.html";
    }

    /**
     * 图片验证码
     */
    @GetMapping(value = "/getImageCode.json")
    @ApiOperation("图片验证码")
    public void getImageCode(HttpServletRequest request,HttpServletResponse response){
        try {
            //设置相应类型,告诉浏览器输出的内容为图片
            response.setContentType("image/jpeg");
            //设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            //输出验证码图片方法
            RandomValidateCodeUtil.getRandcode(request, response);
        } catch (Exception e) {
            System.out.println("获取验证码失败>>>>   "+e);
        }

    }

    /**
     * 用户登录
     * @param username
     * @param password
     * @param modelMap
     * @param session
     * @return
     */
    @RequestMapping(value = "/login.json", method = RequestMethod.POST)
    @ApiOperation("登录接口")
    public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password,@RequestParam("imgCode") String imgCode,
                          @RequestParam(value = "rememberMe",defaultValue = "false") Boolean rememberMe, RedirectAttributes modelMap, HttpSession session) {
        if (!StringUtils.isNotBlank(imgCode)){
            modelMap.addFlashAttribute("msg", "请输入验证码");
            return "redirect:/login.html";
        }
        if (!session.getAttribute("VALIDATECODE").equals(imgCode.toUpperCase())){
            modelMap.addFlashAttribute("msg", "验证码不正确");
            return "redirect:/login.html";
        }
        if (!StringUtils.isNotBlank(username)||!StringUtils.isNotBlank(password)){
            modelMap.addFlashAttribute("msg", "账号或密码为空");
            return "redirect:/login.html";
        }
        UsernamePasswordToken token = new UsernamePasswordToken(username, MD5Utils.md5(password),rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
        } catch (IncorrectCredentialsException ice) {
            token.clear();
            modelMap.addFlashAttribute("msg", "密码不正确");
        } catch (UnknownAccountException uae) {
            token.clear();
            modelMap.addFlashAttribute("msg", "账号不存在");
        } catch (AuthenticationException ae) {
            token.clear();
            modelMap.addFlashAttribute("msg", "该用户被禁用");
        }
        //无论是否登录成功都要移除掉session的随机验证码字符串
        RandomValidateCodeUtil.removeRandomString(request);
        if (subject.isAuthenticated()) {
            session.setAttribute("username", username);
            ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
            SystemLog systemLog = new SystemLog(Address.getIpAddress(),"用户"+shiroUser.getLoginName()+"登录成功","用户登录",shiroUser.getId(),new Date());
            systemLogService.save(systemLog);
            return "redirect:/index.html";
        } else {
            token.clear();
            return "redirect:/login.html";
        }
    }

    /**
     * 登录成功后首页跳转
     * @return
     */
    @GetMapping("/index.html")
    @ApiOperation("首页跳转")
    public String toIndex() {
        Subject user = SecurityUtils.getSubject();
        if (user.isAuthenticated()) {
            return "index";
        }
        return "login2";
    }

}
