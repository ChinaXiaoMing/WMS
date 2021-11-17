package com.ken.wms.common.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ken.wms.common.service.Interface.GoodsStatisticsService;
import com.ken.wms.common.util.JsonUtils;
import com.ken.wms.common.util.Response;
import com.ken.wms.dao.GoodsStatisticsMapper;
import com.ken.wms.domain.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
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
    private GoodsStatisticsService goodsStatisticsService;

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
                                                   @RequestParam(value = "keyWord", required = false) String keyWord,
                                                   @RequestParam(value = "goodsType", required = false) String goodsType) {
        // 初始化 Response
        Map<String, Object> resultMap = new HashMap<>(16);
        log.info("查询库存汇总keyword: {}, goodsType: {}", keyWord, goodsType);
        long total = 0L;
        PageHelper.offsetPage(offset, limit);
        List<GoodsStatisticsDTO> goodsStatisticsDTOList = null;
        if (searchType.equals(CommonConstant.SEARCH_ALL)) {
            if (StringUtils.isNotEmpty(goodsType)) {
                goodsStatisticsDTOList = goodsStatisticsMapper.selectByGoodsType(goodsType);
            } else {
                goodsStatisticsDTOList = goodsStatisticsMapper.selectAll();
            }
        }
        if (searchType.equals(CommonConstant.SEARCH_BY_NAME)) {
            if (StringUtils.isNotEmpty(goodsType)) {
                goodsStatisticsDTOList = goodsStatisticsMapper.selectByGoodsTypeAndGoodName(goodsType, keyWord);
            } else {
                goodsStatisticsDTOList = goodsStatisticsMapper.selectByGoodName(keyWord);
            }

        }
        List<GoodsStatisticsResponse> goodsStatisticsResponseList = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(goodsStatisticsDTOList)) {
            for (GoodsStatisticsDTO goodsStatisticsDTO : goodsStatisticsDTOList) {
                GoodsStatisticsResponse goodsStatisticsResponse = new GoodsStatisticsResponse();
                BeanUtils.copyProperties(goodsStatisticsDTO, goodsStatisticsResponse);
                Integer availableNumber;
                if ("可维修".equals(goodsStatisticsDTO.getType())) {
                    // 可用 = 湘湖 + 七堡 + 南阳 + 物资库库余 + 二线返回
                    availableNumber = goodsStatisticsDTO.getXianghuNumber() + goodsStatisticsDTO.getNanyangNumber() +
                            goodsStatisticsDTO.getQibaoNumber() + goodsStatisticsDTO.getLeaveNumber() +
                            goodsStatisticsDTO.getReworkNumber();
                } else {
                    // 可用 = 湘湖 + 七堡 + 南阳 + 物资库库余 + 二线返回 - 报废
                    availableNumber = goodsStatisticsDTO.getXianghuNumber() + goodsStatisticsDTO.getNanyangNumber() +
                            goodsStatisticsDTO.getQibaoNumber() + goodsStatisticsDTO.getLeaveNumber() +
                            goodsStatisticsDTO.getReworkNumber() - goodsStatisticsDTO.getScrapNumber();
                }
                goodsStatisticsResponse.setAvailableNumber(availableNumber);
                // 故障件 = 一线故障件 + 二线故障件
                Integer faultNumber = goodsStatisticsDTO.getFaultOneNumber() + goodsStatisticsDTO.getFaultTwoNumber();
                goodsStatisticsResponse.setFaultNumber(faultNumber);
                // 总数 = 可用 + 故障件
                goodsStatisticsResponse.setAllNumber(availableNumber + faultNumber);
                goodsStatisticsResponseList.add(goodsStatisticsResponse);
            }
            PageInfo<GoodsStatisticsResponse> pageInfo = new PageInfo<>(goodsStatisticsResponseList);
            total = pageInfo.getTotal();
        }
        resultMap.put("rows", goodsStatisticsResponseList);
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
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        log.info("request: {}", request);
        return goodsStatisticsService.moveGoods(moveGoodsRequest, request);
    }

}
