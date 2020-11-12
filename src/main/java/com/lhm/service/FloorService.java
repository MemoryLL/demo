package com.lhm.service;

import com.lhm.common.Result;
import com.lhm.pojo.Floor;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/11/11 16:12
 * 4
 */
public interface FloorService {

    Result getAllFloor();

    List<Floor> selectFloorByPageHelper(Floor floor);

    Result addFloor(Floor floor);

}
