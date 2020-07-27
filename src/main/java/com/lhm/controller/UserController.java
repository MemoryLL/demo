package com.lhm.controller;

import com.lhm.common.Result;
import com.lhm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    /**
     * 跳转到用户页面
     * @param
     * @return
     */
    @GetMapping("/user.html")
    public String user(){
        return "views/user/userManage";
    }

    /**
     * 获取用户列表（没连数据库所以伪造了数据和分页）
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/userList.json")
    @ResponseBody
    public Map<String, Object> userList(HttpSession session,HttpServletRequest request){
        String page = request.getParameter("page");
        String limit = request.getParameter("limit");
        int pages = Integer.parseInt(page);
        int rows = Integer.parseInt(limit);
        List<User> list = (List<User>) session.getAttribute("userList");
        Map<String, Object> map = new HashMap<>();
        if (list==null&&list.size()==0){
            User user1 = new User(10001,"张三",18,"123456789@qq.com","张三的文件","男","浙江杭州");
            User user2 = new User(10002,"李四",20,"123456789@qq.com","李四的文件","男","浙江杭州");
            User user3 = new User(10003,"王五",22,"123456789@qq.com","王五的文件","男","浙江杭州");
            User user4 = new User(10004,"孙六",15,"123456789@qq.com","孙六的文件","男","浙江杭州");
            List<User> userList = new ArrayList<>();
            userList.add(user1);
            userList.add(user2);
            userList.add(user3);
            userList.add(user4);
            session.setAttribute("userList",userList);
            map.put("code",0);
            map.put("msg", "");
            map.put("count",userList.size());
            List<User> returnList = new ArrayList<>();
            if (pages==1){
                returnList.add(userList.get(0));
                returnList.add(userList.get(1));
                map.put("data",returnList);
            }else {
                returnList.add(userList.get(2));
                returnList.add(userList.get(3));
                map.put("data",returnList);
            }
        }else {
            List<User> returnList = new ArrayList<>();
            map.put("code",0);
            map.put("msg", "");
            map.put("count",list.size());
            if (pages==1){
                returnList.add(list.get(0));
                returnList.add(list.get(1));
                map.put("data",returnList);
            }else {
                returnList.add(list.get(2));
                returnList.add(list.get(3));
                map.put("data",returnList);
            }
        }
        return map;
    }

    /**
     * 根据用户id修改用户年龄
     * @param session
     * @param id
     * @param age
     * @return
     */
    @RequestMapping("/updateAgeById.json")
    @ResponseBody
    public Result  updateAgeById(HttpSession session, @RequestParam("id") Integer id,@RequestParam("age") Integer age){
        List<User> userList = (List<User>) session.getAttribute("userList");
        for (User user:userList) {
            if (user.getId().equals(id)){
                user.setAge(age);
                session.setAttribute("userList",userList);
                return Result.success("修改成功!",userList);
            }
        }
        return Result.fail("修改失败！");
    }

    /**
     * 跳转到添加用户页面
     * @return
     */
    @RequestMapping("/addUserModel.html")
    public String addUsermodel(){
        return "views/user/addUserModal";
    }

    /**
     * 添加用户
     * @param username
     * @param filename
     * @return
     */
    @RequestMapping("/addUser.json")
    @ResponseBody
    public Result addUser(@RequestParam("username") String username,@RequestParam("filename") String filename){
        if (username!=null&&!username.equals("")&&filename!=null&&!filename.equals("")){
            return Result.success("添加成功！",null);
        }
        return Result.fail("添加失败！");
    }
}
