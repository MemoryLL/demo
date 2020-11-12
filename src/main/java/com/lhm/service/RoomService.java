package com.lhm.service;

import com.lhm.common.Result;
import com.lhm.pojo.Room;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/12 15:49
 * 4
 */
public interface RoomService {
    Result getAllRoom();

    List<Room> selectRoomByPageHelper(Room room);

    Result addRoom(Room room);

}
