package com.ken.wms.common.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ken.wms.common.service.Interface.RepositoryAdminManageService;
import com.ken.wms.common.util.ExcelUtil;
import com.ken.wms.dao.RepositoryAdminMapper;
import com.ken.wms.dao.RepositoryMapper;
import com.ken.wms.domain.RepoRepoAdmin;
import com.ken.wms.domain.Repository;
import com.ken.wms.domain.RepositoryAdmin;
import com.ken.wms.domain.UserInfoDTO;
import com.ken.wms.exception.RepositoryAdminManageServiceException;
import com.ken.wms.exception.UserInfoServiceException;
import com.ken.wms.security.service.Interface.UserInfoService;
import com.ken.wms.util.aop.UserOperation;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.exceptions.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 仓库管理员管理 service 实现类
 */
@Service
public class RepositoryAdminManageServiceImpl implements RepositoryAdminManageService {

    private final Logger log = LoggerFactory.getLogger(RepositoryAdminManageServiceImpl.class);

    @Autowired
    private RepositoryAdminMapper repositoryAdminMapper;
    @Autowired
    private ExcelUtil excelUtil;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private RepositoryMapper repositoryMapper;

    /**
     * 返回指定repository id 的仓库管理员记录
     *
     * @param repositoryAdminID 仓库管理员ID
     * @return 结果的一个Map，其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     */
    @Override
    public Map<String, Object> selectByID(Integer repositoryAdminID) throws RepositoryAdminManageServiceException {
        // 初始化结果集
        Map<String, Object> resultSet = new HashMap<>();
        List<RepositoryAdmin> repositoryAdmins = new ArrayList<>();
        long total = 0;

        // 查询
        RepositoryAdmin repositoryAdmin;
        try {
            repositoryAdmin = repositoryAdminMapper.selectByID(repositoryAdminID);
        } catch (PersistenceException e) {
            throw new RepositoryAdminManageServiceException(e);
        }

        if (repositoryAdmin != null) {
            repositoryAdmins.add(repositoryAdmin);
            total = 1;
        }

        resultSet.put("data", repositoryAdmins);
        resultSet.put("total", total);
        return resultSet;
    }

    /**
     * 返回指定 repository address 的仓库管理员记录 支持查询分页以及模糊查询
     *
     * @param offset 分页的偏移值
     * @param limit  分页的大小
     * @param name   仓库管理员的名称
     * @return 结果的一个Map，其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     */
    @Override
    public Map<String, Object> selectByName(int offset, int limit, String name) {
        // 初始化结果集
        Map<String, Object> resultSet = new HashMap<>();
        List<RepositoryAdmin> repositoryAdmins;
        long total = 0;
        boolean isPagination = true;

        // validate
        if (offset < 0 || limit < 0) {
            isPagination = false;
        }

        // query
        if (isPagination) {
            PageHelper.offsetPage(offset, limit);
            repositoryAdmins = repositoryAdminMapper.selectByName(name);
            if (repositoryAdmins != null) {
                PageInfo<RepositoryAdmin> pageInfo = new PageInfo<>(repositoryAdmins);
                total = pageInfo.getTotal();
            } else {
                repositoryAdmins = new ArrayList<>();
            }
        } else {
            repositoryAdmins = repositoryAdminMapper.selectByName(name);
            if (repositoryAdmins != null) {
                total = repositoryAdmins.size();
            } else {
                repositoryAdmins = new ArrayList<>();
            }
        }

        resultSet.put("data", repositoryAdmins);
        resultSet.put("total", total);
        return resultSet;
    }

    /**
     * 返回指定 repository Name 的仓库管理员记录 支持模糊查询
     *
     * @param name 仓库管理员名称
     * @return 结果的一个Map，其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     */
    @Override
    public Map<String, Object> selectByName(String name) {
        return selectByName(-1, -1, name);
    }

