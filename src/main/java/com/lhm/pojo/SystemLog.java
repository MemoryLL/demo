package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SystemLog {
    private Integer sysId;

    private String ipAddress;

    private String remark;

    private String resourceName;

    private Integer createdUserId;

    private Date createDate;

    public SystemLog(String ipAddress, String remark, String resourceName, Integer createdUserId, Date createDate) {
        this.ipAddress = ipAddress;
        this.remark = remark;
        this.resourceName = resourceName;
        this.createdUserId = createdUserId;
        this.createDate = createDate;
    }
}