package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Major implements Serializable {
    private Integer majorId;

    private Integer depId;

    private String majorName;

    private String description;

    private Date createTime;

    private Date updateTime;
}