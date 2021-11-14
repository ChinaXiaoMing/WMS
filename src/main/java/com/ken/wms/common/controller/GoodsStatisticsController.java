package com.ken.wms.common.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ken.wms.common.util.Response;
import com.ken.wms.dao.GoodsStatisticsMapper;
import com.ken.wms.domain.GoodsStatistics;
import com.ken.wms.domain.GoodsStatisticsDTO;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 库存汇总控制器
 *
 * @author xiaoming
 * @date 2021/11/14
 */
@Controller
@RequestMapping(value = "/**/goodsStatistics")
public class GoodsStatisticsController {

    @Autowired
    private GoodsStatisticsMapper goodsStatisticsMapper;

    /**
     * 添加库存汇总记录
     *
     * @param goodsStatistics 库存汇总
     * @return 结果
     */
    @PostMapping(value = "/addGoodsStatics")
    @ResponseBody
    public Map<String, Object> addGoodsStatics(@RequestBody GoodsStatistics goodsStatistics) {
        // 初始化 Response
        Map<String, Object> resultMap = new HashMap<>(16);

        // 添加结果
        String result = goodsStatisticsMapper.insert(goodsStatistics) > 0
                ? Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

        // 设置 Response
        resultMap.put("result", result);
        return resultMap;
    }

    /**
     * 获取库存汇总列表
     *
     * @return 结果
     */
    @GetMapping("/getGoodsStaticsList")
    @ResponseBody
    public Map<String, Object> getGoodsStaticsList(@RequestParam("searchType") String searchType,
                                                   @RequestParam("offset") int offset, @RequestParam("limit") int limit,
                                                   @RequestParam(value = "keyWord", required = false) String keyWord) {
        // 初始化 Response
        Map<String, Object> resultMap = new HashMap<>(16);
        long total = 0L;
        PageHelper.offsetPage(offset, limit);
        List<GoodsStatisticsDTO> goodsStatisticsDTOList = goodsStatisticsMapper.selectAll();
        if (CollectionUtils.isNotEmpty(goodsStatisticsDTOList)) {
            PageInfo<GoodsStatisticsDTO> pageInfo = new PageInfo<>(goodsStatisticsDTOList);
            total = pageInfo.getTotal();
        }
        resultMap.put("rows", goodsStatisticsDTOList);
        resultMap.put("total",total);

        return resultMap;
    }

}
