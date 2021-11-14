package com.ken.wms.domain;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 出库记录
 */
public class StockOutDO {

    /**
     * 出库记录ID
     */
    private Integer id;


    /**
     * 商品ID
     */
    private Integer goodId;

    /**
     * 商品名称
     */
    private String goodName;

    /**
     * 出库仓库ID
     */
    private Integer repositoryId;

    /**
     * 出/入库仓库名称
     */
    private String repoName;

    /**
     * 商品出库数量
     */
    private long number;

    /**
     * 出库日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    /**
     * 出库经手人
     */
    private String personInCharge;

    /**
     * 备注
     */
    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public Integer getRepositoryId() {
        return repositoryId;
    }

    public void setRepositoryId(Integer repositoryId) {
        this.repositoryId = repositoryId;
    }

    public String getRepoName() {
        return repoName;
    }

    public void setRepoName(String repoName) {
        this.repoName = repoName;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPersonInCharge() {
        return personInCharge;
    }

    public void setPersonInCharge(String personInCharge) {
        this.personInCharge = personInCharge;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
