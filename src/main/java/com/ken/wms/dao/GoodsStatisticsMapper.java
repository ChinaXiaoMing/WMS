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
     * 查询列表
     *
     * @return 物料统计列表
     */
    List<GoodsStatisticsDTO> selectAll();

}
