package com.lhm.mapper;

import com.lhm.pojo.Floor;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FloorMapper {

    List<Floor> getAllFloor();

    List<Floor> selectFloorByPageHelper(Floor floor);

    int addFloor(Floor floor);

    Floor getFloorById(Integer floorId);

}