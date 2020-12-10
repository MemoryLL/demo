package com.lhm.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.shiro.util.ByteSource;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ExcelTarget("student")
public class Stu  implements Serializable {
    @Excel(name = "学号")
    private Integer stuNumber;
    @Excel(name = "姓名")
    private String stuName;
    @Excel(name = "电话")
    private String telephone;
    @Excel(name = "地址")
    private String address;

    private Integer depId;

    private Integer majorId;

    private Integer classId;

    private Integer roomId;
    @Excel(name = "性别")
    private String sex;

    private Byte status;
    @Excel(name = "创建日期",format = "yyyy年MM月dd日")
    private Date createTime;

    private Date updateTime;

    //如果有头像就这样写
    //@Excel(name = "头像信息",type = 2,savePath = "E:/java/lhm/demo/src/main/resources/static/imgs")
}