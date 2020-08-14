package com.lhm.service.impl;

import com.lhm.config.shiro.ShiroUser;
import com.lhm.mapper.RoleMapper;
import com.lhm.pojo.Role;
import com.lhm.pojo.RoleResource;
import com.lhm.service.RoleService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
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

    @Override
    public int saveRole(Role role) {
        return roleMapper.saveRole(role);
    }

    @Override
    @Transactional
    public int saveRoleResource(Role role, List<Integer> roleIds) {
        Subject subject = SecurityUtils.getSubject();
        ShiroUser shiroUser =(ShiroUser) subject.getPrincipal();
        role.setCreateUserId(shiroUser.getId());
        roleMapper.saveRole(role);
        List<RoleResource> roleResourceList = new ArrayList<>();
        Date date = new Date();
        RoleResource roleResource;
        for (int i = 0 ; i < roleIds.size() ; i++) {
            roleResource = new RoleResource();
            roleResource.setRoleId(role.getId());
            roleResource.setResourceId(roleIds.get(i));
            roleResource.setCreateTime(date);
            roleResourceList.add(roleResource);
        }
        return roleMapper.saveRoleResource(roleResourceList);
    }

    @Override
    public List<Role> getAllRole() {
        return roleMapper.getAllRole();
    }

    @Override
    public Role findRoleById(Integer roleId) {
        return roleMapper.findRoleById(roleId);
    }
}
