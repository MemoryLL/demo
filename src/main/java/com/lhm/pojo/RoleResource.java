package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: lhm
 * @Date: 2020/8/10 13:53
 * 4
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleResource implements Serializable {
    private Integer id;
    private Integer roleId;
    private Integer resourceId;
    private Date createTime;
}
