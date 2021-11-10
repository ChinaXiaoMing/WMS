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
