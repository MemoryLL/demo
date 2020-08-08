package com.lhm.service;

import com.lhm.pojo.Role;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/8/8 16:46
 * 4
 */
public interface RoleService {
    List<Role> selectRoleByPageHelper(Role role);

}
