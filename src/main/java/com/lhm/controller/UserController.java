package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.config.shiro.ShiroUser;
import com.lhm.pojo.SystemLog;
import com.lhm.pojo.User;
import com.lhm.service.SystemLogService;
import com.lhm.service.UserService;
import com.lhm.utils.Address;
import com.lhm.utils.MD5Utils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Api(tags = "用户操作相关接口")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    SystemLogService systemLogService;

    /**
     * 跳转到用户页面
     * @param
     * @return
     */
    @GetMapping("/user.html")
    @ApiOperation("用户页面跳转")
    public String user() {
        return "views/user/userManage";
    }

    /**
     * 获取用户列表（
     * @return
     */
    @GetMapping(value = "/userList.json")
    @ApiOperation("获取用户列表接口")
    @ResponseBody
    public Map<String, Object> userList(User user,@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<User> list = userService.selectUserByPageHelper(user);
        PageInfo<User> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    /**
     * 根据用户id修改用户年龄
     * @param id
     * @param age
     * @return
     */
    @RequestMapping(value = "/updateAgeById.json", method = RequestMethod.POST)
    @ApiOperation("根据用户id修改用户年龄接口")
    @ResponseBody
    public Result updateAgeById(@RequestParam("id") Integer id, @RequestParam("age") Integer age) {
        User user = new User();
        user.setId(id);
        user.setAge(age);
        int key = userService.updateAgeById(user);
        if (key!=0){
            return Result.success("修改成功！",null);
        }
        return Result.fail("修改失败！");
    }

    /**
     * 跳转到添加用户页面
     * @return
     */
    @GetMapping("/addUserModel.html")
    @ApiOperation("添加用户页面跳转")
    public String addUsermodel() {
        return "views/user/addUserModal";
    }

    /**
     * 添加用户
     * @return
     */
    @RequestMapping(value = "/addUser.json", method = RequestMethod.POST)
    @ApiOperation("添加用户接口")
    @ResponseBody
    public Result addUser(User user, @RequestParam("filename") String filename,@RequestParam("roldId") Integer roldId) {
        if (filename != null && !"".equals(filename)) {
            user.setFile(filename);
        }
        user.setCreateTime(new Date());
        user.setPassword(MD5Utils.md5(user.getPassword()));
        int key = userService.saveUser(user,roldId);
        System.out.println(user.getId());
        if (key != 0) {
            Subject subject = SecurityUtils.getSubject();
            ShiroUser shiroUser = (ShiroUser)subject.getPrincipal();
            SystemLog systemLog = new SystemLog();
            systemLog.setIpAddress(Address.getIpAddress());
            systemLog.setCreatedUserId(shiroUser.getId());
            systemLog.setCreateDate(new Date());
            systemLog.setRemark("添加用户成功");
            systemLog.setResourceName("添加用户");
            systemLogService.save(systemLog);
            return Result.success("添加成功！", null);
        } else {
            return Result.fail("添加失败！");
        }
    }

    /**
     * 修改用户状态
     */
    @RequestMapping(value = "/UpdateUserStateById.json", method = RequestMethod.POST)
    @ApiOperation("修改用户状态接口")
    @ResponseBody
    public Result UpdateUserStateById(User user) {
        int key = userService.UpdateUserStateById(user);
        if (key == 0) {
            return Result.fail("修改失败！");
        }
        Subject subject = SecurityUtils.getSubject();
        ShiroUser shiroUser = (ShiroUser)subject.getPrincipal();
        SystemLog systemLog = new SystemLog();
        systemLog.setIpAddress(Address.getIpAddress());
        systemLog.setCreatedUserId(shiroUser.getId());
        systemLog.setCreateDate(new Date());
        systemLog.setRemark("修改用户状态成功");
        systemLog.setResourceName("修改用户状态");
        systemLogService.save(systemLog);
        return Result.success("修改成功！", null);
    }
}
