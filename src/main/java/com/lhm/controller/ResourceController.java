package com.lhm.controller;

import com.lhm.common.Result;
import com.lhm.common.TreeBuilder;
import com.lhm.pojo.Resource;
import com.lhm.service.ResourceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/7/29 13:54
 * 4
 */
@Controller
@Api(tags = "资源操作相关接口")
public class ResourceController {

    @Autowired
    ResourceService resourceService;

    @GetMapping("/menuInfo.json")
    @ApiOperation("获取资源")
    @ResponseBody
    public Result getResource(){
        List<Resource> resourceList = resourceService.getMenuInfo();
        if (resourceList!=null&&resourceList.size()>0){
            List<Resource> tree = TreeBuilder.bulid(resourceList);
            return Result.success("获取成功！",tree);
        }
        return Result.fail("数据异常");
    }
}
