package com.lhm.config;

import com.jagregory.shiro.freemarker.ShiroTags;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * @Author: lhm
 * @Date: 2020/8/11 14:19
 * 4
 */
@Configuration
public class FreeMarkerConfig {
    @Autowired
    freemarker.template.Configuration configuration;
    @PostConstruct
    public void setSharedVariable() {
        try {
            configuration.setSharedVariable("shiro", new ShiroTags());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
