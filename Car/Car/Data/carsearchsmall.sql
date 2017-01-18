-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-12-27 07:46:37
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carsearchsmall`
--

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_action`
--

CREATE TABLE `carsearchsmall_action` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `carsearchsmall_action`
--

INSERT INTO `carsearchsmall_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1477992298),
(2, 'add_article', '查保养', '积分+5，每天上限5次', 'table:user|field:score|condition:id={$self}|rule:score+5|cycle:24|max:5', '', 2, 1, 1482480136),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, -1, 1383285646),
(4, 'add_document', '查车型', '积分+10，每天上限5次', 'table:user|field:score|condition:id={$self}|rule:score+10|cycle:24|max:5', '[user|get_username]在[time|time_format]\r\n进行了查车操作[model]，记录编号[record]。', 2, 1, 1482480035),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, -1, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_action_log`
--

CREATE TABLE `carsearchsmall_action_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表' ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `carsearchsmall_action_log`
--

INSERT INTO `carsearchsmall_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(115, 1, 1, 0, 'member', 1, 'bianfu在2016-11-17 17:39登录了后台', 1, 1479375591),
(116, 1, 1, 0, 'member', 1, 'bianfu在2016-11-18 09:36登录了后台', 1, 1479432965),
(117, 1, 1, 0, 'member', 1, 'bianfu在2016-11-21 09:59登录了后台', 1, 1479693579),
(118, 1, 1, 0, 'member', 1, 'bianfu在2016-12-14 18:03登录了后台', 1, 1481709802),
(119, 10, 1, 0, 'Menu', 135, '操作url：/Car/admin.php?s=/Menu/add.html', 1, 1482475071),
(120, 1, 1, 0, 'member', 1, 'bianfu在2016-12-23 15:22登录了后台', 1, 1482477776),
(121, 10, 1, 0, 'Menu', 136, '操作url：/Car/admin.php?s=/Menu/add.html', 1, 1482480752),
(122, 10, 1, 0, 'Menu', 136, '操作url：/Car/admin.php?s=/Menu/edit.html', 1, 1482480777),
(123, 10, 1, 0, 'Menu', 136, '操作url：/Car/admin.php?s=/Menu/edit.html', 1, 1482481672),
(124, 10, 1, 0, 'Menu', 136, '操作url：/Car/admin.php?s=/Menu/edit.html', 1, 1482724448);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_addons`
--

CREATE TABLE `carsearchsmall_addons` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 转存表中的数据 `carsearchsmall_addons`
--

INSERT INTO `carsearchsmall_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 0, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 0, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 0, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0),
(16, 'Advertising', '广告位置', '广告位插件', 1, 'null', 'thinkphp', '0.1', 1478079608, 1),
(17, 'Advs', '广告管理', '广告插件', 1, 'null', 'thinkphp', '0.1', 1478079746, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_admin`
--

CREATE TABLE `carsearchsmall_admin` (
  `id` int(11) NOT NULL,
  `administrator` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `operating data` varchar(255) DEFAULT NULL COMMENT '操作记录'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_advertising`
--

CREATE TABLE `carsearchsmall_advertising` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `type` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '广告位置展示方式  0为默认展示一张',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告位置表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `carsearchsmall_advertising`
--

INSERT INTO `carsearchsmall_advertising` (`id`, `title`, `type`, `width`, `height`, `status`) VALUES
(4, '首页轮播', 2, '800', '700', 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_advs`
--

CREATE TABLE `carsearchsmall_advs` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `position` int(11) NOT NULL COMMENT '广告位置',
  `advspic` int(11) NOT NULL COMMENT '图片地址',
  `advstext` text NOT NULL COMMENT '文字广告内容',
  `advshtml` text NOT NULL COMMENT '代码广告内容',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '结束时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `carsearchsmall_advs`
--

INSERT INTO `carsearchsmall_advs` (`id`, `title`, `position`, `advspic`, `advstext`, `advshtml`, `link`, `level`, `status`, `create_time`, `end_time`) VALUES
(4, 'bianfu', 4, 1, '', '', 'http://www.bianfuzhengxin.com/', 0, 1, 1478140080, 1479263280);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_attachment`
--

CREATE TABLE `carsearchsmall_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_attribute`
--

CREATE TABLE `carsearchsmall_attribute` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型属性表';

--
-- 转存表中的数据 `carsearchsmall_attribute`
--

INSERT INTO `carsearchsmall_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_auth_extend`
--

CREATE TABLE `carsearchsmall_auth_extend` (
  `group_id` mediumint(10) UNSIGNED NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) UNSIGNED NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `carsearchsmall_auth_extend`
--

INSERT INTO `carsearchsmall_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_auth_group`
--

CREATE TABLE `carsearchsmall_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_auth_group`
--

INSERT INTO `carsearchsmall_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_auth_group_access`
--

CREATE TABLE `carsearchsmall_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_auth_group_access`
--

INSERT INTO `carsearchsmall_auth_group_access` (`uid`, `group_id`) VALUES
(9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_auth_rule`
--

CREATE TABLE `carsearchsmall_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_auth_rule`
--

INSERT INTO `carsearchsmall_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/index', '内容', -1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/Article/examine', '审核列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(218, 'admin', 1, 'Admin/think/lists', '数据列表', 1, ''),
(219, 'admin', 1, 'Admin/User/pay_List', '充值记录', 1, ''),
(220, 'admin', 1, 'Admin/User/spend_List', '消费记录', 1, ''),
(221, 'admin', 1, 'Admin/Member/index', '管理员信息', -1, ''),
(222, 'admin', 1, 'Admin/Discount/index', '充值优惠', 1, ''),
(223, 'admin', 1, 'Admin/Discount/register', '注册优惠', -1, ''),
(224, 'admin', 2, 'Admin/Discount/index', '促销', 1, ''),
(225, 'admin', 1, 'Admin/Feedback/index', '意见反馈', 1, ''),
(226, 'admin', 1, 'Admin/Clearcache/index', '清除缓存', 1, ''),
(227, 'admin', 1, 'Admin/Fcoupon/index', '优惠类型', 1, ''),
(228, 'admin', 1, 'Admin/Fcoupon/edit', '新增优惠', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_car type_history`
--

CREATE TABLE `carsearchsmall_car type_history` (
  `id` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `VIN` varchar(255) NOT NULL,
  `vehicle information` varchar(255) NOT NULL COMMENT '车辆信息',
  `series` varchar(255) DEFAULT NULL COMMENT '车系',
  `type` varchar(255) DEFAULT NULL COMMENT '车型',
  `year` int(11) DEFAULT NULL COMMENT 'VIN对应的年份',
  `config` varchar(255) DEFAULT NULL COMMENT '车辆配置',
  `manufacturers` varchar(255) DEFAULT NULL COMMENT '厂家名称',
  `model year` varchar(255) DEFAULT NULL COMMENT '年款',
  `displacement` int(11) DEFAULT NULL COMMENT '排量',
  `engine model` varchar(255) DEFAULT NULL COMMENT '发动机型号',
  `transmission type` varchar(255) DEFAULT NULL COMMENT '变速箱类型',
  `gear number` int(11) DEFAULT NULL COMMENT '档位数',
  `effluent standard` varchar(255) DEFAULT NULL COMMENT '排放标准',
  `halt production` int(11) DEFAULT NULL COMMENT '停产年份',
  `price` float DEFAULT NULL COMMENT '指导价格',
  `vehicletype` int(11) DEFAULT NULL COMMENT '车辆类型',
  `car door` int(11) DEFAULT NULL COMMENT '车门数',
  `seat` int(11) DEFAULT NULL COMMENT '座位数',
  `KW` int(11) DEFAULT NULL COMMENT '发动机最大功率',
  `fueltype` varchar(255) DEFAULT NULL COMMENT '燃油类型',
  `AMT` varchar(255) DEFAULT NULL COMMENT '变速箱描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_car_delr`
--

CREATE TABLE `carsearchsmall_car_delr` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `hphm` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `wz_code` int(11) DEFAULT NULL,
  `wz_date` datetime NOT NULL,
  `act` varchar(255) NOT NULL,
  `score` varchar(255) NOT NULL,
  `pay_money` float NOT NULL,
  `pay_no` varchar(255) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `handled` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_car_delr`
--

INSERT INTO `carsearchsmall_car_delr` (`id`, `username`, `hphm`, `area`, `wz_code`, `wz_date`, `act`, `score`, `pay_money`, `pay_no`, `longitude`, `latitude`, `handled`, `time`) VALUES
(15, '13666666666', '晋KLV007', '文苑街南', 1352, '2013-10-06 09:50:00', '驾驶中型以上载客载货汽车、危险物品运输车辆以外的其他机动车行驶超过规定时速未达20%的', '3', 200, '067900104603', 112.738, 37.7101, '未处理', 1481772400),
(16, '13666666666', '晋KLV007', '文苑街南', 1352, '2013-10-06 09:50:00', '驾驶中型以上载客载货汽车、危险物品运输车辆以外的其他机动车行驶超过规定时速未达20%的', '3', 200, '067900104603', 112.738, 37.7101, '未处理', 1481852069);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_car_service`
--

CREATE TABLE `carsearchsmall_car_service` (
  `id` int(11) NOT NULL,
  `vin` varchar(255) NOT NULL,
  `MaintainDateTime` varchar(255) NOT NULL,
  `MilesNum` varchar(255) NOT NULL,
  `MaintainType` varchar(255) NOT NULL,
  `MaintainContent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_car_state`
--

CREATE TABLE `carsearchsmall_car_state` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `hphm` varchar(255) DEFAULT NULL,
  `vin` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_car_state`
--

INSERT INTO `carsearchsmall_car_state` (`id`, `username`, `hphm`, `vin`, `customer_name`, `state`, `time`) VALUES
(1, '13666666666', '陕A18S97', 'LFV5A24G1C3037916', '姜洲', '0', 1481958572),
(2, '13666666666', '陕A18S97', 'LFV5A24G1C3037916', '姜洲', '0', 1481958576),
(3, '13666666666', '陕A18S97', 'LFV5A24G1C3037916', '姜洲', '0', 1482111382),
(4, '13666666666', '陕A789RR', 'LJ8F2C5D2EB005467', '刘小七', '0', 1482287428),
(5, '13666666666', '陕A789RR', 'LJ8F2C5D2EB005467', '刘小七', '0', 1482370249);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_car_type`
--

CREATE TABLE `carsearchsmall_car_type` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `vin` varchar(255) NOT NULL,
  `vin_year` int(11) DEFAULT NULL COMMENT '车辆信息',
  `time` int(11) NOT NULL,
  `cjmc` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `series` varchar(255) DEFAULT NULL,
  `displacement` float DEFAULT NULL,
  `fdjxh` varchar(255) DEFAULT NULL,
  `bsqlx` varchar(255) DEFAULT NULL,
  `dws` int(11) DEFAULT NULL,
  `pfbz` varchar(255) DEFAULT NULL,
  `cxdm` varchar(255) DEFAULT NULL,
  `ssnf` int(11) DEFAULT NULL,
  `tcnf` int(11) DEFAULT NULL,
  `zdjg` float DEFAULT NULL,
  `ssyf` int(11) DEFAULT NULL,
  `scnf` int(11) DEFAULT NULL,
  `nk` int(11) DEFAULT NULL,
  `cxi` varchar(255) DEFAULT NULL,
  `xsmc` varchar(255) DEFAULT NULL,
  `cllx` varchar(255) DEFAULT NULL,
  `cl_lv` varchar(255) DEFAULT NULL,
  `csxs` varchar(255) DEFAULT NULL,
  `cms` varchar(255) DEFAULT NULL,
  `zws` int(11) DEFAULT NULL,
  `gonglv` int(11) DEFAULT NULL,
  `rylx` varchar(255) DEFAULT NULL,
  `bsxms` varchar(255) DEFAULT NULL,
  `rybh` varchar(255) DEFAULT NULL,
  `qdfs` varchar(255) DEFAULT NULL,
  `fdjgs` int(11) DEFAULT NULL,
  `level_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_car_type`
--

INSERT INTO `carsearchsmall_car_type` (`id`, `username`, `vin`, `vin_year`, `time`, `cjmc`, `brand`, `series`, `displacement`, `fdjxh`, `bsqlx`, `dws`, `pfbz`, `cxdm`, `ssnf`, `tcnf`, `zdjg`, `ssyf`, `scnf`, `nk`, `cxi`, `xsmc`, `cllx`, `cl_lv`, `csxs`, `cms`, `zws`, `gonglv`, `rylx`, `bsxms`, `rybh`, `qdfs`, `fdjgs`, `level_id`) VALUES
(4, '18700073381', 'LSGPC52U6AF102554', 2010, 1481879437, '上海通用', '雪佛兰', '科鲁兹', 1.6, 'LDE', '手动', 5, '国4', 'SGM7169MTA', 2010, 2011, 11.39, 8, 2010, 2010, '科鲁兹', '1.6 手动 SL 天地版', '轿车', '紧凑型车', '三厢', '四门', 5, 86, '汽油', '手动变速器(MT)', '93#', '前轮驱动', 4, 'CGX0516M0005'),
(5, '18700073381', 'LSGPC52U6AF102554', 2010, 1481882373, '上海通用', '雪佛兰', '科鲁兹', 1.6, 'LDE', '手动', 5, '国4', 'SGM7169MTA', 2010, 2011, 11.39, 8, 2010, 2010, '科鲁兹', '1.6 手动 SL 天地版', '轿车', '紧凑型车', '三厢', '四门', 5, 86, '汽油', '手动变速器(MT)', '93#', '前轮驱动', 4, 'CGX0516M0005'),
(6, '18700073381', 'LSGPC52U6AF102554', 2010, 1481945626, '上海通用', '雪佛兰', '科鲁兹', 1.6, 'LDE', '手动', 5, '国4', 'SGM7169MTA', 2010, 2011, 11.39, 8, 2010, 2010, '科鲁兹', '1.6 手动 SL 天地版', '轿车', '紧凑型车', '三厢', '四门', 5, 86, '汽油', '手动变速器(MT)', '93#', '前轮驱动', 4, 'CGX0516M0005'),
(7, '13666666666', 'LSGPC52U6AF102554', 2010, 1482206795, '上海通用', '雪佛兰', '科鲁兹', 1.6, 'LDE', '手动', 5, '国4', 'SGM7169MTA', 2010, 2011, 11.39, 8, 2010, 2010, '科鲁兹', '1.6 手动 SL 天地版', '轿车', '紧凑型车', '三厢', '四门', 5, 86, '汽油', '手动变速器(MT)', '93#', '前轮驱动', 4, 'CGX0516M0005'),
(8, '13666666666', 'LJ8F2C5D2EB005467', 2014, 1482219178, '众泰汽车', '众泰', 'T600', 1.5, '15S4G', '手动', 5, '国4', 'JNJ6460', 2013, 0, 7.98, 12, 2014, 2014, 'T600', '1.5T 手动 精英型', 'SUV', '中型车', '两厢', '五门', 5, 119, '汽油', '手动变速器(MT)', '93#', '前轮驱动', 4, '125539'),
(9, '13666666666', 'LJ8F2C5D2EB005467', 2014, 1482219193, '众泰汽车', '众泰', 'T600', 1.5, '15S4G', '手动', 5, '国4', 'JNJ6460', 2013, 0, 7.98, 12, 2014, 2014, 'T600', '1.5T 手动 精英型', 'SUV', '中型车', '两厢', '五门', 5, 119, '汽油', '手动变速器(MT)', '93#', '前轮驱动', 4, '125539');

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_category`
--

CREATE TABLE `carsearchsmall_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) UNSIGNED NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `carsearchsmall_category`
--

INSERT INTO `carsearchsmall_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'blog', '博客', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1382701539, 1, 0, ''),
(2, 'default_blog', '默认分类', 1, 1, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1386839751, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_channel`
--

CREATE TABLE `carsearchsmall_channel` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '频道ID',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '新窗口打开'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_channel`
--

INSERT INTO `carsearchsmall_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Index/index', 1, 1379475111, 1379923177, 1, 0),
(3, 0, '关于我们', 'http://www.bianfuzhengxin.com', 3, 1379475154, 1479268646, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_config`
--

CREATE TABLE `carsearchsmall_config` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_config`
--

INSERT INTO `carsearchsmall_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '车蝙蝠', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '车蝙蝠', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'ThinkPHP，carSearch', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_discount`
--

CREATE TABLE `carsearchsmall_discount` (
  `id` int(11) NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `typenum` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_document`
--

CREATE TABLE `carsearchsmall_document` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) UNSIGNED NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_document_article`
--

CREATE TABLE `carsearchsmall_document_article` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '收藏数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_document_download`
--

CREATE TABLE `carsearchsmall_document_download` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_expense`
--

CREATE TABLE `carsearchsmall_expense` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_expense`
--

INSERT INTO `carsearchsmall_expense` (`id`, `username`, `type`, `brand`, `money`, `time`) VALUES
(1, '13666666666', '查车型', '众泰', 15, 1482219178),
(2, '13666666666', '查车型', '众泰', 15, 1482219193),
(3, '13666666666', '查状态', '刘小七', 29, 1482287428),
(4, '13666666666', '查状态', '刘小七', 29, 1482370249);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_fcoupon`
--

CREATE TABLE `carsearchsmall_fcoupon` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'id',
  `name` varchar(225) NOT NULL DEFAULT '' COMMENT '标志',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '名称',
  `price` varchar(225) NOT NULL DEFAULT '' COMMENT '金额',
  `lownum` varchar(225) NOT NULL DEFAULT '' COMMENT '最低消费',
  `code` varchar(255) NOT NULL COMMENT '代码',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `linkid` varchar(255) NOT NULL DEFAULT '' COMMENT '外链',
  `allow_publish` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `starttime` int(11) NOT NULL COMMENT '开始时间',
  `endtime` int(11) NOT NULL COMMENT '结束时间',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类图标'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券表';

--
-- 转存表中的数据 `carsearchsmall_fcoupon`
--

INSERT INTO `carsearchsmall_fcoupon` (`id`, `name`, `title`, `price`, `lownum`, `code`, `description`, `linkid`, `allow_publish`, `display`, `reply`, `starttime`, `endtime`, `createtime`, `updatetime`, `status`, `icon`) VALUES
(23, '', '充值优惠', '10', '100', '1mubjiy2e', '', '', 0, 1, 0, 1480521600, 1484755200, 0, 0, 1, 2),
(38, '', '微软', '23', '', '', '', '', 0, 1, 0, 1482723244, 1482723244, 0, 0, 0, 0),
(37, '', '而', '23', '', '', '', '', 0, 1, 0, 1482723200, 1482723200, 0, 0, 0, 0),
(36, '', '是的', '', '', '', '', '', 0, 1, 0, 1482723187, 1482723187, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_feedback`
--

CREATE TABLE `carsearchsmall_feedback` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_feedback`
--

INSERT INTO `carsearchsmall_feedback` (`id`, `username`, `text`, `time`) VALUES
(1, '123456789', 'adfsfdsjskdjskd', NULL),
(2, '123456789', 'adfsfdsjskdjskd', 1482283173);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_file`
--

CREATE TABLE `carsearchsmall_file` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_hooks`
--

CREATE TABLE `carsearchsmall_hooks` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_hooks`
--

INSERT INTO `carsearchsmall_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam,Advertising', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_member`
--

CREATE TABLE `carsearchsmall_member` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `img` varchar(255) NOT NULL,
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `remain` float NOT NULL,
  `count` int(10) NOT NULL,
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `carsearchsmall_member`
--

INSERT INTO `carsearchsmall_member` (`uid`, `img`, `nickname`, `remain`, `count`, `reg_time`, `last_login_time`, `status`) VALUES
(1, '', 'bianfu', 0, 0, 1477448521, 1482477776, 1),
(7, '', 'wyl23', 0, 0, 1477896333, 1477896333, 1),
(12, '', 'phpcms', 0, 0, 1477568951, 1475988888, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_menu`
--

CREATE TABLE `carsearchsmall_menu` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_menu`
--

INSERT INTO `carsearchsmall_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(133, '新增优惠', 128, 2, 'Fcoupon/edit', 0, '', '优惠活动', 0, 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1),
(16, '用户', 0, 2, 'User/index', 0, '', '', 0, 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '安全管理', 0, 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(43, '扩展', 0, 6, 'Addons/index', 0, '', '', 0, 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1),
(108, '修改密码', 16, 0, 'User/updatePassword', 0, '', '安全管理', 0, 1),
(109, '修改昵称', 16, 0, 'User/updateNickname', 0, '', '安全管理', 0, 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1),
(123, '审核列表', 3, 0, 'Article/examine', 1, '', '', 0, 1),
(124, '充值记录', 16, 0, 'User/pay_List', 0, '', '用户管理', 0, 1),
(125, '消费记录', 16, 0, 'User/spend_List', 0, '', '用户管理', 0, 1),
(127, '意见反馈', 16, 0, 'Feedback/index', 0, '', '反馈列表', 0, 1),
(128, '促销', 0, 3, 'Fcoupon/index', 0, '', '', 0, 1),
(134, '促销管理', 128, 0, 'Discount/index', 0, '', '', 0, 1),
(132, '优惠类型', 128, 1, 'Fcoupon/index', 0, '', '优惠活动', 0, 1),
(131, '清除缓存', 68, 7, 'Clearcache/index', 0, '', '系统设置', 0, 1),
(135, '管理员', 16, 0, 'Member/index', 0, '', '系统管理员', 0, 1),
(136, '价格设定', 16, 1, 'Search/index', 0, '', '查询类型', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_model`
--

CREATE TABLE `carsearchsmall_model` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) UNSIGNED NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型表';

--
-- 转存表中的数据 `carsearchsmall_model`
--

INSERT INTO `carsearchsmall_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_pay`
--

CREATE TABLE `carsearchsmall_pay` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_picture`
--

CREATE TABLE `carsearchsmall_picture` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_picture`
--

INSERT INTO `carsearchsmall_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2016-11-03/581aa0e66696a.png', '', '7b0a8d0fad882654bea6b9e59a294233', '4355c9d4925a46cb1c71f89c58c2875415b35a09', 1, 1478140134),
(2, '/Uploads/Picture/2016-11-09/5822cf543bd49.png', '', '1660fc003ecec1dfa02df59402fe5dff', '56e6877d919c7ff135be933cac17415aa0c5f284', 1, 1478676308),
(3, '/Uploads/Picture/2016-11-12/5826abfb82e8d.png', '', 'ba8bf36538621181b4a67ff9357d521a', 'be47dfa218fd4d207b0850ec7acdf8922f20d981', 1, 1478929403);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_recharge`
--

CREATE TABLE `carsearchsmall_recharge` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `notify_time` int(11) NOT NULL,
  `out_trade_no` varchar(255) DEFAULT NULL,
  `notify_id` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `total_fee` varchar(255) DEFAULT NULL,
  `trade_status` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_search`
--

CREATE TABLE `carsearchsmall_search` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_search`
--

INSERT INTO `carsearchsmall_search` (`id`, `title`, `price`, `status`) VALUES
(1, '车类型查询', 29, 1),
(15, '车状态查询', 15, 1),
(16, '车保养查询', 23, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_ucenter_admin`
--

CREATE TABLE `carsearchsmall_ucenter_admin` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '管理员ID',
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_ucenter_app`
--

CREATE TABLE `carsearchsmall_ucenter_app` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_ucenter_member`
--

CREATE TABLE `carsearchsmall_ucenter_member` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `carsearchsmall_ucenter_member`
--

INSERT INTO `carsearchsmall_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'bianfu', 'a086fefd8c0b06ee53fecd9b66abd498', '811148509@qq.com', '', 1477448521, 0, 1482477776, 0, 1477448521, 1),
(2, 'aaa', '275f0d3f0a96d3028eb26bde34944406', 'abc@qq.com', '', 1477465728, 0, 1477465817, 0, 1477465728, 1),
(3, 'bbbb', '275f0d3f0a96d3028eb26bde34944406', '111@qq.com', '', 1477473230, 0, 1477473263, 0, 1477473230, 1),
(4, 'bianfu1', '622b4e80283ef4ee7d500f713bc34c12', '335719164@qq.com', '', 1477881153, 0, 0, 0, 1477881153, 1),
(5, 'bf', '622b4e80283ef4ee7d500f713bc34c12', '111123@qq.com', '', 1477881286, 0, 0, 0, 1477881286, 1),
(6, 'wyl', '089dc310f1c9237151bac30d8bf0471a', '77777777@qq.com', '', 1477882747, 0, 0, 0, 1477882747, 1),
(7, 'wyl23', '275f0d3f0a96d3028eb26bde34944406', '11134@qq.com', '', 1477896317, 0, 1477896333, 0, 1477896317, 1),
(8, 'rrr', '275f0d3f0a96d3028eb26bde34944406', '111346@qq.com', '', 1477907294, 0, 1477907403, 0, 1477907294, 1),
(9, 'bianfu123', '622b4e80283ef4ee7d500f713bc34c12', '811148556@qq.com', '', 1478139363, 0, 1478139395, 0, 1478139363, 1),
(10, 'wwu', 'e0987617a183dda1c9c456cc90c1d82e', '234354566@qq.com', '', 1479173412, 0, 0, 0, 1479173412, 1),
(11, '12569856421', '551f8debc12ccd92367d883e72a8dd5c', '7867575@qq.com', '', 1479268062, 0, 1479268125, 0, 1479268062, 1),
(12, 'phpcms', '275f0d3f0a96d3028eb26bde34944406', 'ddhjn@163.com', '', 1479277359, 0, 0, 0, 1479277359, 1),
(13, '非官方', '275f0d3f0a96d3028eb26bde34944406', 'rgtrhg@11.com', '', 1479350478, 0, 0, 0, 1479350478, 1),
(14, '恶搞', '275f0d3f0a96d3028eb26bde34944406', '811148501@qq.com', '', 1479350500, 0, 0, 0, 1479350500, 1),
(15, '斯菲尔德', '34ad59c55b20847f8b09a736737c1d97', '811148502@qq.com', '', 1479350521, 0, 0, 0, 1479350521, 1),
(16, 'root', '275f0d3f0a96d3028eb26bde34944406', '811148503@qq.com', '', 1479350544, 0, 0, 0, 1479350544, 1),
(17, '二而法国', '34ad59c55b20847f8b09a736737c1d97', '811148504@qq.com', '', 1479350563, 0, 0, 0, 1479350563, 1),
(18, '非官方1', '275f0d3f0a96d3028eb26bde34944406', '111148507@qq.com', '', 1479350604, 0, 0, 0, 1479350604, 1),
(19, '字段', '275f0d3f0a96d3028eb26bde34944406', '811148505@qq.com', '', 1479350622, 0, 0, 0, 1479350622, 1),
(20, '微微', '275f0d3f0a96d3028eb26bde34944406', '811148506@qq.com', '', 1479350639, 0, 0, 0, 1479350639, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_ucenter_setting`
--

CREATE TABLE `carsearchsmall_ucenter_setting` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '设置ID',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_url`
--

CREATE TABLE `carsearchsmall_url` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_user`
--

CREATE TABLE `carsearchsmall_user` (
  `id` int(11) NOT NULL,
  `username` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reg_time` int(11) NOT NULL,
  `lastlogin` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '查询次数',
  `remain` float DEFAULT NULL COMMENT '余额',
  `headicon` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_user`
--

INSERT INTO `carsearchsmall_user` (`id`, `username`, `password`, `reg_time`, `lastlogin`, `count`, `remain`, `headicon`, `status`) VALUES
(10, '18700073381', 'd41d8cd98f00b204e9800998ecf8427e', 1480315193, 1480321517, 0, 0, NULL, 1),
(11, '15594966573', '25f9e794323b453885f5181f1b624d0b', 1480322001, 1480469722, 0, 0, NULL, 1),
(12, '13666666666', '25f9e794323b453885f5181f1b624d0b', 1480470075, 1482460485, 7, 913, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_userdata`
--

CREATE TABLE `carsearchsmall_userdata` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT '类型标识',
  `target_id` int(10) UNSIGNED NOT NULL COMMENT '目标id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_userinfo`
--

CREATE TABLE `carsearchsmall_userinfo` (
  `id` int(11) NOT NULL,
  `username` varchar(11) NOT NULL,
  `topup` float(255,0) DEFAULT NULL COMMENT '充值记录',
  `consumption` float DEFAULT NULL COMMENT '消费记录'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_user_service_history`
--

CREATE TABLE `carsearchsmall_user_service_history` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `vin` varchar(255) NOT NULL,
  `Models` varchar(255) NOT NULL COMMENT '车型名称',
  `Brand` varchar(255) NOT NULL COMMENT '品牌名称',
  `Transmission` varchar(255) NOT NULL COMMENT '变速器',
  `Exhaust` varchar(255) NOT NULL COMMENT '排量',
  `StructuralRecording` varchar(255) NOT NULL COMMENT '结构部件记录',
  `AirbagRecord` varchar(255) NOT NULL COMMENT '安全气囊记录',
  `OdometerRecords` varchar(255) NOT NULL COMMENT '里程表记录',
  `MaintenanceTimes` varchar(255) NOT NULL COMMENT '维保次数',
  `MaximumMileage` varchar(255) NOT NULL COMMENT '最大里程数',
  `money` float NOT NULL,
  `state` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carsearchsmall_user_service_history`
--

INSERT INTO `carsearchsmall_user_service_history` (`id`, `username`, `vin`, `Models`, `Brand`, `Transmission`, `Exhaust`, `StructuralRecording`, `AirbagRecord`, `OdometerRecords`, `MaintenanceTimes`, `MaximumMileage`, `money`, `state`, `time`) VALUES
(1, '15594961111', 'LFV5A23G1C3037916', '奥迪', '', '查询成功', '2016-11-02 10:42:18', '', '', '', '', '', 29, 0, 0),
(2, '15594961111', '123456789', '奥迪', '', '查询失败', '2016-11-02 10:55:49', '', '', '', '', '', 29, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_user_state_history`
--

CREATE TABLE `carsearchsmall_user_state_history` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `vin` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `plate number` varchar(255) NOT NULL,
  `truename` varchar(255) NOT NULL,
  `money` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `carsearchsmall_user_type_history`
--

CREATE TABLE `carsearchsmall_user_type_history` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `vin` varchar(255) NOT NULL,
  `car info` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carsearchsmall_action`
--
ALTER TABLE `carsearchsmall_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_action_log`
--
ALTER TABLE `carsearchsmall_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_ip_ix` (`action_ip`),
  ADD KEY `action_id_ix` (`action_id`),
  ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `carsearchsmall_addons`
--
ALTER TABLE `carsearchsmall_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_admin`
--
ALTER TABLE `carsearchsmall_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_advertising`
--
ALTER TABLE `carsearchsmall_advertising`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_advs`
--
ALTER TABLE `carsearchsmall_advs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_attachment`
--
ALTER TABLE `carsearchsmall_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_record_status` (`record_id`,`status`);

--
-- Indexes for table `carsearchsmall_attribute`
--
ALTER TABLE `carsearchsmall_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `carsearchsmall_auth_extend`
--
ALTER TABLE `carsearchsmall_auth_extend`
  ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  ADD KEY `uid` (`group_id`),
  ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `carsearchsmall_auth_group`
--
ALTER TABLE `carsearchsmall_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_auth_group_access`
--
ALTER TABLE `carsearchsmall_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `carsearchsmall_auth_rule`
--
ALTER TABLE `carsearchsmall_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `carsearchsmall_car type_history`
--
ALTER TABLE `carsearchsmall_car type_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_car_delr`
--
ALTER TABLE `carsearchsmall_car_delr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_car_service`
--
ALTER TABLE `carsearchsmall_car_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_car_state`
--
ALTER TABLE `carsearchsmall_car_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_car_type`
--
ALTER TABLE `carsearchsmall_car_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_category`
--
ALTER TABLE `carsearchsmall_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `carsearchsmall_channel`
--
ALTER TABLE `carsearchsmall_channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `carsearchsmall_config`
--
ALTER TABLE `carsearchsmall_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `carsearchsmall_discount`
--
ALTER TABLE `carsearchsmall_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_document`
--
ALTER TABLE `carsearchsmall_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_status` (`category_id`,`status`),
  ADD KEY `idx_status_type_pid` (`status`,`uid`,`pid`);

--
-- Indexes for table `carsearchsmall_document_article`
--
ALTER TABLE `carsearchsmall_document_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_document_download`
--
ALTER TABLE `carsearchsmall_document_download`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_expense`
--
ALTER TABLE `carsearchsmall_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_fcoupon`
--
ALTER TABLE `carsearchsmall_fcoupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_feedback`
--
ALTER TABLE `carsearchsmall_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_file`
--
ALTER TABLE `carsearchsmall_file`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `carsearchsmall_hooks`
--
ALTER TABLE `carsearchsmall_hooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `carsearchsmall_member`
--
ALTER TABLE `carsearchsmall_member`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `carsearchsmall_menu`
--
ALTER TABLE `carsearchsmall_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `carsearchsmall_model`
--
ALTER TABLE `carsearchsmall_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_pay`
--
ALTER TABLE `carsearchsmall_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_picture`
--
ALTER TABLE `carsearchsmall_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_recharge`
--
ALTER TABLE `carsearchsmall_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_search`
--
ALTER TABLE `carsearchsmall_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_ucenter_admin`
--
ALTER TABLE `carsearchsmall_ucenter_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_ucenter_app`
--
ALTER TABLE `carsearchsmall_ucenter_app`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `carsearchsmall_ucenter_member`
--
ALTER TABLE `carsearchsmall_ucenter_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `carsearchsmall_ucenter_setting`
--
ALTER TABLE `carsearchsmall_ucenter_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_url`
--
ALTER TABLE `carsearchsmall_url`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_url` (`url`);

--
-- Indexes for table `carsearchsmall_user`
--
ALTER TABLE `carsearchsmall_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_userdata`
--
ALTER TABLE `carsearchsmall_userdata`
  ADD UNIQUE KEY `uid` (`uid`,`type`,`target_id`);

--
-- Indexes for table `carsearchsmall_userinfo`
--
ALTER TABLE `carsearchsmall_userinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_user_service_history`
--
ALTER TABLE `carsearchsmall_user_service_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_user_state_history`
--
ALTER TABLE `carsearchsmall_user_state_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carsearchsmall_user_type_history`
--
ALTER TABLE `carsearchsmall_user_type_history`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `carsearchsmall_action`
--
ALTER TABLE `carsearchsmall_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_action_log`
--
ALTER TABLE `carsearchsmall_action_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=125;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_addons`
--
ALTER TABLE `carsearchsmall_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_admin`
--
ALTER TABLE `carsearchsmall_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_advertising`
--
ALTER TABLE `carsearchsmall_advertising`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_advs`
--
ALTER TABLE `carsearchsmall_advs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_attachment`
--
ALTER TABLE `carsearchsmall_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_attribute`
--
ALTER TABLE `carsearchsmall_attribute`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_auth_group`
--
ALTER TABLE `carsearchsmall_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_auth_rule`
--
ALTER TABLE `carsearchsmall_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键', AUTO_INCREMENT=229;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_car type_history`
--
ALTER TABLE `carsearchsmall_car type_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_car_delr`
--
ALTER TABLE `carsearchsmall_car_delr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_car_service`
--
ALTER TABLE `carsearchsmall_car_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_car_state`
--
ALTER TABLE `carsearchsmall_car_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_car_type`
--
ALTER TABLE `carsearchsmall_car_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_category`
--
ALTER TABLE `carsearchsmall_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID', AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_channel`
--
ALTER TABLE `carsearchsmall_channel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_config`
--
ALTER TABLE `carsearchsmall_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID', AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_discount`
--
ALTER TABLE `carsearchsmall_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_document`
--
ALTER TABLE `carsearchsmall_document`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_expense`
--
ALTER TABLE `carsearchsmall_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_fcoupon`
--
ALTER TABLE `carsearchsmall_fcoupon`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_feedback`
--
ALTER TABLE `carsearchsmall_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_file`
--
ALTER TABLE `carsearchsmall_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID';
--
-- 使用表AUTO_INCREMENT `carsearchsmall_hooks`
--
ALTER TABLE `carsearchsmall_hooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_member`
--
ALTER TABLE `carsearchsmall_member`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_menu`
--
ALTER TABLE `carsearchsmall_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID', AUTO_INCREMENT=137;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_model`
--
ALTER TABLE `carsearchsmall_model`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模型ID', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_pay`
--
ALTER TABLE `carsearchsmall_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_picture`
--
ALTER TABLE `carsearchsmall_picture`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_recharge`
--
ALTER TABLE `carsearchsmall_recharge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_search`
--
ALTER TABLE `carsearchsmall_search`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_ucenter_admin`
--
ALTER TABLE `carsearchsmall_ucenter_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- 使用表AUTO_INCREMENT `carsearchsmall_ucenter_app`
--
ALTER TABLE `carsearchsmall_ucenter_app`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用ID';
--
-- 使用表AUTO_INCREMENT `carsearchsmall_ucenter_member`
--
ALTER TABLE `carsearchsmall_ucenter_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_ucenter_setting`
--
ALTER TABLE `carsearchsmall_ucenter_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设置ID';
--
-- 使用表AUTO_INCREMENT `carsearchsmall_url`
--
ALTER TABLE `carsearchsmall_url`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识';
--
-- 使用表AUTO_INCREMENT `carsearchsmall_user`
--
ALTER TABLE `carsearchsmall_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_userinfo`
--
ALTER TABLE `carsearchsmall_userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_user_service_history`
--
ALTER TABLE `carsearchsmall_user_service_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_user_state_history`
--
ALTER TABLE `carsearchsmall_user_state_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `carsearchsmall_user_type_history`
--
ALTER TABLE `carsearchsmall_user_type_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
