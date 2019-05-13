-- ----------------------------
-- 1、部门表
-- ----------------------------
drop table if exists sys_dept;
create table sys_dept (
  dept_id 			serial4 primary key ,
  parent_id 		bigint 		default 0 			    ,
  ancestors 		varchar(50)     default '' 			    ,
  dept_name 		varchar(30) 	default '' 				,
  order_num 		int 			default 0 			    ,
  leader            varchar(20)     default null            ,
  phone             varchar(11)     default null            ,
  email             varchar(50)     default null            ,
  status 			char(1) 		default '0' 			,
  del_flag			char(1) 		default '0' 			,
  create_by         varchar(64)     default ''              ,
  create_time 	    timestamp                               ,
  update_by         varchar(64)     default ''              ,
  update_time       timestamp
);
comment on table sys_dept is '部门表';
comment on column sys_dept.dept_id is '部门id';
comment on column sys_dept.parent_id is '父部门id';
comment on column sys_dept.ancestors is '祖级列表';
comment on column sys_dept.dept_name is '部门名称';
comment on column sys_dept.order_num is '显示顺序';
comment on column sys_dept.leader is '负责人';
comment on column sys_dept.phone is '联系电话';
comment on column sys_dept.email is '邮箱';
comment on column sys_dept.status is '部门状态（0正常 1停用）';
comment on column sys_dept.del_flag is '删除标志（0代表存在 2代表删除）';
comment on column sys_dept.create_by is '创建者';
comment on column sys_dept.create_time is '创建时间';
comment on column sys_dept.update_by is '更新者';
comment on column sys_dept.update_time is '更新时间';

