package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Role {
    private Integer id;

    private String roleName;

    private String description;

    private Byte roleLevel;

    //状态 0正常  1删除
    private Byte status;

    private Integer createUserId;

    private Integer updateUserId;

    private Date createTime;

    private Date update_time;
}