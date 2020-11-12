package com.lhm.service;

import com.lhm.common.Result;
import com.lhm.pojo.Class;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/11 14:55
 * 4
 */
public interface ClassService {
    List<Class> selectClassByPageHelper(Class c);


    Result addClass(Class c);

    Result getAllClass();

}
