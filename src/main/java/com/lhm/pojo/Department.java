package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department  implements Serializable {
    private Integer depId;

    private String depName;

    private String description;

    private String departmentHeadName;

    private Date createTime;

    private Date updateTime;

}