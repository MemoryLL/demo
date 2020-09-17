package com.lhm.mapper;


import com.lhm.pojo.Role;
import com.lhm.pojo.RoleResource;
import com.lhm.pojo.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {

    List<Role> selectRoleByPageHelper(Role role);

    int saveRole(Role role);

    int saveRoleResource(List<RoleResource> roleResourceList);

    UserRole findRoleByUserid(@Param("userId") Integer userId);

    Role findRoleByRoleId(@Param("roleId") Integer roleId);

    List<Role> getAllRole();

    int addUserRole(UserRole userRole);

    Role findRoleById(@Param("roleId") Integer roleId);

    int updateRole(Role role);

    void deleteResourceByRoleId(@Param("id") Integer id);

    List<RoleResource> getRoleResourceByRoleId(@Param("id") Integer id);

}