package com.lhm.mapper;

import com.lhm.pojo.Resource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceMapper {
    List<Resource> getMenuInfo();

    List<Resource> selectResourceByPageHelper(Resource resource);

    List<Resource> getResourceByResourceType(Integer resourceType);

    int addResource(Resource resource);

    Resource getResourceById(Integer id);

    int updateResourceStatusById(Resource resource);

}