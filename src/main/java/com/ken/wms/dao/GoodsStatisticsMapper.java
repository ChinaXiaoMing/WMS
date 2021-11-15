package com.ken.wms.dao;

import com.ken.wms.domain.GoodsStatistics;
import com.ken.wms.domain.GoodsStatisticsDTO;

import java.util.List;

/**
 * 库存物料统计表
 *
 * @author xiaoming
 * @date 2021/11/11
 */
public interface GoodsStatisticsMapper {


    /**
     * 插入
     *
     * @param goodsStatistics 商品统计
     * @return int
     */
    int insert(GoodsStatistics goodsStatistics);


    /**
     * 删除
     *
     * @param id id
     * @return int
     */
    int delete(int id);

    /**
     * 更新
     *
     * @param goodsStatistics 商品统计
     * @return int
     */
    int update(GoodsStatistics goodsStatistics);

    /**
     * 根据id查询
     *
     * @param id id
     * @return {@link GoodsStatistics}
     */
    GoodsStatistics selectById(int id);

    /**
     * 根据物料id查询汇总信息
     *
     * @param goodId 好身份证
     * @return 汇总信息
     */
    GoodsStatisticsDTO selectByGoodId(Integer goodId);

    /**
     * 根据物料描述查询汇总信息
     *
     * @param goodName 物料描述
     * @return 汇总信息
     */
    List<GoodsStatisticsDTO> selectByGoodName(String goodName);

    /**
     * 根据物料描述查询汇总信息
     *
     * @param goodName 物料描述
     * @return 汇总信息
     */
    GoodsStatisticsDTO selectEqualsByGoodName(String goodName);

    /**
     * 查询列表
     *
     * @return 物料统计列表
     */
    List<GoodsStatisticsDTO> selectAll();

}