    /**
     * 分页查询仓库管理员的记录
     *
     * @param offset 分页的偏移值
     * @param limit  分页的大小
     * @return 结果的一个Map，其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     */
    @Override
    public Map<String, Object> selectAll(int offset, int limit) throws RepositoryAdminManageServiceException {
        // 初始化结果集
        Map<String, Object> resultSet = new HashMap<>();
        List<RepositoryAdmin> repositoryAdmins;
        long total = 0;
        boolean isPagination = true;

        // validate
        if (offset < 0 || limit < 0) {
            isPagination = false;
        }

        // query
        try {
            if (isPagination) {
                PageHelper.offsetPage(offset, limit);
                repositoryAdmins = repositoryAdminMapper.selectAll();
                if (repositoryAdmins != null) {
                    setRepository(repositoryAdmins);
                    PageInfo<RepositoryAdmin> pageInfo = new PageInfo<>(repositoryAdmins);
                    total = pageInfo.getTotal();
                } else {
                    repositoryAdmins = new ArrayList<>();
                }
            } else {
                repositoryAdmins = repositoryAdminMapper.selectAll();
                if (repositoryAdmins != null) {
                    setRepository(repositoryAdmins);
                    total = repositoryAdmins.size();
                } else {
                    repositoryAdmins = new ArrayList<>();
                }
            }
        } catch (PersistenceException e) {
            throw new RepositoryAdminManageServiceException(e);
        }

        resultSet.put("data", repositoryAdmins);
        resultSet.put("total", total);
        return resultSet;
    }

    /**
     * 查询所有仓库管理员的记录
     *
     * @return 结果的一个Map，其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     */
    @Override
    public Map<String, Object> selectAll() throws RepositoryAdminManageServiceException {
        return selectAll(-1, -1);
    }

    /**
     * 添加仓库管理员信息
     *
     * @param repositoryAdmin 仓库管理员信息
     * @return 返回一个boolean值，值为true代表添加成功，否则代表失败
     */
    @UserOperation(value = "添加仓库管理员信息")
    @Override
    public boolean addRepositoryAdmin(RepositoryAdmin repositoryAdmin) throws RepositoryAdminManageServiceException {

        if (repositoryAdmin != null) {
            if (repositoryAdminCheck(repositoryAdmin)) {
                try {
                    // 添加仓库管理员信息到数据库中
                    repositoryAdminMapper.insert(repositoryAdmin);

                    // 获取插入数据后返回的用户ID
                    Integer userID = repositoryAdmin.getId();
                    if (userID == null) {
                        return false;
                    }

                    // 为仓库管理员创建账户
                    UserInfoDTO userInfo = new UserInfoDTO();
                    userInfo.setUserID(userID);
                    userInfo.setUserName(repositoryAdmin.getUsername());
                    // 设置初始密码为123456
                    userInfo.setPassword("123456");
                    userInfo.setRole(new ArrayList<>(Collections.singletonList("commonsAdmin")));

                    // 添加新创建的仓库管理员账户信息
                    return userInfoService.insertUserInfo(userInfo);

                } catch (PersistenceException | UserInfoServiceException e) {
                    throw new RepositoryAdminManageServiceException(e, "Fail to persist repository admin info");
                }
            }
        }
        return false;
    }

