package com.lhm.mapper;

import com.lhm.pojo.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {
    List<Room> getAllRoom();

    List<Room> selectRoomByPageHelper(Room room);

    int addRoom(Room room);

    Room selectRoomByRoomNameAndFloorId(Room room);

    List<Room> getRoomByFloorId(@Param("floorId") Integer floorId);
}