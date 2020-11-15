package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Major {
    private Integer majorId;

    private Integer depId;

    private String majorName;

    private String description;

    private Date createTime;

    private Date updateTime;
}