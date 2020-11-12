package com.lhm.service.impl;

import com.lhm.common.Result;
import com.lhm.config.shiro.ShiroUser;
import com.lhm.mapper.ClassMapper;
import com.lhm.mapper.SystemLogMapper;
import com.lhm.pojo.Class;
import com.lhm.pojo.SystemLog;
import com.lhm.service.ClassService;
import com.lhm.utils.Address;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/11 14:55
 * 4
 */
@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassMapper classMapper;
    @Autowired
    private SystemLogMapper systemLogMapper;

    @Override
    public List<Class> selectClassByPageHelper(Class c) {
        return classMapper.selectClassByPageHelper(c);
    }

    @Override
    public Result addClass(Class c) {
        c.setCreateTime(new Date());
        int result = classMapper.addClass(c);
        if (result >= 1){
            Subject subject = SecurityUtils.getSubject();
            ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
            SystemLog systemLog = new SystemLog(Address.getIpAddress(),"添加班级成功","添加班级",shiroUser.getId(),new Date());
            systemLogMapper.save(systemLog);
            return Result.success("添加成功",null);
        }
        return Result.fail("添加失败");
    }

    @Override
    public Result getAllClass() {
        List<Class> list = classMapper.getAllClass();
        return Result.success("获取成功",list);
    }
}
