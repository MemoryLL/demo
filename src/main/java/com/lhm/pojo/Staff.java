package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Staff implements Serializable {
    private Integer id;

    private String staffName;

    private String telephone;

    private String address;

    private Date createTime;

    private Date updateTime;

    private String title;

}