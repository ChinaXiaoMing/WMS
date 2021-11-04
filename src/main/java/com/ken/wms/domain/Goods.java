package com.ken.wms.domain;

/**
 * 货物信息
 */
public class Goods {

    /**
     * 货物ID
     */
    private Integer id;
    /**
     * 物料编号
     */
    private String goodCode;
    /**
     * 物料描述
     */
    private String name;
    /**
     * 货物类型
     */
    private String type;
    /**
     * 单位
     */
    private String size;
    /**
     * 货物价值
     */
    private Double value;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
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
        return "Goods{" +
                "id=" + id +
                ", goodCode='" + goodCode + '\'' +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", size='" + size + '\'' +
                ", value=" + value +
                ", carNumber='" + carNumber + '\'' +
                ", goodImportance='" + goodImportance + '\'' +
                ", goodImage='" + goodImage + '\'' +
                '}';
    }

}
