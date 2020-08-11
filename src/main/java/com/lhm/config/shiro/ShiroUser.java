package com.lhm.config.shiro;

import lombok.Data;

import java.io.Serializable;
import java.util.Set;

@Data
public class ShiroUser implements Serializable {
    private int id;
    private final String loginName;
    private Set<String> urlSet;

    public ShiroUser(String loginName) {
        this.loginName = loginName;
    }

    public ShiroUser(int id, String loginName) {
        this.id = id;
        this.loginName = loginName;
    }

    /**
     * 本函数输出将作为默认的<shiro:principal/>输出.
     */
    @Override
    public String toString() {
        return loginName;
    }
}
