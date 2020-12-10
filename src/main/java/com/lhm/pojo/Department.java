package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department  implements Serializable {
    @Column(name = "id")
    private Integer depId;

    private String depName;

    private String description;

    private String departmentHeadName;

    private Date createTime;

    private Date updateTime;

}