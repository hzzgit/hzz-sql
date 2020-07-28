/*
 Navicat Premium Data Transfer

 Source Server         : dev测试环境,96ip
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 172.16.8.96:3306
 Source Schema         : subiaodb

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 28/07/2020 09:31:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 808809userlim
-- ----------------------------
DROP TABLE IF EXISTS `808809userlim`;
CREATE TABLE `808809userlim`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT 'type1代表809，0代表808',
  `configid` int(11) NULL DEFAULT NULL COMMENT '808809管理的主键',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1850 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '808809的授权用户可见性配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adasalarm
-- ----------------------------
DROP TABLE IF EXISTS `adasalarm`;
CREATE TABLE `adasalarm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alarmId` int(11) NOT NULL,
  `alarmNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alarmSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmStatus` int(11) NOT NULL,
  `alarmTime` datetime(0) NULL DEFAULT NULL,
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `altitude` int(11) NOT NULL,
  `attachmentCount` int(11) NOT NULL,
  `deviateType` int(11) NOT NULL,
  `fatigueDegree` int(11) NOT NULL,
  `frontCarDistance` int(11) NOT NULL,
  `frontCarSpeed` int(11) NOT NULL,
  `gpsTime` datetime(0) NULL DEFAULT NULL,
  `latitude` double NOT NULL,
  `level` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `roadRecognitionData` int(11) NOT NULL,
  `roadRecognitionMark` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `terminalId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tirePressureAlarmDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleStatus` int(11) NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adasdevicestate
-- ----------------------------
DROP TABLE IF EXISTS `adasdevicestate`;
CREATE TABLE `adasdevicestate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adasId` int(11) NOT NULL,
  `alarmState` int(11) NOT NULL,
  `commandId` bigint(20) NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `workState` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for adasdevicesysteminfo
-- ----------------------------
DROP TABLE IF EXISTS `adasdevicesysteminfo`;
CREATE TABLE `adasdevicesysteminfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adasId` int(11) NOT NULL,
  `commandId` bigint(20) NOT NULL,
  `companyName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `customerCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deviceId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hardwareVersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productModuleNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `softwareVersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmconfig
-- ----------------------------
DROP TABLE IF EXISTS `alarmconfig`;
CREATE TABLE `alarmconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depId` int(11) NOT NULL DEFAULT 0 COMMENT ' 所属部门Id',
  `alarmSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警来源 常量 来自 AlarmRecord中定义的常量',
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警类型 常量 来自 AlarmRecord中定义的常量',
  `enabled` bit(1) NOT NULL COMMENT '是否启动',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警中文名称',
  `popupEnabled` bit(1) NOT NULL COMMENT '是否弹窗',
  `soundEnabled` bit(1) NOT NULL COMMENT '是否播放报警声音',
  `parent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statisticEnabled` bit(1) NULL DEFAULT NULL COMMENT '是否统计报警的起止时间',
  `alarmOnce` tinyint(1) NOT NULL COMMENT ' 当报警发生的时候，只报警一次，false，则一直报警直到报警关闭或取消',
  `takePictureChannels` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警时需要拍照的摄像头，如果为空，则不拍照',
  `videoMonitorChannels` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警联动,需要实时监控的通道号,为空则不启动实时视频',
  `riskLevel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报警的风险级别，high meidum low null',
  `autoProcess` tinyint(1) NOT NULL COMMENT '是否自动处理',
  `points` int(11) NOT NULL COMMENT '扣分系数',
  `textForDriver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 警报规则说明',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `index_alarmType`(`alarmType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 438 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmgranter
-- ----------------------------
DROP TABLE IF EXISTS `alarmgranter`;
CREATE TABLE `alarmgranter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `alarmtypes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报警要转发的报警类型,格式为,报警来源:报警类型;报警来源:报警类型;(例如:终端报警:超速报警;平台报警:超速报警)',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `isuse` bit(1) NOT NULL COMMENT '是否启用',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,1代表删除,0代表正常',
  `url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问接口',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `que_userId`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报警转发规则配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmgranterbydep
-- ----------------------------
DROP TABLE IF EXISTS `alarmgranterbydep`;
CREATE TABLE `alarmgranterbydep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `configId` int(11) NULL DEFAULT NULL COMMENT '配置id',
  `depId` int(11) NULL DEFAULT NULL COMMENT '绑定机构的id',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,0代表未删除,1代表删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_depId`(`depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报警转发规则和机构权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmgranterbyvehicle
-- ----------------------------
DROP TABLE IF EXISTS `alarmgranterbyvehicle`;
CREATE TABLE `alarmgranterbyvehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `configId` int(11) NULL DEFAULT NULL COMMENT '配置id',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,0代表未删除,1代表删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报警转发规则和车辆权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmgrantertopic
-- ----------------------------
DROP TABLE IF EXISTS `alarmgrantertopic`;
CREATE TABLE `alarmgrantertopic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `topicname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'topic名称,这边要在新增的时候,自动生成一个字符串.唯一字符串.可以使用uuid',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '删除标志,0未删除,1已删除',
  `isuse` bit(1) NULL DEFAULT NULL COMMENT '是否开启,0关闭,1开启',
  `depid` int(11) NULL DEFAULT NULL COMMENT '申请转发开通的时候选择的机构id,唯一的,只能有一条有这个机构',
  `userid` int(11) NULL DEFAULT NULL COMMENT '申请转发开通的时候选择的用户ID,用户已经申请转发开通之后,不能再进行申请',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_depId`(`depid`) USING BTREE,
  UNIQUE INDEX `uni_userId`(`userid`) USING BTREE,
  INDEX `que_userId`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报警转发申请开通表,用于存放公司名和topic' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmgranteruserlim
-- ----------------------------
DROP TABLE IF EXISTS `alarmgranteruserlim`;
CREATE TABLE `alarmgranteruserlim`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configId` int(11) NULL DEFAULT NULL COMMENT '转发配置表的主键',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报警转发规则的授权用户可见性配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmingtrend
-- ----------------------------
DROP TABLE IF EXISTS `alarmingtrend`;
CREATE TABLE `alarmingtrend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间，年月',
  `co` decimal(15, 0) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vehicleId`(`vehicleId`) USING BTREE,
  INDEX `time`(`time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33791 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '看板中报警趋势中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for alarmrecord
-- ----------------------------
DROP TABLE IF EXISTS `alarmrecord`;
CREATE TABLE `alarmrecord`  (
  `alarmId` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `gas1` double NOT NULL,
  `gas2` double NOT NULL,
  `latitude` double NOT NULL,
  `latitude1` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `longitude1` double NOT NULL,
  `mileage1` double NOT NULL,
  `mileage2` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `processed` int(11) NOT NULL,
  `processedTime` datetime(0) NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `station` bigint(20) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeSpan` double NOT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `velocity` double NOT NULL,
  `videoFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`alarmId`) USING BTREE,
  UNIQUE INDEX `alarmId`(`alarmId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1284025 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for app_qrcode_img
-- ----------------------------
DROP TABLE IF EXISTS `app_qrcode_img`;
CREATE TABLE `app_qrcode_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ios_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ios二维码图片',
  `android_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '安卓二维码图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attachmentservermanagement
-- ----------------------------
DROP TABLE IF EXISTS `attachmentservermanagement`;
CREATE TABLE `attachmentservermanagement`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警附件服务器的名称',
  `fileServerIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警附件服务器IP地址',
  `fileServerTcpPort` int(11) NULL DEFAULT NULL COMMENT '报警附件服务器Tcp端口',
  `fileServerUdpPort` int(11) NULL DEFAULT NULL COMMENT '报警附件服务器Udp端口',
  `adasAlarmAttachmentFilePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警附件目录',
  `fileHttpUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警附件HttpUrl地址',
  `lastCheckTime` datetime(0) NULL DEFAULT NULL COMMENT '确认服务在线的心跳',
  `lastCheckServer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务标识',
  `isUploadOss` int(2) NULL DEFAULT 0 COMMENT '是否要上传到OSS(0否，1是)',
  `endpoint` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'OSS连接区域地址',
  `bucketName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'OSS需要存储的bucketName',
  `accessKeyId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'OSS连接keyId',
  `accessKeySecret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'OSS连接秘钥',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'OSS文件保存路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '附件服务管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auto_alarm_config
-- ----------------------------
DROP TABLE IF EXISTS `auto_alarm_config`;
CREATE TABLE `auto_alarm_config`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `alarmType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警类型',
  `expression` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表达式\r\n触发依据(1-持续报警时间、2-累计报警次数、3-报警解除) \r\n单位 次数/时间/(单位:秒) \r\n触发条件关系(1-再过、2-并且、3-或者)\r\n触发动作 1,2,3.........\r\n代表触发次数 单次1/循环2\r\n; 代表条件动作分隔符  t1-2;&2;t2-3;d1,2,3;m1\r\nt 代表触发条件标识  如 t1-2表示 条件累计时长2分钟\r\n& 代表条件内部连接符(并且/或) t1-2;&2;t2-3 表示 条件累计时长2分钟并且累计次数3次\r\nd 代表动作 发送kafka通知 t1-2;&2;t2-3;d1 满足条件后触发动作1\r\n, 代表并列动作 d1,2,3 代表同时触发动作1,2,3\r\nm 代表触发次数 循环/单次 t1-2;&2;t2-3;d1,2,3;m1 满足条件后触发动作1单次\r\n# 代表事件链接符(过后/或) 一个条件动作触发(过后/或者)另一个条件动作触发 \r\n如t1,2;&2;t2,3;d1,2,3;m1;#1;t2,2;&3;t1,5;d1,2,3;m1',
  `createDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `createStaff` bigint(11) NULL DEFAULT 0 COMMENT '创建人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updateStaff` bigint(11) NULL DEFAULT 0 COMMENT '更新人',
  `status` int(4) NULL DEFAULT 1 COMMENT '状态(1启用，2禁用，3删除）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auto_alarm_configbydep
-- ----------------------------
DROP TABLE IF EXISTS `auto_alarm_configbydep`;
CREATE TABLE `auto_alarm_configbydep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `autoalarmId` bigint(20) NULL DEFAULT NULL COMMENT '自动化报警配置id',
  `depId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniqueautoalarmidbydepid`(`autoalarmId`, `depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auto_alarm_configbyvehicle
-- ----------------------------
DROP TABLE IF EXISTS `auto_alarm_configbyvehicle`;
CREATE TABLE `auto_alarm_configbyvehicle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `autoalarmId` bigint(20) NULL DEFAULT NULL COMMENT '自动化报警配置id',
  `vehicleId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆主键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_autoalarmId`(`autoalarmId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for autoplatformconfig
-- ----------------------------
DROP TABLE IF EXISTS `autoplatformconfig`;
CREATE TABLE `autoplatformconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL COMMENT '创建用户id',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `isuse` int(11) NULL DEFAULT NULL COMMENT '是否启用，0，未启用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for autovoice
-- ----------------------------
DROP TABLE IF EXISTS `autovoice`;
CREATE TABLE `autovoice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `startTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效时段-开始时段',
  `endTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效时段-结束时段',
  `isuse` bit(1) NULL DEFAULT NULL COMMENT '是否启用，0不启用，1启用',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `userId` int(11) NULL DEFAULT NULL COMMENT '创建用户的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '语音自动播报配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for autovoicebydep
-- ----------------------------
DROP TABLE IF EXISTS `autovoicebydep`;
CREATE TABLE `autovoicebydep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `autovoiceId` int(11) NULL DEFAULT NULL COMMENT '语音播放配置id',
  `depId` int(11) NULL DEFAULT NULL COMMENT '绑定机构的id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '语音播报和机构权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for autovoicebyvehicle
-- ----------------------------
DROP TABLE IF EXISTS `autovoicebyvehicle`;
CREATE TABLE `autovoicebyvehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `autovoiceId` int(11) NULL DEFAULT NULL COMMENT '语音播放配置主键',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 723 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '语音播报和车辆权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for autovoiceconfig
-- ----------------------------
DROP TABLE IF EXISTS `autovoiceconfig`;
CREATE TABLE `autovoiceconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(11) NULL DEFAULT NULL COMMENT '选择类型，1、ACC开之后立即、2、ACC开之后等待',
  `sendInterval` int(11) NULL DEFAULT NULL COMMENT '发送间隔（单位:分钟），只有选择type=2的类型的时候才有这个时间间隔',
  `sendContent` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语音播报内容',
  `autovoiceId` int(11) NULL DEFAULT NULL COMMENT '主配置表主键',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '语音播报设置中的配置项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for basicdata
-- ----------------------------
DROP TABLE IF EXISTS `basicdata`;
CREATE TABLE `basicdata`  (
  `baseId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `meta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` int(11) NOT NULL DEFAULT 0,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`baseId`) USING BTREE,
  UNIQUE INDEX `baseId`(`baseId`) USING BTREE,
  INDEX `code`(`code`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6447 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bigscreen
-- ----------------------------
DROP TABLE IF EXISTS `bigscreen`;
CREATE TABLE `bigscreen`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `keyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `value` mediumblob NULL COMMENT 'json值',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_tagkey`(`tag`, `keyname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bigscreen_log
-- ----------------------------
DROP TABLE IF EXISTS `bigscreen_log`;
CREATE TABLE `bigscreen_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `keyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `value` mediumblob NULL COMMENT 'json值',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_tagkey`(`tag`, `keyname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bsjparam
-- ----------------------------
DROP TABLE IF EXISTS `bsjparam`;
CREATE TABLE `bsjparam`  (
  `id` int(13) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SimNo 号',
  `type` int(2) NULL DEFAULT NULL COMMENT '参数类型 1.回传时间',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设置的参数值 主要用于前端回显',
  `sourceValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送给设备的源码 用于辅助确认生效',
  `status` int(13) NULL DEFAULT NULL COMMENT '标志 0.未确认 1.生效',
  `cmdId` int(13) NULL DEFAULT NULL COMMENT '指令ID',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bsjvehicleext
-- ----------------------------
DROP TABLE IF EXISTS `bsjvehicleext`;
CREATE TABLE `bsjvehicleext`  (
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'simNo',
  `electric` decimal(5, 1) NULL DEFAULT NULL COMMENT '电量',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`simNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for car_alarm
-- ----------------------------
DROP TABLE IF EXISTS `car_alarm`;
CREATE TABLE `car_alarm`  (
  `id` bigint(18) NOT NULL COMMENT '本记录id',
  `archiveId` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '档案号',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件字段',
  `collectTime` bigint(18) NOT NULL COMMENT '数据采集时间',
  `firstDiscoverTime` bigint(18) NOT NULL COMMENT '数据首次发现时间',
  `lastDiscoverTime` bigint(18) NOT NULL COMMENT '数据末次发现时间',
  `deivceDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备描述',
  `deviceID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备ID',
  `deviceType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备类型',
  `laneNumber` int(11) NULL DEFAULT NULL COMMENT '车道号',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置信息',
  `receivedTime` bigint(18) NOT NULL COMMENT '数据接收时间',
  `sectionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '断面名称',
  `direction` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '断面方向',
  `source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源',
  `vehiclePlateNum` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车牌号',
  `vehicleType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车型',
  `vehicleUserType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆使用类型',
  `licenceType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号牌种类',
  `confidence` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可信度',
  `eid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子证号',
  `cardId` bigint(18) NULL DEFAULT NULL COMMENT '卡号',
  `carryCapacity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核定载客/总质量',
  `displacement` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排量',
  `examineExpireDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检验有效期',
  `factoryDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出厂日期',
  `forceScrapDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '强制报废期',
  `powerRating` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功率',
  `vehicleColor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车身颜色',
  `tid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签id',
  `protocol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carpersoninfo
-- ----------------------------
DROP TABLE IF EXISTS `carpersoninfo`;
CREATE TABLE `carpersoninfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NULL DEFAULT NULL,
  `maindriverId` int(11) NULL DEFAULT NULL COMMENT '主驾驶员主键',
  `fudriverId` int(11) NULL DEFAULT NULL COMMENT '副驾驶员主键',
  `monitordriverId` int(11) NULL DEFAULT NULL COMMENT '押运员主键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unique_vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 279 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆的人员信息部分' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carpolicyinfo
-- ----------------------------
DROP TABLE IF EXISTS `carpolicyinfo`;
CREATE TABLE `carpolicyinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NOT NULL COMMENT '车辆主键',
  `lastcompany` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上期保险公司',
  `lastefftime` datetime(0) NULL DEFAULT NULL COMMENT '上期保险生效时间',
  `jiaoinsurancemoney` decimal(13, 2) NULL DEFAULT NULL COMMENT '交强险保费',
  `businsurancemoney` decimal(13, 2) NULL DEFAULT NULL COMMENT '商业险保费',
  `suminsurancemoney` decimal(13, 2) NULL DEFAULT NULL COMMENT '保费总额',
  `createDate` datetime(0) NOT NULL COMMENT '创建时间',
  `insuranceBuyer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保人',
  `insuranceAnnualMoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保险种年缴费',
  `attachmentUrls` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '附件图片：行驶证运输证保单车身（侧，斜，车载设备）等照片上传地址，以\';\'间隔',
  `insuranceEndfTime` datetime(0) NULL DEFAULT NULL COMMENT '上期保险结束时间',
  `insuranceType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投保险种',
  `usingNature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用性质',
  `fullertoncard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '福路通卡号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniquevehicleId`(`vehicleId`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1040 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆保单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for checkrecord
-- ----------------------------
DROP TABLE IF EXISTS `checkrecord`;
CREATE TABLE `checkrecord`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `infoId` int(11) NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `objId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `objType` int(11) NOT NULL,
  `platformId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `objName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卫星定位服务商或业户的企业全称',
  `answerDate` datetime(0) NULL DEFAULT NULL COMMENT '应答时间',
  `ackUserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查岗应答人姓名',
  `ackUserPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查岗应答人联系电话',
  `govIp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID`(`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for connection_alert_contents
-- ----------------------------
DROP TABLE IF EXISTS `connection_alert_contents`;
CREATE TABLE `connection_alert_contents`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connection_id` int(11) NOT NULL DEFAULT 0,
  `alert_content_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `is_open` tinyint(1) NULL DEFAULT 1,
  `is_read` tinyint(1) NULL DEFAULT 0,
  `end_time` timestamp(0) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `current_threshold_value` int(11) NULL DEFAULT 0,
  `severity` int(11) NULL DEFAULT 1,
  `manual_close_time` timestamp(0) NULL DEFAULT NULL,
  `current_return_value` double NULL DEFAULT 0,
  `current_alert_direction` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_alert_content_id`(`alert_content_id`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_connection_id_alert_content_id`(`connection_id`, `alert_content_id`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_created_at`(`created_at`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_end_time_connection_id`(`end_time`, `connection_id`) USING BTREE,
  INDEX `idx_alert_contents_on_is_open_connection_id_severity_created_at`(`is_open`, `connection_id`, `severity`, `created_at`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_is_open_created_at`(`is_open`, `created_at`) USING BTREE,
  INDEX `idx_alert_contents_on_is_open_connection_id_created_at`(`is_open`, `connection_id`, `created_at`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_is_open_user_id`(`is_open`, `user_id`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_user_id`(`user_id`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_is_open_severity_created_at`(`is_open`, `severity`, `created_at`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_is_read_is_open`(`is_read`, `is_open`) USING BTREE,
  INDEX `idx_connection_alert_contents_on_is_open_alert_content_id`(`is_open`, `alert_content_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for connection_alert_settings
-- ----------------------------
DROP TABLE IF EXISTS `connection_alert_settings`;
CREATE TABLE `connection_alert_settings`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `connection_id` int(11) NOT NULL,
  `alert_inherit_parent` tinyint(1) NOT NULL DEFAULT 0,
  `alert_type` int(11) NOT NULL DEFAULT 0,
  `alert_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_direction` tinyint(1) NOT NULL DEFAULT 0,
  `alert_warn_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_warn_threshold` int(11) NOT NULL DEFAULT 0,
  `alert_critical_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_critical_threshold` int(11) NOT NULL DEFAULT 0,
  `alert_length_minute` int(11) NOT NULL DEFAULT 0,
  `alert_sent_when_raise` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_when_end` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_via_email` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_via_sms` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_via_snmp` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_to_user_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_to_all` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_to_roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `alert_sent_alternative_email` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_to_emails` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alert_sent_via_slack` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_connection_alert_settings_on_connection_id__alert_type`(`connection_id`, `alert_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for connection_groups
-- ----------------------------
DROP TABLE IF EXISTS `connection_groups`;
CREATE TABLE `connection_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_group_name`(`group_name`) USING BTREE,
  UNIQUE INDEX `idx_connection_groups_on_group_name`(`group_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for connections
-- ----------------------------
DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `conn_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'localhost',
  `conn_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `conn_state` tinyint(1) NOT NULL DEFAULT 1,
  `conn_port` int(11) NOT NULL DEFAULT 0,
  `conn_encrypted_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `conn_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `connection_group_id` int(11) NOT NULL,
  `conn_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `os_family` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `conn_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gateway_is_ssh` tinyint(1) NOT NULL DEFAULT 0,
  `gateway_ssh_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gateway_ssh_port` int(11) NOT NULL,
  `gateway_ssh_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gateway_ssh_auth_method` int(11) NOT NULL DEFAULT 1,
  `gateway_ssh_encrypted_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gateway_ssh_private_key_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gateway_ssh_encrypted_passphrase` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cpu_is_ssh` tinyint(1) NOT NULL DEFAULT 0,
  `cpu_ssh_port` int(11) NOT NULL,
  `cpu_ssh_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cpu_ssh_auth_method` int(11) NOT NULL DEFAULT 1,
  `cpu_ssh_encrypted_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cpu_ssh_private_key_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cpu_ssh_encrypted_passphrase` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cpu_community` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `suspend_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_connections_on_conn_name`(`conn_name`) USING BTREE,
  INDEX `idx_connection_on_conn_ip`(`conn_ip`) USING BTREE,
  INDEX `idx_connection_on_connection_group_id`(`connection_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for conversion
-- ----------------------------
DROP TABLE IF EXISTS `conversion`;
CREATE TABLE `conversion`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转换类型 ‘plateNo’ 车牌号',
  `obj` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原对象',
  `cobj` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转换后对象',
  `deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for database_performances
-- ----------------------------
DROP TABLE IF EXISTS `database_performances`;
CREATE TABLE `database_performances`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `conn_num` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `max_conn_num` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `query_rate` double NOT NULL DEFAULT 0,
  `bytes_received_rate` double NOT NULL DEFAULT 0,
  `bytes_sent_rate` double NOT NULL DEFAULT 0,
  `qcache_hits_rate` double NOT NULL DEFAULT 0,
  `com_select_rate` double NOT NULL DEFAULT 0,
  `com_insert_rate` double NOT NULL DEFAULT 0,
  `com_update_rate` double NOT NULL DEFAULT 0,
  `com_delete_rate` double NOT NULL DEFAULT 0,
  `read_query_rate` double NOT NULL DEFAULT 0,
  `write_query_rate` double NOT NULL DEFAULT 0,
  `table_num` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `table_rows_num` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `db_data_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `db_idx_size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_db_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `db_idxfrac_size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `select_scan_rate` double NOT NULL DEFAULT 0,
  `select_full_join_rate` double NOT NULL DEFAULT 0,
  `innodb_buf_pool_size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `innodb_buf_pool_free` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `innodb_buf_cache_hit` double NOT NULL DEFAULT 0,
  `query_cache_hit` double NOT NULL DEFAULT 0,
  `myisam_key_cache_hit` double NOT NULL DEFAULT 0,
  `thread_cache_hit` double NOT NULL DEFAULT 0,
  `conn_running` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `conn_cached` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_open_table_against_table_cache` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `opened_table_rate` double NOT NULL DEFAULT 0,
  `table_locks_immediate_rate` double NOT NULL DEFAULT 0,
  `table_locks_waited_rate` double NOT NULL DEFAULT 0,
  `table_lock_wait_ratio` double NOT NULL DEFAULT 0,
  `conn_attempt_rate` double NOT NULL DEFAULT 0,
  `conn_aborted_rate` double NOT NULL DEFAULT 0,
  `client_aborted_rate` double NOT NULL DEFAULT 0,
  `highest_concurrent_conn` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_of_max_reached_conn` double NOT NULL DEFAULT 0,
  `percent_of_refused_conn` double NOT NULL DEFAULT 0,
  `num_of_slow_launch_threads` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_of_innodb_cache_write_wait` double NOT NULL DEFAULT 0,
  `innodb_log_buffer_size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `percent_of_innodb_log_wait_required` double NOT NULL DEFAULT 0,
  `percent_of_full_table_scan` double NOT NULL DEFAULT 0,
  `created_tmp_tables_rate` double NOT NULL DEFAULT 0,
  `created_tmp_disk_tables_rate` double NOT NULL DEFAULT 0,
  `created_tmp_disk_ratio` double NOT NULL DEFAULT 0,
  `innodb_rows_deleted_rate` double NOT NULL DEFAULT 0,
  `innodb_rows_inserted_rate` double NOT NULL DEFAULT 0,
  `innodb_rows_read_rate` double NOT NULL DEFAULT 0,
  `innodb_rows_updated_rate` double NOT NULL DEFAULT 0,
  `innodb_row_lock_current_waits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `innodb_row_lock_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `innodb_row_lock_time_avg` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `innodb_row_lock_time_max` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `innodb_data_reads_rate` double NOT NULL DEFAULT 0,
  `innodb_data_writes_rate` double NOT NULL DEFAULT 0,
  `com_begin_rate` double NOT NULL DEFAULT 0,
  `com_commit_rate` double NOT NULL DEFAULT 0,
  `com_rollback_rate` double NOT NULL DEFAULT 0,
  `sort_merge_passes_rate` double NOT NULL DEFAULT 0,
  `sort_range_rate` double NOT NULL DEFAULT 0,
  `sort_scan_rate` double NOT NULL DEFAULT 0,
  `sort_rows_rate` double NOT NULL DEFAULT 0,
  `binlog_cache_use_rate` double NOT NULL DEFAULT 0,
  `binlog_cache_disk_use_rate` double NOT NULL DEFAULT 0,
  `total_rows_returned` double NOT NULL DEFAULT 0,
  `total_rows_returned_use_index` double NOT NULL DEFAULT 0,
  `percent_rows_use_index` double NOT NULL DEFAULT 0,
  `percent_pruned_query` double NOT NULL DEFAULT 0,
  `percent_conn_usage` double NOT NULL DEFAULT 0,
  `percent_myisam_cache_usage` double NOT NULL DEFAULT 0,
  `percent_innodb_cache_usage` double NOT NULL DEFAULT 0,
  `slow_query_rate` double NOT NULL DEFAULT 0,
  `innodb_data_fsyncs_rate` double NOT NULL DEFAULT 0,
  `innodb_log_writes_rate` double NOT NULL DEFAULT 0,
  `free_myisam_buffer_size` double NOT NULL DEFAULT 0,
  `key_buffer_size` double NOT NULL DEFAULT 0,
  `percent_of_slow_query` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_database_performances_on_connection_id_created_at`(`connection_id`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deadlocks
-- ----------------------------
DROP TABLE IF EXISTS `deadlocks`;
CREATE TABLE `deadlocks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp(0) NULL DEFAULT NULL,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_deadlocks_on_connection_id_created_at`(`connection_id`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dep_vehicle_ref
-- ----------------------------
DROP TABLE IF EXISTS `dep_vehicle_ref`;
CREATE TABLE `dep_vehicle_ref`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dep_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `vehicle_id` int(11) NULL DEFAULT NULL COMMENT '车辆ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_dep_id`(`dep_id`) USING BTREE,
  INDEX `Index_vehicle_id`(`vehicle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20986 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `depId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `assoMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assoTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businessScope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业户ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `parentId` int(11) NOT NULL COMMENT '上一级ID',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roadPermitNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roadPermitWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `companyId` bigint(20) NOT NULL DEFAULT 0,
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  `iotCardUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '物联网卡url',
  PRIMARY KEY (`depId`) USING BTREE,
  UNIQUE INDEX `depId`(`depId`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE,
  INDEX `region`(`region`) USING BTREE,
  INDEX `memNo`(`memNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117446351 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department_copy1
-- ----------------------------
DROP TABLE IF EXISTS `department_copy1`;
CREATE TABLE `department_copy1`  (
  `depId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `assoMan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assoTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businessScope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业户ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `parentId` int(11) NOT NULL COMMENT '上一级ID',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roadPermitNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roadPermitWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `companyId` bigint(20) NOT NULL DEFAULT 0,
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  `iotCardUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '物联网卡url',
  PRIMARY KEY (`depId`) USING BTREE,
  UNIQUE INDEX `depId`(`depId`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE,
  INDEX `region`(`region`) USING BTREE,
  INDEX `memNo`(`memNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117446302 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deptitle
-- ----------------------------
DROP TABLE IF EXISTS `deptitle`;
CREATE TABLE `deptitle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `depId` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for developerbyinterface
-- ----------------------------
DROP TABLE IF EXISTS `developerbyinterface`;
CREATE TABLE `developerbyinterface`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `developerid` int(11) NULL DEFAULT NULL COMMENT '开发者管理主键',
  `interfaceid` int(11) NULL DEFAULT NULL COMMENT '接口主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开发者接口关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for developermanagement
-- ----------------------------
DROP TABLE IF EXISTS `developermanagement`;
CREATE TABLE `developermanagement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `applateid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发者id',
  `secretkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发者密钥',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `isapproval` bit(1) NULL DEFAULT NULL COMMENT '是否审批通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开发者管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for download_task
-- ----------------------------
DROP TABLE IF EXISTS `download_task`;
CREATE TABLE `download_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导出文件名',
  `status` int(2) NULL DEFAULT 2 COMMENT '下载状态 0正在导出 1导出成功 2导出失败 ',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '删除标志',
  `createStaff` bigint(11) NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_attendance
-- ----------------------------
DROP TABLE IF EXISTS `driver_attendance`;
CREATE TABLE `driver_attendance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `person_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员人脸库ID',
  `vehicle_id` int(11) NOT NULL COMMENT '车辆ID',
  `imei` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IMEI',
  `acc_on_time` datetime(0) NOT NULL COMMENT '驾驶员上车时间',
  `acc_off_time` datetime(0) NULL DEFAULT NULL COMMENT '驾驶员下车时间',
  `compare_id` int(11) NULL DEFAULT NULL COMMENT '人脸比对ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '驾驶员考勤管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_command_response
-- ----------------------------
DROP TABLE IF EXISTS `driver_command_response`;
CREATE TABLE `driver_command_response`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '指令编码',
  `cmdType` int(11) NULL DEFAULT NULL COMMENT '指令类型',
  `subCmdType` int(10) NULL DEFAULT 0 COMMENT '子指令类型',
  `cmdData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '发送数据',
  `cmdId` int(11) NULL DEFAULT NULL COMMENT '指令ID',
  `response` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应答数据',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '应答状态:0未执行,1处理中2:执行成功',
  `simNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sim号',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆ID',
  `createDate` timestamp(0) NULL DEFAULT NULL,
  `updateDate` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cmdId`(`cmdId`) USING BTREE,
  INDEX `vehicleId`(`vehicleId`) USING BTREE,
  INDEX `cmd`(`cmd`) USING BTREE,
  INDEX `simNo`(`simNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1726 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '驾驶员指令应答表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_face_compare
-- ----------------------------
DROP TABLE IF EXISTS `driver_face_compare`;
CREATE TABLE `driver_face_compare`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `time` datetime(0) NOT NULL COMMENT '比对时间',
  `result` bit(1) NOT NULL COMMENT '比对结果（0失败，1成功）',
  `confidence` double(10, 6) NULL DEFAULT NULL COMMENT '可信度',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `person_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员人脸库ID',
  `vehicle_id` int(11) NULL DEFAULT NULL COMMENT '车辆ID',
  `imei` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IMEI',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '驾驶员人脸比对' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_has_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `driver_has_vehicle`;
CREATE TABLE `driver_has_vehicle`  (
  `vehicle_id` int(11) UNSIGNED NOT NULL COMMENT '车辆ID',
  `drvier_id` int(11) UNSIGNED NOT NULL COMMENT '驾驶员ID',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`vehicle_id`, `drvier_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '驾驶员车辆关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_info_manage
-- ----------------------------
DROP TABLE IF EXISTS `driver_info_manage`;
CREATE TABLE `driver_info_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '驾驶员姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系方式',
  `driver_licence` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '驾驶证',
  `practising_certificate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '从业资格证书',
  `face_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '人脸ID',
  `deleted` tinyint(3) NULL DEFAULT 0 COMMENT '是否删除0：未删除1：删除',
  `createDate` timestamp(0) NULL DEFAULT NULL,
  `updateDate` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10075 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '驾驶员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_manage
-- ----------------------------
DROP TABLE IF EXISTS `driver_manage`;
CREATE TABLE `driver_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '驾驶员姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `driver_licence` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '驾驶证',
  `practising_certificate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '从业资格证书',
  `img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '驾驶员照片',
  `person_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员ID',
  `face_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人脸ID',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '驾驶员管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driver_match_dept
-- ----------------------------
DROP TABLE IF EXISTS `driver_match_dept`;
CREATE TABLE `driver_match_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `driver_id` int(11) NOT NULL COMMENT '驾驶员ID',
  `dept_id` int(11) NOT NULL COMMENT '机构ID',
  `vehicle_id` int(11) NULL DEFAULT NULL COMMENT '车辆ID',
  `imei` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IMEI',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '驾驶员与部门匹配表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for drivercardrecord
-- ----------------------------
DROP TABLE IF EXISTS `drivercardrecord`;
CREATE TABLE `drivercardrecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agencyName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 发证机构名称   ',
  `cardState` int(11) NOT NULL COMMENT '//1 插入 2 拔出',
  `certificationCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 从业资格证编码 长度20',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `driverName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 驾驶员姓名  ',
  `operTime` datetime(0) NULL DEFAULT NULL COMMENT ' //插卡或拔卡时间 在状态为1时有效 YYMMDDHHmmss',
  `readResult` int(11) NOT NULL COMMENT '读卡结果，0成功; 0x01：读卡失败，原因为卡片密钥认证未通过；0x02：读卡失败，原因为卡片已被锁定； 0x03：读卡失败，原因为卡片被拔出； 0x04：读卡失败，原因为数据校验错误。 ',
  `validateDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期 YYYYMMDD  ',
  `vehicleId` int(11) NOT NULL,
  `isvalid` int(11) NULL DEFAULT 0 COMMENT '0,、有效，1、无效(这里指的是，司机姓名或者资格证是否是乱码，或者为空，或者资格证是相同数字)',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE,
  INDEX `vehicleId`(`vehicleId`) USING BTREE,
  INDEX `index_driverName`(`driverName`) USING BTREE,
  INDEX `index_certificationCode`(`certificationCode`) USING BTREE,
  INDEX `index_operTime`(`operTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70723 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '司机打卡考勤表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for drivercardrecordonly
-- ----------------------------
DROP TABLE IF EXISTS `drivercardrecordonly`;
CREATE TABLE `drivercardrecordonly`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agencyName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 发证机构名称   ',
  `cardState` int(11) NOT NULL COMMENT '//1 插入 2 拔出',
  `certificationCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 从业资格证编码 长度20',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `driverName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 驾驶员姓名  ',
  `operTime` datetime(0) NULL DEFAULT NULL COMMENT ' //插卡或拔卡时间 在状态为1时有效 YYMMDDHHmmss',
  `readResult` int(11) NOT NULL COMMENT '读卡结果，0成功; 0x01：读卡失败，原因为卡片密钥认证未通过；0x02：读卡失败，原因为卡片已被锁定； 0x03：读卡失败，原因为卡片被拔出； 0x04：读卡失败，原因为数据校验错误。 ',
  `validateDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件有效期 YYYYMMDD  ',
  `vehicleId` int(11) NOT NULL COMMENT '车辆主键',
  `isvalid` int(11) NULL DEFAULT 0 COMMENT '0,、有效，1、无效(这里指的是，司机姓名或者资格证是否是乱码，或者为空，或者资格证是相同数字)',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `vehicleId`(`vehicleId`) USING BTREE,
  INDEX `index_driverName`(`driverName`) USING BTREE,
  INDEX `index_certificationCode`(`certificationCode`) USING BTREE,
  INDEX `index_operTime`(`operTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50455 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '司机打卡考勤表,车辆主键唯一性约束' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driverinfo
-- ----------------------------
DROP TABLE IF EXISTS `driverinfo`;
CREATE TABLE `driverinfo`  (
  `driverId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从业资格类别',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细住址',
  `birthday` datetime(0) NULL DEFAULT NULL,
  `certificationDate` datetime(0) NULL DEFAULT NULL,
  `companyNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员编号',
  `driverLicence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从业资格证，驾驶证',
  `driverName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `drivingType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶车辆类型',
  `examineYear` datetime(0) NULL DEFAULT NULL,
  `harnessesAge` smallint(6) NULL DEFAULT NULL,
  `identityCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invalidDate` datetime(0) NULL DEFAULT NULL,
  `licenseAgency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobilePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monitorOrg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monitorPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `mainDriver` bit(1) NULL DEFAULT NULL COMMENT '是否主驾驶',
  `monitor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '押运员',
  `companyId` int(11) NULL DEFAULT 0,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `driverImgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '司机图片路径',
  `isvalid` int(11) NULL DEFAULT 0 COMMENT '0,、有效，1、无效(这里指的是，司机姓名或者资格证是否是乱码，或者为空，或者资格证是相同数字)',
  PRIMARY KEY (`driverId`) USING BTREE,
  UNIQUE INDEX `driverId`(`driverId`) USING BTREE,
  INDEX `index_drivername`(`driverName`) USING BTREE,
  INDEX `index_driverLicence`(`driverLicence`) USING BTREE,
  INDEX `vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10075 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '驾驶员车辆关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driverinfo2
-- ----------------------------
DROP TABLE IF EXISTS `driverinfo2`;
CREATE TABLE `driverinfo2`  (
  `driverId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `certificationDate` datetime(0) NULL DEFAULT NULL,
  `companyNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverLicence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `drivingType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examineYear` datetime(0) NULL DEFAULT NULL,
  `harnessesAge` smallint(6) NULL DEFAULT NULL,
  `identityCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invalidDate` datetime(0) NULL DEFAULT NULL,
  `licenseAgency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobilePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monitorOrg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monitorPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `mainDriver` bit(1) NULL DEFAULT NULL,
  `monitor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `driverImgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '司机图片路径',
  PRIMARY KEY (`driverId`) USING BTREE,
  UNIQUE INDEX `driverId`(`driverId`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driverinfo_copy
-- ----------------------------
DROP TABLE IF EXISTS `driverinfo_copy`;
CREATE TABLE `driverinfo_copy`  (
  `driverId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `certificationDate` datetime(0) NULL DEFAULT NULL,
  `companyNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶员编号',
  `driverLicence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从业资格证，驾驶证',
  `driverName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `drivingType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶车辆类型',
  `examineYear` datetime(0) NULL DEFAULT NULL,
  `harnessesAge` smallint(6) NULL DEFAULT NULL,
  `identityCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invalidDate` datetime(0) NULL DEFAULT NULL,
  `licenseAgency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobilePhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monitorOrg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monitorPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `mainDriver` bit(1) NULL DEFAULT NULL COMMENT '是否主驾驶',
  `monitor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '押运员',
  `companyId` int(11) NULL DEFAULT 0,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `driverImgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '司机图片路径',
  PRIMARY KEY (`driverId`) USING BTREE,
  UNIQUE INDEX `driverId`(`driverId`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9759 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '驾驶员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driverselfcheck
-- ----------------------------
DROP TABLE IF EXISTS `driverselfcheck`;
CREATE TABLE `driverselfcheck`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `personId` int(11) NULL DEFAULT NULL COMMENT '人员表主键，personmanagebydep这张表的Id，因为司机和机构是多对多',
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证号',
  `driverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '自检时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '车辆状态、0、正常，1、故障',
  `failcause` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '故障原因',
  `failphote` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障照片，用;号隔开，可上传多张照片',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '位置',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `roundstate` int(11) NULL DEFAULT NULL COMMENT '环车检查、0、正常，1、故障',
  `panelstate` int(11) NULL DEFAULT NULL COMMENT '仪表盘检查,0,正常,1故障',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE COMMENT '车辆主键索引',
  INDEX `index_personId`(`personId`) USING BTREE COMMENT '人员主键索引',
  INDEX `Uni_vehicleandpersonId`(`vehicleId`, `personId`) USING BTREE,
  INDEX `index_createDate`(`createDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '司机车辆自检情况表，车辆和司机是唯一的，每个司机和车辆只有一条' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for driverselfcheckinfo
-- ----------------------------
DROP TABLE IF EXISTS `driverselfcheckinfo`;
CREATE TABLE `driverselfcheckinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `personId` int(11) NULL DEFAULT NULL COMMENT '人员表主键，personmanagebydep这张表的Id，因为司机和机构是多对多',
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证号',
  `driverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '司机姓名',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '自检时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '车辆状态、0、正常，1、故障',
  `failcause` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '故障原因',
  `failphote` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障照片，用;号隔开，可上传多张照片',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '位置',
  `roundstate` int(11) NULL DEFAULT NULL COMMENT '环车检查、0、正常，1、故障',
  `panelstate` int(11) NULL DEFAULT NULL COMMENT '仪表盘检查,0,正常,1故障',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE COMMENT '车辆主键索引',
  INDEX `index_personId`(`personId`) USING BTREE COMMENT '人员主键索引',
  INDEX `index_createDate`(`createDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '司机车辆自检情况表，车辆和司机不是唯一的，自检一条插入一条' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for error_import
-- ----------------------------
DROP TABLE IF EXISTS `error_import`;
CREATE TABLE `error_import`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorData` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导入失败数据',
  `tableName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '导入时间',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导入失败原因',
  `solve` bit(1) NULL DEFAULT NULL COMMENT '是否已解决',
  `remark` datetime(0) NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3348 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ewaybill
-- ----------------------------
DROP TABLE IF EXISTS `ewaybill`;
CREATE TABLE `ewaybill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '//运单内容',
  `plateColor` int(11) NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`billId`) USING BTREE,
  UNIQUE INDEX `billId`(`billId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电子运单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exlreadrecord
-- ----------------------------
DROP TABLE IF EXISTS `exlreadrecord`;
CREATE TABLE `exlreadrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `successco` int(11) NULL DEFAULT NULL COMMENT '成功数量',
  `failco` int(11) NULL DEFAULT NULL COMMENT '失败数量',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `failpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败文件路径',
  `type` int(255) NULL DEFAULT 0 COMMENT '类型,0对讲exl导出失败记录(暂时没用,)',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提示',
  `filepath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传的exl文件所在地址',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态,1正在解析,2解析完成',
  `owner` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'exl读取失败记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ext_table_desc
-- ----------------------------
DROP TABLE IF EXISTS `ext_table_desc`;
CREATE TABLE `ext_table_desc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coloum_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'double, long, date, varchar',
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for face_images
-- ----------------------------
DROP TABLE IF EXISTS `face_images`;
CREATE TABLE `face_images`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hash` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件 hash',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `origin_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始文件名',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件url',
  `mime_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mime type',
  `filesize` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `width` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '宽度',
  `height` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '高度',
  `createDate` timestamp(0) NULL DEFAULT NULL,
  `updateDate` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `face_images_hash_index`(`hash`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1092 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '人脸库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fatiguedriving_alarm_config
-- ----------------------------
DROP TABLE IF EXISTS `fatiguedriving_alarm_config`;
CREATE TABLE `fatiguedriving_alarm_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `is_fatigue_driving_alarm` tinyint(1) NOT NULL COMMENT '是否启用疲劳驾驶',
  `is_night_fatigue_driving_alarm` tinyint(1) NOT NULL COMMENT '是否启用夜间疲劳驾驶',
  `vehicle_id` bigint(20) NULL DEFAULT NULL COMMENT '车辆Id',
  `driving_time` int(11) NOT NULL COMMENT '驾驶时长',
  `rest_time` int(11) NULL DEFAULT NULL COMMENT '休息时长',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开始时段',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '结束时段',
  `night_driving_time` int(11) NULL DEFAULT NULL COMMENT '夜间驾驶时长',
  `night_rest_time` int(11) NULL DEFAULT NULL COMMENT '夜间休息时长',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_is_fatigue_driving_alarm`(`is_fatigue_driving_alarm`) USING BTREE,
  INDEX `index_is_night_fatigue_driving_alarm`(`is_night_fatigue_driving_alarm`) USING BTREE,
  INDEX `index_vehicle_id`(`vehicle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_store_config
-- ----------------------------
DROP TABLE IF EXISTS `file_store_config`;
CREATE TABLE `file_store_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `httpUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for foreginlog
-- ----------------------------
DROP TABLE IF EXISTS `foreginlog`;
CREATE TABLE `foreginlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用方',
  `doname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求的接口',
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求的参数',
  `createdate` datetime(0) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`, `createdate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对外访问接口日志表' ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS( createDate ))
PARTITIONS 30
(PARTITION `foreginlog202005` VALUES LESS THAN (737942) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202006` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202007` VALUES LESS THAN (738003) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202008` VALUES LESS THAN (738034) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202009` VALUES LESS THAN (738064) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202010` VALUES LESS THAN (738095) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202011` VALUES LESS THAN (738125) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202012` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202101` VALUES LESS THAN (738187) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202102` VALUES LESS THAN (738215) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202103` VALUES LESS THAN (738246) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202104` VALUES LESS THAN (738276) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202105` VALUES LESS THAN (738307) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202106` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202107` VALUES LESS THAN (738368) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202108` VALUES LESS THAN (738399) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202109` VALUES LESS THAN (738429) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202110` VALUES LESS THAN (738460) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202111` VALUES LESS THAN (738490) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202112` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202201` VALUES LESS THAN (738552) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202202` VALUES LESS THAN (738580) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202203` VALUES LESS THAN (738611) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202204` VALUES LESS THAN (738641) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202205` VALUES LESS THAN (738672) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202206` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202207` VALUES LESS THAN (738733) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202208` VALUES LESS THAN (738764) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202209` VALUES LESS THAN (738794) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202210` VALUES LESS THAN (738825) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for foreginlognew
-- ----------------------------
DROP TABLE IF EXISTS `foreginlognew`;
CREATE TABLE `foreginlognew`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用方',
  `doname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求的接口',
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求的参数',
  `createdate` datetime(0) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`, `createdate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 260 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对外访问接口日志表' ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS( createDate ))
PARTITIONS 30
(PARTITION `foreginlog202005` VALUES LESS THAN (737942) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202006` VALUES LESS THAN (737972) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202007` VALUES LESS THAN (738003) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202008` VALUES LESS THAN (738034) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202009` VALUES LESS THAN (738064) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202010` VALUES LESS THAN (738095) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202011` VALUES LESS THAN (738125) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202012` VALUES LESS THAN (738156) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202101` VALUES LESS THAN (738187) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202102` VALUES LESS THAN (738215) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202103` VALUES LESS THAN (738246) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202104` VALUES LESS THAN (738276) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202105` VALUES LESS THAN (738307) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202106` VALUES LESS THAN (738337) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202107` VALUES LESS THAN (738368) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202108` VALUES LESS THAN (738399) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202109` VALUES LESS THAN (738429) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202110` VALUES LESS THAN (738460) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202111` VALUES LESS THAN (738490) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202112` VALUES LESS THAN (738521) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202201` VALUES LESS THAN (738552) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202202` VALUES LESS THAN (738580) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202203` VALUES LESS THAN (738611) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202204` VALUES LESS THAN (738641) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202205` VALUES LESS THAN (738672) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202206` VALUES LESS THAN (738702) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202207` VALUES LESS THAN (738733) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202208` VALUES LESS THAN (738764) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202209` VALUES LESS THAN (738794) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `foreginlog202210` VALUES LESS THAN (738825) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for foreginuser
-- ----------------------------
DROP TABLE IF EXISTS `foreginuser`;
CREATE TABLE `foreginuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appletId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'appletId，用来寻找对应的秘钥key',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外接口提供给的公司方',
  `md5Hexkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应的秘钥',
  `userId` int(11) NULL DEFAULT NULL COMMENT '所绑定的用户id',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对外接口用户id和秘钥配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for forward_rules_config
-- ----------------------------
DROP TABLE IF EXISTS `forward_rules_config`;
CREATE TABLE `forward_rules_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rules` json NULL COMMENT '规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fuelchangerecord
-- ----------------------------
DROP TABLE IF EXISTS `fuelchangerecord`;
CREATE TABLE `fuelchangerecord`  (
  `enclosureId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fuel` double NOT NULL,
  `happenTime` datetime(0) NULL DEFAULT NULL,
  `latitude` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `manual` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mileage` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `ID` bigint(20) NOT NULL,
  PRIMARY KEY (`enclosureId`) USING BTREE,
  UNIQUE INDEX `enclosureId`(`enclosureId`) USING BTREE,
  UNIQUE INDEX `ID`(`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fuelconsumption
-- ----------------------------
DROP TABLE IF EXISTS `fuelconsumption`;
CREATE TABLE `fuelconsumption`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gas` double NOT NULL,
  `gas1` double NOT NULL,
  `gas2` double NOT NULL,
  `hour` double NOT NULL,
  `intervalDescr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intervalType` int(11) NOT NULL,
  `mileage` double NOT NULL,
  `mileage1` double NOT NULL,
  `mileage2` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staticDate` datetime(0) NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID`(`ID`) USING BTREE,
  INDEX `staticDate`(`staticDate`) USING BTREE,
  INDEX `mileage1`(`mileage1`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17015479 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for func_priv
-- ----------------------------
DROP TABLE IF EXISTS `func_priv`;
CREATE TABLE `func_priv`  (
  `func_priv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能权限ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `button_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '按钮类型：如0：新增，1：修改， 2：删除',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能权限名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上一级id',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_staff` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_staff` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1000' COMMENT '状态(1000启用，1100禁用，1200删除）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`func_priv_id`, `menu_id`) USING BTREE,
  UNIQUE INDEX `un_func_priv_id`(`func_priv_id`) USING BTREE,
  INDEX `func_priv_fk`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10098 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限功能管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for func_priv_copy1
-- ----------------------------
DROP TABLE IF EXISTS `func_priv_copy1`;
CREATE TABLE `func_priv_copy1`  (
  `func_priv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能权限ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `button_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '按钮类型：如0：新增，1：修改， 2：删除',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能权限名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上一级id',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_staff` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_staff` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1000' COMMENT '状态(1000启用，1100禁用，1200删除）',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`func_priv_id`, `menu_id`) USING BTREE,
  UNIQUE INDEX `un_func_priv_id`(`func_priv_id`) USING BTREE,
  INDEX `func_priv_fk`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10069 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限功能管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for functionmodel
-- ----------------------------
DROP TABLE IF EXISTS `functionmodel`;
CREATE TABLE `functionmodel`  (
  `funcId` int(11) NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `funcType` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menuSort` int(11) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `iconFont` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operaterType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态(1000:启用，1100：禁用）',
  `openWay` int(11) NULL DEFAULT NULL COMMENT '打开方式(1：vue组件；2：外链)',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`funcId`) USING BTREE,
  UNIQUE INDEX `funcId`(`funcId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for functionmodel_20190717
-- ----------------------------
DROP TABLE IF EXISTS `functionmodel_20190717`;
CREATE TABLE `functionmodel_20190717`  (
  `funcId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `funcType` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menuSort` int(11) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `iconFont` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operaterType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态(1000:启用，1100：禁用）',
  `openWay` int(11) NULL DEFAULT NULL COMMENT '打开方式(1：vue组件；2：外链)',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`funcId`) USING BTREE,
  UNIQUE INDEX `funcId`(`funcId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000924 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for functionmodel_bak
-- ----------------------------
DROP TABLE IF EXISTS `functionmodel_bak`;
CREATE TABLE `functionmodel_bak`  (
  `funcId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `funcType` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menuSort` int(11) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `iconFont` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operaterType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态(1000:启用，1100：禁用）',
  `openWay` int(11) NULL DEFAULT NULL COMMENT '打开方式(1：vue组件；2：外链)',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`funcId`) USING BTREE,
  UNIQUE INDEX `funcId`(`funcId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000966 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for general_settings
-- ----------------------------
DROP TABLE IF EXISTS `general_settings`;
CREATE TABLE `general_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password_min_length` int(11) NULL DEFAULT 6,
  `different_from_username` tinyint(1) NULL DEFAULT 0,
  `include_upper_lower_number` tinyint(1) NULL DEFAULT 0,
  `at_least_one_symbol` tinyint(1) NULL DEFAULT 0,
  `show_24_hour` tinyint(1) NULL DEFAULT 0,
  `ldap_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ldap_port` int(11) NULL DEFAULT NULL,
  `ldap_encryption` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ldap_allow_anonymous` tinyint(1) NULL DEFAULT NULL,
  `ldap_user_search_base` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ldap_auth_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ldap_auth_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ldap_auth_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ldap_user_search_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_port` int(11) NULL DEFAULT NULL,
  `ad_encryption` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_allow_anonymous` tinyint(1) NULL DEFAULT NULL,
  `ad_user_search_base` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_auth_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_auth_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_auth_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_user_search_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_purging_alert_day` int(11) NULL DEFAULT NULL,
  `data_purging_performance_day` int(11) NULL DEFAULT NULL,
  `ldap_password_attr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ldap_digest_mech` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ad_password_attr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ad_digest_mech` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for global_alert_settings
-- ----------------------------
DROP TABLE IF EXISTS `global_alert_settings`;
CREATE TABLE `global_alert_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_type` int(11) NOT NULL DEFAULT 0,
  `alert_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_direction` tinyint(1) NOT NULL DEFAULT 0,
  `alert_warn_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_warn_threshold` int(11) NOT NULL DEFAULT 0,
  `alert_critical_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_critical_threshold` int(11) NOT NULL DEFAULT 0,
  `alert_length_minute` int(11) NOT NULL DEFAULT 0,
  `alert_sent_when_raise` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_when_end` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_via_email` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_via_sms` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_via_snmp` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_to_user_enable` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_to_all` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_to_roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `alert_sent_alternative_email` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_to_emails` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `manager_note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `alert_sent_via_slack` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_global_alert_settings_on_alert_type`(`alert_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for govplatformmsg
-- ----------------------------
DROP TABLE IF EXISTS `govplatformmsg`;
CREATE TABLE `govplatformmsg`  (
  `funcId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenantId` int(11) NOT NULL,
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msgType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  PRIMARY KEY (`funcId`) USING BTREE,
  UNIQUE INDEX `funcId`(`funcId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gps_hisdata.gpscompressisrun
-- ----------------------------
DROP TABLE IF EXISTS `gps_hisdata.gpscompressisrun`;
CREATE TABLE `gps_hisdata.gpscompressisrun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isrun` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'gps初次启动控制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gps_info_transfer
-- ----------------------------
DROP TABLE IF EXISTS `gps_info_transfer`;
CREATE TABLE `gps_info_transfer`  (
  `day` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应所在表格名',
  `transfer_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '迁移条数',
  `is_success` bit(1) NULL DEFAULT NULL COMMENT '是否成功',
  `section_begin` datetime(0) NULL DEFAULT NULL COMMENT '区间开始时间',
  `section_end` datetime(0) NULL DEFAULT NULL COMMENT '区间结束时间',
  `spend_msec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所花费毫秒数',
  `id` bigint(50) NOT NULL COMMENT '主键',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `time_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间字段',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库实体类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpsinfo
-- ----------------------------
DROP TABLE IF EXISTS `gpsinfo`;
CREATE TABLE `gpsinfo`  (
  `gpsId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmState` int(11) NOT NULL,
  `altitude` double NOT NULL,
  `commandId` int(11) NULL DEFAULT 0,
  `direction` int(11) NOT NULL,
  `gas` double NOT NULL,
  `latitude` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `mileage` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recordVelocity` double NULL DEFAULT 0,
  `runStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `valid` bit(1) NOT NULL DEFAULT b'0',
  `velocity` double NOT NULL DEFAULT 0,
  `signal` int(11) NULL DEFAULT NULL,
  `signalState` int(11) NOT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `motorSpeed` double NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `workHour` double NOT NULL,
  `arriveKeyPlaceAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyPlaceAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leaveKeyPlaceAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mapAreaAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `offsetRouteAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overSpeedAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiredLevel` int(11) NOT NULL,
  `unusualDriveBeaviour` smallint(6) NOT NULL,
  `videoAlarm` int(11) NOT NULL,
  `videoCoverAlarmStatus` int(11) NOT NULL,
  `videoLossAlarmStatus` int(11) NOT NULL,
  `videoStorageFaultAlarmStatus` smallint(6) NOT NULL,
  `batteryData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clockWiseRunning` int(11) NOT NULL,
  `overload` int(11) NOT NULL,
  PRIMARY KEY (`gpsId`) USING BTREE,
  UNIQUE INDEX `gpsId`(`gpsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpsmileage
-- ----------------------------
DROP TABLE IF EXISTS `gpsmileage`;
CREATE TABLE `gpsmileage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gasLastComp` double NOT NULL,
  `gasLastDay` double NOT NULL,
  `gasLastHour` double NOT NULL,
  `gasLastMonth` double NOT NULL,
  `lastCompTime` datetime(0) NULL DEFAULT NULL,
  `mileageLastComp` double NOT NULL,
  `mileageLastDay` double NOT NULL,
  `mileageLastHour` double NOT NULL,
  `mileageLastMonth` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303942 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpsrealdata
-- ----------------------------
DROP TABLE IF EXISTS `gpsrealdata`;
CREATE TABLE `gpsrealdata`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `alarmState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `altitude` decimal(10, 2) NOT NULL,
  `depId` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `dvrStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gas` decimal(10, 2) NOT NULL,
  `latitude` decimal(10, 6) NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` decimal(10, 6) NOT NULL,
  `mileage` decimal(10, 2) NOT NULL,
  `online` bit(1) NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recordVelocity` decimal(10, 2) NOT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `valid` bit(1) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  `velocity` decimal(10, 2) NOT NULL,
  `overSpeedAreaId` int(11) NULL DEFAULT NULL,
  `overSpeedAreaType` int(11) NULL DEFAULT NULL,
  `routeAlarmType` int(11) NULL DEFAULT NULL,
  `routeSegmentId` int(11) NULL DEFAULT NULL,
  `runTimeOnRoute` int(11) NULL DEFAULT NULL,
  `onlineDate` datetime(0) NULL DEFAULT NULL,
  `areaAlarm` int(11) NULL DEFAULT NULL,
  `areaId` int(11) NULL DEFAULT NULL,
  `areaType` int(11) NULL DEFAULT NULL,
  `parkingTime` datetime(0) NULL DEFAULT NULL,
  `busDirection` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastStationId` int(11) NULL DEFAULT NULL,
  `signalState` int(11) NOT NULL,
  `tiredAlarmTime` datetime(0) NULL DEFAULT NULL,
  `lastDayMileage` double NOT NULL,
  `arriveKeyPlaceAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leaveKeyPlaceAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mapAreaAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `offsetRouteAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overSpeedAlarm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiredLevel` int(11) NOT NULL,
  `unusualDriveBeaviour` smallint(6) NOT NULL,
  `videoAlarm` int(11) NOT NULL,
  `videoCoverAlarmStatus` int(11) NOT NULL,
  `videoLossAlarmStatus` int(11) NOT NULL,
  `videoStorageFaultAlarmStatus` smallint(6) NOT NULL,
  `accOffTime` datetime(0) NULL DEFAULT NULL,
  `batteryData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clockWiseRunning` int(11) NULL DEFAULT 0,
  `overload` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `id`(`ID`) USING BTREE,
  UNIQUE INDEX `simNo`(`simNo`) USING BTREE,
  INDEX `vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147566974 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpsrealoperatetime
-- ----------------------------
DROP TABLE IF EXISTS `gpsrealoperatetime`;
CREATE TABLE `gpsrealoperatetime`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `durTime` bigint(18) NULL DEFAULT NULL COMMENT '运行时长',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `simNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'simNo卡号',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `cycle` int(255) NULL DEFAULT NULL COMMENT '行程数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80069 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆时长运营表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpsrepair
-- ----------------------------
DROP TABLE IF EXISTS `gpsrepair`;
CREATE TABLE `gpsrepair`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'simNo',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补点时间，年月日',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态：0，未计算1，已计算',
  `co` int(11) NULL DEFAULT NULL COMMENT '补点数量',
  `createDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间,年月日',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38708 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '补点记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpstransfer
-- ----------------------------
DROP TABLE IF EXISTS `gpstransfer`;
CREATE TABLE `gpstransfer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用的转发接口',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `isuse` bit(1) NOT NULL COMMENT '是否启用,0禁用,1启用',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,1代表删除,0代表正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史轨迹转发配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpstransferbydep
-- ----------------------------
DROP TABLE IF EXISTS `gpstransferbydep`;
CREATE TABLE `gpstransferbydep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gpsId` int(11) NULL DEFAULT NULL COMMENT '历史轨迹转发配置id',
  `depId` int(11) NULL DEFAULT NULL COMMENT '绑定机构的id',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,0代表未删除,1代表删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_depId`(`depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 521 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史轨迹转发和机构权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpstransferbyvehicle
-- ----------------------------
DROP TABLE IF EXISTS `gpstransferbyvehicle`;
CREATE TABLE `gpstransferbyvehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gpsId` int(11) NULL DEFAULT NULL COMMENT '历史轨迹转发配置id',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,0代表未删除,1代表删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 694 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '历史轨迹转发和车辆权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpstransferrepairlog
-- ----------------------------
DROP TABLE IF EXISTS `gpstransferrepairlog`;
CREATE TABLE `gpstransferrepairlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `createdate` datetime(0) NOT NULL COMMENT '创建时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '处理结果',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求url',
  `veco` int(11) NULL DEFAULT NULL COMMENT '处理车辆数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史轨迹转发补传日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gpstransferuserlim
-- ----------------------------
DROP TABLE IF EXISTS `gpstransferuserlim`;
CREATE TABLE `gpstransferuserlim`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gpsId` int(11) NULL DEFAULT NULL COMMENT '转发配置表的主键',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '历史轨迹接口转发的授权用户可见性配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_alert_settings
-- ----------------------------
DROP TABLE IF EXISTS `group_alert_settings`;
CREATE TABLE `group_alert_settings`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `connection_group_id` int(11) NOT NULL,
  `alert_inherit_parent` tinyint(1) NOT NULL DEFAULT 0,
  `alert_type` int(11) NOT NULL DEFAULT 0,
  `alert_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_direction` tinyint(1) NOT NULL DEFAULT 0,
  `alert_warn_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_warn_threshold` int(11) NOT NULL DEFAULT 0,
  `alert_critical_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_critical_threshold` int(11) NOT NULL DEFAULT 0,
  `alert_length_minute` int(11) NOT NULL DEFAULT 0,
  `alert_sent_when_raise` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_when_end` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_via_email` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_via_sms` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_via_snmp` tinyint(1) NOT NULL DEFAULT 1,
  `alert_sent_to_user_enable` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_to_all` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_to_roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `alert_sent_alternative_email` tinyint(1) NOT NULL DEFAULT 0,
  `alert_sent_to_emails` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alert_sent_via_slack` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_alert_settings_on_alert_type`(`alert_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hisalarmrecord
-- ----------------------------
DROP TABLE IF EXISTS `hisalarmrecord`;
CREATE TABLE `hisalarmrecord`  (
  `alarmId` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `alarmSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `gas1` double NOT NULL,
  `gas2` double NOT NULL,
  `latitude` double NOT NULL,
  `latitude1` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `longitude1` double NOT NULL,
  `mileage1` double NOT NULL,
  `mileage2` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `processed` int(11) NOT NULL,
  `processedTime` datetime(0) NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `station` bigint(20) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeSpan` double NOT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `velocity` double NOT NULL,
  `videoFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`alarmId`) USING BTREE,
  UNIQUE INDEX `alarmId`(`alarmId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for icinfodata
-- ----------------------------
DROP TABLE IF EXISTS `icinfodata`;
CREATE TABLE `icinfodata`  (
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'simNo',
  `icData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ic数据',
  PRIMARY KEY (`simNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for importrecord
-- ----------------------------
DROP TABLE IF EXISTS `importrecord`;
CREATE TABLE `importrecord`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `createStaff` bigint(11) NULL DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `depId` bigint(11) NULL DEFAULT NULL COMMENT '归属机构',
  `importCount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导入数',
  `successCount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成功数',
  `failCount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败数',
  `originalFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原导入文件名',
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存文件名',
  `failFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存失败文件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 347 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for individuation_logo
-- ----------------------------
DROP TABLE IF EXISTS `individuation_logo`;
CREATE TABLE `individuation_logo`  (
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'logo图片路径',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `create_staff` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_staff` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for industrytype
-- ----------------------------
DROP TABLE IF EXISTS `industrytype`;
CREATE TABLE `industrytype`  (
  `id` int(11) NOT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `code` int(11) NULL DEFAULT NULL,
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_code` int(11) NULL DEFAULT NULL,
  `industry_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for interfaceconfiguration
-- ----------------------------
DROP TABLE IF EXISTS `interfaceconfiguration`;
CREATE TABLE `interfaceconfiguration`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口访问地址',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `isuse` bit(1) NULL DEFAULT NULL COMMENT '是否启用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for iotcard_config
-- ----------------------------
DROP TABLE IF EXISTS `iotcard_config`;
CREATE TABLE `iotcard_config`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `depId` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `iotCardUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后配置url',
  `iotCardDetailUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡详情查看url',
  `iotCardSecurityCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安全码',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `depId`(`depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for j808809log
-- ----------------------------
DROP TABLE IF EXISTS `j808809log`;
CREATE TABLE `j808809log`  (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NULL DEFAULT NULL,
  `channel` int(11) NULL DEFAULT NULL,
  `operationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logId`) USING BTREE,
  INDEX `logdateindex`(`createDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20582 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for j808configbyvehicle
-- ----------------------------
DROP TABLE IF EXISTS `j808configbyvehicle`;
CREATE TABLE `j808configbyvehicle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platformid` bigint(20) NULL DEFAULT NULL COMMENT '平台主键',
  `vehicleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆主键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_platid`(`platformid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for j809configbyvehicle
-- ----------------------------
DROP TABLE IF EXISTS `j809configbyvehicle`;
CREATE TABLE `j809configbyvehicle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platformid` bigint(20) NULL DEFAULT NULL COMMENT '平台主键',
  `vehicleid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆主键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_platid`(`platformid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 732 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '809转发对应的车辆绑定' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for journey_config
-- ----------------------------
DROP TABLE IF EXISTS `journey_config`;
CREATE TABLE `journey_config`  (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `isPross` bit(1) NOT NULL COMMENT '0,里程计算结束，1、运算完成，2、报警计算结束',
  `updateDate_data` datetime(0) NULL DEFAULT NULL COMMENT '数据处理的更新时间',
  `updateDate_report` datetime(0) NULL DEFAULT NULL COMMENT '报表处理的更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 342 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt808809configbydep
-- ----------------------------
DROP TABLE IF EXISTS `jt808809configbydep`;
CREATE TABLE `jt808809configbydep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platformId` bigint(20) NULL DEFAULT NULL COMMENT '平台唯一接入码',
  `depId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构编码',
  `isgov` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存对应的服务。808，809等',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniqueplateformidbydepid`(`platformId`, `depId`, `isgov`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25299 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '809平台和多个机构的配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt808config
-- ----------------------------
DROP TABLE IF EXISTS `jt808config`;
CREATE TABLE `jt808config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platformId` int(11) NOT NULL COMMENT '808平台id',
  `registerNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鉴权码',
  `third808ServerIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链路转发的ip地址',
  `third808ServerPort` int(11) NULL DEFAULT NULL COMMENT '端口号',
  `isdown` bit(1) NULL DEFAULT NULL COMMENT '是否下行',
  `platformname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下级平台名称',
  `isuse` bit(1) NULL DEFAULT NULL COMMENT '是否启用',
  `isfj` bit(1) NULL DEFAULT b'0' COMMENT '是否转发附件',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `platformId`(`platformId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt808configbak
-- ----------------------------
DROP TABLE IF EXISTS `jt808configbak`;
CREATE TABLE `jt808configbak`  (
  `configId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id` int(11) NOT NULL COMMENT '808转发主键',
  `platformId` int(11) NOT NULL COMMENT '808平台id',
  `registerNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '鉴权码',
  `third808ServerIp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链路转发的ip地址',
  `third808ServerPort` int(11) NULL DEFAULT NULL COMMENT '端口号',
  `isdown` bit(1) NULL DEFAULT NULL COMMENT '是否下行',
  `platformname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下级平台名称',
  `isuse` bit(1) NULL DEFAULT NULL COMMENT '是否启用',
  `isfj` bit(1) NULL DEFAULT b'0' COMMENT '是否转发附件',
  PRIMARY KEY (`configId`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `platformId`(`platformId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '808转发配置备份表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt808registerno
-- ----------------------------
DROP TABLE IF EXISTS `jt808registerno`;
CREATE TABLE `jt808registerno`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platformId` int(255) NULL DEFAULT NULL COMMENT '平台id',
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端编号',
  `registerNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鉴权码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2020 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '808鉴权码对照表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt809command
-- ----------------------------
DROP TABLE IF EXISTS `jt809command`;
CREATE TABLE `jt809command`  (
  `cmdId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SN` int(11) NOT NULL,
  `cmd` int(11) NOT NULL,
  `cmdData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateColor` tinyint(4) NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subCmd` int(11) NOT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `createId` int(11) NULL DEFAULT NULL,
  `userId` bigint(20) NULL DEFAULT NULL COMMENT '平台接入码',
  `companyId` int(11) NULL DEFAULT 0,
  `govIp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cmdId`) USING BTREE,
  UNIQUE INDEX `cmdId`(`cmdId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244533 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt809config
-- ----------------------------
DROP TABLE IF EXISTS `jt809config`;
CREATE TABLE `jt809config`  (
  `configId` bigint(20) NOT NULL AUTO_INCREMENT,
  `transferFromDb` bit(1) NULL DEFAULT b'0' COMMENT '从数据库中读取实时数据进行转发',
  `transferByUserId` bit(1) NULL DEFAULT NULL COMMENT '转发实时数据，根据用户帐户分配的车辆进行过滤',
  `loginName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆账号',
  `transferInterval` int(11) NULL DEFAULT 0 COMMENT '转发间隔',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主界面标题',
  `govServerIp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级运管平台Ip',
  `govServerPort` int(11) NULL DEFAULT 0 COMMENT '运管服务器端口',
  `localServerIp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地用于监听从链路的公网Ip地址',
  `localServerPort` int(11) NULL DEFAULT 0 COMMENT '本地服务器监听端口',
  `platformUserId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户账号',
  `platformPassword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户密码',
  `platformId` bigint(20) NULL DEFAULT NULL COMMENT '唯一接入码',
  `platformNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台过检编号',
  `licenseNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业户经营许可证号',
  `encrypt` bit(1) NULL DEFAULT b'0' COMMENT '是否加密',
  `m1` bigint(20) NULL DEFAULT 0 COMMENT '809加密算法中所需指定的三个密钥参数M1',
  `a1` bigint(20) NULL DEFAULT 0 COMMENT '809加密算法中所需指定的三个密钥参数A1',
  `c1` bigint(20) NULL DEFAULT 0 COMMENT '809加密算法中所需指定的三个密钥参数C1',
  `encryptKey` bigint(20) NULL DEFAULT NULL COMMENT '加密键值',
  `subiao809` bit(1) NULL DEFAULT b'0' COMMENT '是否是苏标809标准',
  `transferStatus` bit(1) NULL DEFAULT NULL COMMENT '是否转发',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '809配置简称',
  `linkStatus` bit(1) NULL DEFAULT NULL COMMENT '连接状态',
  `serverCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务编号',
  PRIMARY KEY (`configId`) USING BTREE,
  UNIQUE INDEX `uniplat`(`platformId`, `localServerPort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt809configbak
-- ----------------------------
DROP TABLE IF EXISTS `jt809configbak`;
CREATE TABLE `jt809configbak`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `configId` bigint(20) NOT NULL COMMENT '809配置内容的主键',
  `transferFromDb` bit(1) NULL DEFAULT b'0' COMMENT '从数据库中读取实时数据进行转发',
  `transferByUserId` bit(1) NULL DEFAULT NULL COMMENT '转发实时数据，根据用户帐户分配的车辆进行过滤',
  `loginName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆账号',
  `transferInterval` int(11) NULL DEFAULT 0 COMMENT '转发间隔',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主界面标题',
  `govServerIp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级运管平台Ip',
  `govServerPort` int(11) NULL DEFAULT 0 COMMENT '运管服务器端口',
  `localServerIp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本地用于监听从链路的公网Ip地址',
  `localServerPort` int(11) NULL DEFAULT 0 COMMENT '本地服务器监听端口',
  `platformUserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户账号',
  `platformPassword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户密码',
  `platformId` bigint(20) NULL DEFAULT NULL COMMENT '唯一接入码',
  `platformNo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台过检编号',
  `licenseNo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业户经营许可证号',
  `encrypt` bit(1) NULL DEFAULT b'0' COMMENT '是否加密',
  `m1` bigint(20) NULL DEFAULT 0 COMMENT '809加密算法中所需指定的三个密钥参数M1',
  `a1` bigint(20) NULL DEFAULT 0 COMMENT '809加密算法中所需指定的三个密钥参数A1',
  `c1` bigint(20) NULL DEFAULT 0 COMMENT '809加密算法中所需指定的三个密钥参数C1',
  `encryptKey` bigint(20) NULL DEFAULT NULL COMMENT '加密键值',
  `subiao809` bit(1) NULL DEFAULT b'0' COMMENT '是否是苏标809标准',
  `transferStatus` bit(1) NULL DEFAULT NULL COMMENT '是否转发',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '809配置简称',
  `linkStatus` bit(1) NULL DEFAULT NULL COMMENT '连接状态',
  `serverCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务编号',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `unconfigId`(`configId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 304 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '809转发配置表备份' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt809serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `jt809serverconfig`;
CREATE TABLE `jt809serverconfig`  (
  `configId` bigint(20) NOT NULL AUTO_INCREMENT,
  `platformUserId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户账号',
  `platformPassword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户密码',
  `platformId` bigint(20) NULL DEFAULT NULL COMMENT '唯一接入码',
  `transferStatus` bit(1) NULL DEFAULT NULL COMMENT '是否转发',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '809配置简称',
  PRIMARY KEY (`configId`) USING BTREE,
  UNIQUE INDEX `uniplat`(`platformId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt809serverconfig111
-- ----------------------------
DROP TABLE IF EXISTS `jt809serverconfig111`;
CREATE TABLE `jt809serverconfig111`  (
  `configId` bigint(20) NOT NULL AUTO_INCREMENT,
  `platformUserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户账号',
  `platformPassword` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接入运管平台的用户密码',
  `platformId` bigint(20) NULL DEFAULT NULL COMMENT '唯一接入码',
  `transferStatus` bit(1) NULL DEFAULT NULL COMMENT '是否转发',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '809配置简称',
  PRIMARY KEY (`configId`) USING BTREE,
  UNIQUE INDEX `uniplat`(`platformId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jt809statistics
-- ----------------------------
DROP TABLE IF EXISTS `jt809statistics`;
CREATE TABLE `jt809statistics`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `platformID` bigint(11) NULL DEFAULT NULL COMMENT '接入码',
  `serverIP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级平台主链路Ip',
  `serverport` int(10) NULL DEFAULT NULL COMMENT '上级平台主链路端口',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型--1链路断开；2车辆定位丢失',
  `startTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `endflag` bit(1) NULL DEFAULT b'0' COMMENT '是否结束',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `loseDymamncSum` bigint(11) NULL DEFAULT 0 COMMENT '丢失的定位数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jxc_card_change_data
-- ----------------------------
DROP TABLE IF EXISTS `jxc_card_change_data`;
CREATE TABLE `jxc_card_change_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯不标识',
  `cNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡号SIM',
  `addTime` date NOT NULL COMMENT '新建时间',
  `iccid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ICCID',
  `imsi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IMSI',
  `imei` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IMEI',
  `action_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作动作：insert:增加，update:更新。',
  `soDate` date NULL DEFAULT NULL COMMENT '开户日期，格式：yyyy-MM-dd',
  `cState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未知=0、正常=1、停机=2、销号=3',
  `lCycle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未知=0、测试期=1、沉默期=2、服务期=3、注销期=4、服务到期=5',
  `mState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机器状态：未知=0、在线=1、关机=2、离线=3',
  `rFlow` float(20, 0) NULL DEFAULT NULL COMMENT '本月实时使用流量,单位：MB',
  `oType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营商：移动(0)、联通(1)、电信(2)',
  `tFlow` float(20, 0) NULL DEFAULT NULL COMMENT '总流量,单位：MB',
  `sPName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基础套餐名称',
  `sPeriod` date NULL DEFAULT NULL COMMENT '服务开始日期，格式：yyyy-MM-dd',
  `ePeriod` date NULL DEFAULT NULL COMMENT '服务截止日期，格式：yyyy-MM-dd',
  `silEDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '沉默期到期日期，格式：yyyy-MM-dd',
  `authState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名认证：0=未认证，1=认证中，2=已认证，3=未通过',
  `rDate` date NULL DEFAULT NULL COMMENT '续费截止日期，格式：yyyy-MM-dd',
  `suspend` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停机保号：有、无',
  `uFlow` double(20, 0) NULL DEFAULT NULL COMMENT '已用总流量（MB）',
  `bOState` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无=0、到期停机=1、（停机保号设置停机）到期断网=2、（停机保号设置断网）达量停机=3、（超流量停机）达量断网=4、（超流量断网）套餐已到期=5、（停机保号到期解除套餐）强制停机=6，强制断网=7',
  `sPDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量清零日期，格式：yyyy-MM-dd',
  `oRDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据同步日期，格式：yyyy-MM-dd',
  `pUSms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期已用短信（条）',
  `pASms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期可用短信（条）',
  `sPCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自营套餐编号',
  `action_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作动作：success:成功，failure:失败',
  `action_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`, `addTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6110521 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (TO_DAYS(addTime))
PARTITIONS 31
(PARTITION `part_0` VALUES LESS THAN (737890) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_1` VALUES LESS THAN (737891) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_2` VALUES LESS THAN (737892) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_3` VALUES LESS THAN (737893) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_4` VALUES LESS THAN (737894) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_5` VALUES LESS THAN (737895) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_6` VALUES LESS THAN (737896) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_7` VALUES LESS THAN (737897) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_8` VALUES LESS THAN (737898) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_9` VALUES LESS THAN (737899) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_10` VALUES LESS THAN (737900) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_11` VALUES LESS THAN (737901) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_12` VALUES LESS THAN (737902) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_13` VALUES LESS THAN (737903) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_14` VALUES LESS THAN (737904) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_15` VALUES LESS THAN (737905) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_16` VALUES LESS THAN (737906) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_17` VALUES LESS THAN (737907) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_18` VALUES LESS THAN (737908) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_19` VALUES LESS THAN (737909) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_20` VALUES LESS THAN (737910) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_21` VALUES LESS THAN (737911) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_22` VALUES LESS THAN (737912) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_23` VALUES LESS THAN (737913) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_24` VALUES LESS THAN (737914) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_25` VALUES LESS THAN (737915) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_26` VALUES LESS THAN (737916) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_27` VALUES LESS THAN (737917) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_28` VALUES LESS THAN (737918) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_29` VALUES LESS THAN (737919) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `part_catchall` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for jxc_card_info
-- ----------------------------
DROP TABLE IF EXISTS `jxc_card_info`;
CREATE TABLE `jxc_card_info`  (
  `cNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡号SIM',
  `addTime` datetime(0) NOT NULL COMMENT '新建时间',
  `iccid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ICCID',
  `imsi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IMSI',
  `imei` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IMEI',
  `soDate` date NULL DEFAULT NULL COMMENT '开户日期，格式：yyyy-MM-dd',
  `cState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未知=0、正常=1、停机=2、销号=3',
  `lCycle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未知=0、测试期=1、沉默期=2、服务期=3、注销期=4、服务到期=5',
  `mState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机器状态：未知=0、在线=1、关机=2、离线=3',
  `rFlow` float(20, 0) NULL DEFAULT NULL COMMENT '本月实时使用流量,单位：MB',
  `oType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营商：移动(0)、联通(1)、电信(2)',
  `tFlow` float(20, 0) NULL DEFAULT NULL COMMENT '总流量,单位：MB',
  `sPName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基础套餐名称',
  `sPeriod` date NULL DEFAULT NULL COMMENT '服务开始日期，格式：yyyy-MM-dd',
  `ePeriod` date NULL DEFAULT NULL COMMENT '服务截止日期，格式：yyyy-MM-dd',
  `silEDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '沉默期到期日期，格式：yyyy-MM-dd',
  `authState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名认证：0=未认证，1=认证中，2=已认证，3=未通过',
  `rDate` date NULL DEFAULT NULL COMMENT '续费截止日期，格式：yyyy-MM-dd',
  `suspend` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停机保号：有、无',
  `uFlow` double(20, 0) NULL DEFAULT NULL COMMENT '已用总流量（MB）',
  `bOState` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无=0、到期停机=1、（停机保号设置停机）到期断网=2、（停机保号设置断网）达量停机=3、（超流量停机）达量断网=4、（超流量断网）套餐已到期=5、（停机保号到期解除套餐）强制停机=6，强制断网=7',
  `sPDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流量清零日期，格式：yyyy-MM-dd',
  `oRDate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据同步日期，格式：yyyy-MM-dd',
  `pUSms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期已用短信（条）',
  `pASms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期可用短信（条）',
  `sPCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自营套餐编号',
  PRIMARY KEY (`cNo`) USING BTREE,
  INDEX `index_iccid`(`iccid`) USING BTREE,
  INDEX `index_imsi`(`imsi`) USING BTREE,
  INDEX `index_imei`(`imei`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for keyvalue
-- ----------------------------
DROP TABLE IF EXISTS `keyvalue`;
CREATE TABLE `keyvalue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key值',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `createdate` datetime(0) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `keyindex`(`keyname`) USING BTREE,
  INDEX `tagindex`(`tag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'key-value前端通用接口' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for linesegment
-- ----------------------------
DROP TABLE IF EXISTS `linesegment`;
CREATE TABLE `linesegment`  (
  `segId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `byTime` bit(1) NOT NULL,
  `latitude1` double NOT NULL,
  `latitude2` double NOT NULL,
  `limitSpeed` bit(1) NOT NULL,
  `lineWidth` int(11) NOT NULL,
  `longitude1` double NOT NULL,
  `longitude2` double NOT NULL,
  `maxSpeed` int(11) NOT NULL,
  `maxTimeLimit` int(11) NOT NULL,
  `minTimeLimit` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overSpeedTime` int(11) NOT NULL,
  `pointId` int(11) NOT NULL,
  `station` bit(1) NOT NULL,
  `routeId` int(11) NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`segId`) USING BTREE,
  UNIQUE INDEX `segId`(`segId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 995 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for maintenance_settings
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_settings`;
CREATE TABLE `maintenance_settings`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_datetime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `duration_minute` int(11) NOT NULL DEFAULT 60,
  `connection_id` int(11) NOT NULL,
  `recurrence` int(11) NOT NULL DEFAULT 0,
  `weeks_frequency` int(11) NOT NULL DEFAULT 1,
  `weeks_day_of_week` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[1]',
  `months_mode` int(11) NOT NULL DEFAULT 0,
  `months_days_start` int(11) NOT NULL DEFAULT 1,
  `months_days_frequency` int(11) NOT NULL DEFAULT 1,
  `months_weeks_start` int(11) NOT NULL DEFAULT 0,
  `months_weeks_day_of_week` int(11) NOT NULL DEFAULT 1,
  `months_weeks_frequency` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for maparea
-- ----------------------------
DROP TABLE IF EXISTS `maparea`;
CREATE TABLE `maparea`  (
  `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '删除标志',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持有者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 报警类型，每个报警使用逗号隔开',
  `areaType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '围栏类型',
  `byTime` bit(1) NOT NULL COMMENT ' 是否根据时间',
  `centerLat` double NOT NULL COMMENT '围栏的中心经度',
  `centerLng` double NOT NULL COMMENT '围栏的中心纬度',
  `delay` int(11) NOT NULL COMMENT '超速持续时间',
  `depId` int(11) NOT NULL COMMENT '机构id',
  `endDate` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地图标记时所用的图标',
  `keyPoint` int(11) NOT NULL COMMENT '关键点监控',
  `limitSpeed` bit(1) NOT NULL COMMENT '是否限速',
  `lineWidth` double NOT NULL COMMENT ' 统一线宽',
  `mapType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地图类型',
  `maxSpeed` double NOT NULL COMMENT '最大速度限制',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '围栏名称',
  `offsetDelay` int(11) NOT NULL COMMENT '偏移报警延迟时间',
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `points` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '围栏坐标点,字符串格式是x1,y1;x2,y2,分别代表左上角和右下角的坐标点值',
  `radius` double NOT NULL COMMENT '半径，以地图的米为单位',
  `sn` int(11) NOT NULL COMMENT '围栏号',
  `startDate` datetime(0) NULL DEFAULT NULL COMMENT '围栏有效期',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `businessType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`areaId`) USING BTREE,
  UNIQUE INDEX `areaId`(`areaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 970 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mapareabinding
-- ----------------------------
DROP TABLE IF EXISTS `mapareabinding`;
CREATE TABLE `mapareabinding`  (
  `bindId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '删除标注',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拥有者',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `areaId` int(11) NOT NULL COMMENT '围栏id',
  `bindType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定到终端还是平台platform,绑定到平台，由平台报警,terminal 绑定到终端，由终端报警',
  `commandId` int(11) NOT NULL COMMENT '终端绑定区域时，下发的命令Id,用于跟踪绑定状态',
  `configType` int(11) NOT NULL COMMENT '配置终端的操作类型 0：更新区域； 1：追加区域； 2：修改区域 ；3 删除单个区域',
  `vehicleId` int(11) NOT NULL COMMENT '车辆id',
  `companyId` int(11) NULL DEFAULT 0 COMMENT '公司id',
  PRIMARY KEY (`bindId`) USING BTREE,
  UNIQUE INDEX `bindId`(`bindId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26864 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mediaitem
-- ----------------------------
DROP TABLE IF EXISTS `mediaitem`;
CREATE TABLE `mediaitem`  (
  `mediaItemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `channelId` tinyint(4) NOT NULL,
  `codeFormat` tinyint(4) NOT NULL,
  `commandId` bigint(20) NOT NULL,
  `commandType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eventCode` tinyint(4) NOT NULL,
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `mediaDataId` int(11) NOT NULL,
  `mediaType` tinyint(4) NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speed` double NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`mediaItemId`) USING BTREE,
  UNIQUE INDEX `mediaItemId`(`mediaItemId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 503039 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for memberinfo
-- ----------------------------
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE `memberinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businessScope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `licenseNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orgNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `updateStaff` int(11) NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `ownerSex` int(11) NULL DEFAULT NULL COMMENT '车主性别	女:0,男:1',
  `execNo` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `loginName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业户登录名称',
  `passWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '7E994BD9E124936C405129FCF668D20E' COMMENT '登录密码',
  `auth` bit(1) NULL DEFAULT b'0' COMMENT '是否授权',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `index_deleted`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69796 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for memberinfo2
-- ----------------------------
DROP TABLE IF EXISTS `memberinfo2`;
CREATE TABLE `memberinfo2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businessScope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `licenseNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orgNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `updateStaff` int(11) NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `ownerSex` int(11) NULL DEFAULT NULL COMMENT '车主性别	女:0,男:1',
  `execNo` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `loginName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业户登录名称',
  `passWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '7E994BD9E124936C405129FCF668D20E' COMMENT '登录密码',
  `auth` bit(1) NULL DEFAULT b'0' COMMENT '是否授权',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `index_deleted`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67568 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for metadata
-- ----------------------------
DROP TABLE IF EXISTS `metadata`;
CREATE TABLE `metadata`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mileagestatistic
-- ----------------------------
DROP TABLE IF EXISTS `mileagestatistic`;
CREATE TABLE `mileagestatistic`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `depName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hour` double NOT NULL,
  `intervalDescr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intervalType` int(11) NOT NULL,
  `mileage` decimal(11, 2) NOT NULL,
  `mileage1` decimal(11, 2) NOT NULL,
  `mileage2` decimal(11, 2) NOT NULL,
  `oil` decimal(11, 2) NOT NULL,
  `oil1` decimal(11, 2) NOT NULL,
  `oil2` decimal(11, 2) NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staticDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for module_version
-- ----------------------------
DROP TABLE IF EXISTS `module_version`;
CREATE TABLE `module_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务器IP',
  `work_dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作目录',
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工程名称',
  `version_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `git_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `git_commit_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `build_time` datetime(0) NULL DEFAULT NULL,
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_module_version`(`ip`, `work_dir`, `project_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for newalarm
-- ----------------------------
DROP TABLE IF EXISTS `newalarm`;
CREATE TABLE `newalarm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ackSn` int(11) NOT NULL,
  `alarmSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmTime` datetime(0) NULL DEFAULT NULL,
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `processed` int(11) NOT NULL,
  `processedTime` datetime(0) NULL DEFAULT NULL,
  `processedUserId` int(11) NOT NULL,
  `processedUserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speed` double NOT NULL,
  `vehicleId` int(11) NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adasAlarmNo` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for night_prohibition_config
-- ----------------------------
DROP TABLE IF EXISTS `night_prohibition_config`;
CREATE TABLE `night_prohibition_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicle_id` bigint(20) NOT NULL COMMENT '车辆ID',
  `is_use` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '开始时段',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '结束时段',
  `prohibit_speed` int(11) NOT NULL COMMENT '禁止速度',
  `duration_time` int(11) NULL DEFAULT NULL COMMENT '持续时间',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notice_event_log_config
-- ----------------------------
DROP TABLE IF EXISTS `notice_event_log_config`;
CREATE TABLE `notice_event_log_config`  (
  `event_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notification_settings
-- ----------------------------
DROP TABLE IF EXISTS `notification_settings`;
CREATE TABLE `notification_settings`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_when_system_error` tinyint(1) NOT NULL DEFAULT 0,
  `email_when_alert_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_smtp_server_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email_smtp_server_port` int(11) NOT NULL DEFAULT 587,
  `email_secure_connection` tinyint(1) NOT NULL DEFAULT 1,
  `email_smtp_require_login` tinyint(1) NOT NULL DEFAULT 0,
  `email_smtp_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email_smtp_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email_smtp_from_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `snmp_when_alert_notification` tinyint(1) NOT NULL DEFAULT 0,
  `snmp_target_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `snmp_target_port` int(11) NOT NULL DEFAULT 162,
  `snmp_community_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_when_alert_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_service_provider` int(11) NOT NULL DEFAULT 1,
  `sms_provider_1_api_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_2_account_sid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_2_auth_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_2_use_phone_number` tinyint(1) NOT NULL DEFAULT 1,
  `sms_provider_2_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_2_messaging_service_sid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_0_api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_0_request_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'POST',
  `sms_provider_0_key_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_0_content_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_provider_0_recipient_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `slack_when_alert_notification` tinyint(1) NOT NULL DEFAULT 0,
  `slack_web_hook` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `slack_channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for onenet_device
-- ----------------------------
DROP TABLE IF EXISTS `onenet_device`;
CREATE TABLE `onenet_device`  (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` int(11) NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`vehicleId`) USING BTREE,
  INDEX `SimNo`(`simNo`) USING BTREE,
  INDEX `index_deleted`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for onlinerecord
-- ----------------------------
DROP TABLE IF EXISTS `onlinerecord`;
CREATE TABLE `onlinerecord`  (
  `alarmId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gas1` double NOT NULL,
  `gas2` double NOT NULL,
  `latitude` double NOT NULL,
  `latitude1` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `longitude1` double NOT NULL,
  `mileage1` double NOT NULL,
  `mileage2` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `station` int(11) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeSpan` double NOT NULL,
  `vehicleId` int(11) NOT NULL,
  `velocity` double NOT NULL,
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`alarmId`) USING BTREE,
  UNIQUE INDEX `alarmId`(`alarmId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 143142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for onlinestatistic
-- ----------------------------
DROP TABLE IF EXISTS `onlinestatistic`;
CREATE TABLE `onlinestatistic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depId` int(11) NOT NULL,
  `depName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intervalType` int(11) NOT NULL,
  `onlineNum` int(11) NOT NULL,
  `onlineRate` decimal(6, 2) NOT NULL,
  `parentDepId` int(11) NOT NULL,
  `statisticDate` datetime(0) NULL DEFAULT NULL,
  `vehicleNum` int(11) NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11931080 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operationlog
-- ----------------------------
DROP TABLE IF EXISTS `operationlog`;
CREATE TABLE `operationlog`  (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `channel` int(11) NOT NULL,
  `operationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logId`) USING BTREE,
  UNIQUE INDEX `depId`(`logId`) USING BTREE,
  INDEX `logdateindex`(`createDate`) USING BTREE,
  FULLTEXT INDEX `userName`(`userName`)
) ENGINE = InnoDB AUTO_INCREMENT = 559049 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for outagerecord
-- ----------------------------
DROP TABLE IF EXISTS `outagerecord`;
CREATE TABLE `outagerecord`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` bigint(11) NOT NULL COMMENT '车辆id',
  `startDate` date NULL DEFAULT NULL COMMENT '开始时间',
  `endDate` date NULL DEFAULT NULL COMMENT '结束时间',
  `remainingTime` int(10) NULL DEFAULT NULL COMMENT '剩余天数',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '离线原因',
  `createStaff` bigint(11) NULL DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateStaff` bigint(11) NULL DEFAULT NULL COMMENT '更新人id',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` bit(1) NULL DEFAULT b'0',
  `triggeringTime` date NULL DEFAULT NULL COMMENT '触发时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_id`(`id`) USING BTREE,
  UNIQUE INDEX `index_uvehicleid`(`vehicleId`) USING BTREE,
  INDEX `index_start_date`(`startDate`) USING BTREE,
  INDEX `index_end_date`(`endDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for outagerecordlog
-- ----------------------------
DROP TABLE IF EXISTS `outagerecordlog`;
CREATE TABLE `outagerecordlog`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` bigint(11) NOT NULL COMMENT '车辆id',
  `startDate` date NULL DEFAULT NULL COMMENT '开始时间',
  `endDate` date NULL DEFAULT NULL COMMENT '结束时间',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '离线原因',
  `createStaff` bigint(11) NULL DEFAULT NULL COMMENT '创建人id',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` bit(1) NULL DEFAULT b'0',
  `logtype` int(2) NULL DEFAULT 0 COMMENT '0表示手动报上 1表示自动上报',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_id`(`id`) USING BTREE,
  UNIQUE INDEX `index_uvehicleid`(`vehicleId`) USING BTREE,
  INDEX `index_start_date`(`startDate`) USING BTREE,
  INDEX `index_end_date`(`endDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for partitiontableconfig
-- ----------------------------
DROP TABLE IF EXISTS `partitiontableconfig`;
CREATE TABLE `partitiontableconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(0) NOT NULL,
  `baseTableName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dbName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tableSchema` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enableDate` date NOT NULL COMMENT '生效日期',
  `tableDays` int(11) NOT NULL COMMENT '每张表保存多少天数据',
  `partitionDays` int(11) NOT NULL COMMENT '每个分区报错多少天数据',
  `subPartitionCount` int(11) NOT NULL COMMENT '每个分区分成几个子分区',
  `createTableDDL` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新建表的语句，变量：#{partitionDate} #{partitionLessDate} #{tableName} #{subPartitionCount}#{partitionMonth}#{partitionLessMonth}#{baseTableName}',
  `addPartitionDDL` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加分区的语句',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for partitiontablerange
-- ----------------------------
DROP TABLE IF EXISTS `partitiontablerange`;
CREATE TABLE `partitiontablerange`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(0) NOT NULL,
  `baseTableName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应partitionconfig中的tableName',
  `dbName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tableSchema` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tableName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建的表名',
  `dataBeginDate` date NULL DEFAULT NULL COMMENT '条件为>=',
  `dataEndDate` date NULL DEFAULT NULL COMMENT '条件为<',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库表版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4363 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personmanage
-- ----------------------------
DROP TABLE IF EXISTS `personmanage`;
CREATE TABLE `personmanage`  (
  `certificate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '从业资格证号',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `certificatetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从业资格证类型',
  `address` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细住址',
  `drivingType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '准驾车型',
  `driverName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '驾驶员姓名',
  `driverImgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '司机图片路径',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `licenseAgency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发证机构名称',
  `sfzh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `invalidDate` datetime(0) NULL DEFAULT NULL COMMENT '证件有效期',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `isuseDate` datetime(0) NULL DEFAULT NULL COMMENT '发证时间',
  `carefulDate` datetime(0) NULL DEFAULT NULL COMMENT '年审日期',
  `monitorOrg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督机构',
  `monitorPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监督电话',
  `persontype` int(11) NULL DEFAULT 0 COMMENT '人员类型，暂时是0代表司机，1代表押运员，后续可能会添加',
  `fullertoncard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '福路通卡号',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构id',
  `otherimg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他司机照片',
  `driverlicencefrontimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶证正面照片',
  `driverlicencebackimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾驶证副本照片',
  `certificateimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从业资格证照片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_certificateanddrivername`(`certificate`, `driverName`, `persontype`) USING BTREE COMMENT '从业资格证唯一索引',
  INDEX `index_certificate`(`certificate`) USING BTREE,
  INDEX `index_drivername`(`driverName`) USING BTREE,
  INDEX `index_persontype`(`persontype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员表（唯一从业资格证和姓名，保存司机信息和押运员信息）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personmanagebydep
-- ----------------------------
DROP TABLE IF EXISTS `personmanagebydep`;
CREATE TABLE `personmanagebydep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driverid` int(11) NULL DEFAULT NULL COMMENT '司机表主键',
  `depid` int(11) NULL DEFAULT NULL COMMENT '机构表主键',
  `owner` int(11) NULL DEFAULT NULL COMMENT '创建者id',
  `createDate` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态：1/请假,0正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_driveridanddepid`(`driverid`, `depid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员机构绑定关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platform_config
-- ----------------------------
DROP TABLE IF EXISTS `platform_config`;
CREATE TABLE `platform_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `ip_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ip/域名',
  `config_type` tinyint(1) NULL DEFAULT 0 COMMENT '1：全局 0：账号 ,2:域名',
  `login_page_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '登录页图片路径',
  `filing_head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '技术支持[手机：xxxxxx]  公司版权所有',
  `filing_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备案号',
  `filing_website_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备案网站链接',
  `browser_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器标题',
  `browser_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '浏览器图片路径',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1000' COMMENT '状态',
  `platform_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '平台图片路径',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `bottomcolor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '底色配置',
  `loginimglocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录框位置，直接显示中文',
  `carouselbackimg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '轮播背景图路径',
  `carouselimg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '轮播图片路径',
  `carouseicon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '轮播图标，用;号隔开',
  `carousetext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '轮播文字，用;号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platforminfo
-- ----------------------------
DROP TABLE IF EXISTS `platforminfo`;
CREATE TABLE `platforminfo`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkEndTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkInterval` int(11) NOT NULL,
  `checkQuestion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkStartTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mainLinkState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platformId` int(11) NOT NULL,
  `sublinkPort` int(11) NOT NULL,
  `sublinkServerIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sublinkState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID`(`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platformstate
-- ----------------------------
DROP TABLE IF EXISTS `platformstate`;
CREATE TABLE `platformstate`  (
  `stateId` int(11) NOT NULL AUTO_INCREMENT,
  `gpsServerDate` datetime(0) NULL DEFAULT NULL,
  `gpsServerState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mainLinkDate` datetime(0) NULL DEFAULT NULL,
  `mainLinkState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subLinkDate` datetime(0) NULL DEFAULT NULL,
  `subLinkState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorizeCode1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorizeCode2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platformId` bigint(20) NULL DEFAULT NULL COMMENT '唯一接入码',
  PRIMARY KEY (`stateId`) USING BTREE,
  UNIQUE INDEX `stateId`(`stateId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4503 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pole_camera_file
-- ----------------------------
DROP TABLE IF EXISTS `pole_camera_file`;
CREATE TABLE `pole_camera_file`  (
  `mediaItemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据存储的文件名',
  `fileUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据存储的地址',
  `sendTime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sim卡号',
  PRIMARY KEY (`mediaItemId`) USING BTREE,
  UNIQUE INDEX `mediaItemId`(`mediaItemId`) USING BTREE,
  INDEX `simNo`(`simNo`) USING BTREE,
  INDEX `sendTime`(`sendTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recognitionmediaitem
-- ----------------------------
DROP TABLE IF EXISTS `recognitionmediaitem`;
CREATE TABLE `recognitionmediaitem`  (
  `mediaItemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `driverId` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人脸id',
  `channelId` tinyint(4) NULL DEFAULT NULL COMMENT '摄像头通道号',
  `result` tinyint(4) UNSIGNED NULL DEFAULT NULL COMMENT '比对结果 0:匹配成功; 1:匹配失败; 2:超时; 3:没有启用该功能; 4:连接异常; 5:无指定人脸图片 6:无人脸库',
  `critical` int(6) NULL DEFAULT NULL COMMENT '对比相似度阈值单位是 1%',
  `similarity` double(6, 2) NULL DEFAULT NULL COMMENT '比对相似度单位是 0.01%;比如 5432 表示 54.32%',
  `codeFormat` tinyint(4) NULL DEFAULT NULL COMMENT '0:JPEG',
  `eventCode` tinyint(4) NOT NULL COMMENT '比对类型 0-插卡比对;1-巡检比对;2-点火比对;3-离开返回比对',
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据存储的文件名',
  `fileUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据存储的地址',
  `latitude` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体位置',
  `longitude` double NOT NULL,
  `mediaType` tinyint(4) NULL DEFAULT NULL COMMENT '图片格式 0：图片',
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `sendTime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sim卡号',
  `speed` double UNSIGNED NOT NULL DEFAULT 0 COMMENT '速度',
  `vehicleId` int(11) UNSIGNED NOT NULL COMMENT '车辆id',
  PRIMARY KEY (`mediaItemId`) USING BTREE,
  UNIQUE INDEX `mediaItemId`(`mediaItemId`) USING BTREE,
  INDEX `simNo`(`simNo`) USING BTREE,
  INDEX `sendTime`(`sendTime`) USING BTREE,
  INDEX `vehicleid`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13531 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(11) NOT NULL,
  `center_lat_lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat_lons` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `fullName` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region_copy1
-- ----------------------------
DROP TABLE IF EXISTS `region_copy1`;
CREATE TABLE `region_copy1`  (
  `id` int(11) NOT NULL,
  `center_lat_lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat_lons` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `fullName` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region_copy2
-- ----------------------------
DROP TABLE IF EXISTS `region_copy2`;
CREATE TABLE `region_copy2`  (
  `id` int(11) NOT NULL,
  `center_lat_lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat_lons` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `fullName` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region_copy3
-- ----------------------------
DROP TABLE IF EXISTS `region_copy3`;
CREATE TABLE `region_copy3`  (
  `id` int(11) NOT NULL,
  `center_lat_lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat_lons` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `fullName` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region_copy4
-- ----------------------------
DROP TABLE IF EXISTS `region_copy4`;
CREATE TABLE `region_copy4`  (
  `id` int(11) NOT NULL,
  `center_lat_lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat_lons` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `fullName` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for regiontest
-- ----------------------------
DROP TABLE IF EXISTS `regiontest`;
CREATE TABLE `regiontest`  (
  `id` int(1) NULL DEFAULT NULL COMMENT '是否执行地区查看 0 查看 1 不查看'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '是否执行地区查看' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for replication_error_histories
-- ----------------------------
DROP TABLE IF EXISTS `replication_error_histories`;
CREATE TABLE `replication_error_histories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replication_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `error_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `error_no` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_replication_error_histories_on_replication_id`(`replication_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for replication_states
-- ----------------------------
DROP TABLE IF EXISTS `replication_states`;
CREATE TABLE `replication_states`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL,
  `replication_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `start_or_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_replication_states_on_created_at`(`created_at`) USING BTREE,
  INDEX `idx_replication_states_on_replication_id`(`replication_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for replications
-- ----------------------------
DROP TABLE IF EXISTS `replications`;
CREATE TABLE `replications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `master_log_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_log_pos` int(10) UNSIGNED NOT NULL,
  `slave_sql_running` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_port` int(10) UNSIGNED NOT NULL,
  `connect_retry` int(10) UNSIGNED NOT NULL,
  `relay_log_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `relay_log_pos` int(10) UNSIGNED NOT NULL,
  `relay_master_log_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replicate_do_db` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replicate_ignore_db` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replicate_do_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replicate_ignore_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replicate_wild_do_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replicate_wild_ignore_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_errno` int(10) UNSIGNED NOT NULL,
  `last_error` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `skip_counter` int(10) UNSIGNED NOT NULL,
  `exec_master_log_pos` int(10) UNSIGNED NOT NULL,
  `relay_log_space` int(10) UNSIGNED NOT NULL,
  `until_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `until_log_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `until_log_pos` int(10) UNSIGNED NOT NULL,
  `master_ssl_allowed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_ssl_ca_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_ssl_ca_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_ssl_cert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_ssl_cipher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `master_ssl_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seconds_behind_master` int(10) UNSIGNED NOT NULL,
  `master_ssl_verify_server_cert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_io_errno` int(10) UNSIGNED NOT NULL,
  `last_io_error` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_sql_errno` int(10) UNSIGNED NOT NULL,
  `last_sql_error` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slave_io_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slave_io_running` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_replications_on_connection_id_and_created_at`(`connection_id`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `ownerId` bigint(20) NOT NULL,
  `share` tinyint(1) NOT NULL,
  `companyId` bigint(20) NOT NULL,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`roleId`) USING BTREE,
  UNIQUE INDEX `roleId`(`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 376 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_funcpriv
-- ----------------------------
DROP TABLE IF EXISTS `role_funcpriv`;
CREATE TABLE `role_funcpriv`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `func_priv_id` int(11) NOT NULL COMMENT '功能权限ID',
  PRIMARY KEY (`role_id`, `func_priv_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色功能权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_ip_ranges
-- ----------------------------
DROP TABLE IF EXISTS `role_ip_ranges`;
CREATE TABLE `role_ip_ranges`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mask_bit` int(11) NULL DEFAULT NULL,
  `ipv` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_ip_ranges_on_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rolefunc
-- ----------------------------
DROP TABLE IF EXISTS `rolefunc`;
CREATE TABLE `rolefunc`  (
  `role_id` int(11) NOT NULL,
  `sys_func_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `sys_func_id`) USING BTREE,
  INDEX `FKF3F0507A418B4B7C`(`role_id`) USING BTREE,
  INDEX `FKF3F0507AA1C65F87`(`sys_func_id`) USING BTREE,
  INDEX `FKF3F0507A1ABA8BF3`(`sys_func_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `access_configurations` tinyint(1) NOT NULL DEFAULT 0,
  `export_chart` tinyint(1) NOT NULL DEFAULT 0,
  `edit_instance_variables` tinyint(1) NOT NULL DEFAULT 0,
  `alert_close_open` tinyint(1) NOT NULL DEFAULT 0,
  `alert_add_remarks` tinyint(1) NOT NULL DEFAULT 0,
  `alert_assign_members` tinyint(1) NOT NULL DEFAULT 0,
  `alert_policy_edit` tinyint(1) NOT NULL DEFAULT 0,
  `alert_event_handler_edit` tinyint(1) NOT NULL DEFAULT 0,
  `end_process` tinyint(1) NOT NULL DEFAULT 0,
  `config_instances` tinyint(1) NOT NULL DEFAULT 0,
  `config_general_setting` tinyint(1) NOT NULL DEFAULT 0,
  `config_privilege` tinyint(1) NOT NULL DEFAULT 0,
  `config_user_profile` tinyint(1) NOT NULL DEFAULT 0,
  `config_self_profile` tinyint(1) NOT NULL DEFAULT 0,
  `all_groups_access` tinyint(1) NOT NULL DEFAULT 0,
  `config_data_purge` tinyint(1) NOT NULL DEFAULT 0,
  `config_data_repository` tinyint(1) NOT NULL DEFAULT 0,
  `retrieve_log` tinyint(1) NOT NULL DEFAULT 0,
  `config_activate_and_license` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for routesegment
-- ----------------------------
DROP TABLE IF EXISTS `routesegment`;
CREATE TABLE `routesegment`  (
  `segId` int(11) NOT NULL AUTO_INCREMENT,
  `delay` int(11) NOT NULL,
  `endSegId` int(11) NOT NULL,
  `maxSpeed` double NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `routeId` int(11) NOT NULL,
  `startSegId` int(11) NOT NULL,
  `strPoints` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`segId`) USING BTREE,
  UNIQUE INDEX `segId`(`segId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedulingtemplate
-- ----------------------------
DROP TABLE IF EXISTS `schedulingtemplate`;
CREATE TABLE `schedulingtemplate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(2555) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本内容',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(11) NULL DEFAULT 1 COMMENT '模版类型，1代表调度信息文本内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度文本信息模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for service_monitor
-- ----------------------------
DROP TABLE IF EXISTS `service_monitor`;
CREATE TABLE `service_monitor`  (
  `todev_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `http_port` int(10) NULL DEFAULT NULL,
  `unit_config` json NULL,
  `version_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `version_build_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `version_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`todev_topic`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for speed_limit
-- ----------------------------
DROP TABLE IF EXISTS `speed_limit`;
CREATE TABLE `speed_limit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `vehicle_id` int(255) NULL DEFAULT NULL COMMENT '车辆Id',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1000' COMMENT '状态（1000：启用 1100：禁用 1200：删除）',
  `terminal_alarm_number` int(11) NULL DEFAULT 0 COMMENT '终端报警次数',
  `create_staff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_staff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `call_interface_number` int(11) NULL DEFAULT 0 COMMENT '接口调用次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 962 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for speeding_alarm_config
-- ----------------------------
DROP TABLE IF EXISTS `speeding_alarm_config`;
CREATE TABLE `speeding_alarm_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `is_speeding_alarm` tinyint(1) NOT NULL COMMENT '是否启用超速报警',
  `is_nightspeeding_alarm` tinyint(1) NOT NULL COMMENT '是否启用夜间报警',
  `vehicle_id` bigint(20) NOT NULL COMMENT '车辆Id',
  `alarm_speed` int(11) NOT NULL COMMENT '报警速度',
  `duration_time` int(11) NOT NULL COMMENT '持续时间',
  `early_warning_difference` int(11) NOT NULL COMMENT '预警差值',
  `immediate_alarm` int(11) NOT NULL COMMENT '立即报警',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开始时段',
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '结束时段',
  `rate_limit` int(11) NULL DEFAULT NULL COMMENT '夜间限速百分比',
  `night_duration_time` int(11) NULL DEFAULT NULL COMMENT '夜间报警持续时间',
  `params` json NULL COMMENT '参数，为以后字段扩展',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for speedrecorder
-- ----------------------------
DROP TABLE IF EXISTS `speedrecorder`;
CREATE TABLE `speedrecorder`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `recorderDate` datetime(0) NULL DEFAULT NULL,
  `signal` int(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `speed` double NOT NULL,
  `recorderId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE,
  INDEX `FK905A06054E2D3A1`(`recorderId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for system_performances
-- ----------------------------
DROP TABLE IF EXISTS `system_performances`;
CREATE TABLE `system_performances`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_cpu` bigint(20) NOT NULL,
  `free_cpu` double NOT NULL,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `total_mem` bigint(20) NOT NULL,
  `free_mem` bigint(20) NOT NULL,
  `total_swap` bigint(20) NOT NULL,
  `free_swap` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_performances_on_connection_id_and_created_at`(`connection_id`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for systemconfig
-- ----------------------------
DROP TABLE IF EXISTS `systemconfig`;
CREATE TABLE `systemconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `initLat` double NULL DEFAULT NULL,
  `initLng` double NULL DEFAULT NULL,
  `initZoomLevel` int(11) NULL DEFAULT NULL,
  `mapType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maxOfflineDays` int(11) NULL DEFAULT NULL,
  `platformMessage` int(11) NULL DEFAULT NULL,
  `displayStateType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkValidateCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smartKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `systemTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alarmInterval` int(11) NULL DEFAULT NULL,
  `baiduKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refreshInterval` int(11) NULL DEFAULT NULL,
  `showVehicleOnMap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maxParkingTime` int(11) NOT NULL,
  `amapKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amapWebServiceKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `showDepNameOnMap` bit(1) NULL DEFAULT b'0',
  `companyId` int(11) NULL DEFAULT 0,
  `vehicleIconType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baiduWebServiceKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoServerIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoServerTcpPort` int(11) NOT NULL,
  `videoServerUdpPort` int(11) NOT NULL,
  `rtmpPort` int(11) NOT NULL,
  `layoutOption` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accOffTimeSpan` int(11) NULL DEFAULT 0,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统logo',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_assign
-- ----------------------------
DROP TABLE IF EXISTS `t_assign`;
CREATE TABLE `t_assign`  (
  `ASSIGN_ID` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '派车单号',
  `DEPT_ID` int(16) NULL DEFAULT NULL COMMENT '发起部门ID',
  `NUM` int(16) NOT NULL COMMENT '使用人数',
  `REASON` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用车原因',
  `START_PLACE` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起始地',
  `END_PLACE` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地',
  `START_TIME` datetime(6) NULL DEFAULT NULL COMMENT '用车开始时间',
  `END_TIME` datetime(6) NULL DEFAULT NULL COMMENT '用车结束时间',
  `STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '派单状态：1、待派，2 审核中 3、审核通过　4、,审核不通过，5、删除 6、撤单',
  `ASSIGN_MAN` int(11) NOT NULL COMMENT '发起人',
  `ASSIGN_TIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '派单时间',
  `MEASURE` int(10) NULL DEFAULT 0 COMMENT '预估行驶里程',
  `PRIORITY` int(2) NULL DEFAULT NULL COMMENT '优先级：一级为关键部门用车、大型活动用车、重要事项用车；二级为部门协作用车；三级为单部门普通用车',
  `FURTUR_FEE` int(10) NULL DEFAULT NULL COMMENT '预估费用',
  `ATTEMPER_TYPE` int(2) NULL DEFAULT NULL COMMENT '调度类型：1、开放；2、封闭',
  `OA_ID` int(16) NULL DEFAULT NULL COMMENT 'OA接口ID',
  `USER_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用车联系人',
  `USER_TEL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用车联系人联系电话',
  `SET_TYPE` int(65) NULL DEFAULT NULL COMMENT '流程类型',
  `FILE_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILES` longblob NULL,
  `PROCESS_ID` int(16) NULL DEFAULT NULL COMMENT '对应的第一个审核人id',
  `CUR_STEP` int(65) NULL DEFAULT 1 COMMENT '当前SEQ',
  `IS_OPERATION` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是已评价过 0 否 1 是',
  `IS_OVER` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否 完结 0 否 1 是',
  `IS_READ` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已读 0 否 1 是',
  `IS_MSG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否短信提醒 0 是 1 否',
  `TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0 正常单 1 非正常单',
  `OLD_ASSIGN_ID` int(16) NULL DEFAULT NULL COMMENT '备份ID',
  `IS_SEND_BACK` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否被回退 0否 1是',
  `IS_ADDITIONAL` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否为事后补单 0否 1是',
  `IS_DRIVER_RECEIVED` int(1) NULL DEFAULT 0 COMMENT '司机是否确认 0否 1 是',
  PRIMARY KEY (`ASSIGN_ID`) USING BTREE,
  INDEX `IDX_T_ASSIGN_ASSIGNTIME`(`ASSIGN_TIME`) USING BTREE,
  INDEX `IDX_T_ASSIGN_DEPT`(`DEPT_ID`) USING BTREE,
  INDEX `IDX_T_ASSIGN_STATUS`(`STATUS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '派单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_business_type
-- ----------------------------
DROP TABLE IF EXISTS `t_business_type`;
CREATE TABLE `t_business_type`  (
  `BUSINESS_ID` int(16) NOT NULL AUTO_INCREMENT,
  `BUSINESS_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  `CORP_ID` int(16) NULL DEFAULT NULL COMMENT '部门id',
  `STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 0 可用 1 不可用',
  `TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 默认流程 1',
  `CREAT_TIME` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `NEED_CHECK` int(1) NULL DEFAULT 1 COMMENT '是否需要审核  0不需要 1 需要',
  PRIMARY KEY (`BUSINESS_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_process_state
-- ----------------------------
DROP TABLE IF EXISTS `t_process_state`;
CREATE TABLE `t_process_state`  (
  `ID` bigint(16) NOT NULL,
  `ASSIGN_ID` bigint(16) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '派单表id',
  `STATUS` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态 1 暂不审核 2还未审核 3 审核不通过 4 审核通过 5 移交审核  ',
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '意见',
  `PROCESS_USER` int(16) NULL DEFAULT NULL COMMENT '审核人',
  `NEXT_PROCESS_USER` int(16) NULL DEFAULT NULL COMMENT '下个审核人',
  `FLOW_ID` int(16) NULL DEFAULT NULL COMMENT '对应的流程ID',
  `PROCESSING_TIME` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `RECEIVE_TIME` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '接收时间',
  `IS_AUDIT_PUSH` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT ' 0 未推送  1已推送(审核人是否推送)',
  `IS_MSG` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT ' 0（短信要发送还未发送） 1（短信不发送） 2 短信已经发送',
  `IS_REGIS_PUSH` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT ' 0否  1是(申请人是否推送)',
  `RETURN_USER` int(16) NULL DEFAULT NULL COMMENT '退回人',
  `PROCESS_USER_A` int(16) NULL DEFAULT NULL COMMENT '审核人A',
  `PROCESS_USER_B` int(16) NULL DEFAULT NULL COMMENT '审核人B',
  `NEXT_PROCESS_USER_A` int(16) NULL DEFAULT NULL COMMENT '下个审核人A',
  `NEXT_PROCESS_USER_B` int(16) NULL DEFAULT NULL COMMENT '下个审核人B',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDX_ASSIGN_ID`(`ASSIGN_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_register
-- ----------------------------
DROP TABLE IF EXISTS `t_register`;
CREATE TABLE `t_register`  (
  `REGISTER_ID` bigint(16) NOT NULL COMMENT '登记表ID',
  `ASSIGN_ID` bigint(16) NULL DEFAULT NULL COMMENT '派单ID',
  `CAR_ID` bigint(16) NOT NULL COMMENT '车辆ID',
  `DRIVER_ID` int(16) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '驾驶员ID',
  `START_MILE` decimal(10, 3) NULL DEFAULT NULL COMMENT '起始里程',
  `MEASURE` decimal(10, 3) NULL DEFAULT NULL COMMENT '估算里程',
  `TIMES` int(2) NULL DEFAULT 1 COMMENT '行程数:从出发地到目的地算一个行程(一个或多个)',
  `NOW_MILE` decimal(15, 0) NULL DEFAULT NULL COMMENT '现里程',
  `REAL_MILE` decimal(15, 0) NULL DEFAULT NULL COMMENT '行驶里程:现里程 - 起始里程',
  `TOLL` int(10) NULL DEFAULT 0 COMMENT '过路过桥费',
  `PARK_FEE` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '停车费',
  `OIL` decimal(10, 2) NULL DEFAULT NULL COMMENT '用油量',
  `OIL_FEE` decimal(10, 2) NULL DEFAULT NULL COMMENT '加油费',
  `OTHER_FEE` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '其它费用',
  `OTHER_REMARK` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它费用说明',
  `DEVIATION` decimal(10, 2) NULL DEFAULT NULL COMMENT '里程偏差值',
  `IS_VERIFY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否需验证:1、不需要　2、需要',
  `VERIFY_ID` decimal(16, 0) NULL DEFAULT NULL COMMENT '验证ID',
  `REGISTER_TIME` datetime(6) NULL DEFAULT NULL COMMENT '回单时间',
  `REGISTER_MAN` decimal(16, 0) NULL DEFAULT NULL COMMENT '回单员',
  `NOW_PLACE` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆目前所在位置',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态：1、末回单　2、已回单  3、撤销单',
  `TOTAL` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '总费用',
  `BACK_PLACE` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务结束后返回位置',
  `END_TIME` datetime(6) NULL DEFAULT NULL COMMENT '用车结束时间',
  `TIME_WARP` decimal(10, 2) NULL DEFAULT NULL COMMENT '时间偏差值，单位为：小时',
  `FEE_WARP` decimal(10, 2) NULL DEFAULT NULL COMMENT '费用偏差值，单位为：元',
  `BEGIN_TIME` datetime(6) NULL DEFAULT NULL COMMENT '用车实际开始时间',
  `GIS_MILE` decimal(10, 3) NULL DEFAULT NULL COMMENT 'GIS行驶里程数；接口过来数据',
  `SUGGEST` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用车人意见',
  `CONTENTMENT` decimal(2, 0) NULL DEFAULT NULL COMMENT '用车人是否满意',
  `MILE_FEE` decimal(10, 3) NULL DEFAULT NULL COMMENT '里程费用',
  `HOUR` decimal(10, 0) NULL DEFAULT NULL COMMENT '用车时间时长（单位小时）',
  `HOUR_FEE` decimal(10, 3) NULL DEFAULT NULL COMMENT '时长费用',
  `MILE_PRICE` decimal(10, 3) NULL DEFAULT NULL COMMENT '里程单价',
  `HOUR_PRICE` decimal(10, 3) NULL DEFAULT NULL COMMENT '小时单价',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `IS_MSG` int(65) NULL DEFAULT 1 COMMENT ' 0（短信要发送还未发送） 1（短信不发送） 2 短信已经发送',
  `NOW_MILEPHOTO` longblob NULL COMMENT '码表图片',
  `END_MILE` decimal(15, 0) NULL DEFAULT NULL COMMENT '结束码表数',
  `END_MILEPHOTO` longblob NULL COMMENT '结束码表图片',
  `IS_PUSH` int(65) NULL DEFAULT 0 COMMENT '0 未推送 1已推送 ',
  `ETC` decimal(10, 0) NULL DEFAULT NULL COMMENT 'ect费用',
  `DELETED` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`REGISTER_ID`) USING BTREE,
  INDEX `IDX_REGISTER_ASSIGNID_STATUS`(`ASSIGN_ID`, `STATUS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用车情况登记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_shareinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_shareinfo`;
CREATE TABLE `t_shareinfo`  (
  `share_id` bigint(20) NOT NULL COMMENT '分享的id信息',
  `share_useid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享的用户的id值',
  `alarm_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警的id值',
  `share_date` datetime(0) NULL DEFAULT NULL COMMENT '分享时间',
  `count` int(10) NULL DEFAULT NULL COMMENT '分享次数',
  PRIMARY KEY (`share_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_state_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_state_flow`;
CREATE TABLE `t_state_flow`  (
  `FLOW_ID` int(16) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NODE_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `STATUS` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 0 可用 1 不可用',
  `BACK_NODE_ID` int(16) NULL DEFAULT NULL COMMENT '会退到那个节点',
  `NEXT_NODE_ID` int(16) NULL DEFAULT NULL COMMENT '下个节点',
  `SEQ` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `IS_LAST_NODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否最后一个节点 0 否 1是',
  `BUSINESS_ID` int(16) NULL DEFAULT NULL,
  `IS_SENDCAR` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 否 1 是 判断流程派车是否加在流程中',
  `IS_FOR_THIS_DEPT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核的时候需要确认针对本部门还是派单的原部门，因为派车单可能向上级领导传递，默认1针对当前审核人的部门',
  `IS_ADD_ASSIGN_SCOPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要在本流程加入派车范围内的审核人员 0不需要加入',
  PRIMARY KEY (`FLOW_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程走向' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talkchannel
-- ----------------------------
DROP TABLE IF EXISTS `talkchannel`;
CREATE TABLE `talkchannel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channelId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '频道Id',
  `channelname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '频道名称',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `membernum` int(11) NULL DEFAULT 0 COMMENT '成员数量',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '频道备注',
  `owner` int(11) NULL DEFAULT NULL COMMENT '创建用户id',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态,0,正常,4禁用',
  `type` int(11) NULL DEFAULT 0 COMMENT '类型,0频道(该字段暂时无用,预留)',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '0代表未删除,1以上代表删除',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_channelId`(`channelId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对讲频道管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talkchannelbymember
-- ----------------------------
DROP TABLE IF EXISTS `talkchannelbymember`;
CREATE TABLE `talkchannelbymember`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channelId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '频道id',
  `memberid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员id',
  `channeltalkType` int(11) NULL DEFAULT 4 COMMENT '成员在该频道的话语权优先级，2：高3：中；4：低；1000：仅听',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_chanandmembeiId`(`channelId`, `memberid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '频道和成员绑定关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talkdelrecord
-- ----------------------------
DROP TABLE IF EXISTS `talkdelrecord`;
CREATE TABLE `talkdelrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '具体操作内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `userId` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记录频道成员删除' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talkmember
-- ----------------------------
DROP TABLE IF EXISTS `talkmember`;
CREATE TABLE `talkmember`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `memberid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成员id',
  `membername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员昵称',
  `iccid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'iccid号',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营商',
  `simNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端卡号',
  `driverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证号',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `depId` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `usestatus` int(11) NULL DEFAULT 0 COMMENT '状态,1,启用,0,禁用',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `activeTime` datetime(0) NULL DEFAULT NULL COMMENT '激活时间',
  `expireTime` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '激活状态,1,激活,0,未激活',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '0代表未删除,1以上代表删除',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `passwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户密码',
  `plateno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `online` int(11) NULL DEFAULT 0 COMMENT '0,离线,1在线',
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'imei号',
  `userid` int(11) NULL DEFAULT NULL COMMENT '绑定的用户id',
  `vehicleid` int(11) NULL DEFAULT NULL COMMENT '绑定的车辆主键',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_memberid`(`memberid`) USING BTREE,
  INDEX `index_simNo`(`simNo`) USING BTREE,
  INDEX `index_driverName`(`driverName`) USING BTREE,
  INDEX `index_certificate`(`certificate`) USING BTREE,
  INDEX `index_depId`(`depId`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleid`) USING BTREE,
  INDEX `index_userId`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对讲管理成员管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for talkmember_copy1
-- ----------------------------
DROP TABLE IF EXISTS `talkmember_copy1`;
CREATE TABLE `talkmember_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `memberid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '成员id',
  `membername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成员昵称',
  `iccid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'iccid号',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运营商',
  `simNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端卡号',
  `driverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员姓名',
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '从业资格证号',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `depId` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `usestatus` int(11) NULL DEFAULT 0 COMMENT '状态,1,启用,0,禁用',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `activeTime` datetime(0) NULL DEFAULT NULL COMMENT '激活时间',
  `expireTime` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '激活状态,1,激活,0,未激活',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '0代表未删除,1以上代表删除',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `passwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户密码',
  `plateno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `online` int(11) NULL DEFAULT 0 COMMENT '0,离线,1在线',
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'imei号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_memberid`(`memberid`) USING BTREE,
  INDEX `index_simNo`(`simNo`) USING BTREE,
  INDEX `index_driverName`(`driverName`) USING BTREE,
  INDEX `index_certificate`(`certificate`) USING BTREE,
  INDEX `index_depId`(`depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对讲管理成员管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temperaturealarm
-- ----------------------------
DROP TABLE IF EXISTS `temperaturealarm`;
CREATE TABLE `temperaturealarm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `timedur` int(11) NULL DEFAULT NULL COMMENT '开门报警选中的时候,持续时间,单位为分钟',
  `highorlow` int(11) NULL DEFAULT NULL COMMENT '0,低温,1高温,开门报警开启的时候,是达到高温阈值还是低温阈值',
  `isdoor` int(11) NULL DEFAULT NULL COMMENT '是否是开门报警,0不开启,1开启',
  `highval1` decimal(18, 2) NULL DEFAULT NULL COMMENT '一路高温阈值',
  `lowval1` decimal(18, 2) NULL DEFAULT NULL COMMENT '一路低温阈值',
  `highval2` decimal(18, 2) NULL DEFAULT NULL COMMENT '二路高温阈值',
  `lowval2` decimal(18, 2) NULL DEFAULT NULL COMMENT '二路低温阈值',
  `highval3` decimal(18, 2) NULL DEFAULT NULL COMMENT '三路高温阈值',
  `lowval3` decimal(18, 2) NULL DEFAULT NULL COMMENT '三路低温阈值',
  `highval4` decimal(18, 2) NULL DEFAULT NULL COMMENT '四路高温阈值',
  `lowval4` decimal(18, 2) NULL DEFAULT NULL COMMENT '四路低温阈值',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `isuse` bit(1) NOT NULL COMMENT '是否启用',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,1代表删除,0代表正常',
  `disabled1` bit(1) NULL DEFAULT NULL COMMENT '一路高低温阈值开关状态，1为开，0为关',
  `disabled2` bit(1) NULL DEFAULT NULL COMMENT '二路高低温阈值开关状态，1为开，0为关',
  `disabled3` bit(1) NULL DEFAULT NULL COMMENT '三路高低温阈值开关状态，1为开，0为关',
  `disabled4` bit(1) NULL DEFAULT NULL COMMENT '一路高低温阈值开关状态，1为开，0为关',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '温度报警配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temperaturealarmbydep
-- ----------------------------
DROP TABLE IF EXISTS `temperaturealarmbydep`;
CREATE TABLE `temperaturealarmbydep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `temId` int(11) NULL DEFAULT NULL COMMENT '温度报警配置id',
  `depId` int(11) NULL DEFAULT NULL COMMENT '绑定机构的id',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,0代表未删除,1代表删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_depId`(`depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 622 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '温度报警配置和机构权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temperaturealarmbyvehicle
-- ----------------------------
DROP TABLE IF EXISTS `temperaturealarmbyvehicle`;
CREATE TABLE `temperaturealarmbyvehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `temId` int(11) NULL DEFAULT NULL COMMENT '温度报警配置id',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除标志,0代表未删除,1代表删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 712 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '温度报警配置和车辆权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temperaturealarmuserlim
-- ----------------------------
DROP TABLE IF EXISTS `temperaturealarmuserlim`;
CREATE TABLE `temperaturealarmuserlim`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temId` int(11) NULL DEFAULT NULL COMMENT '转发配置表的主键',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 869 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆温度报警的授权用户可见性配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_sim_no
-- ----------------------------
DROP TABLE IF EXISTS `temporary_sim_no`;
CREATE TABLE `temporary_sim_no`  (
  `simNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`simNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminal
-- ----------------------------
DROP TABLE IF EXISTS `terminal`;
CREATE TABLE `terminal`  (
  `termId` int(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bind` bit(1) NULL DEFAULT NULL,
  `devNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installAddress` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installTime` datetime(0) NULL DEFAULT NULL,
  `makeFactory` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makeNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makeTime` datetime(0) NULL DEFAULT NULL,
  `seqNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `termNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `termType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  `verHardware` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `verProtocol` smallint(6) NULL DEFAULT NULL,
  `verSoftware` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waitor` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depId` int(11) NOT NULL,
  `certPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `certString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unitNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modelNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `termSn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `contactTelephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installCompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `isPhoto` int(11) NULL DEFAULT NULL COMMENT '是否支持拍照	1支持0不支持',
  `createStaff` int(11) NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `versionProtocol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本协议',
  `factoryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '厂家',
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '型号',
  `installation_site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装地点',
  `after_sale_staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后人员',
  `after_sale_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后电话',
  PRIMARY KEY (`termId`) USING BTREE,
  UNIQUE INDEX `termId`(`termId`) USING BTREE,
  INDEX `index_termNo`(`termNo`) USING BTREE,
  INDEX `index_deleted`(`deleted`) USING BTREE,
  INDEX `index_termId`(`termId`) USING BTREE,
  INDEX `depId`(`depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129797 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminal2
-- ----------------------------
DROP TABLE IF EXISTS `terminal2`;
CREATE TABLE `terminal2`  (
  `termId` int(13) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bind` bit(1) NULL DEFAULT NULL,
  `devNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installAddress` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installTime` datetime(0) NULL DEFAULT NULL,
  `makeFactory` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makeNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makeTime` datetime(0) NULL DEFAULT NULL,
  `seqNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `termNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `termType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  `verHardware` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `verProtocol` smallint(6) NULL DEFAULT NULL,
  `verSoftware` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waitor` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depId` int(11) NOT NULL,
  `certPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `certString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unitNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modelNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `termSn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `contactTelephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installCompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `isPhoto` int(11) NULL DEFAULT NULL COMMENT '是否支持拍照	1支持0不支持',
  `createStaff` int(11) NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `versionProtocol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本协议',
  `factoryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '厂家',
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '型号',
  PRIMARY KEY (`termId`) USING BTREE,
  UNIQUE INDEX `termId`(`termId`) USING BTREE,
  INDEX `index_termNo`(`termNo`) USING BTREE,
  INDEX `index_deleted`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminal_model
-- ----------------------------
DROP TABLE IF EXISTS `terminal_model`;
CREATE TABLE `terminal_model`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `factory_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '厂家编码',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '型号',
  `factory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '是否已删除(0:未删除 1：已删除)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1190 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '终端型号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminal_test
-- ----------------------------
DROP TABLE IF EXISTS `terminal_test`;
CREATE TABLE `terminal_test`  (
  `termId` int(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` int(11) UNSIGNED ZEROFILL NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bind` bit(1) NULL DEFAULT NULL,
  `devNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installAddress` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installTime` datetime(0) NULL DEFAULT NULL,
  `makeFactory` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makeNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `makeTime` datetime(0) NULL DEFAULT NULL,
  `seqNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `termNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `termType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  `verHardware` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `verProtocol` smallint(6) NULL DEFAULT NULL,
  `verSoftware` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waitor` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depId` int(11) NOT NULL,
  `certPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `certString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unitNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modelNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `termSn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` bigint(20) NOT NULL,
  `contactTelephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installCompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `isPhoto` int(11) NULL DEFAULT NULL COMMENT '是否支持拍照	1支持0不支持',
  `createStaff` int(11) NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `versionProtocol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本协议',
  `factoryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '厂家',
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '型号',
  `installation_site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安装地点',
  `after_sale_staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后人员',
  `after_sale_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后电话',
  PRIMARY KEY (`termId`) USING BTREE,
  UNIQUE INDEX `termId`(`termId`) USING BTREE,
  INDEX `index_termNo`(`termNo`) USING BTREE,
  INDEX `index_deleted`(`deleted`) USING BTREE,
  INDEX `index_termId`(`termId`) USING BTREE,
  INDEX `depId`(`depId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129586 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalcommand
-- ----------------------------
DROP TABLE IF EXISTS `terminalcommand`;
CREATE TABLE `terminalcommand`  (
  `cmdId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` timestamp(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SN` int(11) NOT NULL,
  `cmd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cmdData` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cmdType` int(11) NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateDate` timestamp(0) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `subCmdType` int(11) NOT NULL,
  PRIMARY KEY (`cmdId`) USING BTREE,
  UNIQUE INDEX `cmdId`(`cmdId`) USING BTREE,
  INDEX `createDate`(`createDate`, `status`) USING BTREE,
  INDEX `simNo`(`simNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9449580 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '终端命令表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalcommandresp
-- ----------------------------
DROP TABLE IF EXISTS `terminalcommandresp`;
CREATE TABLE `terminalcommandresp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端SimNo',
  `cmd_id` bigint(11) NULL DEFAULT NULL COMMENT '终端指令表ID',
  `req_cmd_sn` int(11) NULL DEFAULT NULL COMMENT '请求流水号',
  `req_cmd_type` int(11) NULL DEFAULT NULL COMMENT '请求指令类型',
  `resp_cmd_sn` int(11) NULL DEFAULT NULL COMMENT '应答流水号',
  `resp_cmd_type` int(11) NULL DEFAULT NULL COMMENT '应答消息类型',
  `new_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回应协议具体内容',
  `hex` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回应协议 16进制编码',
  `json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回应协议 Json字符串',
  `source_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '源码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 591 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalgroupcmd
-- ----------------------------
DROP TABLE IF EXISTS `terminalgroupcmd`;
CREATE TABLE `terminalgroupcmd`  (
  `cmdId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` timestamp(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cmd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cmdData` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cmdType` int(11) NULL DEFAULT NULL,
  `subCmdType` int(11) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateDate` timestamp(0) NULL DEFAULT NULL,
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '群发kafka的topic',
  `expireDate` timestamp(0) NULL DEFAULT NULL COMMENT '过期时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cmdId`) USING BTREE,
  UNIQUE INDEX `cmdId`(`cmdId`) USING BTREE,
  INDEX `createDate`(`createDate`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车联网群发指令表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalgroupcmdlog
-- ----------------------------
DROP TABLE IF EXISTS `terminalgroupcmdlog`;
CREATE TABLE `terminalgroupcmdlog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NOT NULL,
  `simNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cmdId` int(11) NOT NULL,
  `sendTime` datetime(0) NOT NULL,
  `sn` int(11) NULL DEFAULT NULL,
  `sendUnit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalgroupcmdvehicle
-- ----------------------------
DROP TABLE IF EXISTS `terminalgroupcmdvehicle`;
CREATE TABLE `terminalgroupcmdvehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleId` int(11) NOT NULL,
  `maxCmdId` bigint(20) NOT NULL,
  `simNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sendDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vid`(`vehicleId`, `maxCmdId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalparam
-- ----------------------------
DROP TABLE IF EXISTS `terminalparam`;
CREATE TABLE `terminalparam`  (
  `paramId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commandId` int(11) NOT NULL,
  `fieldType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sN` int(11) NOT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`paramId`) USING BTREE,
  UNIQUE INDEX `paramId`(`paramId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5540 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalversion
-- ----------------------------
DROP TABLE IF EXISTS `terminalversion`;
CREATE TABLE `terminalversion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `codeDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `simNo-code`(`simNo`, `code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2152 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for terminalvideoproperty
-- ----------------------------
DROP TABLE IF EXISTS `terminalvideoproperty`;
CREATE TABLE `terminalvideoproperty`  (
  `baseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `audioChannelNum` tinyint(4) NOT NULL,
  `audioEcnoderType` tinyint(4) NOT NULL,
  `audioFrameLength` smallint(6) NOT NULL,
  `audioFrequence` tinyint(4) NOT NULL,
  `audioSampleBitNum` tinyint(4) NOT NULL,
  `commandId` bigint(20) NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `maxAudioChannelNum` tinyint(4) NOT NULL,
  `maxVideoChannelNum` tinyint(4) NOT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supportAudio` tinyint(4) NOT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `videoEcnoderType` tinyint(4) NOT NULL,
  PRIMARY KEY (`baseId`) USING BTREE,
  UNIQUE INDEX `baseId`(`baseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v1` bigint(100) NULL DEFAULT NULL,
  `v2` int(100) NULL DEFAULT NULL,
  `v3` decimal(65, 0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for track
-- ----------------------------
DROP TABLE IF EXISTS `track`;
CREATE TABLE `track`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '里程备注名称',
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SimNO',
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `startTime` datetime(0) NULL DEFAULT NULL COMMENT '行程的开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '行程的结束时间',
  `startlocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行程的开始位置',
  `startlatitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '开始纬度',
  `startlongitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '开始经度',
  `endlocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束位置',
  `endlatitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '结束纬度',
  `endlongitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '结束经度',
  `mileage` decimal(10, 4) NULL DEFAULT NULL COMMENT '这段行程的里程',
  `perfuel` decimal(10, 4) NULL DEFAULT NULL COMMENT '百公里油耗',
  `driverfuel` decimal(10, 4) NULL DEFAULT NULL COMMENT '行驶油耗',
  `allfuel` decimal(10, 4) NULL DEFAULT NULL COMMENT '总油耗',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `depId` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `userId` int(11) NULL DEFAULT NULL COMMENT '创建用户id',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `mileageadjustment` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '当时的里程调整',
  `speed` int(11) NULL DEFAULT 1 COMMENT '当时时速',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轨迹里程记录,用户选择起始和终点进行计算里程和油耗' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `deadlock_id` int(11) NOT NULL DEFAULT 0,
  `transaction_active_time` int(11) NOT NULL DEFAULT 0,
  `tables_in_use` int(11) NOT NULL DEFAULT 0,
  `tables_locked` int(11) NOT NULL DEFAULT 0,
  `row_locks` int(11) NOT NULL DEFAULT 0,
  `thread_id` int(11) NOT NULL DEFAULT 0,
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `db` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `success` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_transactions_on_deadlock_id_and_created_at`(`deadlock_id`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transfer_module
-- ----------------------------
DROP TABLE IF EXISTS `transfer_module`;
CREATE TABLE `transfer_module`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `tranfer_type` int(3) NOT NULL COMMENT '转发类型(0:TTS;1:短信;2:微信;3:钉钉)',
  `tranfer_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '自定义转发信息(您已超速|#key|分钟)',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `tranfer_type`(`tranfer_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '报警规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transfer_rule
-- ----------------------------
DROP TABLE IF EXISTS `transfer_rule`;
CREATE TABLE `transfer_rule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `topic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'kafka消息组',
  `rule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '报警规则',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否启用 1为启用',
  `aim_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '定制类型0全部1针对部分设备',
  `aim_dep` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '机构ID组，以‘,’分隔',
  `aim_sim` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '被制定规则的sim',
  `started_at` datetime(0) NULL DEFAULT NULL COMMENT '规则开始时间',
  `ended_at` datetime(0) NULL DEFAULT NULL COMMENT '规则结束时间',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `tranfer_type` int(3) NOT NULL COMMENT '转发类型(0:TTS;1:短信;2:微信;3:钉钉;4:kafka)',
  `tranfer_status` int(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '转发内容0:源数据,1：指定消息，2：模板消息\n',
  `tranfer_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '自定义转发信息',
  `template_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '报警规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for triggers
-- ----------------------------
DROP TABLE IF EXISTS `triggers`;
CREATE TABLE `triggers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `filter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `transform` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `registrationId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `createdAt` timestamp(0) NULL DEFAULT NULL,
  `updatedAt` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unknowsimno
-- ----------------------------
DROP TABLE IF EXISTS `unknowsimno`;
CREATE TABLE `unknowsimno`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `simNo`(`simNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213691919 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '未知simNo表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for up_down_states
-- ----------------------------
DROP TABLE IF EXISTS `up_down_states`;
CREATE TABLE `up_down_states`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `start_or_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_up_down_states_on_connection_id_and_created_at`(`connection_id`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_authorization
-- ----------------------------
DROP TABLE IF EXISTS `user_authorization`;
CREATE TABLE `user_authorization`  (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `bind_userid` int(11) NOT NULL COMMENT '绑定的用户',
  PRIMARY KEY (`userid`, `bind_userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户授权绑定信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_connection_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_connection_groups`;
CREATE TABLE `user_connection_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `connection_group_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_connection_groups_on_connection_group_id`(`connection_group_id`) USING BTREE,
  INDEX `idx_user_connection_groups_on_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_filter_profiles
-- ----------------------------
DROP TABLE IF EXISTS `user_filter_profiles`;
CREATE TABLE `user_filter_profiles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filter_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_filter_profiles_on_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_preferences
-- ----------------------------
DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `process_list` int(11) NULL DEFAULT 5,
  `deadlock` int(11) NULL DEFAULT 5,
  `dashboard_filter_shown` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '[\"status_bar\", \"cpu_usage_percentage\", \"memory_usage_percentage\", \"connections_total\", \"query_rate\", \"db_sizes_total\", \"statement_rw\", \"network_io\"]',
  `dashboard_filter_sort_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'severity',
  `dashboard_filter_group` int(11) NULL DEFAULT 0,
  `dashboard_custom_order` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_preferences_on_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_sessions
-- ----------------------------
DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE `user_sessions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_sessions_on_user_session_id`(`user_session_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_vehicle_ref
-- ----------------------------
DROP TABLE IF EXISTS `user_vehicle_ref`;
CREATE TABLE `user_vehicle_ref`  (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `vehicle_id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_vehicle_id`(`vehicle_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户车辆权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for useralarmpopup
-- ----------------------------
DROP TABLE IF EXISTS `useralarmpopup`;
CREATE TABLE `useralarmpopup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `alarmType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报警类型',
  `isuse` bit(1) NULL DEFAULT NULL COMMENT '是否启用弹窗',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33926 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户报警弹窗' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userdepartment
-- ----------------------------
DROP TABLE IF EXISTS `userdepartment`;
CREATE TABLE `userdepartment`  (
  `userId` int(11) NOT NULL,
  `depId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `depId`) USING BTREE,
  INDEX `FK23CDD59D2BB198BE`(`depId`) USING BTREE,
  INDEX `FK23CDD59D5D8DBDC1`(`userId`) USING BTREE,
  INDEX `FK23CDD59D57D809EB`(`depId`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for userdriverinfo
-- ----------------------------
DROP TABLE IF EXISTS `userdriverinfo`;
CREATE TABLE `userdriverinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `driverId` int(11) NULL DEFAULT NULL COMMENT '驾驶员主键',
  `createdate` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_useridanddriverid`(`userid`, `driverId`) USING BTREE,
  INDEX `index_userid`(`userid`) USING BTREE,
  INDEX `index_driverid`(`driverId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户司机绑定关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usergpsinfo
-- ----------------------------
DROP TABLE IF EXISTS `usergpsinfo`;
CREATE TABLE `usergpsinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accuracy` double NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `direction` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `velocity` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usergpsrealdata
-- ----------------------------
DROP TABLE IF EXISTS `usergpsrealdata`;
CREATE TABLE `usergpsrealdata`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accuracy` double NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `direction` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` double NOT NULL,
  `sendTime` datetime(0) NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `velocity` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NOT NULL DEFAULT 0 COMMENT '所属企业Id',
  `loginName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mapCenterLat` double NOT NULL,
  `mapCenterLng` double NOT NULL,
  `mapLevel` int(11) NOT NULL,
  `mapType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginTime` datetime(0) NULL DEFAULT NULL,
  `phoneNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `bindingIp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startExpireTime` datetime(0) NULL DEFAULT NULL COMMENT '账号开始的有效期',
  `endExpireTime` datetime(0) NULL DEFAULT NULL COMMENT '账号结束的有效期',
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9376 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userpreference
-- ----------------------------
DROP TABLE IF EXISTS `userpreference`;
CREATE TABLE `userpreference`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `maxAudioListeningTime` int(11) NOT NULL,
  `maxVideoPreviewTime` int(11) NOT NULL,
  `streamType` int(11) NOT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  `videoDataType` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userprofile
-- ----------------------------
DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE `userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ownerId` int(11) NOT NULL COMMENT '用户id',
  `isvoice` bit(1) NULL DEFAULT b'0' COMMENT '是否报警声音',
  `iswindow` bit(1) NULL DEFAULT b'1' COMMENT '是否弹窗',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniuserid`(`ownerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户配置（暂时是声音和弹窗）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `authorizationType` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `FKF3F76701B850FE09`(`roleId`) USING BTREE,
  INDEX `FKF3F767015D8DBDC1`(`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色绑定关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `password_digest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auth_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'internal',
  `country_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT 3,
  `tutorial1` int(11) NULL DEFAULT 0,
  `tutorial2` int(11) NULL DEFAULT 0,
  `tutorial3` int(11) NULL DEFAULT 0,
  `country_code_iso2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `language` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'en',
  `should_show_trial_expired_bar` tinyint(1) NOT NULL DEFAULT 1,
  `should_show_activate_tokens_popover` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_users_on_email`(`email`) USING BTREE,
  INDEX `idx_users_on_login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for uservehicle
-- ----------------------------
DROP TABLE IF EXISTS `uservehicle`;
CREATE TABLE `uservehicle`  (
  `userId` int(11) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `vehicleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle`  (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyTime` datetime(0) NULL DEFAULT NULL,
  `depId` int(11) NOT NULL DEFAULT 0,
  `depName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `driverMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gpsTerminalType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `installDate` datetime(0) NULL DEFAULT NULL,
  `lastCheckTime` datetime(0) NULL DEFAULT NULL,
  `memberId` int(11) NOT NULL DEFAULT 0,
  `monitor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monitorMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `motorID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `offlineTime` datetime(0) NULL DEFAULT NULL,
  `onlineTime` datetime(0) NULL DEFAULT NULL,
  `operPermit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateColor` int(11) NOT NULL DEFAULT 0,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `routes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `runStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `termId` int(12) NOT NULL DEFAULT 0,
  `useType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoDeviceId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endDate` datetime(0) NULL DEFAULT NULL,
  `startDate` datetime(0) NULL DEFAULT NULL,
  `workHour` decimal(12, 2) NULL DEFAULT 0.00,
  `buyDate` datetime(0) NULL DEFAULT NULL,
  `engineNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `frameNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manufacture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modelNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `videoChannelNum` int(11) NOT NULL DEFAULT 0,
  `UserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VideoDataType` int(11) NULL DEFAULT NULL,
  `ChannelId` int(11) NULL DEFAULT NULL,
  `videoDisk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoChannelNames` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flowRateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `vehiclePassWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '123456',
  `superTransType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级平台的营运类型代码    (必填)	  字典维护',
  `seatingCapacity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '吨（座）位',
  `transserialno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道路运输证号',
  `routeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营运线路',
  `serviceStartDate` datetime(0) NULL DEFAULT NULL COMMENT '服务开始时间',
  `serviceEndDate` datetime(0) NULL DEFAULT NULL COMMENT '服务结束时间',
  `mileageAdjustment` double NULL DEFAULT NULL COMMENT '里程调整',
  `fuelConsumption` double NULL DEFAULT NULL COMMENT '百公里油耗',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updateStaff` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `createStaff` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `vehicleManufacturer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆厂商',
  `inLineDate` datetime(0) NULL DEFAULT NULL,
  `synchronizedDate` datetime(0) NULL DEFAULT NULL COMMENT '同步时间',
  PRIMARY KEY (`vehicleId`) USING BTREE,
  UNIQUE INDEX `uni_simNo_del`(`simNo`, `deleted`) USING BTREE,
  INDEX `SimNo`(`simNo`) USING BTREE,
  INDEX `PlateNo`(`plateNo`) USING BTREE,
  INDEX `termId`(`termId`) USING BTREE,
  INDEX `index_depId`(`depId`) USING BTREE,
  INDEX `index_deleted`(`deleted`) USING BTREE,
  INDEX `plateColor`(`plateColor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 446050 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车辆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicle_converter_809
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_converter_809`;
CREATE TABLE `vehicle_converter_809`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆id',
  `configId` int(11) NULL DEFAULT NULL COMMENT '809配置id',
  `cPlateNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转换车牌号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_veh_con_index`(`vehicleId`, `configId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '809车牌号转换配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicle_ext
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_ext`;
CREATE TABLE `vehicle_ext`  (
  `extId` int(11) NOT NULL AUTO_INCREMENT,
  `vc1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务期限',
  `vc2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆型号',
  `vc3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接入类型',
  `vc4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆运营状态',
  `vc5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总质量(kg)',
  `vc6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '准牵引总质量(kg)',
  `vc7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外廓尺寸-长(mm)',
  `vc8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外廓尺寸-宽(mm)',
  `vc9` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外廓尺寸-高(mm)',
  `vc10` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轴数',
  `vc11` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮胎数',
  `vc12` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮胎规格',
  `vc13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营范围',
  `vc14` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车身颜色',
  `vc15` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道路运输经营许可证号',
  `vc16` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆购置方式',
  `cv17` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用单价（元）',
  `vc18` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆品牌',
  `vc19` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机验证状态',
  `vc20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '燃料种类',
  `vc21` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货厢内部尺寸-长(mm)',
  `vc22` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货厢内部尺寸-宽(mm)',
  `vc23` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货厢内部尺寸-高(mm)',
  `vc24` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检验有效期至',
  `vc25` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执照上传数',
  `vc26` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发动机号',
  `vc27` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发动机型号',
  `vc28` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆识别代码/车架号',
  `dt1` datetime(0) NULL DEFAULT NULL COMMENT '车辆出厂日期',
  `dt2` datetime(0) NULL DEFAULT NULL COMMENT '车辆保险到期时间',
  `dt3` datetime(0) NULL DEFAULT NULL COMMENT '首次上线时间',
  `dt4` datetime(0) NULL DEFAULT NULL COMMENT '服务合同到期时间',
  `dt5` datetime(0) NULL DEFAULT NULL COMMENT '行驶证发证日期',
  `vehicleId` int(11) NOT NULL COMMENT '车辆ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '删除标志',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `vc40` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机验证状态',
  `vc41` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '燃料种类',
  `vc42` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '核发机关',
  `vc43` datetime(0) NULL DEFAULT NULL COMMENT '发证日期',
  `vc44` datetime(0) NULL DEFAULT NULL COMMENT '证件有效期',
  `vc45` datetime(0) NULL DEFAULT NULL COMMENT '年审日期',
  `vc46` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆尺寸',
  `vc47` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营范围代码',
  PRIMARY KEY (`extId`) USING BTREE,
  INDEX `vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31495 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicle_type
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_type`;
CREATE TABLE `vehicle_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` int(11) NOT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码对应名称',
  `parent_id` int(11) NOT NULL COMMENT '上一级Id',
  `create_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicleinfomodifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `vehicleinfomodifyrecord`;
CREATE TABLE `vehicleinfomodifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2470 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicleonlinerate
-- ----------------------------
DROP TABLE IF EXISTS `vehicleonlinerate`;
CREATE TABLE `vehicleonlinerate`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intervalType` int(11) NOT NULL,
  `offlineTime` double NOT NULL,
  `onlineRate` double NOT NULL,
  `onlineTime` double NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staticDate` datetime(0) NULL DEFAULT NULL,
  `totalTime` double NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6930426 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicleoperationlog
-- ----------------------------
DROP TABLE IF EXISTS `vehicleoperationlog`;
CREATE TABLE `vehicleoperationlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作详情',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `vehicleId` int(11) NOT NULL COMMENT '车辆主键',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `logdateindex`(`createDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1037 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicleosd
-- ----------------------------
DROP TABLE IF EXISTS `vehicleosd`;
CREATE TABLE `vehicleosd`  (
  `osdId` bigint(20) NOT NULL AUTO_INCREMENT,
  `osdType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `posType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  PRIMARY KEY (`osdId`) USING BTREE,
  UNIQUE INDEX `osdId`(`osdId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehiclephoto
-- ----------------------------
DROP TABLE IF EXISTS `vehiclephoto`;
CREATE TABLE `vehiclephoto`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicleid` int(11) NULL DEFAULT NULL COMMENT '车辆主键',
  `driverlicensefrontimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶证(正本)',
  `driverlicensebackimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驾驶证(副本)',
  `transportationimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运输证',
  `carbodyfrontimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车身正面',
  `carbodyfortyfiveimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车身45度',
  `carbodysideimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车身侧面',
  `carbodybackimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车身(尾部)',
  `baodanjqx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保单(交强险)',
  `baodansyx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保单(商业险)',
  `createdate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatedate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_vehicleId`(`vehicleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆保存的唯一照片 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehiclerecorder
-- ----------------------------
DROP TABLE IF EXISTS `vehiclerecorder`;
CREATE TABLE `vehiclerecorder`  (
  `RecorderId` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `altitude` double NOT NULL,
  `cmd` int(11) NOT NULL,
  `cmdData` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commandId` int(11) NOT NULL,
  `driverLicense` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `sortId` int(11) NOT NULL,
  `speed` double NOT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `vehicleId` int(11) NOT NULL,
  `signalState` tinyint(4) NOT NULL,
  PRIMARY KEY (`RecorderId`) USING BTREE,
  UNIQUE INDEX `RecorderId`(`RecorderId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 457 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicleregisterinfo
-- ----------------------------
DROP TABLE IF EXISTS `vehicleregisterinfo`;
CREATE TABLE `vehicleregisterinfo`  (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆id',
  `depId` int(11) NOT NULL COMMENT '部门id',
  `plateColor` int(11) NOT NULL COMMENT '车牌颜色',
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `plateformId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台唯一编码',
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端SIM卡电话号码',
  `terminalId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端编号',
  `terminalModel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端型号',
  `terminalVendorId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端厂商唯一编码',
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `submitDate` datetime(0) NULL DEFAULT NULL COMMENT '注册信息提交时间',
  PRIMARY KEY (`vehicleId`) USING BTREE,
  UNIQUE INDEX `vehicleId`(`vehicleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 446003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicleregisterinfo_log
-- ----------------------------
DROP TABLE IF EXISTS `vehicleregisterinfo_log`;
CREATE TABLE `vehicleregisterinfo_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vehicleId` int(11) NULL DEFAULT NULL COMMENT '车辆id',
  `depId` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `plateColor` int(11) NULL DEFAULT NULL COMMENT '车牌颜色',
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `plateformId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台唯一编码',
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端SIM卡电话号码',
  `terminalId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端编号',
  `terminalModel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端型号',
  `terminalVendorId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终端厂商唯一编码',
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1174389 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '注册信息日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehiclestateicon
-- ----------------------------
DROP TABLE IF EXISTS `vehiclestateicon`;
CREATE TABLE `vehiclestateicon`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NULL DEFAULT 0,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT b'0',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `defaultVehicleType` tinyint(1) NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vespeedlimt
-- ----------------------------
DROP TABLE IF EXISTS `vespeedlimt`;
CREATE TABLE `vespeedlimt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'simNo',
  `speedlimit` int(11) NULL DEFAULT NULL COMMENT '限速值',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQUE_SIMNO`(`simno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 377 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆限速值存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for videochannel
-- ----------------------------
DROP TABLE IF EXISTS `videochannel`;
CREATE TABLE `videochannel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channelNo` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` int(11) NOT NULL,
  `vehicleId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for videodatausagedetail
-- ----------------------------
DROP TABLE IF EXISTS `videodatausagedetail`;
CREATE TABLE `videodatausagedetail`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channelId` int(11) NOT NULL,
  `dataUsage` int(11) NOT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `totalTime` double NOT NULL,
  `usageType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41392 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for videofileitem
-- ----------------------------
DROP TABLE IF EXISTS `videofileitem`;
CREATE TABLE `videofileitem`  (
  `baseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `alarmStatus` bigint(20) NOT NULL,
  `channelId` tinyint(4) NOT NULL,
  `commandId` bigint(20) NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `dataType` tinyint(4) NOT NULL,
  `endDate` datetime(0) NULL DEFAULT NULL,
  `fileLength` bigint(11) NOT NULL,
  `startDate` datetime(0) NULL DEFAULT NULL,
  `storeType` tinyint(4) NOT NULL,
  `streamType` tinyint(4) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `filePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadDate` datetime(0) NULL DEFAULT NULL,
  `SimNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude1` double NOT NULL,
  `latitude2` double NOT NULL,
  `longitude1` double NOT NULL,
  `longitude2` double NOT NULL,
  `fileUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器URL',
  `downname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载文件名',
  `playname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '播放文件名',
  PRIMARY KEY (`baseId`) USING BTREE,
  UNIQUE INDEX `baseId`(`baseId`) USING BTREE,
  INDEX `index_commandId`(`commandId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 276414 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for videomp4keyframe
-- ----------------------------
DROP TABLE IF EXISTS `videomp4keyframe`;
CREATE TABLE `videomp4keyframe`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `keyFrames` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mp4FilePath` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 388 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for videorequest
-- ----------------------------
DROP TABLE IF EXISTS `videorequest`;
CREATE TABLE `videorequest`  (
  `baseId` bigint(20) NOT NULL AUTO_INCREMENT,
  `channelId` int(11) NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `mediaType` int(11) NOT NULL,
  `sessionId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` datetime(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `streamType` int(11) NOT NULL,
  `updateDate` datetime(0) NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` datetime(0) NULL DEFAULT NULL,
  `flow1` double NOT NULL COMMENT '开始流量',
  `flow2` double NOT NULL COMMENT '结束流量',
  `flow` double NOT NULL COMMENT '使用流量',
  PRIMARY KEY (`baseId`) USING BTREE,
  UNIQUE INDEX `baseId`(`baseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61765 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户播放情况表（流量和播放统计表）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for videoserverconfig
-- ----------------------------
DROP TABLE IF EXISTS `videoserverconfig`;
CREATE TABLE `videoserverconfig`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ftpPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftpPort` int(11) NOT NULL,
  `ftpPortout` int(11) NULL DEFAULT NULL,
  `ftpServerIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rtmpPort` int(11) NOT NULL,
  `rtmpPortout` int(11) NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoServerIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoServerTcpPort` int(11) NOT NULL,
  `videoServerTcpPortout` int(11) NULL DEFAULT NULL,
  `videoServerUdpPort` int(11) NOT NULL,
  `videoServerUdpPortout` int(11) NULL DEFAULT NULL,
  `ftpPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftpUserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `httpPort` int(11) NOT NULL,
  `httpPortout` int(11) NULL DEFAULT NULL,
  `httpServerIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actionOnDiskFull` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `diskCapacity` int(11) NOT NULL,
  `minAvailableCapacity` int(11) NOT NULL,
  `videoConnectionIdleTime` int(11) NOT NULL,
  `webIdleTime` int(11) NOT NULL,
  `ffmpegPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendVideoChannelStatus` bit(1) NULL DEFAULT b'0',
  `videoServerPlaybckTcpPort` int(11) NOT NULL,
  `broadcastTcpPort` int(11) NOT NULL,
  `broadcastTcpPortout` int(11) NULL DEFAULT NULL,
  `talkTcpPort` int(11) NOT NULL,
  `talkTcpPortout` int(11) NULL DEFAULT NULL,
  `videoServer809TcpPort` int(11) NOT NULL,
  `videoServer809TcpPortout` int(11) NULL DEFAULT NULL,
  `videoServerPlaybackTcpPort` int(11) NOT NULL,
  `videoServerPlaybackTcpPortout` int(11) NULL DEFAULT NULL,
  `ftpHttpUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ftp对应的服务器Url',
  `videoServer809RtmpTcpPortout` int(11) NULL DEFAULT NULL,
  `videoServer809RtmpTcpPort` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for warnmsgurgtodoreq
-- ----------------------------
DROP TABLE IF EXISTS `warnmsgurgtodoreq`;
CREATE TABLE `warnmsgurgtodoreq`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ackTime` datetime(0) NULL DEFAULT NULL,
  `plateColor` int(11) NOT NULL,
  `plateNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `result` int(11) NOT NULL,
  `supervicsionId` int(11) NOT NULL,
  `supervisionEndtime` datetime(0) NULL DEFAULT NULL,
  `supervisionLevel` int(11) NOT NULL,
  `supervisor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supervisorEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supervisorTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicleId` int(11) NULL DEFAULT NULL,
  `warnSrc` int(11) NOT NULL,
  `warnTime` datetime(0) NULL DEFAULT NULL,
  `warnType` int(11) NOT NULL,
  `companyId` int(11) NULL DEFAULT 0,
  `platformId` int(11) NULL DEFAULT NULL COMMENT '平台接入码',
  `govIp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7602 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_route_config
-- ----------------------------
DROP TABLE IF EXISTS `web_route_config`;
CREATE TABLE `web_route_config`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id值',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由地址',
  `orders` int(10) NULL DEFAULT 0 COMMENT '排序',
  `path_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由路径',
  `fliter_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过滤器名称',
  `flag` int(1) NULL DEFAULT 1 COMMENT '是否有效 1表示有效，0表示无效',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_id`(`id`) USING BTREE COMMENT '主键唯一约束'
) ENGINE = InnoDB AUTO_INCREMENT = 230 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '路由配置中心表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for addTwo
-- ----------------------------
DROP PROCEDURE IF EXISTS `addTwo`;
delimiter ;;
CREATE PROCEDURE `addTwo`()
BEGIN
	DECLARE _Done INT DEFAULT(0);
	DECLARE _roleId BIGINT(20);
	
	DECLARE rs CURSOR FOR
	SELECT
	  role_id
	FROM
	  rolefunc
	WHERE sys_func_id IN (
		'1000882',
		'1000883',
		'1000884',
		'1000885',
		'1000886',
		'1000887',
		'1000888',
		'1000889',
		'1000890',
		'1000891',
		'1000899'
	  )
	GROUP BY role_id;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET _Done = 1;
	OPEN rs;
	FETCH next FROM rs INTO _roleId;
	REPEAT
		IF NOT _Done THEN
			INSERT INTO rolefunc(role_id, sys_func_id) VALUES(_roleId,'1000881');
		END IF;
	FETCH next FROM rs INTO _roleId;
UNTIL _Done END REPEAT;
CLOSE rs;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for getGpsDistance
-- ----------------------------
DROP FUNCTION IF EXISTS `getGpsDistance`;
delimiter ;;
CREATE FUNCTION `getGpsDistance`(`lng1` double,`lat1` double,`lng2` double,`lat2` double)
 RETURNS double
BEGIN
	
  RETURN round(6378.138*2*asin(sqrt(pow(sin( (lat1*pi()/180-lat2*pi()/180)/2),2)+cos(lat1*pi()/180)*cos(lat2*pi()/180)* pow(sin( (lng1*pi()/180-lng2*pi()/180)/2),2)))*1000);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for isInArea
-- ----------------------------
DROP FUNCTION IF EXISTS `isInArea`;
delimiter ;;
CREATE FUNCTION `isInArea`(`lng` double,`lat` double,`mapType` varchar(20),`radius` double,`strPoints` varchar(2500))
 RETURNS int(1)
BEGIN
  IF ( mapType = 'circle' ) THEN
     RETURN isInCircle(lng, lat, radius, strPoints);  
  ELSE
     RETURN isInPolygon(lng, lat, strPoints);
  END IF;
	RETURN 0;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for isInCircle
-- ----------------------------
DROP FUNCTION IF EXISTS `isInCircle`;
delimiter ;;
CREATE FUNCTION `isInCircle`(`lng` double,`lat` double,`radius` double,`strPoint` varchar(2500))
 RETURNS int(1)
BEGIN
	DECLARE lng1 DOUBLE;
	DECLARE lat1 DOUBLE;
  DECLARE result INT(1) DEFAULT 0;  
  SET lng1 = SUBSTRING_INDEX(strPoint,',',1)+0;
  SET lat1 = SUBSTRING_INDEX(strPoint,',',-1)+0;
  IF ( getGpsDistance(lng,lat,lng1,lat1) <= radius ) THEN
     SET result = 1;  
  END IF;
	RETURN result;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for isInPolygon
-- ----------------------------
DROP FUNCTION IF EXISTS `isInPolygon`;
delimiter ;;
CREATE FUNCTION `isInPolygon`(`lng` double,`lat` double,`strPoints` varchar(2550))
 RETURNS int(1)
  COMMENT '判断点是否在多边形中；\r\nstrPoints是多边形顶点字符串组织的规则必须是最后一个点和第一个点是重复的，lng1,lat1;'
BEGIN
	DECLARE strPolygon VARCHAR(550);
	DECLARE strPoint VARCHAR(50);
  DECLARE result INT(1);
  SET strPolygon = REPLACE(strPoints,',',' ');
  SET strPolygon = REPLACE(strPolygon,';',',');
  SET strPolygon = CONCAT('POLYGON((', strPolygon, '))');
  SET strPoint = CONCAT('POINT(', lng, ' ', lat, ')');
  SET result = MBRContains(GeomFromText(strPolygon), GeomFromText(strPoint));
	RETURN result;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for looppc
-- ----------------------------
DROP PROCEDURE IF EXISTS `looppc`;
delimiter ;;
CREATE PROCEDURE `looppc`()
begin
 DECLARE alarmid int(11);
  DECLARE done BOOLEAN DEFAULT 0;
DECLARE cur CURSOR FOR select id from alarmconfig;
DECLARE depcur CURSOR FOR select depId from department;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
OPEN cur;
  read_loop:LOOP
	FETCH cur INTO alarmid;
	select alarmid	;
	 IF done THEN
	   LEAVE read_loop;
		 END IF;	
	END LOOP;
	 CLOSE cur;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
