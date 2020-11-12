package com.lhm.service.impl;

import com.lhm.common.Result;
import com.lhm.mapper.RoomMapper;
import com.lhm.pojo.Room;
import com.lhm.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/12 15:50
 * 4
 */
@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    @Override
    public Result getAllRoom() {
        List<Room> list = roomMapper.getAllRoom();
        return Result.success("获取成功",list);
    }

    @Override
    public List<Room> selectRoomByPageHelper(Room room) {
        return roomMapper.selectRoomByPageHelper(room);
    }

    @Override
    public Result addRoom(Room room) {
        Room r = roomMapper.selectRoomByRoomNameAndFloorId(room);
        if (r != null){
            return Result.fail("添加失败，该楼的宿舍已经存在");
        }
        room.setCreateTime(new Date());
        int result = roomMapper.addRoom(room);
        if (result>=1){
            return Result.success("添加成功",null);
        }
        return Result.fail("添加失败");
    }
}
