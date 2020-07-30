package com.lhm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.pojo.User;
import com.lhm.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Api(tags = "用户操作相关接口")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 跳转到用户页面
     *
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
     *
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
     *
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
     *
     * @return
     */
    @GetMapping("/addUserModel.html")
    @ApiOperation("添加用户页面跳转")
    public String addUsermodel() {
        return "views/user/addUserModal";
    }

    /**
     * 添加用户
     *
     * @return
     */
    @RequestMapping(value = "/addUser.json", method = RequestMethod.POST)
    @ApiOperation("添加用户接口")
    @ResponseBody
    public Result addUser(User user, @RequestParam("filename") String filename) {
        if (filename != null && !filename.equals("")) {
            user.setFile(filename);
        }
        int key = userService.saveUser(user);
        System.out.println(user.getId());
        if (key != 0) {
            return Result.success("添加成功！", null);
        } else {
            return Result.fail("添加失败！");
        }
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delUserById.json", method = RequestMethod.POST)
    @ApiOperation("删除用户接口")
    @ResponseBody
    public Result delUserById(@RequestParam("id") int id) {
        if (id == 0) {
            return Result.fail("无效参数！");
        }
        int key = userService.delUserById(id);
        if (key != 0) {
            return Result.success("删除成功！", null);
        }
        return Result.fail("删除失败！");
    }
}
