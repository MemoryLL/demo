package com.lhm.mapper;

import com.lhm.pojo.Class;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassMapper {

    List<Class> selectClassByPageHelper(Class c);

    int addClass(Class c);

    List<Class> getAllClass();

    List<Class> getClassByMajorId(@Param("majorId") Integer majorId);

    Class getClassById(Integer classId);

}