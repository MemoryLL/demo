package com.lhm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FormController {

    @GetMapping("/form.html")
    public String form(){
        return "views/form/formManage";
    }
}
