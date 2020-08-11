package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

/**
 * @Author: lhm
 * @Date: 2020/8/10 17:08
 * 4
 */
@Data
public class UserRole {

    private Integer id;
    private Integer userId;
    private Integer roleId;
    private Date createTime;

}
