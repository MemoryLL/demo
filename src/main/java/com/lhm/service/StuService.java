package com.lhm.service;

import com.lhm.common.Result;
import com.lhm.pojo.Stu;
import com.lhm.vo.StuVo;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/15 18:10
 * 4
 */
public interface StuService {
    Result getAllStduent();

    List<Stu> selectStuByPageHelper(Stu student);

    Result save(Stu student);

    StuVo getStuDatailByStuNumber(String stuNumber);
}
