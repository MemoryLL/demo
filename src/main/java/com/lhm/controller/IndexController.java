package com.lhm.controller;

import com.lhm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {
    @RequestMapping({"","/"})
    public String index(HttpSession session){
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
        return "index";
    }

    @GetMapping("/console.html")
    public String console(){
        return "views/console/consoleManage";
    }
}
