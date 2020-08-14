package com.lhm.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lhm.mapper.ResourceMapper;
import com.lhm.mapper.RoleMapper;
import com.lhm.mapper.UserMapper;
import com.lhm.pojo.Role;
import com.lhm.pojo.RoleResource;
import com.lhm.pojo.User;
import com.lhm.pojo.UserRole;
import com.lhm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.Date;
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
    @Autowired
    RoleMapper roleMapper;
    @Autowired
    ResourceMapper resourceMapper;

    @Override
    public IPage<User> selectUserPage(Page page) {
        return userMapper.selectUserPage(page);
    }

    @Override
    @Transactional
    public int saveUser(User user,Integer roleId) {
        userMapper.saveUser(user);
        UserRole userRole = new UserRole();
        userRole.setCreateTime(new Date());
        userRole.setUserId(user.getId());
        userRole.setRoleId(roleId);
        int key = roleMapper.addUserRole(userRole);
        return key;
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

    @Override
    public User findUserByName(String username) {
        return userMapper.findUserByName(username);
    }

    @Override
    public List<String> findPermsById(Integer userId) {
        UserRole userRole = roleMapper.findRoleByUserid(userId);
        Role role = roleMapper.findRoleByRoleId(userRole.getRoleId());
        if (role==null){
            return new ArrayList<>();
        }
        List<RoleResource> list = resourceMapper.findResourceByRoleId(role.getId());
        List<String> perms = resourceMapper.findResourceHrefById(list);
        return perms;
    }
}
