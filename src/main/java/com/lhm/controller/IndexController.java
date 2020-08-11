package com.lhm.controller;

import com.lhm.common.Result;
import com.lhm.pojo.Resource;
import com.lhm.pojo.User;
import com.lhm.service.ResourceService;
import com.lhm.service.UserService;
import com.lhm.utils.TreeBuilder;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@Api(tags = "首页操作相关接口")
public class IndexController {

    @Autowired
    ResourceService resourceService;
    @Autowired
    UserService userService;

    @GetMapping("/menuInfo.json")
    @ApiOperation("获取菜单接口")
    @ResponseBody
    public Result getResource(){
        List<Resource> resourceList = resourceService.getMenuInfo();
        if (resourceList!=null&&resourceList.size()>0){
            List<Resource> tree = TreeBuilder.bulid(resourceList);
            return Result.success("获取成功！",tree);
        }
        return Result.fail("数据异常");
    }


    @GetMapping("/console.html")
    @ApiOperation("控制台页面跳转")
    public String console(HttpServletRequest request){
        int caidan = 0;
        int yemian = 0;
        int anniu = 0;
        List<Resource> rList = resourceService.getMenuInfo();
        List<User> uList = userService.getAllUser();
        if (rList!=null&&rList.size()>0){
            for (Resource resource :rList) {
                if (resource.getResourceType()==0){
                    caidan++;
                }else if (resource.getResourceType()==1){
                    yemian++;
                }else if (resource.getResourceType()==2){
                    anniu++;
                }
            }
        }
        if (uList!=null&&uList.size()>0){
            request.setAttribute("user",uList.size());
        }else {
            request.setAttribute("user",0);
        }
        request.setAttribute("caidan",caidan);
        request.setAttribute("yemian",yemian);
        request.setAttribute("anniu",anniu);
        return "views/console/consoleManage";
    }
}
