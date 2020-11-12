package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Class {
    private Integer id;

    private String className;

    private Integer majorId;

    private Date createTime;

    private Date updateTime;

    //状态 0正常  1已毕业
    private Byte status;


}