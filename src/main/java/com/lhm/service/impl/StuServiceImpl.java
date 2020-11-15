package com.lhm.service.impl;

import com.lhm.common.Result;
import com.lhm.mapper.StuMapper;
import com.lhm.pojo.Stu;
import com.lhm.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/15 18:10
 * 4
 */
@Service
public class StuServiceImpl implements StuService {
    @Autowired
    private StuMapper stuMapper;

    @Override
    public Result getAllStduent() {
        List<Stu> list = stuMapper.getAllStudent();
        return Result.success("获取成功",list);
    }

    @Override
    public List<Stu> selectStuByPageHelper(Stu student) {
        return stuMapper.selectStuByPageHelper(student);
    }

    @Override
    public Result save(Stu student) {
        student.setCreateTime(new Date());
        int result = stuMapper.save(student);
        if (result >= 1){
            return Result.success("添加成功",null);
        }
        return Result.fail("添加失败");
    }
}
