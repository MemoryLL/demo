package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.shiro.util.ByteSource;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Stu  implements Serializable {
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