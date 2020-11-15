package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Room {
    private Integer roomId;

    private Integer floorId;

    private String roomName;

    private Date createTime;

    private Date updateTime;


}