package com.ken.wms.common.controller;

import com.ken.wms.common.service.Interface.StockRecordManageService;
import com.ken.wms.common.util.Response;
import com.ken.wms.common.util.ResponseUtil;
import com.ken.wms.domain.StockRecordDTO;
import com.ken.wms.exception.StockRecordManageServiceException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 商品出入库管理请求Handler
 */
@Controller
@RequestMapping(value = "stockRecordManage")
public class StockRecordManageHandler {

    @Autowired
    private ResponseUtil responseUtil;
    @Autowired
    private StockRecordManageService stockRecordManageService;

    /**
     * 货物出库操作
     *
     * @param goodsId      货物ID
     * @param repositoryId 仓库ID
     * @param number       出库数量
     * @param remark       备注
     * @param request      http请求
     * @return 返回一个map，key为result的值表示操作是否成功
     */
    @RequestMapping(value = "stockOut", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> stockOut(@RequestParam("goodsId") Integer goodsId,
                                 @RequestParam(value = "repositoryId", required = false) Integer repositoryId,
                                 @RequestParam("number") long number,
                                 @RequestParam(value = "remark", required = false) String remark,
                                 HttpServletRequest request) throws StockRecordManageServiceException {
        // 初始化 Response
        Response responseContent = responseUtil.newResponseInstance();

        HttpSession session = request.getSession();
        String personInCharge = (String) session.getAttribute("userName");

        String result = stockRecordManageService.stockOutOperation(goodsId, repositoryId, number, personInCharge, remark) ?
                Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

        // 设置 Response
        responseContent.setResponseResult(result);
        return responseContent.generateResponse();
    }

    /**
     * 货物入库操作
     *
     * @param goodsId      货物ID
     * @param repositoryId 仓库ID
     * @param number       入库数目
     * @param request      http 请求
     * @return 返回一个map，key为result的值表示操作是否成功
     */
    @RequestMapping(value = "stockIn", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> stockIn(@RequestParam("goodsId") Integer goodsId, @RequestParam("repositoryId") Integer repositoryId,
                                @RequestParam("number") long number, @RequestParam("remark") String remark,
                                HttpServletRequest request) throws StockRecordManageServiceException {
        // 初始化 Response
        Response responseContent = responseUtil.newResponseInstance();

        HttpSession session = request.getSession();
        String personInCharge = (String) session.getAttribute("userName");

        String result = stockRecordManageService.stockInOperation(goodsId, repositoryId, number, personInCharge, remark) ?
                Response.RESPONSE_RESULT_SUCCESS : Response.RESPONSE_RESULT_ERROR;

        // 设置 Response
        responseContent.setResponseResult(result);
        return responseContent.generateResponse();
    }

    /**
     * 查询出入库记录
     *
     * @param searchType      查询类型（查询所有或仅查询入库记录或仅查询出库记录）
     * @param repositoryId 查询记录所对应的仓库ID
     * @param endDateStr      查询的记录起始日期
     * @param startDateStr    查询的记录结束日期
     * @param limit           分页大小
     * @param offset          分页偏移值
     * @return 返回一个Map，其中：Key为rows的值代表所有记录数据，Key为total的值代表记录的总条数
     */
    @SuppressWarnings({"SingleStatementInBlock", "unchecked"})
    @RequestMapping(value = "searchStockRecord", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getStockRecord(@RequestParam("searchType") String searchType,
                                       @RequestParam(value = "repositoryId", required = false) Integer repositoryId,
                                       @RequestParam("startDate") String startDateStr,
                                       @RequestParam("endDate") String endDateStr,
                                       @RequestParam("limit") int limit,
                                       @RequestParam("offset") int offset) throws StockRecordManageServiceException {
        // 初始化 Response
        Response responseContent = responseUtil.newResponseInstance();
        List<StockRecordDTO> rows = null;
        long total = 0;

        // 参数检查
        String regex = "([0-9]{4})-([0-9]{2})-([0-9]{2})";
        boolean startDateFormatCheck = (StringUtils.isEmpty(startDateStr) || startDateStr.matches(regex));
        boolean endDateFormatCheck = (StringUtils.isEmpty(endDateStr) || endDateStr.matches(regex));

        if (startDateFormatCheck && endDateFormatCheck) {
            // 转到 Service 执行查询
            Map<String, Object> queryResult = stockRecordManageService.selectStockRecord(repositoryId, startDateStr, endDateStr, searchType, offset, limit);
            if (queryResult != null) {
                rows = (List<StockRecordDTO>) queryResult.get("data");
                total = (long) queryResult.get("total");
            }
        } else {
            responseContent.setResponseMsg("Request argument error");
        }

        if (rows == null) {
            rows = new ArrayList<>(0);
        }

        responseContent.setCustomerInfo("rows", rows);
        responseContent.setResponseTotal(total);
        return responseContent.generateResponse();
    }
}
