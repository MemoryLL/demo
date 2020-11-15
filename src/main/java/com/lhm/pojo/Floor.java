package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Floor {
    private Integer floorId;

    private String floorName;

    private String descr;

    private Date createTime;

    private Date updateTime;
}