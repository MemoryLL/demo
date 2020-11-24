package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Class  implements Serializable {
    private Integer classId;

    private String className;

    private Integer majorId;

    private Date createTime;

    private Date updateTime;

    //状态 0正常  1已毕业
    private Byte status;


}