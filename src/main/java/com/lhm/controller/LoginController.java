package com.lhm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @GetMapping("/exit.html")
    public String exit(){
        return "login";
    }

    @RequestMapping("/login.json")
    public String doLogin(){
        return "redirect:/index.html";
    }

    @RequestMapping("/index.html")
    public String toIndex(HttpSession session){
        return "index";
    }
}
