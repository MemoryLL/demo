package com.lhm.service.impl;

import com.lhm.mapper.RoleMapper;
import com.lhm.pojo.Role;
import com.lhm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/8/8 16:46
 * 4
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleMapper;

    @Override
    public List<Role> selectRoleByPageHelper(Role role) {
        return roleMapper.selectRoleByPageHelper(role);
    }
}
