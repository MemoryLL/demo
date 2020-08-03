package com.lhm.pojo;

import com.baomidou.mybatisplus.annotation.TableField;

import java.util.List;
public class Resource {
    //主键id
    private Integer id;
    //标题
    private String title;
    //头像
    private String icon;
    //地址
    private String href;
    //描述
    private String description;
    //父节点
    private Integer pId;

    private String seq;
    //状态 0正常  1删除
    private Byte status;

    private Byte spread;
    //类型  0菜单 1页面 2按钮
    private Byte resourceType;

    @TableField(exist = false)
    private List<Resource> children;

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

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Byte getSpread() {
        return spread;
    }

    public void setSpread(Byte spread) {
        this.spread = spread;
    }

    public Byte getResourceType() {
        return resourceType;
    }

    public void setResourceType(Byte resourceType) {
        this.resourceType = resourceType;
    }

    public List<Resource> getChildren() {
        return children;
    }

    public void setChildren(List<Resource> children) {
        this.children = children;
    }
}