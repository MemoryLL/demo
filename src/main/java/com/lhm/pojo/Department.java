package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Department {
    private Integer depId;

    private String depName;

    private String description;

    private String departmentHeadName;

    private Date createTime;

    private Date updateTime;

}