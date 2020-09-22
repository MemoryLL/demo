package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.pojo.SystemLog;
import com.lhm.service.SystemLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @Author: lhm
 * @Date: 2020/7/29 13:54
 * 4
 */
@Controller
@Api(tags = "系统日志相关接口")
public class SystemLogController {

    @Autowired
    SystemLogService systemLogService;

    @GetMapping("/systemLog.html")
    @ApiOperation("日志页面跳转")
    public String resourcesManage(){
        return "views/systemLog/systemLogManage";
    }

    /**
     * 日志分页查询
     * @return
     */
    @GetMapping(value = "/systemLogList.json")
    @ApiOperation("获取日志列表接口")
    @ResponseBody
    public Map<String, Object> systemLogList(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        PageHelper.startPage(page,limit);
        List<SystemLog> sysList = systemLogService.selectSysLogByPageHelper();
        PageInfo<SystemLog> info = new PageInfo<>(sysList);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

}
