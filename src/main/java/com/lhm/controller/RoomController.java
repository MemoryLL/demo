package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.pojo.Room;
import com.lhm.service.RoomService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: lhm
 * @Date: 2020/11/12 15:50
 * 4
 */
@Controller
@Api(tags = "宿舍管理操作相关接口")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @GetMapping("/room.html")
    @ApiOperation("宿舍页面跳转")
    public String roomManage(){
        return "views/room/roomManage";
    }

    @GetMapping("/addRoomModel.html")
    @ApiOperation("新增宿舍页面跳转")
    public String addRoomModel(){
        return "views/room/addRoomModal";
    }

    @GetMapping("/getAllRoom.json")
    @ApiOperation("获取所有宿舍接口")
    public Result getAllRoom(){
        return roomService.getAllRoom();
    }

    @GetMapping("/roomList.json")
    @ApiOperation("分页获取宿舍列表接口")
    @ResponseBody
    public Map<String, Object> roomPageHelper(Room room, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<Room> list = roomService.selectRoomByPageHelper(room);
        PageInfo<Room> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>(4);
        map.put("code", 0);
        map.put("msg", "获取成功");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    @RequestMapping(value = "/addRoom.json",method = RequestMethod.POST)
    @ApiOperation("新增宿舍")
    @ResponseBody
    public Result addRoom(Room room){
        return roomService.addRoom(room);
    }
}
