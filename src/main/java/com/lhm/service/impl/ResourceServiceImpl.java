package com.lhm.service.impl;

import com.lhm.mapper.ResourceMapper;
import com.lhm.pojo.Resource;
import com.lhm.service.ResourceService;
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

    @Override
    public List<Resource> getMenuInfo() {
        return resourceMapper.getMenuInfo();
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
}
