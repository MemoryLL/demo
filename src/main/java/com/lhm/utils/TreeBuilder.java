package com.lhm.utils;

import com.lhm.common.TreeNode;
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
        for (Resource r : resources) {
            if (r.getResourceType() != 2) {
                resourceList.add(r);
            }
        }

        List<Resource> trees = new ArrayList<>();
        for (Resource resource : resourceList) {
            if (resource.getpId() == 0) {
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

    public static List<TreeNode> TreeNodeBulid(List<Resource> resources) {
        List<TreeNode> treeNodes = new ArrayList<>();
        TreeNode treeNode = new TreeNode();
        for (Resource resource : resources) {
            if (resource.getpId() == 0) {
                treeNode = new TreeNode();
                treeNode.setId(resource.getId());
                treeNode.setTitle(resource.getTitle());
                if (resource.getStatus() == 1) {
                    treeNode.setDisabled(true);
                }
                treeNodes.add(treeNode);
            }

            for (Resource r1 : resources) {
                if (r1.getpId() == resource.getId().intValue()&&r1.getResourceType()==1) {
                    TreeNode node = new TreeNode();
                    if (treeNode.getChildren() == null) {
                        treeNode.setChildren(new ArrayList<>());
                    }
                    for (Resource r2 : resources) {
                        if (r2.getpId()==r1.getId().intValue()&&r2.getResourceType()==2){
                            TreeNode tr = new TreeNode();
                            if (node.getChildren()==null){
                                node.setChildren(new ArrayList<>());
                            }
                            tr.setId(r2.getId());
                            tr.setTitle(r2.getTitle());
                            if (r2.getStatus() == 1) {
                                tr.setDisabled(true);
                            }
                            node.getChildren().add(tr);
                        }
                    }
                    node.setId(r1.getId());
                    node.setTitle(r1.getTitle());
                    if (r1.getStatus() == 1) {
                        node.setDisabled(true);
                    }
                    treeNode.getChildren().add(node);
                }
            }
        }
        return treeNodes;
    }

}
