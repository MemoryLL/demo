package com.lhm.service;

import com.lhm.pojo.Class;
import com.lhm.pojo.SystemLog;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/9/17 16:13
 * 4
 */
public interface SystemLogService {
    void save(SystemLog systemLog);

    List<SystemLog> selectSysLogByPageHelper();

}
