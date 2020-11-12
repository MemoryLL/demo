package com.lhm.mapper;

import com.lhm.common.Result;
import com.lhm.pojo.Class;

import java.util.List;

public interface ClassMapper {

    List<Class> selectClassByPageHelper(Class c);

    int addClass(Class c);

    List<Class> getAllClass();

}