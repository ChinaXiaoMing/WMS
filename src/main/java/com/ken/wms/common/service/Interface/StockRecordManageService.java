package com.ken.wms.common.service.Interface;

import com.ken.wms.exception.StockRecordManageServiceException;

import java.util.Map;

/**
 * 出入库管理
 */
public interface StockRecordManageService {

    /**
     * 货物入库操作
     *
     * @param goodsId      货物ID
     * @param repositoryId 入库仓库ID
     * @param number       入库数量
     * @param remark       备注
     * @return 返回一个boolean 值，若值为true表示入库成功，否则表示入库失败
     */
    boolean stockInOperation(Integer goodsId, Integer repositoryId, long number, String remark, String personInCharge)
            throws StockRecordManageServiceException;

    /**
     * 货物出库操作
     *
     * @param goodsId      货物ID
     * @param repositoryId 出库仓库ID
     * @param number       出库数量
     * @param personInCharge 出库经办人
     * @param remark        备注
     * @return 返回一个boolean值，若值为true表示出库成功，否则表示出库失败
     */
    boolean stockOutOperation(Integer goodsId, Integer repositoryId, long number, String personInCharge, String remark)
            throws StockRecordManageServiceException;

    /**
     * 查询出入库记录
     *
     * @param repositoryID 仓库ID
     * @param endDateStr   查询记录起始日期
     * @param startDateStr 查询记录结束日期
     * @param searchType   记录查询方式
     * @return 结果的一个Map，其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     */
    Map<String, Object> selectStockRecord(Integer repositoryID, String startDateStr, String endDateStr, String searchType) throws StockRecordManageServiceException;

    /**
     * 分页查询出入库记录
     *
     * @param repositoryID 仓库ID
     * @param endDateStr   查询记录起始日期
     * @param startDateStr 查询记录结束日期
     * @param searchType   记录查询方式
     * @param offset       分页偏移值
     * @param limit        分页大小
     * @return 结果的一个Map，其中： key为 data 的代表记录数据；key 为 total 代表结果记录的数量
     */
    Map<String, Object> selectStockRecord(Integer repositoryID, String startDateStr, String endDateStr, String searchType, int offset, int limit) throws StockRecordManageServiceException;
}
