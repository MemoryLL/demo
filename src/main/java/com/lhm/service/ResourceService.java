package com.lhm.service;

import com.lhm.pojo.Resource;
import com.lhm.pojo.RoleResource;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/7/29 14:01
 * 4
 */
public interface ResourceService {
     List<Resource> getMenuInfo();

    List<Resource> selectResourceByPageHelper(Resource resource);

    List<Resource> getResourceByResourceType(Integer resourceType);

    int addResource(Resource resource);

    Resource getResourceById(Integer id);

    int updateResourceStatusById(Resource resource);

    int updateResourceById(Resource resource);

    List<Resource> getAllResource();

    List<RoleResource> findResourceByRoleId(Integer roleId);

}
