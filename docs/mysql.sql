-- ----------------------------
-- Table structure for magic_api_file
-- ----------------------------
DROP TABLE IF EXISTS `magic_api_file`;
CREATE TABLE `magic_api_file`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of magic_api_file
-- ----------------------------
INSERT INTO `magic_api_file` VALUES (1, '/magic-api/function/', 'this is directory');
INSERT INTO `magic_api_file` VALUES (2, '/magic-api/backups/', 'this is directory');
INSERT INTO `magic_api_file` VALUES (3, '/magic-api/api/', 'this is directory');
INSERT INTO `magic_api_file` VALUES (4, '/magic-api/datasource/', 'this is directory');
INSERT INTO `magic_api_file` VALUES (5, '/magic-api/api/测试/', 'this is directory');
INSERT INTO `magic_api_file` VALUES (6, '/magic-api/api/测试/group.json', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"type\" : \"1\",\r\n  \"parentId\" : \"0\",\r\n  \"path\" : \"/test\",\r\n  \"paths\" : [ ],\r\n  \"options\" : [ ]\r\n}');
INSERT INTO `magic_api_file` VALUES (7, '/magic-api/api/测试/测试.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626234292579,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626234292037,\\n    \\\"executeTime\\\": 4\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626234292037,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 4,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (8, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/', 'this is directory');
INSERT INTO `magic_api_file` VALUES (9, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626230174432.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626230174401,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": -1,\\n    \\\"message\\\": \\\"系统内部出现错误\\\",\\n    \\\"data\\\": null,\\n    \\\"timestamp\\\": 1626230050583,\\n    \\\"executeTime\\\": 16\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : -1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"系统内部出现错误\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : null,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626230050583,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 16,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (10, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626230212700.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626230212689,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626230174461,\\n    \\\"executeTime\\\": 9\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626230174461,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 9,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (11, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626230213467.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626230213458,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626230212728,\\n    \\\"executeTime\\\": 6\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626230212728,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 6,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (12, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626230618502.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626230618488,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626230474870,\\n    \\\"executeTime\\\": 4\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626230474870,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 4,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (13, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626230626710.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626230626700,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626230618541,\\n    \\\"executeTime\\\": 4\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626230618541,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 4,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (14, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626234291301.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626234291285,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626234290050,\\n    \\\"executeTime\\\": 4\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626234290050,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 4,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (15, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626234292009.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626234292003,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626234291335,\\n    \\\"executeTime\\\": 6\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626234291335,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 6,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');
INSERT INTO `magic_api_file` VALUES (16, '/magic-api/backups/c5f98456036146a7bd0aeabe682b8572/1626234292590.ms', '{\r\n  \"properties\" : { },\r\n  \"id\" : \"c5f98456036146a7bd0aeabe682b8572\",\r\n  \"script\" : null,\r\n  \"groupId\" : \"a1c38ba0980a4c7cb07e2a2005a7ae72\",\r\n  \"name\" : \"测试\",\r\n  \"createTime\" : null,\r\n  \"updateTime\" : 1626234292579,\r\n  \"method\" : \"GET\",\r\n  \"path\" : \"/\",\r\n  \"parameters\" : [ ],\r\n  \"option\" : \"[]\",\r\n  \"requestBody\" : \"{\\r\\n\\t\\r\\n}\",\r\n  \"headers\" : [ ],\r\n  \"paths\" : [ ],\r\n  \"responseBody\" : \"{\\n    \\\"code\\\": 1,\\n    \\\"message\\\": \\\"success\\\",\\n    \\\"data\\\": {\\n        \\\"name\\\": \\\"李富贵\\\"\\n    },\\n    \\\"timestamp\\\": 1626234292037,\\n    \\\"executeTime\\\": 4\\n}\",\r\n  \"description\" : null,\r\n  \"requestBodyDefinition\" : null,\r\n  \"responseBodyDefinition\" : {\r\n    \"name\" : \"\",\r\n    \"value\" : \"\",\r\n    \"description\" : \"\",\r\n    \"required\" : false,\r\n    \"dataType\" : \"Object\",\r\n    \"type\" : null,\r\n    \"defaultValue\" : null,\r\n    \"validateType\" : \"\",\r\n    \"error\" : \"\",\r\n    \"expression\" : \"\",\r\n    \"children\" : [ {\r\n      \"name\" : \"code\",\r\n      \"value\" : 1,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"message\",\r\n      \"value\" : \"success\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"String\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"data\",\r\n      \"value\" : \"\",\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Object\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ {\r\n        \"name\" : \"name\",\r\n        \"value\" : \"李富贵\",\r\n        \"description\" : \"\",\r\n        \"required\" : false,\r\n        \"dataType\" : \"String\",\r\n        \"type\" : null,\r\n        \"defaultValue\" : null,\r\n        \"validateType\" : \"\",\r\n        \"error\" : \"\",\r\n        \"expression\" : \"\",\r\n        \"children\" : [ ]\r\n      } ]\r\n    }, {\r\n      \"name\" : \"timestamp\",\r\n      \"value\" : 1626234292037,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Long\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    }, {\r\n      \"name\" : \"executeTime\",\r\n      \"value\" : 4,\r\n      \"description\" : \"\",\r\n      \"required\" : false,\r\n      \"dataType\" : \"Integer\",\r\n      \"type\" : null,\r\n      \"defaultValue\" : null,\r\n      \"validateType\" : \"\",\r\n      \"error\" : \"\",\r\n      \"expression\" : \"\",\r\n      \"children\" : [ ]\r\n    } ]\r\n  },\r\n  \"optionMap\" : { }\r\n}\r\n================================\r\nreturn {\r\n    \"name\" : \"李富贵\"\r\n}');

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记住密码' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('admin', 'ZpyMW79hiJr6Zcu7JFoDrQ==', 'czWl40bpejWbJqW23I21cQ==', '2021-07-14 11:44:35');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别',
  `age` tinyint(2) NULL DEFAULT 0 COMMENT '年龄',
  `user_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '用户类别[0:管理员,1:普通员工]',
  `organization_id` int(11) NULL DEFAULT NULL COMMENT '组织id',
  `locked` tinyint(2) NULL DEFAULT 0 COMMENT '是否锁定[0:正常,1:锁定]',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态[0:失效,1:正常]',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_admin_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', '$2a$11$VzpOQ9qEgqD3O2suUJ1ZVuD6IEkUr5DPeRHk0fwx1TO0Iv9zBTOtC', '管理员', '596392912@qq.com', '15321111111', 0, 0, 0, 1, 0, 1, '2018-01-30 10:08:41', '2018-04-16 14:59:38');
INSERT INTO `t_admin` VALUES (2, 'test', '$2a$11$VzpOQ9qEgqD3O2suUJ1ZVuD6IEkUr5DPeRHk0fwx1TO0Iv9zBTOtC', '测试', '596392912@qq.com', NULL, 0, 0, 1, 6, 0, 1, '2018-03-28 04:26:31', '2018-04-14 23:21:52');

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `admin_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_role_ids`(`admin_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES (74, 1, 1);
INSERT INTO `t_admin_role` VALUES (75, 1, 2);
INSERT INTO `t_admin_role` VALUES (76, 1, 7);
INSERT INTO `t_admin_role` VALUES (77, 1, 8);
INSERT INTO `t_admin_role` VALUES (79, 2, 8);
INSERT INTO `t_admin_role` VALUES (63, 13, 2);
INSERT INTO `t_admin_role` VALUES (64, 14, 7);
INSERT INTO `t_admin_role` VALUES (53, 15, 8);

-- ----------------------------
-- Table structure for t_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织名',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `icon_cls` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态[0:失效,1:正常]',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_organization
-- ----------------------------
INSERT INTO `t_organization` VALUES (1, '总经办', '王家桥', '01', 'glyphicon-apple', 3, 0, 1, '2014-02-19 01:00:00', '2021-05-12 11:13:15');
INSERT INTO `t_organization` VALUES (3, '技术部', '', '02', 'glyphicon-heart', NULL, 1, 1, '2015-10-01 13:10:42', '2018-04-14 16:30:15');
INSERT INTO `t_organization` VALUES (5, '产品部', '保利麓谷林语C区5栋', '03', 'glyphicon-glass', 3, 2, 0, '2015-12-06 12:15:30', '2021-04-17 17:51:00');
INSERT INTO `t_organization` VALUES (6, '测试组', '', '04', 'glyphicon-retweet ', 3, 0, 1, '2015-12-06 13:12:18', '2018-03-24 04:33:21');

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `permissions` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源的权限',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源介绍',
  `icon_cls` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源图标',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态[0:失效,1:正常]',
  `opened` tinyint(1) NOT NULL DEFAULT 0 COMMENT '打开状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '资源类别',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 247 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES (1, '权限管理', '', '', NULL, '系统管理', 'glyphicon-th ', NULL, 0, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (11, '资源管理', '', '/resource/manager', 'ajax', '资源管理', 'glyphicon-list-alt', 1, 1, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (12, '角色管理', '', '/role/manager', 'ajax', '角色管理', 'glyphicon-lock', 1, 2, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (13, '用户管理', '', '/admin/manager', 'ajax', '用户管理', 'glyphicon-user', 1, 3, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (14, '部门管理', '', '/organization/manager', 'ajax', '部门管理', 'glyphicon-globe', 1, 4, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (111, '列表', '', '/resource/treeGrid', 'ajax', '资源列表', 'glyphicon-th-list', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (112, '添加', 'resource:add', '/resource/add', 'ajax', '资源添加', 'glyphicon-plus', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (113, '编辑', 'resource:edit', '/resource/edit', 'ajax', '资源编辑', 'glyphicon-pencil', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (114, '删除', 'resource:delete', '/resource/delete', 'ajax', '资源删除', 'glyphicon-remove', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (121, '列表', '', '/role/dataGrid', 'ajax', '角色列表', 'glyphicon-th-list', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (122, '添加', 'role:add', '/role/add', 'ajax', '角色添加', 'glyphicon-plus', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (123, '编辑', 'role:edit', '/role/edit', 'ajax', '角色编辑', 'glyphicon-pencil', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (124, '删除', 'role:delete', '/role/delete', 'ajax', '角色删除', 'glyphicon-remove', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (125, '授权', 'role:grant', '/role/grant', 'ajax', '角色授权', 'glyphicon-ok ', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (131, '列表', '', '/admin/dataGrid', 'ajax', '用户列表', 'glyphicon-th-list', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (132, '添加', 'admin:add', '/admin/add', 'ajax', '用户添加', 'glyphicon-plus', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (133, '编辑', 'admin:edit', '/admin/edit', 'ajax', '用户编辑', 'glyphicon-pencil', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (134, '删除', 'admin:delete', '/admin/delete', 'ajax', '用户删除', 'glyphicon-remove', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (141, '列表', '', '/organization/treeGrid', 'ajax', '用户列表', 'glyphicon-th-list', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (142, '添加', 'organization:add', '/organization/add', 'ajax', '部门添加', 'glyphicon-plus', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (143, '编辑', 'organization:edit', '/organization/edit', 'ajax', '部门编辑', 'glyphicon-pencil', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (144, '删除', 'organization:delete', '/organization/delete', 'ajax', '部门删除', 'glyphicon-remove', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (221, '系统管理', '', '', NULL, NULL, 'glyphicon-cog ', NULL, 3, 1, 0, 0, '2015-12-01 11:44:20', '2018-04-15 21:41:32');
INSERT INTO `t_resource` VALUES (226, '修改密码', 'admin:edit:pwd', '/admin/editPwdPage', 'ajax', NULL, 'glyphicon-warning-sign', NULL, 4, 1, 1, 1, '2015-12-07 20:23:06', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (227, '登录日志', '', '/sysLog/manager', 'ajax', NULL, 'glyphicon-info-sign', 221, 3, 1, 1, 0, '2016-09-30 22:10:53', '2021-07-14 10:25:22');
INSERT INTO `t_resource` VALUES (229, '系统图标', '', '/icons.html', 'ajax', NULL, 'glyphicon-picture', 221, 1, 1, 1, 0, '2016-12-24 15:53:47', '2018-04-15 21:48:18');
INSERT INTO `t_resource` VALUES (235, '字典管理', 'sysDict:manager', '/sysDict/manager', NULL, '字典管理', 'glyphicon-list-alt ', 221, 0, 1, 1, 0, '2018-04-15 20:17:32', '2018-04-15 21:48:26');
INSERT INTO `t_resource` VALUES (236, '列表', 'sysDict:dataGrid', '/sysDict/dataGrid', 'ajax', '资源列表', 'glyphicon-th-list', 235, 0, 1, 1, 1, '2018-04-15 20:17:32', '2018-04-15 21:59:40');
INSERT INTO `t_resource` VALUES (237, '添加', 'sysDict:add', '/sysDict/add', 'ajax', '资源添加', 'glyphicon-plus', 235, 0, 1, 1, 1, '2018-04-15 20:17:32', '2018-04-15 21:32:45');
INSERT INTO `t_resource` VALUES (238, '编辑', 'sysDict:edit', '/sysDict/edit', 'ajax', '资源编辑', 'glyphicon-pencil', 235, 0, 1, 1, 1, '2018-04-15 20:17:32', '2018-04-15 21:32:55');
INSERT INTO `t_resource` VALUES (239, 'swagger', '', '/doc.html', '', NULL, 'glyphicon-wrench ', 221, 2, 1, 1, 0, '2021-07-13 17:59:54', '2021-07-14 10:26:13');
INSERT INTO `t_resource` VALUES (240, '开发管理', NULL, NULL, NULL, NULL, 'glyphicon-refresh on', NULL, 9, 1, 0, 0, '2021-07-13 18:30:13', '2021-07-13 18:30:13');
INSERT INTO `t_resource` VALUES (241, '代码平台', NULL, '/magic/web/index.html', 'iframe', NULL, 'glyphicon-briefcase ', 240, 0, 1, 1, 0, '2021-07-13 18:37:01', '2021-07-13 18:37:01');
INSERT INTO `t_resource` VALUES (242, '代码平台 classes 接口', '', 'magic/web/classes', '', NULL, 'glyphicon-globe ', 241, 0, 1, 1, 1, '2021-07-13 18:39:04', '2021-07-13 18:39:51');
INSERT INTO `t_resource` VALUES (243, '代码平台 classes 接口文本', NULL, '/magic/web/classes.txt', NULL, NULL, 'glyphicon-globe ', 241, 0, 1, 1, 1, '2021-07-13 18:40:44', '2021-07-13 18:40:44');
INSERT INTO `t_resource` VALUES (244, '代码平台 json 配置', NULL, '/magic/web/config.json', NULL, NULL, 'glyphicon-globe ', 241, 0, 1, 1, 1, '2021-07-13 18:41:25', '2021-07-13 18:41:25');
INSERT INTO `t_resource` VALUES (245, '代码平台 options 配置', NULL, '/magic/web/options', NULL, NULL, 'glyphicon-globe ', 241, 0, 1, 1, 1, '2021-07-13 18:42:01', '2021-07-13 18:42:01');
INSERT INTO `t_resource` VALUES (246, '代码平台权限', NULL, '/magic/web/**', NULL, NULL, 'glyphicon-random ', 241, 0, 1, 1, 1, '2021-07-14 11:33:26', '2021-07-14 11:33:26');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `icon_cls` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色图标',
  `seq` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序号',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态[0:失效,1:正常]',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'admin', '超级管理员', 'glyphicon-lock ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:35');
INSERT INTO `t_role` VALUES (2, 'de', '技术部经理', 'glyphicon-plane ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:42');
INSERT INTO `t_role` VALUES (7, 'pm', '产品部经理', 'glyphicon-ok-circle ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:47');
INSERT INTO `t_role` VALUES (8, 'test', '测试账户', 'glyphicon-calendar ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:52');

-- ----------------------------
-- Table structure for t_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_resource_ids`(`role_id`, `resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 978 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------
INSERT INTO `t_role_resource` VALUES (956, 1, 1);
INSERT INTO `t_role_resource` VALUES (973, 1, 11);
INSERT INTO `t_role_resource` VALUES (967, 1, 12);
INSERT INTO `t_role_resource` VALUES (962, 1, 13);
INSERT INTO `t_role_resource` VALUES (957, 1, 14);
INSERT INTO `t_role_resource` VALUES (974, 1, 111);
INSERT INTO `t_role_resource` VALUES (975, 1, 112);
INSERT INTO `t_role_resource` VALUES (976, 1, 113);
INSERT INTO `t_role_resource` VALUES (977, 1, 114);
INSERT INTO `t_role_resource` VALUES (968, 1, 121);
INSERT INTO `t_role_resource` VALUES (969, 1, 122);
INSERT INTO `t_role_resource` VALUES (970, 1, 123);
INSERT INTO `t_role_resource` VALUES (971, 1, 124);
INSERT INTO `t_role_resource` VALUES (972, 1, 125);
INSERT INTO `t_role_resource` VALUES (963, 1, 131);
INSERT INTO `t_role_resource` VALUES (964, 1, 132);
INSERT INTO `t_role_resource` VALUES (965, 1, 133);
INSERT INTO `t_role_resource` VALUES (966, 1, 134);
INSERT INTO `t_role_resource` VALUES (958, 1, 141);
INSERT INTO `t_role_resource` VALUES (959, 1, 142);
INSERT INTO `t_role_resource` VALUES (960, 1, 143);
INSERT INTO `t_role_resource` VALUES (961, 1, 144);
INSERT INTO `t_role_resource` VALUES (948, 1, 221);
INSERT INTO `t_role_resource` VALUES (947, 1, 226);
INSERT INTO `t_role_resource` VALUES (949, 1, 227);
INSERT INTO `t_role_resource` VALUES (951, 1, 229);
INSERT INTO `t_role_resource` VALUES (952, 1, 235);
INSERT INTO `t_role_resource` VALUES (953, 1, 236);
INSERT INTO `t_role_resource` VALUES (954, 1, 237);
INSERT INTO `t_role_resource` VALUES (955, 1, 238);
INSERT INTO `t_role_resource` VALUES (950, 1, 239);
INSERT INTO `t_role_resource` VALUES (940, 1, 240);
INSERT INTO `t_role_resource` VALUES (941, 1, 241);
INSERT INTO `t_role_resource` VALUES (942, 1, 242);
INSERT INTO `t_role_resource` VALUES (943, 1, 243);
INSERT INTO `t_role_resource` VALUES (944, 1, 244);
INSERT INTO `t_role_resource` VALUES (945, 1, 245);
INSERT INTO `t_role_resource` VALUES (946, 1, 246);
INSERT INTO `t_role_resource` VALUES (437, 2, 1);
INSERT INTO `t_role_resource` VALUES (438, 2, 13);
INSERT INTO `t_role_resource` VALUES (439, 2, 131);
INSERT INTO `t_role_resource` VALUES (440, 2, 132);
INSERT INTO `t_role_resource` VALUES (441, 2, 133);
INSERT INTO `t_role_resource` VALUES (445, 2, 221);
INSERT INTO `t_role_resource` VALUES (442, 2, 222);
INSERT INTO `t_role_resource` VALUES (443, 2, 223);
INSERT INTO `t_role_resource` VALUES (444, 2, 224);
INSERT INTO `t_role_resource` VALUES (446, 2, 227);
INSERT INTO `t_role_resource` VALUES (447, 2, 228);
INSERT INTO `t_role_resource` VALUES (158, 3, 1);
INSERT INTO `t_role_resource` VALUES (159, 3, 11);
INSERT INTO `t_role_resource` VALUES (164, 3, 12);
INSERT INTO `t_role_resource` VALUES (170, 3, 13);
INSERT INTO `t_role_resource` VALUES (175, 3, 14);
INSERT INTO `t_role_resource` VALUES (160, 3, 111);
INSERT INTO `t_role_resource` VALUES (161, 3, 112);
INSERT INTO `t_role_resource` VALUES (162, 3, 113);
INSERT INTO `t_role_resource` VALUES (163, 3, 114);
INSERT INTO `t_role_resource` VALUES (165, 3, 121);
INSERT INTO `t_role_resource` VALUES (166, 3, 122);
INSERT INTO `t_role_resource` VALUES (167, 3, 123);
INSERT INTO `t_role_resource` VALUES (168, 3, 124);
INSERT INTO `t_role_resource` VALUES (169, 3, 125);
INSERT INTO `t_role_resource` VALUES (171, 3, 131);
INSERT INTO `t_role_resource` VALUES (172, 3, 132);
INSERT INTO `t_role_resource` VALUES (173, 3, 133);
INSERT INTO `t_role_resource` VALUES (174, 3, 134);
INSERT INTO `t_role_resource` VALUES (176, 3, 141);
INSERT INTO `t_role_resource` VALUES (177, 3, 142);
INSERT INTO `t_role_resource` VALUES (178, 3, 143);
INSERT INTO `t_role_resource` VALUES (179, 3, 144);
INSERT INTO `t_role_resource` VALUES (359, 7, 1);
INSERT INTO `t_role_resource` VALUES (360, 7, 14);
INSERT INTO `t_role_resource` VALUES (361, 7, 141);
INSERT INTO `t_role_resource` VALUES (362, 7, 142);
INSERT INTO `t_role_resource` VALUES (363, 7, 143);
INSERT INTO `t_role_resource` VALUES (367, 7, 221);
INSERT INTO `t_role_resource` VALUES (364, 7, 222);
INSERT INTO `t_role_resource` VALUES (365, 7, 223);
INSERT INTO `t_role_resource` VALUES (366, 7, 224);
INSERT INTO `t_role_resource` VALUES (368, 7, 226);
INSERT INTO `t_role_resource` VALUES (894, 8, 1);
INSERT INTO `t_role_resource` VALUES (901, 8, 11);
INSERT INTO `t_role_resource` VALUES (899, 8, 12);
INSERT INTO `t_role_resource` VALUES (897, 8, 13);
INSERT INTO `t_role_resource` VALUES (895, 8, 14);
INSERT INTO `t_role_resource` VALUES (902, 8, 111);
INSERT INTO `t_role_resource` VALUES (900, 8, 121);
INSERT INTO `t_role_resource` VALUES (898, 8, 131);
INSERT INTO `t_role_resource` VALUES (896, 8, 141);
INSERT INTO `t_role_resource` VALUES (889, 8, 221);
INSERT INTO `t_role_resource` VALUES (890, 8, 227);
INSERT INTO `t_role_resource` VALUES (892, 8, 229);
INSERT INTO `t_role_resource` VALUES (893, 8, 235);
INSERT INTO `t_role_resource` VALUES (891, 8, 239);
INSERT INTO `t_role_resource` VALUES (886, 8, 243);
INSERT INTO `t_role_resource` VALUES (887, 8, 244);
INSERT INTO `t_role_resource` VALUES (888, 8, 245);

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编码ID',
  `dict_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `dict_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `dict_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '键',
  `dict_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '值',
  `seq` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES (1, 'adminSex', '性别-男', '0', '男', 0, '2018-04-21 12:45:34');
INSERT INTO `t_sys_dict` VALUES (2, 'adminSex', '性别-女', '1', '女', 1, '2018-04-21 12:45:34');
INSERT INTO `t_sys_dict` VALUES (3, 'dbStatus', '数据库状态-失效', '0', '失效', 0, '2018-04-21 12:46:37');
INSERT INTO `t_sys_dict` VALUES (4, 'dbStatus', '数据库状态-正常', '1', '正常', 1, '2018-04-21 12:46:59');
INSERT INTO `t_sys_dict` VALUES (5, 'adminLocked', '锁定-否', '0', '否', 0, '2018-04-21 12:50:56');
INSERT INTO `t_sys_dict` VALUES (6, 'adminLocked', '锁定-是', '1', '是', 1, '2018-04-21 12:51:15');
INSERT INTO `t_sys_dict` VALUES (7, 'adminType', 'admin类型-管理员', '0', '管理员', 1, '2018-04-21 12:52:27');
INSERT INTO `t_sys_dict` VALUES (8, 'adminType', 'admin类型-用户', '1', '用户', 0, '2018-04-21 12:52:49');
INSERT INTO `t_sys_dict` VALUES (9, 'resourceType', '资源类型-菜单', '0', '菜单', 0, '2018-04-21 12:53:51');
INSERT INTO `t_sys_dict` VALUES (10, 'resourceType', '资源类型-按钮', '1', '按钮', 1, '2018-04-21 12:54:09');
INSERT INTO `t_sys_dict` VALUES (11, 'resourceOpened', '资源菜单打开状态-打开', '1', '打开', 0, '2018-04-21 12:55:41');
INSERT INTO `t_sys_dict` VALUES (12, 'resourceOpened', '资源菜单打开状态-关闭', '0', '关闭', 1, '2018-04-21 12:56:07');
INSERT INTO `t_sys_dict` VALUES (13, 'resourceOpenMode', '资源打开方式-ajax', 'ajax', 'ajax', 0, '2018-04-21 15:17:03');
INSERT INTO `t_sys_dict` VALUES (14, 'resourceOpenMode', '资源打开方式-iframe', 'iframe', 'iframe', 0, '2018-04-21 15:17:25');

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `operation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作',
  `class_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类-方法',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户端ip',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

