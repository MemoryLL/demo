package com.lhm.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * @Author: lhm
 * @Date: 2020/7/29 13:54
 * 4
 */
@Controller
@Api(tags = "系统日志相关接口")
public class SystemLogController {

    @GetMapping("/systemLog.html")
    @ApiOperation("日志页面跳转")
    public String resourcesManage(){
        return "views/systemLog/systemLogManage";
    }

}
