package com.lhm.common;

import lombok.Data;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/8/8 13:19
 * 4
 */
@Data
public class TreeNode {

    private Integer id;
    private String title;
    //是否初始展开
    private boolean spread = false;
    //是否初始为选中状态
    private boolean checked = true;
    //是否为禁用状态
    private boolean disabled = false;

    private List<TreeNode> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isDisabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }
}
