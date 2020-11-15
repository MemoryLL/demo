package com.lhm.pojo;

import lombok.Data;
import org.apache.shiro.util.ByteSource;

import java.util.Date;

@Data
public class Stu {
    private Integer stuNumber;

    private String stuName;

    private String telephone;

    private String address;

    private Integer depId;

    private Integer majorId;

    private Integer classId;

    private Integer roomId;

    private String sex;

    private Byte status;

    private Date createTime;

    private Date updateTime;
}