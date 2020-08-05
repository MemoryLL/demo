package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.common.TreeBuilder;
import com.lhm.pojo.Resource;
import com.lhm.service.ResourceService;
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
@Api(tags = "资源操作相关接口")
public class ResourceController {

    @Autowired
    ResourceService resourceService;


    @GetMapping("/resources.html")
    @ApiOperation("资源页面跳转")
    public String resourcesManage(){
        return "views/resources/resourcesManage";
    }

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

    /**
     * 获取资源
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
     *
     * @return
     */
    @GetMapping("/addResourceModel.html")
    @ApiOperation("添加资源页面跳转")
    public String addResourceModel() {
        return "views/resources/addResourceModal";
    }

    /**
     *
     */
    @GetMapping("/getPid.json")
    @ResponseBody
    public Result getPid(@RequestParam("resourceType") Integer resourceType){
        List<Resource> list = resourceService.getResourceByResourceType(resourceType);
        return Result.success("成功",list);
    }

    /**
     *
     */
    @RequestMapping(value = "/addResource.json",method = RequestMethod.POST)
    @ResponseBody
    public Result addResource(Resource resource){
        if (resource.getpId()==null||resource.getpId().equals("")){
            resource.setpId(0);
        }
        resource.setStatus((byte)0);
        int key = resourceService.addResource(resource);
        if (key==0){
            return Result.fail("添加失败！");
        }
        return Result.success("添加成功！",null);
    }
}
