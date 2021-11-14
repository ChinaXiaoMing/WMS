package com.ken.wms.domain;

/**
 * 出库/入库记录DO
 */
public class StockRecordDTO {

    /**
     * 记录ID
     */
    private Integer recordId;

    /**
     * 记录的类型（出库/入库）
     */
    private String type;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 出库或入库仓库ID
     */
    private Integer repositoryId;

    /**
     * 出/入库仓库名称
     */
    private String repoName;

    /**
     * 出库或入库数量
     */
    private long number;

    /**
     * 出库或入库时间
     */
    private String time;

    /**
     * 出库或入库经手人
     */
    private String personInCharge;

    /**
     * 备注
     */
    private String remark;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
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
