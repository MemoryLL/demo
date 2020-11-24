package com.lhm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: lhm
 * @Date: 2020/8/4 16:14
 * 4
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Form implements Serializable {
    private String title;
    private String password;
    private String city;
    private String sex;
    private String desc;
    private String sw;
    private String write;
    private String read;
    private String dai;

}