    /**
     * 更新仓库管理员信息
     *
     * @param repositoryAdmin 仓库管理员信息
     * @return 返回一个boolean值，值为true代表更新成功，否则代表失败
     */
    @UserOperation(value = "修改仓库管理员信息")
    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean updateRepositoryAdmin(RepositoryAdmin repositoryAdmin) throws RepositoryAdminManageServiceException {

        log.info("更新仓库管理员信息：{}", repositoryAdmin);
        if (repositoryAdmin != null) {
            try {
                // 检查属性
                if (!repositoryAdminCheck(repositoryAdmin)) {
                    return false;
                }

                repositoryAdminMapper.update(repositoryAdmin);

                // 查询是否存在待分配的仓库ID
                List<Integer> repoIdList = repositoryAdmin.getRepoIdList();
                if (CollectionUtils.isNotEmpty(repoIdList)) {
                    List<RepoRepoAdmin> repoRepoAdminList = repositoryMapper.selectRepoRepoAdminByRepoAdminId(repositoryAdmin.getId());
                    if (CollectionUtils.isNotEmpty(repoRepoAdminList)) {
                        // 删除旧的关联关系
                        repositoryMapper.removeRepoRepoAdminByRepoAdminId(repositoryAdmin.getId());
                    }
                    for (Integer repoId : repoIdList) {
                        RepoRepoAdmin repoRepoAdmin = new RepoRepoAdmin();
                        repoRepoAdmin.setRepositoryId(repoId);
                        repoRepoAdmin.setRepoAdminId(repositoryAdmin.getId());
                        // 新增新的关联关系
                        repositoryMapper.insertRepoRepoAdmin(repoRepoAdmin);
                    }
                 }

                return true;
            } catch (PersistenceException e) {
                throw new RepositoryAdminManageServiceException(e);
            }
        } else {
            return false;
        }

    }

    /**
     * 删除仓库管理员信息
     *
     * @param repositoryAdminID 仓库管理员ID
     * @return 返回一个boolean值，值为true代表删除成功，否则代表失败
     */
    @UserOperation(value = "删除仓库管理员信息")
    @Override
    public boolean deleteRepositoryAdmin(Integer repositoryAdminID) throws RepositoryAdminManageServiceException {

        try {
            // 判断是否已指派仓库
            List<Repository> repositoryList = repositoryMapper.selectByRepoAdminId(repositoryAdminID);
            if (CollectionUtils.isEmpty(repositoryList)) {

                // 删除仓库管理员信息
                repositoryAdminMapper.deleteByID(repositoryAdminID);

                // 删除账户信息
                userInfoService.deleteUserInfo(repositoryAdminID);

                return true;
            } else {
                log.error("删除仓库管理员信息失败，该仓库管理员存在指派仓库");
                return false;
            }
        } catch (PersistenceException | UserInfoServiceException e) {
            throw new RepositoryAdminManageServiceException(e);
        }
    }

    /**
     * 为仓库管理员指派指定 ID 的仓库
     *
     * @param repositoryAdminID 仓库管理员ID
     * @param repositoryID      所指派的仓库ID
     * @return 返回一个 boolean 值，值为 true 表示仓库指派成功，否则表示失败
     */
    @UserOperation(value = "指派仓库管理员")
    @Override
    public boolean assignRepository(Integer repositoryAdminID, Integer repositoryID) throws RepositoryAdminManageServiceException {

        try {
            Repository repository = repositoryMapper.selectByID(repositoryID);
            if (repository != null) {
                repository.setAdminID(repositoryAdminID);
                repositoryMapper.update(repository);
                return true;
            } else {
                return false;
            }
        } catch (PersistenceException e) {
            throw new RepositoryAdminManageServiceException(e);
        }
    }

