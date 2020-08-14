package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.common.TreeNode;
import com.lhm.common.TreeNode2;
import com.lhm.pojo.Resource;
import com.lhm.pojo.Role;
import com.lhm.pojo.RoleResource;
import com.lhm.service.ResourceService;
import com.lhm.service.RoleService;
import com.lhm.utils.TreeBuilder;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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


    @GetMapping("/getRole.json")
    @ApiOperation("获取角色接口")
    @ResponseBody
    public Result getAllRole(){
        List<Role> roleList = roleService.getAllRole();
        if (roleList!=null&&roleList.size()>0){
            return Result.success("获取成功",roleList);
        }
        return Result.fail("还没有角色！");
    }


    @RequestMapping(value = "/addRole.json",method = RequestMethod.POST)
    @ApiOperation("添加角色接口")
    @ResponseBody
    public Result addRole(Role role,@RequestParam("roleIds") List<Integer> roleIds){
        if(role==null){
            return Result.fail("角色信息为空！");
        }
        if (roleIds==null&&roleIds.size()==0){
            return Result.fail("未给角色赋予资源！");
        }
        role.setCreateTime(new Date());
        int key = roleService.saveRoleResource(role,roleIds);
        if (key==roleIds.size()){
            return Result.success("添加成功！",null);
        }
        return Result.fail("添加失败！");
    }

    @GetMapping("/updateRoleModel.html")
    @ApiOperation("修改角色页面跳转")
    public String updateRoleModel(@RequestParam("id") Integer roleId, HttpServletRequest request){
        Role role = roleService.findRoleById(roleId);
        request.setAttribute("role",role);
        return "views/role/updateRoleModal";
    }

    @RequestMapping(value = "/updateRole.json",method = RequestMethod.POST)
    @ApiOperation("修改角色")
    @ResponseBody
    public Result updateRole(Role role,@RequestParam("roleIds") List<Integer> roleIds){
        return Result.success("接口还没写完呢",null);
    }

    @RequestMapping(value = "/updateRroleStatusById.json",method = RequestMethod.POST)
    @ApiOperation("根据id修改状态")
    @ResponseBody
    public Result updateRroleStatusById(Role role){
        return Result.success("接口还没写玩呢",null);
    }

    @RequestMapping(value = "/getResourceByRoleId.json",method = RequestMethod.POST)
    @ApiOperation("根据角色id获取tree")
    @ResponseBody
    public Result getResourceByRoleId(@RequestParam("roleId") Integer roleId){
        List<Resource> resourceList = resourceService.getAllResource();
        List<RoleResource> roleResourceList = resourceService.findResourceByRoleId(roleId);
        List<TreeNode2> treeNodes = TreeBuilder.TreeNodeBulid2(resourceList,roleResourceList);
        if (treeNodes==null){
            return Result.fail("获取失败！");
        }
        return Result.success("获取成功！",treeNodes);
    }

}
