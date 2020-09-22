package com.lhm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class SystemLog {
    private Integer sysId;

    private String ipAddress;

    private String remark;

    private String resourceName;

    private Integer createdUserId;

    private Date createDate;

}