    /**
     * 从文件中导入仓库管理员信息
     *
     * @param file 导入信息的文件
     * @return 返回一个Map，其中：key为total代表导入的总记录数，key为available代表有效导入的记录数
     */
    @UserOperation(value = "导入仓库管理员信息")
    @Override
    public Map<String, Object> importRepositoryAdmin(MultipartFile file) throws RepositoryAdminManageServiceException {
        // 初始化结果集
        Map<String, Object> resultSet = new HashMap<>();
        long total = 0;
        long available = 0;

        // 从文件中读取
        List<Object> repositoryAdmins = excelUtil.excelReader(RepositoryAdmin.class, file);

        if (repositoryAdmins != null) {
            total = repositoryAdmins.size();

            // 验证记录
            RepositoryAdmin repositoryAdmin;
            List<RepositoryAdmin> availableList = new ArrayList<>();
            for (Object object : repositoryAdmins) {
                repositoryAdmin = (RepositoryAdmin) object;
                if (repositoryAdminCheck(repositoryAdmin)) {
                    availableList.add(repositoryAdmin);
                }
            }

            try {
                // 保存到数据库
                available = availableList.size();
                if (available > 0) {
                    for (RepositoryAdmin repoAdmin : availableList) {
                        repositoryAdminMapper.insert(repoAdmin);
                        // 为仓库管理员创建账户
                        UserInfoDTO userInfo = new UserInfoDTO();
                        userInfo.setUserID(repoAdmin.getId());
                        userInfo.setUserName(repoAdmin.getUsername());
                        // 设置初始密码为123456
                        userInfo.setPassword("123456");
                        userInfo.setRole(new ArrayList<>(Collections.singletonList("commonsAdmin")));

                        // 添加新创建的仓库管理员账户信息
                        userInfoService.insertUserInfo(userInfo);
                    }
                }
            } catch (PersistenceException | UserInfoServiceException e) {
                throw new RepositoryAdminManageServiceException(e);
            }
        }

        resultSet.put("total", total);
        resultSet.put("available", available);
        return resultSet;
    }

    /**
     * 导出仓库管理员信息到文件中
     *
     * @param repositoryAdmins 包含若干条 repository 信息的 List
     * @return Excel 文件
     */
    @UserOperation(value = "导出仓库管理员信息")
    @Override
    public File exportRepositoryAdmin(List<RepositoryAdmin> repositoryAdmins) {
        File file = null;

        if (repositoryAdmins != null) {
            file = excelUtil.excelWriter(RepositoryAdmin.class, repositoryAdmins);
        }

        return file;
    }

    /**
     * 检验 repositoryAdmin 信息是否有效
     *
     * @param repositoryAdmin 仓库管理员信息
     * @return 返回一个 boolean 值，若仓库管理员信息中要求非空均有值，返回 true，否则返回 false
     */
    private boolean repositoryAdminCheck(RepositoryAdmin repositoryAdmin) {

        return repositoryAdmin.getName() != null && repositoryAdmin.getTel() != null &&
                repositoryAdmin.getUsername() != null;
    }

    /**
     * 返回所属指定 repositoryID 的仓库管理员信息
     *
     * @param repositoryID 仓库ID 其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     * @return 返回一个Map，
     */
    @Override
    public Map<String, Object> selectByRepositoryID(Integer repositoryID) throws RepositoryAdminManageServiceException {
        // 初始化结果集
        Map<String, Object> resultSet = new HashMap<>();
        List<RepositoryAdmin> repositoryAdmins = new ArrayList<>();
        long total = 0;

        // 查询
        RepositoryAdmin repositoryAdmin;
        try {
            repositoryAdmin = repositoryAdminMapper.selectByRepositoryID(repositoryID);
        } catch (PersistenceException e) {
            throw new RepositoryAdminManageServiceException(e);
        }

        if (repositoryAdmin != null) {
            repositoryAdmins.add(repositoryAdmin);
            total = 1;
        }

        resultSet.put("data", repositoryAdmins);
        resultSet.put("total", total);
        return resultSet;
    }

    private void setRepository(List<RepositoryAdmin> repositoryAdminList) {
        for (RepositoryAdmin repositoryAdmin: repositoryAdminList) {
            List<Repository> repositoryList = repositoryMapper.selectByRepoAdminId(repositoryAdmin.getId());
            repositoryAdmin.setRepositoryList(repositoryList);
        }
    }

    /**
     * 检查用户名唯一性
     *
     * @param username 用户名
     * @return boolean 是否唯一
     */
    @Override
    public boolean checkUsername(String username) {
        return repositoryAdminMapper.selectRepositoryAdminByUserName(username) == null;
    }

}
