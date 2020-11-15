package com.lhm.mapper;

import com.lhm.pojo.Major;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MajorMapper {

    List<Major> getAllMajor();


    List<Major> selectMajorByPageHelper(Major major);

    int saveMajor(Major major);

    List<Major> getMajorByDepId(@Param("depId") Integer depId);

}