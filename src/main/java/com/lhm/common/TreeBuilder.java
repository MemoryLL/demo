package com.lhm.common;

import com.lhm.pojo.Resource;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/7/29 14:11
 * 4
 */
public class TreeBuilder {
    public static List<Resource> bulid(List<Resource> resources) {

        List<Resource> trees = new ArrayList<>();

        for (Resource resource : resources) {

            if (resource.getpId()==0) {
                trees.add(resource);
            }

            for (Resource it : resources) {
                if (it.getpId() == resource.getId().intValue()) {
                    if (resource.getChildren() == null) {
                        resource.setChildren(new ArrayList<>());
                    }
                    resource.getChildren().add(it);
                }
            }
        }
        return trees;
    }

}
