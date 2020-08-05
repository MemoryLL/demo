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
        //去除按钮
        List<Resource> resourceList = new ArrayList<>();
        for (Resource r:resources) {
            if (r.getResourceType()!=2){
                resourceList.add(r);
            }
        }

        List<Resource> trees = new ArrayList<>();
        for (Resource resource : resourceList) {

            if (resource.getpId()==0) {
                trees.add(resource);
            }

            for (Resource it : resourceList) {
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
