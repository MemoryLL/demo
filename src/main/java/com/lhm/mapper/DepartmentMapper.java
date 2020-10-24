package com.lhm.mapper;

import com.lhm.pojo.Department;

import java.util.List;

public interface DepartmentMapper {

    List<Department> selectDepartmentByPageHelper(Department department);

}