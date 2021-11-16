package com.ken.wms.domain;

/**
 * 移动货物的请求类
 *
 * @author xiaoming
 * @date 2021/11/16
 */
public class MoveGoodsRequest {

    /**
     * 物料ID
     */
    private Integer goodsId;

    /**
     * 入库仓库ID
     */
    private Integer inRepoId;

    /**
     * 出库仓库ID
     */
    private Integer outRepoId;

    /**
     * 移库数量
     */
    private Long moveGoodsNumber;

    /**
     * 备注
     */
    private String remark;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getInRepoId() {
        return inRepoId;
    }

    public void setInRepoId(Integer inRepoId) {
        this.inRepoId = inRepoId;
    }

    public Integer getOutRepoId() {
        return outRepoId;
    }

    public void setOutRepoId(Integer outRepoId) {
        this.outRepoId = outRepoId;
    }

    public Long getMoveGoodsNumber() {
        return moveGoodsNumber;
    }

    public void setMoveGoodsNumber(Long moveGoodsNumber) {
        this.moveGoodsNumber = moveGoodsNumber;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
