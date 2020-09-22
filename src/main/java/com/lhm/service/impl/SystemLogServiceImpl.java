package com.lhm.service.impl;

import com.lhm.mapper.SystemLogMapper;
import com.lhm.pojo.SystemLog;
import com.lhm.service.SystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/9/17 16:13
 * 4
 */
@Service
public class SystemLogServiceImpl implements SystemLogService {

    @Autowired
    SystemLogMapper systemLogMapper;

    @Override
    public void save(SystemLog systemLog) {
        systemLogMapper.save(systemLog);
    }

    @Override
    public List<SystemLog> selectSysLogByPageHelper() {
        return systemLogMapper.selectSysLogByPageHelper();
    }
}
