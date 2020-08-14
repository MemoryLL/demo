package com.lhm.utils;

import com.lhm.common.TreeNode;
import com.lhm.common.TreeNode2;
import com.lhm.pojo.Resource;
import com.lhm.pojo.RoleResource;

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
                if (r1.getpId() == resource.getId().intValue() && r1.getResourceType() == 1) {
                    TreeNode node = new TreeNode();
                    if (treeNode.getChildren() == null) {
                        treeNode.setChildren(new ArrayList<>());
                    }
                    for (Resource r2 : resources) {
                        if (r2.getpId() == r1.getId().intValue() && r2.getResourceType() == 2) {
                            TreeNode tr = new TreeNode();
                            if (node.getChildren() == null) {
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

    public static List<TreeNode2> TreeNodeBulid2(List<Resource> resources, List<RoleResource> roleResources) {
        List<TreeNode2> treeNodes = new ArrayList<>();
        TreeNode2 treeNode = new TreeNode2();
        for (RoleResource roleR : roleResources) {
            for (Resource res : resources) {
                if (roleR.getResourceId().intValue() == res.getId()) {
                    res.setIsCheck((byte) 0);
                }
            }
        }
        for (Resource resource : resources) {
            if (resource.getpId() == 0) {
                treeNode = new TreeNode2();
                treeNode.setId(resource.getId());
                treeNode.setTitle(resource.getTitle());
                if (resource.getStatus() == 1) {
                    treeNode.setDisabled(true);
                }
                treeNodes.add(treeNode);
            }

            for (Resource r1 : resources) {
                if (r1.getpId() == resource.getId().intValue() && r1.getResourceType() == 1) {
                    TreeNode2 node = new TreeNode2();
                    if (treeNode.getChildren() == null) {
                        treeNode.setChildren(new ArrayList<>());
                    }
                    for (Resource r2 : resources) {
                        if (r2.getpId() == r1.getId().intValue() && r2.getResourceType() == 2) {
                            TreeNode2 tr = new TreeNode2();
                            if (node.getChildren() == null) {
                                node.setChildren(new ArrayList<>());
                            }
                            tr.setId(r2.getId());
                            tr.setTitle(r2.getTitle());
                            if (r2.getStatus() == 1) {
                                tr.setDisabled(true);
                            }
                            if (r2.getIsCheck() == 0) {
                                tr.setChecked(true);
                            }
                            node.getChildren().add(tr);
                        }
                    }
                    if (node.getChildren()==null){
                        if (r1.getIsCheck() == 0) {
                            node.setChecked(true);
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
