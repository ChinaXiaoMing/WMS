ALTER TABLE `wms_respository`
MODIFY COLUMN `REPO_ADDRESS`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `REPO_ID`,
ADD COLUMN `REPO_NAME`  varchar(64) NOT NULL COMMENT '仓库名称' AFTER `REPO_ID`;

ALTER TABLE `wms_db`.`wms_repo_admin`
ADD COLUMN `REPO_ADMIN_USERNAME` varchar(20) NOT NULL COMMENT '仓库管理员用户名（用于账号登录）' AFTER `REPO_ADMIN_ID`;

ALTER TABLE `wms_db`.`wms_repo_admin`
MODIFY COLUMN `REPO_ADMIN_SEX` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `REPO_ADMIN_NAME`,
MODIFY COLUMN `REPO_ADMIN_ADDRESS` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `REPO_ADMIN_TEL`,
MODIFY COLUMN `REPO_ADMIN_BIRTH` datetime(0) NULL AFTER `REPO_ADMIN_ADDRESS`;

ALTER TABLE `wms_db`.`wms_respository`
MODIFY COLUMN `REPO_AREA` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `REPO_STATUS`;

ALTER TABLE `wms_goods`
MODIFY COLUMN `GOOD_NAME`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货物描述' AFTER `GOOD_ID`,
MODIFY COLUMN `GOOD_RYPE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物类型' AFTER `GOOD_NAME`,
MODIFY COLUMN `GOOD_SIZE`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货物单位' AFTER `GOOD_RYPE`,
MODIFY COLUMN `GOOD_VALUE`  double NULL AFTER `GOOD_SIZE`,
ADD COLUMN `GOOD_CODE`  varchar(64) NOT NULL COMMENT '货物编号' AFTER `GOOD_ID`,
ADD COLUMN `GOOD_CAR_NUMBER`  varchar(64) NULL COMMENT '车号' AFTER `GOOD_VALUE`,
ADD COLUMN `GOOD_IMPORTANCE`  varchar(32) NULL COMMENT '货物重要性' AFTER `GOOD_CAR_NUMBER`,
ADD COLUMN `GOOD_IMAGE`  varchar(255) NULL COMMENT '物资照片' AFTER `GOOD_IMPORTANCE`;

ALTER TABLE `wms_db`.`wms_goods`
MODIFY COLUMN `GOOD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货物描述' AFTER `GOOD_CODE`;

ALTER TABLE `wms_repo_admin` DROP FOREIGN KEY `wms_repo_admin_ibfk_1`;

ALTER TABLE `wms_repo_admin`
MODIFY COLUMN `REPO_ADMIN_REPOID`  varchar(255) NULL DEFAULT NULL COMMENT '所属仓库' AFTER `REPO_ADMIN_BIRTH`;

ALTER TABLE `wms_db`.`wms_respository`
ADD COLUMN `REPO_ADMIN_ID` int(11) NULL COMMENT '仓库管理员ID' AFTER `REPO_DESC`;

ALTER TABLE `wms_db`.`wms_record_in`
ADD COLUMN `REMARK` varchar(255) NOT NULL COMMENT '入库备注' AFTER `RECORD_REPOSITORYID`;

ALTER TABLE `wms_db`.`wms_record_out`
ADD COLUMN `REMARK` varchar(255) NULL COMMENT '出库备注' AFTER `RECORD_REPOSITORYID`;

ALTER TABLE `wms_record_in`
    MODIFY COLUMN `RECORD_SUPPLIERID`  int(11) NULL AFTER `RECORD_ID`,
    MODIFY COLUMN `REMARK`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '入库备注' AFTER `RECORD_REPOSITORYID`;

ALTER TABLE `wms_record_out`
    MODIFY COLUMN `RECORD_CUSTOMERID`  int(11) NULL AFTER `RECORD_ID`,
    MODIFY COLUMN `RECORD_REPOSITORYID`  int(11) NULL AFTER `RECORD_PERSON`;

CREATE TABLE `wms_repo_repo_admin` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   `repository_id` int(11) NOT NULL COMMENT '仓库ID',
   `repo_admin_id` int(11) NOT NULL COMMENT '仓库管理员ID',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库与仓库管理员关联表';



CREATE TABLE `wms_goods_statistics` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `goods_id` int(11) NOT NULL COMMENT '物料ID',
    `total_number` int(11) NOT NULL DEFAULT '0' COMMENT '总数（物资库）',
    `out_number` int(11) NOT NULL DEFAULT '0' COMMENT '借出（物资库）',
    `leave_number` int(11) NOT NULL DEFAULT '0' COMMENT '库余（物资库）',
    `xianghu_number` int(11) DEFAULT NULL COMMENT '湘湖（一线）',
    `nanyang_number` int(11) DEFAULT NULL COMMENT '南阳（一线）',
    `qibao_number` int(11) DEFAULT NULL COMMENT '七堡（一线）',
    `fault_one_number` int(11) DEFAULT NULL COMMENT '故障件（一线）',
    `fault_two_number` int(11) DEFAULT NULL COMMENT '故障件（二线）',
    `reworking_number` int(11) DEFAULT NULL COMMENT '返修中（二线）',
    `rework_number` int(11) DEFAULT NULL COMMENT '返修回（二线）',
    `overhaul_number` int(11) DEFAULT NULL COMMENT '大修拆回',
    `scrap_number` int(11) DEFAULT NULL COMMENT '报废',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存物料统计表';


