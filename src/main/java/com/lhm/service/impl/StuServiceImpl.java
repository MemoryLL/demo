package com.lhm.service.impl;

import com.lhm.common.Result;
import com.lhm.mapper.*;
import com.lhm.pojo.*;
import com.lhm.pojo.Class;
import com.lhm.service.StuService;
import com.lhm.vo.StuVo;
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
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private MajorMapper majorMapper;
    @Autowired
    private ClassMapper classMapper;
    @Autowired
    private FloorMapper floorMapper;
    @Autowired
    private RoomMapper roomMapper;

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

    @Override
    public StuVo getStuDatailByStuNumber(String stuNumber) {
        StuVo stuVo = new StuVo();
        Stu stu = stuMapper.getStuByStuNumber(stuNumber);
        stuVo.setStuNumber(stu.getStuNumber());
        stuVo.setStuName(stu.getStuName());
        stuVo.setAddress(stu.getAddress());
        stuVo.setTelephone(stu.getTelephone());
        stuVo.setSex(stu.getSex());
        stuVo.setDepId(stu.getDepId());
        stuVo.setMajorId(stu.getMajorId());
        stuVo.setClassId(stu.getClassId());
        stuVo.setRoomId(stu.getRoomId());
        Department dep = departmentMapper.getDepById(stu.getDepId());
        stuVo.setDepName(dep.getDepName());
        Major major = majorMapper.getMajorById(stu.getMajorId());
        stuVo.setMajorName(major.getMajorName());
        Class c = classMapper.getClassById(stu.getClassId());
        stuVo.setClassName(c.getClassName());
        Room room = roomMapper.getRoomById(stu.getRoomId());
        stuVo.setRoomName(room.getRoomName());
        Floor floor = floorMapper.getFloorById(room.getFloorId());
        stuVo.setFloorName(floor.getFloorName());
        return stuVo;
    }
}
