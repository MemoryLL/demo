package com.lhm.service.impl;

import com.lhm.mapper.DepartmentMapper;
import com.lhm.pojo.Department;
import com.lhm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/10/24 14:37
 * 4
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> selectDepartmentByPageHelper(Department department) {
        return departmentMapper.selectDepartmentByPageHelper(department);
    }
}
