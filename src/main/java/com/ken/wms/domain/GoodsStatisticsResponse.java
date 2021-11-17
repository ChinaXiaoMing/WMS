package com.ken.wms.domain;

/**
 * 库存汇总响应类
 *
 * @author fu.yuanming
 * @date 2021-11-17
 */
public class GoodsStatisticsResponse {

    /**
     * 物料编号
     */
    private String goodCode;
    /**
     * 物料描述
     */
    private String name;
    /**
     * 物料属性
     */
    private String type;
    /**
     * 单位
     */
    private String size;
    /**
     * 车号
     */
    private String carNumber;
    /**
     * 货物重要性
     */
    private String goodImportance;

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 物料id
     */
    private Integer goodsId;

    /**
     * 总数
     */
    private Integer allNumber;

    /**
     * 可用数量
     */
    private Integer availableNumber;

    /**
     * 故障件数量
     */
    private Integer faultNumber;

    /**
     * 报废
     */
    private Integer scrapNumber;

    public String getGoodCode() {
        return goodCode;
    }

    public void setGoodCode(String goodCode) {
        this.goodCode = goodCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
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

    public Integer getAllNumber() {
        return allNumber;
    }

    public void setAllNumber(Integer allNumber) {
        this.allNumber = allNumber;
    }

    public Integer getAvailableNumber() {
        return availableNumber;
    }

    public void setAvailableNumber(Integer availableNumber) {
        this.availableNumber = availableNumber;
    }

    public Integer getFaultNumber() {
        return faultNumber;
    }

    public void setFaultNumber(Integer faultNumber) {
        this.faultNumber = faultNumber;
    }

    public Integer getScrapNumber() {
        return scrapNumber;
    }

    public void setScrapNumber(Integer scrapNumber) {
        this.scrapNumber = scrapNumber;
    }
}
