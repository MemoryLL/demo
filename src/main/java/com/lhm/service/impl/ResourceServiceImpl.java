package com.lhm.service.impl;

import com.lhm.config.shiro.ShiroUser;
import com.lhm.mapper.ResourceMapper;
import com.lhm.mapper.RoleMapper;
import com.lhm.pojo.Resource;
import com.lhm.pojo.Role;
import com.lhm.pojo.RoleResource;
import com.lhm.pojo.UserRole;
import com.lhm.service.ResourceService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/7/29 14:01
 * 4
 */
@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    ResourceMapper resourceMapper;
    @Autowired
    RoleMapper roleMapper;

    @Override
    public List<Resource> getMenuInfo() {
        Subject subject = SecurityUtils.getSubject();
        ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
        UserRole userRole = roleMapper.findRoleByUserid(shiroUser.getId());
        List<RoleResource> roleResourceList = resourceMapper.findResourceByRoleId(userRole.getRoleId());
        List<Resource> resourceList = resourceMapper.findResourceByListId(roleResourceList);
        //return resourceMapper.getMenuInfo();
        return resourceList;
    }

    @Override
    public List<Resource> selectResourceByPageHelper(Resource resource) {
        return resourceMapper.selectResourceByPageHelper(resource);
    }

    @Override
    public List<Resource> getResourceByResourceType(Integer resourceType) {
        return resourceMapper.getResourceByResourceType(resourceType);
    }

    @Override
    public int addResource(Resource resource) {
        return resourceMapper.addResource(resource);
    }

    @Override
    public Resource getResourceById(Integer id) {
        return resourceMapper.getResourceById(id);
    }

    @Override
    public int updateResourceStatusById(Resource resource) {
        return resourceMapper.updateResourceStatusById(resource);
    }

    @Override
    public int updateResourceById(Resource resource) {
        return resourceMapper.updateResourceById(resource);
    }

    @Override
    public List<Resource> getAllResource() {
        return resourceMapper.getAllResource();
    }

    @Override
    public List<RoleResource> findResourceByRoleId(Integer roleId) {
        return resourceMapper.findResourceByRoleId(roleId);
    }
}
