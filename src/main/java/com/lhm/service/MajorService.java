package com.lhm.service;

import com.lhm.pojo.Major;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/10/25 16:50
 * 4
 */
public interface MajorService {
    List<Major> getAllMajor();

    List<Major> selectMajorByPageHelper(Major major);


    int saveMajor(Major major);

}
