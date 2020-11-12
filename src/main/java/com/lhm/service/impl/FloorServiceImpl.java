package com.lhm.service.impl;

import com.lhm.common.Result;
import com.lhm.config.shiro.ShiroUser;
import com.lhm.mapper.FloorMapper;
import com.lhm.mapper.SystemLogMapper;
import com.lhm.pojo.Floor;
import com.lhm.pojo.SystemLog;
import com.lhm.service.FloorService;
import com.lhm.utils.Address;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/11 16:12
 * 4
 */
@Service
public class FloorServiceImpl implements FloorService {

    @Autowired
    private FloorMapper floorMapper;
    @Autowired
    private SystemLogMapper systemLogMapper;

    @Override
    public Result getAllFloor() {
        List<Floor> list = floorMapper.getAllFloor();
        return Result.success("获取成功",list);
    }

    @Override
    public List<Floor> selectFloorByPageHelper(Floor floor) {
        return floorMapper.selectFloorByPageHelper(floor);
    }

    @Override
    public Result addFloor(Floor floor) {
        floor.setCreateTime(new Date());
        int result = floorMapper.addFloor(floor);
        if (result >= 1){
            Subject subject = SecurityUtils.getSubject();
            ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
            SystemLog systemLog = new SystemLog(Address.getIpAddress(),"添加楼层成功","添加楼层",shiroUser.getId(),new Date());
            systemLogMapper.save(systemLog);
            return Result.success("添加成功",null);
        }
        return Result.fail("添加失败");
    }
}
