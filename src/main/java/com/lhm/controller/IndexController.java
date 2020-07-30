package com.lhm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
    @RequestMapping({"","/"})
    public String index(){
        return "login";
    }

    @GetMapping("/console.html")
    public String console(){
        return "views/console/consoleManage";
    }
}
