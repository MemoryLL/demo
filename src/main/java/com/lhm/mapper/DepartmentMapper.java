package com.lhm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lhm.pojo.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper extends BaseMapper<Department> {

    List<Department> selectDepartmentByPageHelper(Department department);

    int saveDepartment(Department department);

    List<Department> getAllDep();

    Department getDepById(Integer depId);

}