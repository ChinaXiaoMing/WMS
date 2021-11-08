package com.ken.wms.domain;

import java.sql.Date;
import java.util.List;

/**
 * 仓库管理员信息
 */
public class RepositoryAdmin {

    /**
     * 仓库管理员ID
     */
    private Integer id;
    /**
     * 仓库管理员用户名
     */
    private String username;
    /**
     * 姓名
     */
    private String name;
    /**
     * 姓名
     */
    private String sex;
    /**
     * 联系电话
     */
    private String tel;
    /**
     * 地址
     */
    private String address;
    /**
     * 出生日期
     */
    private Date birth;

    /**
     * 所属仓库id(多仓库id用逗号隔开)
     */
    private String repoId;

    /**
     * 所属仓库id(多仓库id用逗号隔开)
     */
    private List<Integer> repoIdList;

    /**
     * 所属仓库信息列表
     */
    private List<Repository> repositoryList;

    public String getRepoId() {
        return repoId;
    }

    public void setRepoId(String repoId) {
        this.repoId = repoId;
    }

    public List<Integer> getRepoIdList() {
        return repoIdList;
    }

    public void setRepoIdList(List<Integer> repoIdList) {
        this.repoIdList = repoIdList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public List<Repository> getRepositoryList() {
        return repositoryList;
    }

    public void setRepositoryList(List<Repository> repositoryList) {
        this.repositoryList = repositoryList;
    }

    @Override
    public String toString() {
        return "RepositoryAdmin{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", birth=" + birth +
                ", repoId='" + repoId + '\'' +
                ", repoIdList=" + repoIdList +
                ", repositoryList=" + repositoryList +
                '}';
    }
}
