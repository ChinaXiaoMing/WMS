package com.ken.wms.domain;

/**
 * @author fu.yuanming
 * @date 2021-11-15
 */
public class GoodsStaticsRequest {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 物料id
     */
    private Integer goodsId;

    /**
     * 总数（物资库）
     */
    private Integer totalNumber;

    /**
     * 借出（物资库）
     */
    private Integer outNumber;

    /**
     * 库余（物资库）
     */
    private Integer leaveNumber;

    /**
     * 湘湖（一线）
     */
    private Integer xianghuNumber;

    /**
     * 南阳（一线）
     */
    private Integer nanyangNumber;

    /**
     * 七堡（一线）
     */
    private Integer qibaoNumber;

    /**
     * 故障件（一线）
     */
    private Integer faultOneNumber;

    /**
     * 故障件（二线）
     */
    private Integer faultTwoNumber;

    /**
     * 返修中（二线）
     */
    private Integer reworkingNumber;

    /**
     * 返修回（二线）
     */
    private Integer reworkNumber;

    /**
     * 大修拆回
     */
    private Integer overhaulNumber;

    /**
     * 报废
     */
    private Integer scrapNumber;

    /**
     * 物料描述
     */
    private String goodName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(Integer totalNumber) {
        this.totalNumber = totalNumber;
    }

    public Integer getOutNumber() {
        return outNumber;
    }

    public void setOutNumber(Integer outNumber) {
        this.outNumber = outNumber;
    }

    public Integer getLeaveNumber() {
        return leaveNumber;
    }

    public void setLeaveNumber(Integer leaveNumber) {
        this.leaveNumber = leaveNumber;
    }

    public Integer getXianghuNumber() {
        return xianghuNumber;
    }

    public void setXianghuNumber(Integer xianghuNumber) {
        this.xianghuNumber = xianghuNumber;
    }

    public Integer getNanyangNumber() {
        return nanyangNumber;
    }

    public void setNanyangNumber(Integer nanyangNumber) {
        this.nanyangNumber = nanyangNumber;
    }

    public Integer getQibaoNumber() {
        return qibaoNumber;
    }

    public void setQibaoNumber(Integer qibaoNumber) {
        this.qibaoNumber = qibaoNumber;
    }

    public Integer getFaultOneNumber() {
        return faultOneNumber;
    }

    public void setFaultOneNumber(Integer faultOneNumber) {
        this.faultOneNumber = faultOneNumber;
    }

    public Integer getFaultTwoNumber() {
        return faultTwoNumber;
    }

    public void setFaultTwoNumber(Integer faultTwoNumber) {
        this.faultTwoNumber = faultTwoNumber;
    }

    public Integer getReworkingNumber() {
        return reworkingNumber;
    }

    public void setReworkingNumber(Integer reworkingNumber) {
        this.reworkingNumber = reworkingNumber;
    }

    public Integer getReworkNumber() {
        return reworkNumber;
    }

    public void setReworkNumber(Integer reworkNumber) {
        this.reworkNumber = reworkNumber;
    }

    public Integer getOverhaulNumber() {
        return overhaulNumber;
    }

    public void setOverhaulNumber(Integer overhaulNumber) {
        this.overhaulNumber = overhaulNumber;
    }

    public Integer getScrapNumber() {
        return scrapNumber;
    }

    public void setScrapNumber(Integer scrapNumber) {
        this.scrapNumber = scrapNumber;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }
}
