package com.lhm.mapper;

import com.lhm.pojo.Stu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StuMapper {
    List<Stu> getAllStudent();

    List<Stu> selectStuByPageHelper(Stu student);

    int save(Stu student);

    Stu getStuByStuNumber(@Param("stuNumber") String stuNumber);

}