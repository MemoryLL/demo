package com.lhm.service.impl;

import com.lhm.common.Result;
import com.lhm.mapper.MajorMapper;
import com.lhm.pojo.Class;
import com.lhm.pojo.Major;
import com.lhm.service.ClassService;
import com.lhm.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/10/25 16:50
 * 4
 */
@Service
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;

    @Override
    public List<Major> getAllMajor() {
        return majorMapper.getAllMajor();
    }

    @Override
    public List<Major> selectMajorByPageHelper(Major major) {
        return majorMapper.selectMajorByPageHelper(major);
    }

    @Override
    public int saveMajor(Major major) {
        major.setCreateTime(new Date());
        return majorMapper.saveMajor(major);
    }

    @Override
    public Result getMajorByDepId(Integer depId) {
        List<Major> list = majorMapper.getMajorByDepId(depId);
        return Result.success("获取成功",list);
    }
}
