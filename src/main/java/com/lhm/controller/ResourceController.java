package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.common.TreeNode;
import com.lhm.config.shiro.ShiroUser;
import com.lhm.pojo.SystemLog;
import com.lhm.service.SystemLogService;
import com.lhm.utils.Address;
import com.lhm.utils.TreeBuilder;
import com.lhm.pojo.Resource;
import com.lhm.service.ResourceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    SystemLogService systemLogService;


    @GetMapping("/resources.html")
    @ApiOperation("资源页面跳转")
    public String resourcesManage(){
        return "views/resources/resourcesManage";
    }

    /**
     * 资源分页查询
     */
    @GetMapping(value = "/resourcesList.json")
    @ApiOperation("获取资源列表接口")
    @ResponseBody
    public Map<String, Object> rsourcesList(Resource resource, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        PageHelper.startPage(page,limit);
        List<Resource> list = resourceService.selectResourceByPageHelper(resource);
        PageInfo<Resource> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    /**
     * 添加资源页面跳转
     * @return
     */
    @GetMapping("/addResourceModel.html")
    @ApiOperation("添加资源页面跳转")
    public String addResourceModel() {
        return "views/resources/addResourceModal";
    }

    /**
     * 根据类型查询资源
     */
    @GetMapping("/getPid.json")
    @ApiOperation("根据类型查询资源")
    @ResponseBody
    public Result getPid(@RequestParam("resourceType") Integer resourceType){
        List<Resource> list = resourceService.getResourceByResourceType(resourceType);
        return Result.success("成功",list);
    }

    /**
     * 添加资源接口
     */
    @RequestMapping(value = "/addResource.json",method = RequestMethod.POST)
    @ApiOperation("添加资源接口")
    @ResponseBody
    public Result addResource(Resource resource){
        if (resource.getpId()==null||resource.getpId().equals("")){
            resource.setpId(0);
        }
        resource.setStatus((byte)0);
        resource.setCreateTime(new Date());
        int key = resourceService.addResource(resource);
        if (key==0){
            return Result.fail("添加失败！");
        }
        Subject subject = SecurityUtils.getSubject();
        ShiroUser shiroUser = (ShiroUser)subject.getPrincipal();
        SystemLog systemLog = new SystemLog();
        systemLog.setIpAddress(Address.getIpAddress());
        systemLog.setCreatedUserId(shiroUser.getId());
        systemLog.setCreateDate(new Date());
        systemLog.setRemark("添加资源成功");
        systemLog.setCName("添加资源");
        systemLogService.save(systemLog);
        return Result.success("添加成功！",null);
    }

    /**
     * 修改资源页面跳转
     */
    @GetMapping(value = "/updateResourceModel.html")
    @ApiOperation("修改资源页面跳转")
    public String updateResourceModel(@RequestParam("id") Integer id, HttpServletRequest request){
        Resource resource = resourceService.getResourceById(id);
        request.setAttribute("resource",resource);
        return "views/resources/updateResourceModal";
    }

    /**
     * 修改资源接口
     */
    @RequestMapping(value = "/updateResource.json",method = RequestMethod.POST)
    @ApiOperation("修改资源接口")
    @ResponseBody
    public Result updateResource(Resource resource){
        int key = resourceService.updateResourceById(resource);
        if (key==0){
            return Result.fail("修改失败！");
        }
        Subject subject = SecurityUtils.getSubject();
        ShiroUser shiroUser = (ShiroUser)subject.getPrincipal();
        SystemLog systemLog = new SystemLog();
        systemLog.setIpAddress(Address.getIpAddress());
        systemLog.setCreatedUserId(shiroUser.getId());
        systemLog.setCreateDate(new Date());
        systemLog.setRemark("修改资源成功");
        systemLog.setCName("修改资源");
        systemLogService.save(systemLog);
        return Result.success("修改成功！",null);
    }

    /**
     * 修改资源状态
     */
    @RequestMapping(value = "/updateResourceStatusById.json",method = RequestMethod.POST)
    @ApiOperation("修改资源状态")
    @ResponseBody
    public Result updateResourceStatusById(Resource resource){
        int key = resourceService.updateResourceStatusById(resource);
        if (key==0){
            return Result.fail("修改失败！");
        }
        Subject subject = SecurityUtils.getSubject();
        ShiroUser shiroUser = (ShiroUser)subject.getPrincipal();
        SystemLog systemLog = new SystemLog();
        systemLog.setIpAddress(Address.getIpAddress());
        systemLog.setCreatedUserId(shiroUser.getId());
        systemLog.setCreateDate(new Date());
        systemLog.setRemark("修改资源状态成功");
        systemLog.setCName("修改资源状态");
        systemLogService.save(systemLog);
        return Result.success("修改成功！",null);
    }
}
