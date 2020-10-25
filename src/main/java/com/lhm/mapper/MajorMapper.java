package com.lhm.mapper;

import com.lhm.pojo.Major;

import java.util.List;

public interface MajorMapper {

    List<Major> getAllMajor();


    List<Major> selectMajorByPageHelper(Major major);

    int saveMajor(Major major);

}