-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          '若依科技',   0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(101,  100, '0,100',      '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(102,  100, '0,100',      '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(103,  101, '0,100,101',  '研发部门',   1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(104,  101, '0,100,101',  '市场部门',   2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(105,  101, '0,100,101',  '测试部门',   3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(106,  101, '0,100,101',  '财务部门',   4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(107,  101, '0,100,101',  '运维部门',   5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(108,  102, '0,100,102',  '市场部门',   1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(109,  102, '0,100,102',  '财务部门',   2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- 2、用户信息表
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
  user_id 			serial4  primary key               ,
  dept_id 			bigint 		default null			       ,
  login_name 		varchar(30) 	not null 				   ,
  user_name 		varchar(30) 	not null 				   ,
  user_type 		varchar(2) 	    default '00' 		       ,
  email  			varchar(50) 	default '' 				   ,
  phonenumber  		varchar(11) 	default '' 				   ,
  sex  		        char(1) 	    default '0' 			   ,
  avatar            varchar(100) 	default '' 				   ,
  password 			varchar(50) 	default '' 				   ,
  salt 				varchar(20) 	default '' 				   ,
  status 			char(1) 		default '0' 			   ,
  del_flag			char(1) 		default '0' 			   ,
  login_ip          varchar(50)     default ''                 ,
  login_date        timestamp                                  ,
  create_by         varchar(64)     default ''                 ,
  create_time 	    timestamp                                  ,
  update_by         varchar(64)     default ''                 ,
  update_time       timestamp                                  ,
  remark 		    varchar(500) 	default ''
);
comment on table sys_user is '用户信息表';
comment on column sys_user.user_id is '用户ID';
comment on column sys_user.dept_id is '部门ID';
comment on column sys_user.login_name is '登录账号';
comment on column sys_user.user_name is '用户昵称';
comment on column sys_user.user_type is '用户类型（00系统用户）';
comment on column sys_user.email is '用户邮箱';
comment on column sys_user.phonenumber is '手机号码';
comment on column sys_user.sex is '用户性别（0男 1女 2未知）';
comment on column sys_user.avatar is '头像路径';
comment on column sys_user.password is '密码';
comment on column sys_user.salt is '盐加密';
comment on column sys_user.status is '帐号状态（0正常 1停用）';
comment on column sys_user.del_flag is '删除标志（0代表存在 2代表删除）';
comment on column sys_user.login_ip is '最后登陆IP';
comment on column sys_user.login_date is '最后登陆时间';
comment on column sys_user.create_by is '创建者';
comment on column sys_user.create_time is '创建时间';
comment on column sys_user.update_by is '更新者';
comment on column sys_user.update_time is '更新时间';
comment on column sys_user.remark is '备注';

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1,  103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', now(), 'admin', now(), 'ry', now(), '管理员');
insert into sys_user values(2,  105, 'ry',    '若依', '00', 'ry@qq.com',  '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', now(), 'admin', now(), 'ry', now(), '测试员');


-- ----------------------------
-- 3、岗位信息表
-- ----------------------------
drop table if exists sys_post;
create table sys_post
(
    post_id       serial4 primary key               ,
	post_code     varchar(64)     not null                   ,
	post_name     varchar(50)     not null                   ,
	post_sort     int          not null                   ,
	status        char(1)         not null                   ,
    create_by     varchar(64)     default ''                 ,
    create_time   timestamp                                  ,
    update_by     varchar(64) 	  default ''			     ,
	update_time   timestamp                                  ,
    remark 		  varchar(500) 	  default null
);
comment on table sys_post is '岗位信息表';
comment on column sys_post.post_id is '岗位ID';
comment on column sys_post.post_code is '岗位编码';
comment on column sys_post.post_name is '岗位名称';
comment on column sys_post.post_sort is '显示顺序';
comment on column sys_post.status is '状态（0正常 1停用）';
comment on column sys_post.create_by is '创建者';
comment on column sys_post.create_time is '创建时间';
comment on column sys_post.update_by is '更新者';
comment on column sys_post.update_time is '更新时间';
comment on column sys_post.remark is '备注';

-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
insert into sys_post values(1, 'ceo',  '董事长',    1, '0', 'admin', now(), 'ry', now(), '');
insert into sys_post values(2, 'se',   '项目经理',  2, '0', 'admin', now(), 'ry', now(), '');
insert into sys_post values(3, 'hr',   '人力资源',  3, '0', 'admin', now(), 'ry', now(), '');
insert into sys_post values(4, 'user', '普通员工',  4, '0', 'admin', now(), 'ry', now(), '');


-- ----------------------------
-- 4、角色信息表
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
  role_id 			 serial4 primary key                        ,
  role_name 		varchar(30) 	not null 				   ,
  role_key 		    varchar(100) 	not null 				   ,
  role_sort         int         not null                   ,
  data_scope        char(1) 	    default '1'				   ,
  status 			char(1) 		not null 			       ,
  del_flag			char(1) 		default '0' 			   ,
  create_by         varchar(64)     default ''                 ,
  create_time 		timestamp                                  ,
  update_by 		varchar(64) 	default ''			       ,
  update_time 		timestamp                                  ,
  remark 			varchar(500) 	default null
);
comment on table sys_role is '角色信息表';
comment on column sys_role.role_id is '角色ID';
comment on column sys_role.role_name is '角色名称';
comment on column sys_role.role_key is '角色权限字符串';
comment on column sys_role.role_sort is '显示顺序';
comment on column sys_role.data_scope is '数据范围（1：全部数据权限 2：自定数据权限）';
comment on column sys_role.status is '角色状态（0正常 1停用）';
comment on column sys_role.del_flag is '删除标志（0代表存在 2代表删除）';
comment on column sys_role.create_by is '创建者';
comment on column sys_role.create_time is '创建时间';
comment on column sys_role.update_by is '更新者';
comment on column sys_role.update_time is '更新时间';
comment on column sys_role.remark is '备注';

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values('1', '管理员',   'admin',  1, 1, '0', '0', 'admin', now(), 'ry', now(), '管理员');
insert into sys_role values('2', '普通角色', 'common', 2, 2, '0', '0', 'admin', now(), 'ry', now(), '普通角色');


-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
  menu_id 			 serial4 primary key                        ,
  menu_name 		varchar(50) 	not null 				   ,
  parent_id 		bigint 		default 0 			           ,
  order_num 		int 			default 0 			       ,
  url 				varchar(200) 	default '#'				   ,
  menu_type 		char(1) 		default '' 			       ,
  visible 			char(1) 		default 0 				   ,
  perms 			varchar(100) 	default null 			   ,
  icon 				varchar(100) 	default '#' 			   ,
  create_by         varchar(64)     default ''                 ,
  create_time 		timestamp                                  ,
  update_by 		varchar(64) 	default ''			       ,
  update_time 		timestamp                                  ,
  remark 			varchar(500) 	default ''
);
comment on table sys_menu is '菜单权限表';
comment on column sys_menu.menu_id is '菜单ID';
comment on column sys_menu.menu_name is '菜单名称';
comment on column sys_menu.parent_id is '父菜单ID';
comment on column sys_menu.order_num is '显示顺序';
comment on column sys_menu.url is '请求地址';
comment on column sys_menu.menu_type is '菜单类型（M目录 C菜单 F按钮）';
comment on column sys_menu.visible is '菜单状态（0显示 1隐藏）';
comment on column sys_menu.perms is '权限标识';
comment on column sys_menu.icon is '菜单图标';
comment on column sys_menu.create_by is '创建者';
comment on column sys_menu.create_time is '创建时间';
comment on column sys_menu.update_by is '更新者';
comment on column sys_menu.update_time is '更新时间';
comment on column sys_menu.remark is '备注';

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
insert into sys_menu values('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear',         'admin', now(), 'ry', now(), '系统管理目录');
insert into sys_menu values('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', now(), 'ry', now(), '系统监控目录');
insert into sys_menu values('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars',         'admin', now(), 'ry', now(), '系统工具目录');
-- 二级菜单
insert into sys_menu values('100',  '用户管理', '1', '1', '/system/user',        'C', '0', 'system:user:view',         '#', 'admin', now(), 'ry', now(), '用户管理菜单');
insert into sys_menu values('101',  '角色管理', '1', '2', '/system/role',        'C', '0', 'system:role:view',         '#', 'admin', now(), 'ry', now(), '角色管理菜单');
insert into sys_menu values('102',  '菜单管理', '1', '3', '/system/menu',        'C', '0', 'system:menu:view',         '#', 'admin', now(), 'ry', now(), '菜单管理菜单');
insert into sys_menu values('103',  '部门管理', '1', '4', '/system/dept',        'C', '0', 'system:dept:view',         '#', 'admin', now(), 'ry', now(), '部门管理菜单');
insert into sys_menu values('104',  '岗位管理', '1', '5', '/system/post',        'C', '0', 'system:post:view',         '#', 'admin', now(), 'ry', now(), '岗位管理菜单');
insert into sys_menu values('105',  '字典管理', '1', '6', '/system/dict',        'C', '0', 'system:dict:view',         '#', 'admin', now(), 'ry', now(), '字典管理菜单');
insert into sys_menu values('106',  '参数设置', '1', '7', '/system/config',      'C', '0', 'system:config:view',       '#', 'admin', now(), 'ry', now(), '参数设置菜单');
insert into sys_menu values('107',  '通知公告', '1', '8', '/system/notice',      'C', '0', 'system:notice:view',       '#', 'admin', now(), 'ry', now(), '通知公告菜单');
insert into sys_menu values('108',  '日志管理', '1', '9', '#',                   'M', '0', '',                         '#', 'admin', now(), 'ry', now(), '日志管理菜单');
insert into sys_menu values('109',  '在线用户', '2', '1', '/monitor/online',     'C', '0', 'monitor:online:view',      '#', 'admin', now(), 'ry', now(), '在线用户菜单');
insert into sys_menu values('110',  '定时任务', '2', '2', '/monitor/job',        'C', '0', 'monitor:job:view',         '#', 'admin', now(), 'ry', now(), '定时任务菜单');
insert into sys_menu values('111',  '数据监控', '2', '3', '/monitor/data',       'C', '0', 'monitor:data:view',        '#', 'admin', now(), 'ry', now(), '数据监控菜单');
insert into sys_menu values('112',  '服务监控', '2', '3', '/monitor/server',     'C', '0', 'monitor:server:view',      '#', 'admin', now(), 'ry', now(), '服务监控菜单');
insert into sys_menu values('113',  '表单构建', '3', '1', '/tool/build',         'C', '0', 'tool:build:view',          '#', 'admin', now(), 'ry', now(), '表单构建菜单');
insert into sys_menu values('114',  '代码生成', '3', '2', '/tool/gen',           'C', '0', 'tool:gen:view',            '#', 'admin', now(), 'ry', now(), '代码生成菜单');
insert into sys_menu values('115',  '系统接口', '3', '3', '/tool/swagger',       'C', '0', 'tool:swagger:view',        '#', 'admin', now(), 'ry', now(), '系统接口菜单');
-- 三级菜单
insert into sys_menu values('500',  '操作日志', '108', '1', '/monitor/operlog',    'C', '0', 'monitor:operlog:view',     '#', 'admin', now(), 'ry', now(), '操作日志菜单');
insert into sys_menu values('501',  '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view',  '#', 'admin', now(), 'ry', now(), '登录日志菜单');
-- 用户管理按钮
insert into sys_menu values('1000', '用户查询', '100', '1',  '#',  'F', '0', 'system:user:list',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1001', '用户新增', '100', '2',  '#',  'F', '0', 'system:user:add',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1002', '用户修改', '100', '3',  '#',  'F', '0', 'system:user:edit',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1003', '用户删除', '100', '4',  '#',  'F', '0', 'system:user:remove',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1004', '用户导出', '100', '5',  '#',  'F', '0', 'system:user:export',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1005', '用户导入', '100', '6',  '#',  'F', '0', 'system:user:import',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1006', '重置密码', '100', '7',  '#',  'F', '0', 'system:user:resetPwd',    '#', 'admin', now(), 'ry', now(), '');
-- 角色管理按钮
insert into sys_menu values('1007', '角色查询', '101', '1',  '#',  'F', '0', 'system:role:list',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1008', '角色新增', '101', '2',  '#',  'F', '0', 'system:role:add',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1009', '角色修改', '101', '3',  '#',  'F', '0', 'system:role:edit',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1010', '角色删除', '101', '4',  '#',  'F', '0', 'system:role:remove',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1011', '角色导出', '101', '5',  '#',  'F', '0', 'system:role:export',      '#', 'admin', now(), 'ry', now(), '');
-- 菜单管理按钮
insert into sys_menu values('1012', '菜单查询', '102', '1',  '#',  'F', '0', 'system:menu:list',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1013', '菜单新增', '102', '2',  '#',  'F', '0', 'system:menu:add',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1014', '菜单修改', '102', '3',  '#',  'F', '0', 'system:menu:edit',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1015', '菜单删除', '102', '4',  '#',  'F', '0', 'system:menu:remove',      '#', 'admin', now(), 'ry', now(), '');
-- 部门管理按钮
insert into sys_menu values('1016', '部门查询', '103', '1',  '#',  'F', '0', 'system:dept:list',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1017', '部门新增', '103', '2',  '#',  'F', '0', 'system:dept:add',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1018', '部门修改', '103', '3',  '#',  'F', '0', 'system:dept:edit',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1019', '部门删除', '103', '4',  '#',  'F', '0', 'system:dept:remove',      '#', 'admin', now(), 'ry', now(), '');
-- 岗位管理按钮
insert into sys_menu values('1020', '岗位查询', '104', '1',  '#',  'F', '0', 'system:post:list',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1021', '岗位新增', '104', '2',  '#',  'F', '0', 'system:post:add',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1022', '岗位修改', '104', '3',  '#',  'F', '0', 'system:post:edit',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1023', '岗位删除', '104', '4',  '#',  'F', '0', 'system:post:remove',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1024', '岗位导出', '104', '5',  '#',  'F', '0', 'system:post:export',      '#', 'admin', now(), 'ry', now(), '');
-- 字典管理按钮
insert into sys_menu values('1025', '字典查询', '105', '1', '#',  'F', '0', 'system:dict:list',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1026', '字典新增', '105', '2', '#',  'F', '0', 'system:dict:add',          '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1027', '字典修改', '105', '3', '#',  'F', '0', 'system:dict:edit',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1028', '字典删除', '105', '4', '#',  'F', '0', 'system:dict:remove',       '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1029', '字典导出', '105', '5', '#',  'F', '0', 'system:dict:export',       '#', 'admin', now(), 'ry', now(), '');
-- 参数设置按钮
insert into sys_menu values('1030', '参数查询', '106', '1', '#',  'F', '0', 'system:config:list',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1031', '参数新增', '106', '2', '#',  'F', '0', 'system:config:add',       '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1032', '参数修改', '106', '3', '#',  'F', '0', 'system:config:edit',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1033', '参数删除', '106', '4', '#',  'F', '0', 'system:config:remove',    '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1034', '参数导出', '106', '5', '#',  'F', '0', 'system:config:export',    '#', 'admin', now(), 'ry', now(), '');
-- 通知公告按钮
insert into sys_menu values('1035', '公告查询', '107', '1', '#',  'F', '0', 'system:notice:list',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1036', '公告新增', '107', '2', '#',  'F', '0', 'system:notice:add',       '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1037', '公告修改', '107', '3', '#',  'F', '0', 'system:notice:edit',      '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1038', '公告删除', '107', '4', '#',  'F', '0', 'system:notice:remove',    '#', 'admin', now(), 'ry', now(), '');
-- 操作日志按钮
insert into sys_menu values('1039', '操作查询', '500', '1', '#',  'F', '0', 'monitor:operlog:list',    '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1040', '操作删除', '500', '2', '#',  'F', '0', 'monitor:operlog:remove',  '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1041', '详细信息', '500', '3', '#',  'F', '0', 'monitor:operlog:detail',  '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1042', '日志导出', '500', '4', '#',  'F', '0', 'monitor:operlog:export',  '#', 'admin', now(), 'ry', now(), '');
-- 登录日志按钮
insert into sys_menu values('1043', '登录查询', '501', '1', '#',  'F', '0', 'monitor:logininfor:list',         '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1044', '登录删除', '501', '2', '#',  'F', '0', 'monitor:logininfor:remove',       '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1045', '日志导出', '501', '3', '#',  'F', '0', 'monitor:logininfor:export',       '#', 'admin', now(), 'ry', now(), '');
-- 在线用户按钮
insert into sys_menu values('1046', '在线查询', '109', '1', '#',  'F', '0', 'monitor:online:list',             '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1047', '批量强退', '109', '2', '#',  'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1048', '单条强退', '109', '3', '#',  'F', '0', 'monitor:online:forceLogout',      '#', 'admin', now(), 'ry', now(), '');
-- 定时任务按钮
insert into sys_menu values('1049', '任务查询', '110', '1', '#',  'F', '0', 'monitor:job:list',                '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1050', '任务新增', '110', '2', '#',  'F', '0', 'monitor:job:add',                 '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1051', '任务修改', '110', '3', '#',  'F', '0', 'monitor:job:edit',                '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1052', '任务删除', '110', '4', '#',  'F', '0', 'monitor:job:remove',              '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1053', '状态修改', '110', '5', '#',  'F', '0', 'monitor:job:changeStatus',        '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1054', '任务详细', '110', '6', '#',  'F', '0', 'monitor:job:detail',              '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1055', '任务导出', '110', '7', '#',  'F', '0', 'monitor:job:export',              '#', 'admin', now(), 'ry', now(), '');
-- 代码生成按钮
insert into sys_menu values('1056', '生成查询', '114', '1', '#',  'F', '0', 'tool:gen:list',  '#', 'admin', now(), 'ry', now(), '');
insert into sys_menu values('1057', '生成代码', '114', '2', '#',  'F', '0', 'tool:gen:code',  '#', 'admin', now(), 'ry', now(), '');


-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
  user_id 	bigint not null ,
  role_id 	bigint not null ,
  primary key(user_id, role_id)
);
comment on table sys_user_role is '用户和角色关联表';
comment on column sys_user_role.user_id is '用户ID';
comment on column sys_user_role.role_id is '角色ID';

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
  role_id 	bigint not null ,
  menu_id 	bigint not null ,
  primary key(role_id, menu_id)
);

comment on table sys_role_menu is '角色和菜单关联表';
comment on column sys_role_menu.role_id is '角色ID';
comment on column sys_role_menu.menu_id is '菜单ID';

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');

-- ----------------------------
-- 8、角色和部门关联表  角色1-N部门
-- ----------------------------
drop table if exists sys_role_dept;
create table sys_role_dept (
  role_id 	bigint not null ,
  dept_id 	bigint not null ,
  primary key(role_id, dept_id)
);
comment on table sys_role_dept is '角色和部门关联表';
comment on column sys_role_dept.role_id is '角色ID';
comment on column sys_role_dept.dept_id is '部门ID';

-- ----------------------------
-- 初始化-角色和部门关联表数据
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post
(
	user_id bigint not null ,
	post_id bigint not null ,
	primary key (user_id, post_id)
);
comment on table sys_user_post is '用户与岗位关联表';
comment on column sys_user_post.user_id is '用户ID';
comment on column sys_user_post.post_id is '岗位ID';

-- ----------------------------
-- 初始化-用户与岗位关联表数据
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');


-- ----------------------------
-- 10、操作日志记录
-- ----------------------------
drop table if exists sys_oper_log;
create table sys_oper_log (
  oper_id 			 serial4 primary key                        ,
  title             varchar(50)     default ''                 ,
  business_type     int         default 0                      ,
  method            varchar(100)    default ''                 ,
  operator_type     int         default 0                      ,
  oper_name 	    varchar(50)     default '' 		 	 	   ,
  dept_name 		varchar(50)     default '' 		 	 	   ,
  oper_url 		    varchar(255) 	default '' 				   ,
  oper_ip 			varchar(50) 	default '' 				   ,
  oper_location     varchar(255)    default ''                 ,
  oper_param 		varchar(2000) 	default '' 				   ,
  status 			int 		    default 0				   ,
  error_msg 		varchar(2000) 	default '' 				   ,
  oper_time 		timestamp
);
comment on table sys_oper_log is '操作日志记录';
comment on column sys_oper_log.oper_id is '日志主键';
comment on column sys_oper_log.title is '模块标题';
comment on column sys_oper_log.business_type is '业务类型（0其它 1新增 2修改 3删除）';
comment on column sys_oper_log.method is '方法名称';
comment on column sys_oper_log.operator_type is '操作类别（0其它 1后台用户 2手机端用户）';
comment on column sys_oper_log.oper_name is '操作人员';
comment on column sys_oper_log.dept_name is '部门名称';
comment on column sys_oper_log.oper_url is '请求URL';
comment on column sys_oper_log.oper_ip is '主机地址';
comment on column sys_oper_log.oper_location is '操作地点';
comment on column sys_oper_log.oper_param is '请求参数';
comment on column sys_oper_log.status is '操作状态（0正常 1异常）';
comment on column sys_oper_log.error_msg is '错误消息';
comment on column sys_oper_log.oper_time is '操作时间';



-- ----------------------------
-- 11、字典类型表
-- ----------------------------
drop table if exists sys_dict_type;
create table sys_dict_type
(
	dict_id          serial4 primary key                ,
	dict_name        varchar(100)    default ''                 ,
	dict_type        varchar(100)    default ''                 ,
    status 			 char(1) 		 default '0'			    ,
    create_by        varchar(64)     default ''                 ,
    create_time      timestamp                                  ,
    update_by        varchar(64) 	 default ''			        ,
	update_time      timestamp                                  ,
    remark 	         varchar(500) 	 default null 				,
	unique (dict_type)
);
comment on table sys_dict_type is '字典类型表';
comment on column sys_dict_type.dict_id is '字典主键';
comment on column sys_dict_type.dict_name is '字典名称';
comment on column sys_dict_type.dict_type is '字典类型';
comment on column sys_dict_type.status is '状态（0正常 1停用）';
comment on column sys_dict_type.create_by is '创建者';
comment on column sys_dict_type.create_time is '创建时间';
comment on column sys_dict_type.update_by is '更新者';
comment on column sys_dict_type.update_time is '更新时间';
comment on column sys_dict_type.remark is '备注';


insert into sys_dict_type values(1,  '用户性别', 'sys_user_sex',        '0', 'admin', now(), 'ry', now(), '用户性别列表');
insert into sys_dict_type values(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', now(), 'ry', now(), '菜单状态列表');
insert into sys_dict_type values(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', now(), 'ry', now(), '系统开关列表');
insert into sys_dict_type values(4,  '任务状态', 'sys_job_status',      '0', 'admin', now(), 'ry', now(), '任务状态列表');
insert into sys_dict_type values(5,  '系统是否', 'sys_yes_no',          '0', 'admin', now(), 'ry', now(), '系统是否列表');
insert into sys_dict_type values(6,  '通知类型', 'sys_notice_type',     '0', 'admin', now(), 'ry', now(), '通知类型列表');
insert into sys_dict_type values(7,  '通知状态', 'sys_notice_status',   '0', 'admin', now(), 'ry', now(), '通知状态列表');
insert into sys_dict_type values(8,  '操作类型', 'sys_oper_type',       '0', 'admin', now(), 'ry', now(), '操作类型列表');
insert into sys_dict_type values(9,  '系统状态', 'sys_common_status',   '0', 'admin', now(), 'ry', now(), '登录状态列表');


-- ----------------------------
-- 12、字典数据表
-- ----------------------------
drop table if exists sys_dict_data;
create table sys_dict_data
(
	dict_code         serial4   primary key             ,
	dict_sort        int          default 0                  ,
	dict_label       varchar(100)    default ''                 ,
	dict_value       varchar(100)    default ''                 ,
	dict_type        varchar(100)    default ''                 ,
	css_class        varchar(100)    default null               ,
	list_class       varchar(100)    default null               ,
	is_default       char(1)         default 'N'                ,
    status 			 char(1) 		 default '0'			    ,
    create_by        varchar(64)     default ''                 ,
    create_time      timestamp                                  ,
    update_by        varchar(64) 	 default ''			        ,
	update_time      timestamp                                  ,
    remark 	         varchar(500) 	 default null
);
comment on table sys_dict_data is '字典数据表';
comment on column sys_dict_data.dict_code is '字典编码';
comment on column sys_dict_data.dict_sort is '字典排序';
comment on column sys_dict_data.dict_label is '字典标签';
comment on column sys_dict_data.dict_value is '字典键值';
comment on column sys_dict_data.dict_type is '字典类型';
comment on column sys_dict_data.css_class is '样式属性（其他样式扩展）';
comment on column sys_dict_data.list_class is '表格回显样式';
comment on column sys_dict_data.is_default is '是否默认（Y是 N否）';
comment on column sys_dict_data.status is '状态（0正常 1停用）';
comment on column sys_dict_data.create_by is '创建者';
comment on column sys_dict_data.create_time is '创建时间';
comment on column sys_dict_data.update_by is '更新者';
comment on column sys_dict_data.update_time is '更新时间';
comment on column sys_dict_data.remark is '备注';


insert into sys_dict_data values(1,  1,  '男',       '0',  'sys_user_sex',        '',   '',        'Y', '0', 'admin', now(), 'ry', now(), '性别男');
insert into sys_dict_data values(2,  2,  '女',       '1',  'sys_user_sex',        '',   '',        'N', '0', 'admin', now(), 'ry', now(), '性别女');
insert into sys_dict_data values(3,  3,  '未知',     '2',  'sys_user_sex',        '',   '',        'N', '0', 'admin', now(), 'ry', now(), '性别未知');
insert into sys_dict_data values(4,  1,  '显示',     '0',  'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', now(), 'ry', now(), '显示菜单');
insert into sys_dict_data values(5,  2,  '隐藏',     '1',  'sys_show_hide',       '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '隐藏菜单');
insert into sys_dict_data values(6,  1,  '正常',     '0',  'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', now(), 'ry', now(), '正常状态');
insert into sys_dict_data values(7,  2,  '停用',     '1',  'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '停用状态');
insert into sys_dict_data values(8,  1,  '正常',     '0',  'sys_job_status',      '',   'primary', 'Y', '0', 'admin', now(), 'ry', now(), '正常状态');
insert into sys_dict_data values(9,  2,  '暂停',     '1',  'sys_job_status',      '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '停用状态');
insert into sys_dict_data values(10, 1,  '是',       'Y',  'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', now(), 'ry', now(), '系统默认是');
insert into sys_dict_data values(11, 2,  '否',       'N',  'sys_yes_no',          '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '系统默认否');
insert into sys_dict_data values(12, 1,  '通知',     '1',  'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', now(), 'ry', now(), '通知');
insert into sys_dict_data values(13, 2,  '公告',     '2',  'sys_notice_type',     '',   'success', 'N', '0', 'admin', now(), 'ry', now(), '公告');
insert into sys_dict_data values(14, 1,  '正常',     '0',  'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', now(), 'ry', now(), '正常状态');
insert into sys_dict_data values(15, 2,  '关闭',     '1',  'sys_notice_status',   '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '关闭状态');
insert into sys_dict_data values(16, 1,  '新增',     '1',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', now(), 'ry', now(), '新增操作');
insert into sys_dict_data values(17, 2,  '修改',     '2',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', now(), 'ry', now(), '修改操作');
insert into sys_dict_data values(18, 3,  '删除',     '3',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '删除操作');
insert into sys_dict_data values(19, 4,  '授权',     '4',  'sys_oper_type',       '',   'primary', 'N', '0', 'admin', now(), 'ry', now(), '授权操作');
insert into sys_dict_data values(20, 5,  '导出',     '5',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', now(), 'ry', now(), '导出操作');
insert into sys_dict_data values(21, 6,  '导入',     '6',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', now(), 'ry', now(), '导入操作');
insert into sys_dict_data values(22, 7,  '强退',     '7',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '强退操作');
insert into sys_dict_data values(23, 8,  '生成代码', '8',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', now(), 'ry', now(), '生成操作');
insert into sys_dict_data values(24, 9,  '清空数据', '9',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '清空操作');
insert into sys_dict_data values(25, 1,  '成功',     '0',  'sys_common_status',   '',   'primary', 'N', '0', 'admin', now(), 'ry', now(), '正常状态');
insert into sys_dict_data values(26, 2,  '失败',     '1',  'sys_common_status',   '',   'danger',  'N', '0', 'admin', now(), 'ry', now(), '停用状态');


-- ----------------------------
-- 13、参数配置表
-- ----------------------------
drop table if exists sys_config;
create table sys_config (
	config_id 		   serial4    primary key        ,
	config_name        varchar(100)  default ''                 ,
	config_key         varchar(100)  default ''                 ,
	config_value       varchar(100)  default ''                 ,
	config_type        char(1)       default 'N'                ,
    create_by          varchar(64)   default ''                 ,
    create_time 	   timestamp                                ,
    update_by          varchar(64)   default ''                 ,
    update_time        timestamp                                ,
	remark 	           varchar(500)  default null
);
comment on table sys_config is '参数配置表';
comment on column sys_config.config_id is '参数主键';
comment on column sys_config.config_name is '参数名称';
comment on column sys_config.config_key is '参数键名';
comment on column sys_config.config_value is '参数键值';
comment on column sys_config.config_type is '系统内置（Y是 N否）';
comment on column sys_config.create_by is '创建者';
comment on column sys_config.create_time is '创建时间';
comment on column sys_config.update_by is '更新者';
comment on column sys_config.update_time is '更新时间';
comment on column sys_config.remark is '备注';

insert into sys_config values(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName',     'skin-blue',     'Y', 'admin', now(), 'ry', now(), '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow' );
insert into sys_config values(2, '用户管理-账号初始密码',     'sys.user.initPassword',  '123456',        'Y', 'admin', now(), 'ry', now(), '初始化密码 123456' );


-- ----------------------------
-- 14、系统访问记录
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
  info_id 		 serial4 primary key               ,
  login_name 	 varchar(50)   default '' 			     ,
  ipaddr 		 varchar(50)   default '' 			     ,
  login_location varchar(255)  default ''                ,
  browser  		 varchar(50)   default '' 			     ,
  os      		 varchar(50)   default '' 			     ,
  status 		 char(1) 	   default '0' 			     ,
  msg      		 varchar(255)  default '' 			     ,
  login_time 	 timestamp
);
comment on table sys_logininfor is '系统访问记录';
comment on column sys_logininfor.info_id is '访问ID';
comment on column sys_logininfor.login_name is '登录账号';
comment on column sys_logininfor.ipaddr is '登录IP地址';
comment on column sys_logininfor.login_location is '登录地点';
comment on column sys_logininfor.browser is '浏览器类型';
comment on column sys_logininfor.os is '操作系统';
comment on column sys_logininfor.status is '登录状态（0成功 1失败）';
comment on column sys_logininfor.msg is '提示消息';
comment on column sys_logininfor.login_time is '访问时间';


-- ----------------------------
-- 15、在线用户记录
-- ----------------------------
drop table if exists sys_user_online;
create table sys_user_online (
  sessionId 	    varchar(50)  default ''              	,
  login_name 	    varchar(50)  default '' 		 	 	,
  dept_name 		varchar(50)  default '' 		 	 	,
  ipaddr 		    varchar(50)  default '' 			 	,
  login_location    varchar(255) default ''                 ,
  browser  		    varchar(50)  default '' 			 	,
  os      		    varchar(50)  default '' 			 	,
  status      	    varchar(10)  default '' 			 	,
  start_timestamp 	timestamp                               ,
  last_access_time  timestamp                               ,
  expire_time 	    int 		 default 0 			 	    ,
  primary key (sessionId)
);
comment on table sys_user_online is '在线用户记录';
comment on column sys_user_online.sessionId is '用户会话id';
comment on column sys_user_online.login_name is '登录账号';
comment on column sys_user_online.dept_name is '部门名称';
comment on column sys_user_online.ipaddr is '登录IP地址';
comment on column sys_user_online.login_location is '登录地点';
comment on column sys_user_online.browser is '浏览器类型';
comment on column sys_user_online.os is '操作系统';
comment on column sys_user_online.status is '在线状态on_line在线off_line离线';
comment on column sys_user_online.start_timestamp is 'session创建时间';
comment on column sys_user_online.last_access_time is 'session最后访问时间';
comment on column sys_user_online.expire_time is '超时时间，单位为分钟';

-- ----------------------------
-- 16、定时任务调度表
-- ----------------------------
drop table if exists sys_job;
create table sys_job (
  job_id 		      serial4                ,
  job_name            varchar(64)   default ''                 ,
  job_group           varchar(64)   default ''                 ,
  method_name         varchar(500)  default ''                 ,
  method_params       varchar(50)   default null               ,
  cron_expression     varchar(255)  default ''                 ,
  misfire_policy      varchar(20)   default '3'                ,
  concurrent          char(1)       default '1'                ,
  status              char(1)       default '0'                ,
  create_by           varchar(64)   default ''                 ,
  create_time         timestamp                                ,
  update_by           varchar(64)   default ''                 ,
  update_time         timestamp                                ,
  remark              varchar(500)  default ''                 ,
  primary key (job_id, job_name, job_group)
);
comment on table sys_job is '定时任务调度表';
comment on column sys_job.job_id is '任务ID';
comment on column sys_job.job_name is '任务名称';
comment on column sys_job.job_group is '任务组名';
comment on column sys_job.method_name is '任务方法';
comment on column sys_job.method_params is '方法参数';
comment on column sys_job.cron_expression is 'cron执行表达式';
comment on column sys_job.misfire_policy is '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
comment on column sys_job.concurrent is '是否并发执行（0允许 1禁止）';
comment on column sys_job.status is '状态（0正常 1暂停）';
comment on column sys_job.create_by is '创建者';
comment on column sys_job.create_time is '创建时间';
comment on column sys_job.update_by is '更新者';
comment on column sys_job.update_time is '更新时间';
comment on column sys_job.remark is '备注信息';

insert into sys_job values(1, 'ryTask', '系统默认（无参）', 'ryNoParams',  '',   '0/10 * * * * ?', '3', '1', '1', 'admin', now(), 'ry', now(), '');
insert into sys_job values(2, 'ryTask', '系统默认（有参）', 'ryParams',    'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', now(), 'ry', now(), '');


-- ----------------------------
-- 17、定时任务调度日志表
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
  job_log_id          serial4 primary key                ,
  job_name            varchar(64)   not null                   ,
  job_group           varchar(64)   not null                   ,
  method_name         varchar(500)                             ,
  method_params       varchar(50)   default null               ,
  job_message         varchar(500)                             ,
  status              char(1)       default '0'                ,
  exception_info      varchar(2000) default ''                 ,
  create_time         timestamp
);
comment on table sys_job_log is '定时任务调度日志表';
comment on column sys_job_log.job_log_id is '任务日志ID';
comment on column sys_job_log.job_name is '任务名称';
comment on column sys_job_log.job_group is '任务组名';
comment on column sys_job_log.method_name is '任务方法';
comment on column sys_job_log.method_params is '方法参数';
comment on column sys_job_log.job_message is '日志信息';
comment on column sys_job_log.status is '执行状态（0正常 1失败）';
comment on column sys_job_log.exception_info is '异常信息';
comment on column sys_job_log.create_time is '创建时间';


-- ----------------------------
-- 18、通知公告表
-- ----------------------------
drop table if exists sys_notice;
create table sys_notice (
  notice_id 		serial4 primary key           ,
  notice_title 		varchar(50) 	not null 				   ,
  notice_type 		char(1) 	    not null 			       ,
  notice_content    varchar(2000)   default null               ,
  status 			char(1) 		default '0' 			   ,
  create_by         varchar(64)     default ''                 ,
  create_time 		timestamp                                  ,
  update_by 		varchar(64) 	default ''			       ,
  update_time 		timestamp                                  ,
  remark 			varchar(255) 	default null
);
comment on table sys_notice is '通知公告表';
comment on column sys_notice.notice_id is '公告ID';
comment on column sys_notice.notice_title is '公告标题';
comment on column sys_notice.notice_type is '公告类型（1通知 2公告）';
comment on column sys_notice.notice_content is '公告内容';
comment on column sys_notice.status is '公告状态（0正常 1关闭）';
comment on column sys_notice.create_by is '创建者';
comment on column sys_notice.create_time is '创建时间';
comment on column sys_notice.update_by is '更新者';
comment on column sys_notice.update_time is '更新时间';
comment on column sys_notice.remark is '备注';

-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
insert into sys_notice values('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', now(), 'ry', now(), '管理员');
insert into sys_notice values('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容',   '0', 'admin', now(), 'ry', now(), '管理员');





--------------------------------------------------------------------------------------------------------------------
-- ----------------------------
-- 1、存储每一个已配置的 jobDetail 的详细信息
-- ----------------------------
drop table if exists QRTZ_JOB_DETAILS;
create table QRTZ_JOB_DETAILS (
    sched_name           varchar(120)    not null,
    job_name             varchar(200)    not null,
    job_group            varchar(200)    not null,
    description          varchar(250)    null,
    job_class_name       varchar(250)    not null,
    is_durable           varchar(5)      not null,
    is_nonconcurrent     varchar(5)      not null,
    is_update_data       varchar(5)      not null,
    requests_recovery    varchar(5)      not null,
    job_data             bytea            null,
    primary key (sched_name,job_name,job_group)
);

-- ----------------------------
-- 2、 存储已配置的 Trigger 的信息
-- ----------------------------
drop table if exists QRTZ_TRIGGERS;
create table QRTZ_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    job_name             varchar(200)    not null,
    job_group            varchar(200)    not null,
    description          varchar(250)    null,
    next_fire_time       bigint      null,
    prev_fire_time       bigint      null,
    priority             integer         null,
    trigger_state        varchar(16)     not null,
    trigger_type         varchar(8)      not null,
    start_time           bigint      not null,
    end_time             bigint      null,
    calendar_name        varchar(200)    null,
    misfire_instr        smallint     null,
    job_data             bytea            null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,job_name,job_group) references QRTZ_JOB_DETAILS(sched_name,job_name,job_group)
);

-- ----------------------------
-- 3、 存储简单的 Trigger，包括重复次数，间隔，以及已触发的次数
-- ----------------------------
drop table if exists QRTZ_SIMPLE_TRIGGERS;
create table QRTZ_SIMPLE_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    repeat_count         bigint       not null,
    repeat_interval      bigint      not null,
    times_triggered      bigint      not null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);

-- ----------------------------
-- 4、 存储 Cron Trigger，包括 Cron 表达式和时区信息
-- ----------------------------
drop table if exists QRTZ_CRON_TRIGGERS;
create table QRTZ_CRON_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    cron_expression      varchar(200)    not null,
    time_zone_id         varchar(80),
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);

-- ----------------------------
-- 5、 Trigger 作为 Blob 类型存储(用于 Quartz 用户用 JDBC 创建他们自己定制的 Trigger 类型，JobStore 并不知道如何存储实例的时候)
-- ----------------------------
drop table if exists QRTZ_BLOB_TRIGGERS;
create table QRTZ_BLOB_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    blob_data            bytea            null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);

-- ----------------------------
-- 6、 以 Blob 类型存储存放日历信息， quartz可配置一个日历来指定一个时间范围
-- ----------------------------
drop table if exists QRTZ_CALENDARS;
create table QRTZ_CALENDARS (
    sched_name           varchar(120)    not null,
    calendar_name        varchar(200)    not null,
    calendar             bytea            not null,
    primary key (sched_name,calendar_name)
);

-- ----------------------------
-- 7、 存储已暂停的 Trigger 组的信息
-- ----------------------------
drop table if exists QRTZ_PAUSED_TRIGGER_GRPS;
create table QRTZ_PAUSED_TRIGGER_GRPS (
    sched_name           varchar(120)    not null,
    trigger_group        varchar(200)    not null,
    primary key (sched_name,trigger_group)
);

-- ----------------------------
-- 8、 存储与已触发的 Trigger 相关的状态信息，以及相联 Job 的执行信息
-- ----------------------------
drop table if exists QRTZ_FIRED_TRIGGERS;
create table QRTZ_FIRED_TRIGGERS (
    sched_name           varchar(120)    not null,
    entry_id             varchar(95)     not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    instance_name        varchar(200)    not null,
    fired_time           bigint      not null,
    sched_time           bigint      not null,
    priority             integer         not null,
    state                varchar(16)     not null,
    job_name             varchar(200)    null,
    job_group            varchar(200)    null,
    is_nonconcurrent     varchar(5)      null,
    requests_recovery    varchar(5)      null,
    primary key (sched_name,entry_id)
);

-- ----------------------------
-- 9、 存储少量的有关 Scheduler 的状态信息，假如是用于集群中，可以看到其他的 Scheduler 实例
-- ----------------------------
drop table if exists QRTZ_SCHEDULER_STATE;
create table QRTZ_SCHEDULER_STATE (
    sched_name           varchar(120)    not null,
    instance_name        varchar(200)    not null,
    last_checkin_time    bigint      not null,
    checkin_interval     bigint      not null,
    primary key (sched_name,instance_name)
);

-- ----------------------------
-- 10、 存储程序的悲观锁的信息(假如使用了悲观锁)
-- ----------------------------
drop table if exists QRTZ_LOCKS;
create table QRTZ_LOCKS (
    sched_name           varchar(120)    not null,
    lock_name            varchar(40)     not null,
    primary key (sched_name,lock_name)
);

drop table if exists QRTZ_SIMPROP_TRIGGERS;
create table QRTZ_SIMPROP_TRIGGERS (
    sched_name           varchar(120)    not null,
    trigger_name         varchar(200)    not null,
    trigger_group        varchar(200)    not null,
    str_prop_1           varchar(512)    null,
    str_prop_2           varchar(512)    null,
    str_prop_3           varchar(512)    null,
    int_prop_1           int             null,
    int_prop_2           int             null,
    long_prop_1          bigint          null,
    long_prop_2          bigint          null,
    dec_prop_1           numeric(13,4)   null,
    dec_prop_2           numeric(13,4)   null,
    bool_prop_1          varchar(5)      null,
    bool_prop_2          varchar(5)      null,
    primary key (sched_name,trigger_name,trigger_group),
    foreign key (sched_name,trigger_name,trigger_group) references QRTZ_TRIGGERS(sched_name,trigger_name,trigger_group)
);

commit;

truncate table QRTZ_TRIGGERS CASCADE;
truncate table QRTZ_CRON_TRIGGERS;
truncate table QRTZ_JOB_DETAILS CASCADE;

INSERT INTO sys_menu  ( create_by,menu_name,parent_id,order_num,url,menu_type,visible,perms,icon )
VALUES( 'admin','业务管理',0,4,'','M','0','', 'fa fa-check-square-o');