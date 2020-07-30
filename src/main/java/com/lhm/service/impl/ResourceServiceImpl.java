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
}
