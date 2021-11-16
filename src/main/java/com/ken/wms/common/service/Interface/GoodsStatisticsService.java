package com.ken.wms.common.service.Interface;

import com.ken.wms.domain.MoveGoodsRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 库存汇总服务类
 *
 * @author fu.yuanming
 * @date 2021-11-16
 */
public interface GoodsStatisticsService {

    Map<String, Object> moveGoods(MoveGoodsRequest moveGoodsRequest, HttpServletRequest request);

}
