package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.common.TreeNode;
import com.lhm.pojo.Resource;
import com.lhm.pojo.Role;
import com.lhm.service.ResourceService;
import com.lhm.service.RoleService;
import com.lhm.utils.TreeBuilder;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Api(tags = "角色操作相关接口")
public class RoleController {

    @Autowired
    ResourceService resourceService;

    @Autowired
    RoleService roleService;

    @GetMapping("/role.html")
    @ApiOperation("角色页面跳转")
    public String roleManage(){
        return "views/role/roleManage";
    }

    /**
     * 角色分页查询
     * @return
     */
    @GetMapping("/roleList.json")
    @ApiOperation("分页查询角色接口")
    @ResponseBody
    public Map<String, Object> roleList(Role role, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        PageHelper.startPage(page,limit);
        List<Role> roleList = roleService.selectRoleByPageHelper(role);
        PageInfo<Role> info = new PageInfo<>(roleList);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        if (info.getList()==null){
            map.put("msg", "无数据！");
        }else{
            map.put("msg", "查询成功！");
        }
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;

    }

    @GetMapping("/getAllResource.json")
    @ApiOperation("获取所有资源接口")
    @ResponseBody
    public Result getAllResource(){
        List<Resource> resourceList = resourceService.getAllResource();
        List<TreeNode> treeNodes = TreeBuilder.TreeNodeBulid(resourceList);
        if (treeNodes==null){
            return Result.fail("获取失败！");
        }
        return Result.success("获取成功！",treeNodes);
    }

    @GetMapping("/addRoleModel.html")
    @ApiOperation("添加角色页面跳转")
    public String addRoleModel(){
        return "views/role/addRoleModal";
    }


    @RequestMapping(value = "/addRole.json",method = RequestMethod.POST)
    @ApiOperation("添加角色接口")
    @ResponseBody
    public Result addRole(Role role,@RequestParam("roleIds") List<Integer> roleIds){
        System.out.println(role);
        return Result.success("后台接口还未写完呢！",null);
    }
}
