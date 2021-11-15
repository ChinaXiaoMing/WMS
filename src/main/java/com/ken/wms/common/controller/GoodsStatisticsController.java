package com.ken.wms.common.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ken.wms.common.util.JsonUtils;
import com.ken.wms.common.util.Response;
import com.ken.wms.dao.GoodsStatisticsMapper;
import com.ken.wms.domain.GoodsStaticsRequest;
import com.ken.wms.domain.GoodsStatistics;
import com.ken.wms.domain.GoodsStatisticsDTO;
import com.ken.wms.domain.MoveGoodsRequest;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    private final Logger log = LoggerFactory.getLogger(GoodsStatisticsController.class);

    @Autowired
    private GoodsStatisticsMapper goodsStatisticsMapper;

    /**
     * 添加库存汇总记录
     *
     * @param goodsStaticsRequest 库存汇总请求
     * @return 结果
     */
    @PostMapping(value = "/addGoodsStatics")
    @ResponseBody
    public Map<String, Object> addGoodsStatics(@RequestBody GoodsStaticsRequest goodsStaticsRequest) {
        // 初始化 Response
        Map<String, Object> resultMap = new HashMap<>(16);
        String result;
        log.info("新增库存汇总记录物料描述：{}", JsonUtils.jsonToString(goodsStaticsRequest));
        if (goodsStatisticsMapper.selectEqualsByGoodName(goodsStaticsRequest.getGoodName()) != null) {
            result = Response.RESPONSE_RESULT_ERROR;

        } else {
            GoodsStatistics goodsStatistics = new GoodsStatistics();
            BeanUtils.copyProperties(goodsStaticsRequest, goodsStatistics);


            // 添加结果
            result = goodsStatisticsMapper.insert(goodsStatistics) > 0
                    ? Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

            // 设置 Response
        }
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

    /**
     * 删除库存汇总记录
     *
     * @param id 库存汇总id
     * @return 结果
     */
    @GetMapping(value = "/deleteGoodsStatics")
    @ResponseBody
    public Map<String, Object> deleteGoodsStatics(@RequestParam("id") Integer id) {
        // 初始化 Response
        Map<String, Object> resultMap = new HashMap<>(16);

        // 添加结果
        String result = goodsStatisticsMapper.delete(id) > 0
                ? Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

        // 设置 Response
        resultMap.put("result", result);
        return resultMap;
    }

    /**
     * 检查物料编码是否存在
     *
     * @param goodName 物料描述
     * @return 是否存在
     */
    @PostMapping("/checkGoodName")
    @ResponseBody
    public String checkGoodName(@RequestParam("goodName") String goodName) {
        HashMap<String, Object> map = new HashMap<>(16);
        map.put("valid", goodsStatisticsMapper.selectEqualsByGoodName(goodName) == null);
        return JsonUtils.jsonToString(map);
    }

    /**
     * 物料移库
     *
     * @return 是否成功
     */
    @PostMapping("/moveGoods")
    @ResponseBody
    public Map<String, Object> moveGoods(@RequestBody MoveGoodsRequest moveGoodsRequest) {
        log.info("移库请求数据：{}", JsonUtils.jsonToString(moveGoodsRequest));
        HashMap<String, Object> result = new HashMap<>(16);
        result.put("result", "success");

        return result;
    }

}
