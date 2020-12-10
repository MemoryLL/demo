package com.lhm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lhm.pojo.Department;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/10/24 14:37
 * 4
 */
public interface DepartmentService extends IService<Department> {

    List<Department> selectDepartmentByPageHelper(Department department);

    int saveDepartment(Department department);

    List<Department> getAllDep();

}
