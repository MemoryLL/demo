package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Department {
    private Integer id;

    private String depName;

    private String desc;

    private String departmentHeadName;

    private Date createTime;

    private Date updateTime;

}