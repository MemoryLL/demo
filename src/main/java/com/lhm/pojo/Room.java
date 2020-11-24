package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room implements Serializable {
    private Integer roomId;

    private Integer floorId;

    private String roomName;

    private Date createTime;

    private Date updateTime;


}