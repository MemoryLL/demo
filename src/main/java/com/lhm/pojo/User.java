package com.lhm.pojo;

import lombok.Data;

/**
 * @Author: lhm
 * @Date: 2020/7/27 16:40
 * 4
 */
@Data
public class User {
    private Integer id;
    private String username;
    private Integer age;
    private String email;
    private String file;
    private String sex;
    private String city;

    public User() {
    }

    public User(Integer id, String username, Integer age, String email, String file, String sex, String city) {
        this.id = id;
        this.username = username;
        this.age = age;
        this.email = email;
        this.file = file;
        this.sex = sex;
        this.city = city;
    }
}
