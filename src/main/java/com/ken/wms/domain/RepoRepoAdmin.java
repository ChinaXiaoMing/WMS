package com.ken.wms.domain;

/**
 * 仓库与仓库管理员关联表
 *
 * @author xiaoming
 * @date 2021/11/14
 */
public class RepoRepoAdmin {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 仓库id
     */
    private Integer repositoryId;

    /**
     * 仓库管理员id
     */
    private Integer repoAdminId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRepositoryId() {
        return repositoryId;
    }

    public void setRepositoryId(Integer repositoryId) {
        this.repositoryId = repositoryId;
    }

    public Integer getRepoAdminId() {
        return repoAdminId;
    }

    public void setRepoAdminId(Integer repoAdminId) {
        this.repoAdminId = repoAdminId;
    }
}
