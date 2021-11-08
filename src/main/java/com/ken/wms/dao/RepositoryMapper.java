package com.ken.wms.dao;

import com.ken.wms.domain.Repository;

import java.util.List;

/**
 * Repository 映射器
 */
@org.springframework.stereotype.Repository
public interface RepositoryMapper {

    /**
     * 选择全部的 Repository 记录
     *
     * @return 返回全部的 Repository
     */
    List<Repository> selectAll();

    /**
     * 选择全部的未分配的 repository 记录
     *
     * @return 返回所有未分配的 Repository
     */
    List<Repository> selectUnassign();

    /**
     * 选择指定 Repository ID 的 Repository 记录
     *
     * @param repositoryID 仓库ID
     * @return 返回指定的Repository
     */
    Repository selectByID(Integer repositoryID);

    /**
     * 根据仓库名称获取仓库信息
     *
     * @param repoName 仓库名称
     * @return 返回指定的Repository
     */
    Repository selectByRepoName(String repoName);

    /**
     * 选择指定 repository Address 的 repository 记录
     *
     * @param address 仓库地址
     * @return 返回指定的Repository
     */
    List<Repository> selectByAddress(String address);

    /**
     * 插入一条新的 Repository 记录
     *
     * @param repository 仓库信息
     */
    void insert(Repository repository);

    /**
     * 批量插入 Repository 记录
     *
     * @param repositories 存有若干条记录的 List
     */
    void insertbatch(List<Repository> repositories);

    /**
     * 更新 Repository 记录
     *
     * @param repository 仓库信息
     */
    void update(Repository repository);

    /**
     * 更新管理id
     *
     * @param repoId 回购id
     */
    void updateAdminID(Integer repoId);

    /**
     * 删除指定 Repository ID 的 Repository 记录
     *
     * @param repositoryID 仓库ID
     */
    void deleteByID(Integer repositoryID);

    /**
     * 根据仓库管理员ID查询仓库信息
     *
     * @param adminID 管理员id
     * @return {@link Repository}
     */
    List<Repository> selectByRepoAdminId(Integer adminID);
}
