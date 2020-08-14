package com.lhm.mapper;

import com.lhm.pojo.Resource;
import com.lhm.pojo.RoleResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceMapper {
    List<Resource> getMenuInfo();

    List<Resource> selectResourceByPageHelper(Resource resource);

    List<Resource> getResourceByResourceType(Integer resourceType);

    int addResource(Resource resource);

    Resource getResourceById(Integer id);

    int updateResourceStatusById(Resource resource);

    int updateResourceById(Resource resource);

    List<Resource> getAllResource();

    List<String> findResourceHrefById(List<RoleResource> list);

    List<RoleResource> findResourceByRoleId(Integer id);

    List<Resource> findResourceByListId(List<RoleResource> list);

}