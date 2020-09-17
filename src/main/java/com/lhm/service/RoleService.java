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

    int saveRole(Role role);

    int saveRoleResource(Role role, List<Integer> roleIds);

    List<Role> getAllRole();

    Role findRoleById(Integer roleId);

    int updateRole(Role role, List<Integer> roleIds);

}
