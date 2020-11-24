package com.lhm.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: lhm
 * @Date: 2020/11/24 13:38
 * 4
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StuVo implements Serializable {
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

    private String depName;

    private String majorName;

    private String className;

    private String floorName;

    private String roomName;
}
