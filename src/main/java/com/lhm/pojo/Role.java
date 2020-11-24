package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role implements Serializable {
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