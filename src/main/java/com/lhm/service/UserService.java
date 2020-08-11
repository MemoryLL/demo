package com.lhm.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageInfo;
import com.lhm.pojo.User;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/7/28 20:02
 * 4
 */
public interface UserService {
    IPage<User> selectUserPage(Page page);

    int saveUser(User user,Integer roleId);

    int delUserById(int id);

    int updateAgeById(User user);

    List<User> selectUserByPageHelper(User user);

    List<User> getAllUser();

    int UpdateUserStateById(User user);

    User findUserByName(String username);

    List<String> findPermsById(Integer userId);


}
