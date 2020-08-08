package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class User {
    private Integer id;

    private String password;

    private String name;

    private Integer age;

    private String email;

    private String file;

    private String sex;

    private String city;

    private Integer state;

    private Date createTime;

    private Date updateTime;

}