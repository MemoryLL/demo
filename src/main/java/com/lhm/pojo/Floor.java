package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Floor {
    private Integer id;

    private String floorName;

    private String descr;

    private Date createTime;

    private Date updateTime;
}