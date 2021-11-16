package com.ken.wms.common.service.Impl;

import com.ken.wms.common.service.Interface.GoodsStatisticsService;
import com.ken.wms.dao.StockInMapper;
import com.ken.wms.dao.StockOutMapper;
import com.ken.wms.dao.StorageMapper;
import com.ken.wms.domain.MoveGoodsRequest;
import com.ken.wms.domain.StockInDO;
import com.ken.wms.domain.StockOutDO;
import com.ken.wms.domain.Storage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 库存汇总逻辑实现类
 *
 * @author fu.yuanming
 * @date 2021-11-16
 */
@Service
public class GoodsStatisticsServiceImpl implements GoodsStatisticsService {

    private final Logger log = LoggerFactory.getLogger(GoodsStatisticsServiceImpl.class);

    @Autowired
    private StorageMapper storageMapper;

    @Autowired
    private StockInMapper stockInMapper;

    @Autowired
    private StockOutMapper stockOutMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Map<String, Object> moveGoods(MoveGoodsRequest moveGoodsRequest, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>(16);
        Storage storage = storageMapper.selectByGoodsIdAndRepoId(moveGoodsRequest.getGoodsId(), moveGoodsRequest.getOutRepoId());
        log.info("移库库存信息：{}", storage);
        if (storage == null) {
            result.put("data", "操作失败，出库仓库没有该物料");
            result.put("result", "error");
            return result;
        }

        if (moveGoodsRequest.getMoveGoodsNumber() > storage.getNumber()) {
            result.put("data", "操作失败，移库数量大于库存数量");
            result.put("result", "error");
            return result;
        }

        if (moveGoodsRequest.getOutRepoId().equals(moveGoodsRequest.getInRepoId())) {
            result.put("data", "操作失败，移出仓库与移入仓库不能为同一仓库");
            result.put("result", "error");
            return result;
        }

        Long moveGoodsNumber = moveGoodsRequest.getMoveGoodsNumber();
        String userName = (String) request.getSession().getAttribute("userName");

        // 移库操作
        // 1、移出库存减少移出数量，更新库存信息
        storage.setNumber(storage.getNumber() - moveGoodsNumber);
        log.info("移出仓库库存信息：{}", storage);
        storageMapper.update(storage);

        storage.setRepositoryID(moveGoodsRequest.getInRepoId());
        storage.setNumber(moveGoodsNumber);
        log.info("移入仓库库存信息：{}", storage);
        storageMapper.insert(storage);

        // 2、记录出库入库信息
        StockOutDO stockOutDO = new StockOutDO();
        stockOutDO.setGoodId(moveGoodsRequest.getGoodsId());
        stockOutDO.setNumber(moveGoodsNumber);
        stockOutDO.setPersonInCharge(userName);
        stockOutDO.setRepositoryId(moveGoodsRequest.getOutRepoId());
        stockOutDO.setTime(new Date());
        stockOutDO.setRemark(moveGoodsRequest.getRemark());
        stockOutMapper.insert(stockOutDO);

        StockInDO stockInDO = new StockInDO();
        stockInDO.setGoodId(moveGoodsRequest.getGoodsId());
        stockInDO.setNumber(moveGoodsNumber);
        stockInDO.setPersonInCharge(userName);
        stockInDO.setTime(new Date());
        stockInDO.setRepositoryId(moveGoodsRequest.getInRepoId());
        stockInDO.setRemark(moveGoodsRequest.getRemark());
        stockInMapper.insert(stockInDO);

        result.put("result", "success");

        return result;
    }
}
