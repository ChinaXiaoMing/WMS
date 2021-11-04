package com.ken.wms.domain;

/**
 * 仓库库存
 */
public class Storage {

    /**
     * 货物ID
     */
    private Integer goodsID;
    /**
     * 物料编号
     */
    private String goodCode;
    /**
     * 物料描述
     */
    private String goodsName;
    /**
     * 货物类型
     */
    private String goodsType;
    /**
     * 单位
     */
    private String goodsSize;
    /**
     * 车号
     */
    private String carNumber;
    /**
     * 货物重要性
     */
    private String goodImportance;
    /**
     * 货物照片
     */
    private String goodImage;
    /**
     * 仓库ID
     */
    private Integer repositoryID;
    /**
     * 仓库名称
     */
    private String repoName;
    /**
     * 库存数量
     */
    private Long number;

    public Integer getGoodsID() {
        return goodsID;
    }

    public void setGoodsID(Integer goodsID) {
        this.goodsID = goodsID;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsSize() {
        return goodsSize;
    }

    public void setGoodsSize(String goodsSize) {
        this.goodsSize = goodsSize;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public Integer getRepositoryID() {
        return repositoryID;
    }

    public void setRepositoryID(Integer repositoryID) {
        this.repositoryID = repositoryID;
    }

    public String getRepoName() {
        return repoName;
    }

    public void setRepoName(String repoName) {
        this.repoName = repoName;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public String getGoodCode() {
        return goodCode;
    }

    public void setGoodCode(String goodCode) {
        this.goodCode = goodCode;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public String getGoodImportance() {
        return goodImportance;
    }

    public void setGoodImportance(String goodImportance) {
        this.goodImportance = goodImportance;
    }

    public String getGoodImage() {
        return goodImage;
    }

    public void setGoodImage(String goodImage) {
        this.goodImage = goodImage;
    }

    @Override
    public String toString() {
        return "Storage{" +
                "goodsID=" + goodsID +
                ", goodCode='" + goodCode + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", goodsSize='" + goodsSize + '\'' +
                ", carNumber='" + carNumber + '\'' +
                ", goodImportance='" + goodImportance + '\'' +
                ", goodImage='" + goodImage + '\'' +
                ", repositoryID=" + repositoryID +
                ", repoName='" + repoName + '\'' +
                ", number=" + number +
                '}';
    }

}
