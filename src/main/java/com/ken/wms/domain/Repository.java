package com.ken.wms.domain;

import java.util.List;

/**
 * 仓库信息
 */
public class Repository {

    /**
     * 仓库id
     */
    private Integer id;
    /**
     * 仓库名称
     */
    private String name;
    private String address;// 仓库地址
    private String status;// 仓库状态
    private String area;// 仓库面积
    private String desc;// 仓库描述
    private Integer adminID;//仓库管理员ID
    private String adminName; //仓库管理员名字

    /**
     * 仓库管理员列表
     */
    private List<RepositoryAdmin> repoAdminList;

    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<RepositoryAdmin> getRepoAdminList() {
        return repoAdminList;
    }

    public void setRepoAdminList(List<RepositoryAdmin> repoAdminList) {
        this.repoAdminList = repoAdminList;
    }
}
