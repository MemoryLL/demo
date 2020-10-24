package com.lhm.service;

import com.lhm.pojo.Department;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/10/24 14:37
 * 4
 */
public interface DepartmentService {

    List<Department> selectDepartmentByPageHelper(Department department);

}
