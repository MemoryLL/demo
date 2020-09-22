package com.lhm.mapper;

import com.lhm.pojo.SystemLog;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SystemLogMapper {

    void save(SystemLog systemLog);

    List<SystemLog> selectSysLogByPageHelper();

}