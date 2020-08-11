package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

/**
 * @Author: lhm
 * @Date: 2020/8/10 13:53
 * 4
 */
@Data
public class RoleResource {
    private Integer id;
    private Integer roleId;
    private Integer resourceId;
    private Date createTime;
}
