package com.lhm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OperateruleController {

    @GetMapping("/operaterule.html")
    public String operaterule(){
        return "views/operaterule/operateruleManage";
    }
}
