package com.lhm.mapper;


import com.lhm.pojo.Role;

import java.util.List;

public interface RoleMapper {

    List<Role> selectRoleByPageHelper(Role role);

}