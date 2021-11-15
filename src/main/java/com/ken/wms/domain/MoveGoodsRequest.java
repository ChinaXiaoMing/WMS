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
    private Integer moveGoodsNumber;

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

    public Integer getMoveGoodsNumber() {
        return moveGoodsNumber;
    }

    public void setMoveGoodsNumber(Integer moveGoodsNumber) {
        this.moveGoodsNumber = moveGoodsNumber;
    }
}
