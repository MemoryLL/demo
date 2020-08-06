package com.lhm.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.mapper.UserMapper;
import com.lhm.pojo.User;
import com.lhm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/7/28 20:08
 * 4
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public IPage<User> selectUserPage(Page page) {
        return userMapper.selectUserPage(page);
    }

    @Override
    public int saveUser(User user) {
        return userMapper.saveUser(user);
    }

    @Override
    public int delUserById(int id) {
        return userMapper.delUserBuId(id);
    }

    @Override
    public int updateAgeById(User user) {
        return userMapper.updateAgeById(user);
    }

    @Override
    public List<User> selectUserByPageHelper(User user) {
        List<User> list = userMapper.selectUserByPageHelper(user);
        return list;
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public int UpdateUserStateById(User user) {
        return userMapper.UpdateUserStateById(user);
    }
}
