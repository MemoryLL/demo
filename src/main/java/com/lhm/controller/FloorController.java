package com.lhm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhm.common.Result;
import com.lhm.pojo.Floor;
import com.lhm.service.FloorService;
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
 * @Date: 2020/11/11 16:12
 * 4
 */
@Controller
@Api(tags = "宿舍楼管理操作相关接口")
public class FloorController {
    @Autowired
    private FloorService floorService;

    @GetMapping("/floor.html")
    @ApiOperation("宿舍楼页面跳转")
    public String floorManage(){
        return "views/floor/floorManage";
    }

    @GetMapping("/addFloorModel.html")
    @ApiOperation("新增宿舍楼页面跳转")
    public String addFloorManage(){
        return "views/floor/addFloorModal";
    }

    /**
     * 获取所有的宿舍楼
     */
    @GetMapping("/getAllFloor.json")
    @ApiOperation("获取所有的宿舍楼列表接口")
    @ResponseBody
    public Result getAllFloor(){
        return floorService.getAllFloor();
    }

    @GetMapping(value = "/floorList.json")
    @ApiOperation("分页获取宿舍楼列表接口")
    @ResponseBody
    public Map<String, Object> floorPageHelper(Floor floor, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        PageHelper.startPage(page,limit);
        List<Floor> list = floorService.selectFloorByPageHelper(floor);
        PageInfo<Floor> info = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>(4);
        map.put("code", 0);
        map.put("msg", "获取成功");
        map.put("count", info.getTotal());
        map.put("data", info.getList());
        return map;
    }

    @RequestMapping(value = "/addFloor.json",method = RequestMethod.POST)
    @ApiOperation("新增宿舍楼")
    @ResponseBody
    public Result addFloor(Floor floor){
        return floorService.addFloor(floor);
    }
}
