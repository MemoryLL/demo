package com.lhm.mapper;

import com.lhm.pojo.Stu;

import java.util.List;

public interface StuMapper {
    List<Stu> getAllStudent();

    List<Stu> selectStuByPageHelper(Stu student);

    int save(Stu student);

}