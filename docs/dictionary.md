## 数据字典
生成工具详见[JFinal生成markdown格式数据字典](https://www.dreamlu.net/news/2018/01/25/JFinal-generates-the-markdown-format-data-dictionary/)

Table: persistent_logins（spring-security记住密码表）

| Field     | Type          | Null | Key | Default           | Remarks |
| --------- | ------------- | ---- | --- | ----------------- | ------- |
| username  | VARCHAR(64)   | NO   |     |                   |         |
| series    | VARCHAR(64)   | NO   | PRI |                   |         |
| token     | VARCHAR(64)   | NO   |     |                   |         |
| last_used | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP |         |

Table: t_admin（后台管理员表）

| Field           | Type             | Null | Key | Default           | Remarks |
| --------------- | ---------------- | ---- | --- | ----------------- | ------- |
| id              | INT UNSIGNED(10) | NO   | PRI |                   | 主键id    |
| username        | VARCHAR(10)      | NO   |     |                   | 用户名     |
| password        | VARCHAR(255)     | NO   |     |                   | 密码      |
| name            | VARCHAR(20)      | NO   |     |                   | 用户名     |
| email           | VARCHAR(36)      | NO   |     |                   | 邮箱      |
| phone           | VARCHAR(20)      | YES  |     |                   | 手机号     |
| sex             | TINYINT(3)       | NO   |     | 0                 | 性别      |
| age             | TINYINT(3)       | YES  |     | 0                 | 年龄      |
| user_type       | TINYINT(3)       | NO   |     | 1                 | 用户类别[0:管理员,1:普通员工]|
| organization_id | INT(10)          | YES  |     |                   | 组织id    |
| locked          | TINYINT(3)       | YES  |     | 0                 | 是否锁定[0:正常,1:锁定]|
| status          | TINYINT(3)       | NO   |     | 1                 | 状态[0:失效,1:正常]|
| create_time     | TIMESTAMP(19)    | NO   |     | CURRENT_TIMESTAMP | 创建时间    |
| update_time     | TIMESTAMP(19)    | NO   |     | CURRENT_TIMESTAMP | 更新时间    |

Table: t_admin_role（用户角色）

| Field    | Type    | Null | Key | Default | Remarks |
| -------- | ------- | ---- | --- | ------- | ------- |
| id       | INT(10) | NO   | PRI |         | 主键id    |
| admin_id | INT(10) | NO   |     |         | 用户id    |
| role_id  | INT(10) | NO   |     |         | 角色id    |

Table: t_organization（组织机构）

| Field       | Type          | Null | Key | Default           | Remarks |
| ----------- | ------------- | ---- | --- | ----------------- | ------- |
| id          | INT(10)       | NO   | PRI |                   | 主键id    |
| name        | VARCHAR(64)   | NO   |     |                   | 组织名     |
| address     | VARCHAR(100)  | YES  |     |                   | 地址      |
| code        | VARCHAR(64)   | NO   |     |                   | 编号      |
| icon_cls    | VARCHAR(32)   | YES  |     |                   | 图标      |
| pid         | INT(10)       | YES  |     |                   | 父级主键    |
| seq         | TINYINT(3)    | NO   |     | 0                 | 排序      |
| status      | TINYINT(3)    | NO   |     | 1                 | 状态[0:失效,1:正常]|
| create_time | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP | 创建时间    |
| update_time | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP | 更新时间    |

Table: t_resource（资源表）

| Field         | Type          | Null | Key | Default           | Remarks |
| ------------- | ------------- | ---- | --- | ----------------- | ------- |
| id            | INT(10)       | NO   | PRI |                   | 主键      |
| name          | VARCHAR(64)   | NO   |     |                   | 资源名称    |
| permissions   | VARCHAR(32)   | YES  |     |                   | 资源的权限   |
| url           | VARCHAR(100)  | YES  |     |                   | 资源路径    |
| open_mode     | VARCHAR(32)   | YES  |     |                   | 打开方式ajax,iframe|
| description   | VARCHAR(255)  | YES  |     |                   | 资源介绍    |
| icon_cls      | VARCHAR(32)   | YES  |     |                   | 资源图标    |
| pid           | INT(10)       | YES  |     |                   | 父级资源id  |
| seq           | TINYINT(3)    | NO   |     | 0                 | 排序      |
| status        | TINYINT(3)    | NO   |     | 1                 | 状态[0:失效,1:正常]|
| opened        | TINYINT(3)    | NO   |     | 0                 | 打开状态    |
| resource_type | TINYINT(3)    | NO   |     | 0                 | 资源类别    |
| create_time   | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP | 创建时间    |
| update_time   | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP | 更新时间    |

Table: t_role（角色表）

| Field       | Type          | Null | Key | Default           | Remarks |
| ----------- | ------------- | ---- | --- | ----------------- | ------- |
| id          | INT(10)       | NO   | PRI |                   | 主键id    |
| name        | VARCHAR(64)   | NO   |     |                   | 角色名     |
| description | VARCHAR(255)  | YES  |     |                   | 简介      |
| icon_cls    | VARCHAR(32)   | YES  |     |                   | 角色图标    |
| seq         | TINYINT(3)    | NO   |     | 0                 | 排序号     |
| status      | TINYINT(3)    | NO   |     | 1                 | 状态[0:失效,1:正常]|
| create_time | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP | 创建时间    |
| update_time | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP | 更新时间    |

Table: t_role_resource（角色资源）

| Field       | Type    | Null | Key | Default | Remarks |
| ----------- | ------- | ---- | --- | ------- | ------- |
| id          | INT(10) | NO   | PRI |         | 主键id    |
| role_id     | INT(10) | NO   |     |         | 角色id    |
| resource_id | INT(10) | NO   |     |         | 资源id    |

Table: t_sys_log（系统日志）

| Field       | Type          | Null | Key | Default           | Remarks |
| ----------- | ------------- | ---- | --- | ----------------- | ------- |
| id          | INT(10)       | NO   | PRI |                   | 主键id    |
| username    | VARCHAR(20)   | YES  |     |                   | 登陆名     |
| role_name   | VARCHAR(255)  | YES  |     |                   | 角色名     |
| class_name  | VARCHAR(100)  | YES  |     |                   |         |
| method_name | VARCHAR(64)   | YES  |     |                   | 参名数     |
| content     | TEXT(65535)   | YES  |     |                   | 内容      |
| client_ip   | VARCHAR(255)  | YES  |     |                   | 客户端ip   |
| create_time | TIMESTAMP(19) | NO   |     | CURRENT_TIMESTAMP | 创建时间    |

