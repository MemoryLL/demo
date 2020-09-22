package com.lhm.controller;

import com.lhm.config.shiro.ShiroUser;
import com.lhm.pojo.SystemLog;
import com.lhm.service.SystemLogService;
import com.lhm.utils.Address;
import com.lhm.utils.MD5Utils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@Api(tags = "登录操作相关接口")
public class LoginController {

    @Autowired
    SystemLogService systemLogService;

    /**
     * 登录页面跳转
     * @return
     */
    @GetMapping({"", "/", "/login.html"})
    @ApiOperation("登录页面跳转")
    public String index() {
        return "login2";
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
     * 用户登录
     * @param username
     * @param password
     * @param modelMap
     * @param session
     * @return
     */
    @RequestMapping(value = "/login.json", method = RequestMethod.POST)
    @ApiOperation("登录接口")
    public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password, RedirectAttributes modelMap, HttpSession session) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, MD5Utils.md5(password));
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
        } catch (IncorrectCredentialsException ice) {
            modelMap.addFlashAttribute("msg", "密码不正确");
        } catch (UnknownAccountException uae) {
            modelMap.addFlashAttribute("msg", "账号不存在");
        } catch (AuthenticationException ae) {
            modelMap.addFlashAttribute("msg", "该用户被禁用");
        }
        if (subject.isAuthenticated()) {
            System.out.println("认证成功");
            session.setAttribute("username", username);
            ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
            SystemLog systemLog = new SystemLog();
            systemLog.setRemark("用户"+shiroUser.getLoginName()+"登录成功");
            systemLog.setResourceName("用户登录");
            systemLog.setCreateDate(new Date());
            systemLog.setCreatedUserId(shiroUser.getId());
            systemLog.setIpAddress(Address.getIpAddress());
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
        return "index";
    }

}
