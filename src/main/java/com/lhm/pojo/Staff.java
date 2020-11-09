package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Staff {
    private Integer id;

    private String staffName;

    private String telephone;

    private String address;

    private Date createTime;

    private Date updateTime;

    private String title;

}