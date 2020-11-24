package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Floor implements Serializable {
    private Integer floorId;

    private String floorName;

    private String descr;

    private Date createTime;

    private Date updateTime;
}