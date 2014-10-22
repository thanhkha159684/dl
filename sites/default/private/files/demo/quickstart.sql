-- Demo module database dump
-- Version 1.1
-- http://drupal.org/project/demo
--
-- Database: quickstart
-- Date: Sun, 06/03/2012 - 16:40
-- Server version: 5.5.8
-- PHP version: 5.3.5
-- Drupal version: 7.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET FOREIGN_KEY_CHECKS = 0;

SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8;

--
-- Table structure for table 'actions'
--

CREATE TABLE IF NOT EXISTS `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Label of the action.',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores action information.';

--
-- Dumping data for table 'actions'
--

/*!40000 ALTER TABLE actions DISABLE KEYS */;
INSERT INTO `actions` VALUES
('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment'),
('comment_save_action', 'comment', 'comment_save_action', '', 'Save comment'),
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make content sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make content unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote content to front page'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish content'),
('node_save_action', 'node', 'node_save_action', '', 'Save content'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove content from front page'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish content'),
('pathauto_node_update_action', 'node', 'pathauto_node_update_action', '', 'Update node alias'),
('pathauto_taxonomy_term_update_action', 'taxonomy_term', 'pathauto_taxonomy_term_update_action', '', 'Update taxonomy term alias'),
('pathauto_user_update_action', 'user', 'pathauto_user_update_action', '', 'Update user alias'),
('system_block_ip_action', 'user', 'system_block_ip_action', '', 'Ban IP address of current user'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user');
/*!40000 ALTER TABLE actions ENABLE KEYS */;

--
-- Table structure for table 'authmap'
--

CREATE TABLE IF NOT EXISTS `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique authmap ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'User’s users.uid.',
  `authname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Unique authentication name.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'Module which is controlling the authentication.',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores distributed authentication mapping.';

--
-- Dumping data for table 'authmap'
--

/*!40000 ALTER TABLE authmap DISABLE KEYS */;
/*!40000 ALTER TABLE authmap ENABLE KEYS */;

--
-- Table structure for table 'backup_migrate_destinations'
--

CREATE TABLE IF NOT EXISTS `backup_migrate_destinations` (
  `destination_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `type` varchar(32) NOT NULL COMMENT 'The type of the destination.',
  `location` text NOT NULL COMMENT 'The the location string of the destination.',
  `settings` text NOT NULL COMMENT 'Other settings for the destination.',
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table 'backup_migrate_destinations'
--

/*!40000 ALTER TABLE backup_migrate_destinations DISABLE KEYS */;
/*!40000 ALTER TABLE backup_migrate_destinations ENABLE KEYS */;

--
-- Table structure for table 'backup_migrate_profiles'
--

CREATE TABLE IF NOT EXISTS `backup_migrate_profiles` (
  `profile_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `filename` varchar(255) NOT NULL,
  `append_timestamp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Append a timestamp to the filename.',
  `timestamp_format` varchar(14) NOT NULL COMMENT 'The format of the timestamp.',
  `filters` text NOT NULL COMMENT 'The filter settings for the profile.',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table 'backup_migrate_profiles'
--

/*!40000 ALTER TABLE backup_migrate_profiles DISABLE KEYS */;
/*!40000 ALTER TABLE backup_migrate_profiles ENABLE KEYS */;

--
-- Table structure for table 'backup_migrate_schedules'
--

CREATE TABLE IF NOT EXISTS `backup_migrate_schedules` (
  `schedule_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `source_id` varchar(32) NOT NULL DEFAULT 'db' COMMENT 'The backup_migrate_destination.destination_id of the source to backup from.',
  `destination_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The backup_migrate_destination.destination_id of the destination to back up to.',
  `profile_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `keep` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of backups to keep.',
  `period` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of seconds between backups.',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether the schedule is enabled.',
  `cron` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether the schedule should be run during cron.',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table 'backup_migrate_schedules'
--

/*!40000 ALTER TABLE backup_migrate_schedules DISABLE KEYS */;
/*!40000 ALTER TABLE backup_migrate_schedules ENABLE KEYS */;

--
-- Table structure for table 'batch'
--

CREATE TABLE IF NOT EXISTS `batch` (
  `bid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` int(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.',
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores details about batches (processes that run in...';

--
-- Dumping data for table 'batch'
--

/*!40000 ALTER TABLE batch DISABLE KEYS */;
/*!40000 ALTER TABLE batch ENABLE KEYS */;

--
-- Table structure for table 'block'
--

CREATE TABLE IF NOT EXISTS `block` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the `Pages` block; contains either a list of paths on which to include/exclude the block or PHP code, depending on `visibility` setting.',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores block settings, such as region and visibility...';

--
-- Dumping data for table 'block'
--

/*!40000 ALTER TABLE block DISABLE KEYS */;
INSERT INTO `block` VALUES
('1', 'system', 'main', 'bartik', '1', '0', 'content', '0', '0', '', '', '-1'),
('2', 'search', 'form', 'bartik', '1', '-1', 'sidebar_first', '0', '0', '', '', '-1'),
('3', 'node', 'recent', 'seven', '0', '10', '-1', '0', '0', '', '', '-1'),
('4', 'user', 'login', 'bartik', '1', '0', 'sidebar_first', '0', '0', '', '', '-1'),
('5', 'system', 'navigation', 'bartik', '1', '0', 'sidebar_first', '0', '0', '', '', '-1'),
('6', 'system', 'powered-by', 'bartik', '0', '-9', '-1', '0', '0', '', '', '-1'),
('7', 'system', 'help', 'bartik', '1', '0', 'help', '0', '0', '', '', '-1'),
('8', 'system', 'main', 'seven', '1', '0', 'content', '0', '0', '', '', '-1'),
('9', 'system', 'help', 'seven', '1', '0', 'help', '0', '0', '', '', '-1'),
('10', 'user', 'login', 'seven', '1', '10', 'content', '0', '0', '', '', '-1'),
('11', 'user', 'new', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('12', 'search', 'form', 'seven', '0', '-10', '-1', '0', '0', '', '', '-1'),
('13', 'comment', 'recent', 'bartik', '0', '0', '-1', '0', '0', '', '', '1'),
('14', 'node', 'syndicate', 'bartik', '0', '-1', '-1', '0', '0', '', '', '-1'),
('15', 'node', 'recent', 'bartik', '0', '-4', '-1', '0', '0', '', '', '1'),
('16', 'shortcut', 'shortcuts', 'bartik', '0', '-3', '-1', '0', '0', '', '', '-1'),
('17', 'system', 'management', 'bartik', '0', '-5', '-1', '0', '0', '', '', '-1'),
('18', 'system', 'user-menu', 'bartik', '0', '0', '-1', '0', '0', '', '', '-1'),
('19', 'system', 'main-menu', 'bartik', '0', '-6', '-1', '0', '0', '', '', '-1'),
('20', 'user', 'new', 'bartik', '0', '1', '-1', '0', '0', '', '', '1'),
('21', 'user', 'online', 'bartik', '0', '2', '-1', '0', '0', '', '', '-1'),
('22', 'comment', 'recent', 'seven', '0', '0', '-1', '0', '0', '', '', '1'),
('23', 'node', 'syndicate', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('24', 'shortcut', 'shortcuts', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('25', 'system', 'powered-by', 'seven', '0', '10', '-1', '0', '0', '', '', '-1'),
('26', 'system', 'navigation', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('27', 'system', 'management', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('28', 'system', 'user-menu', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('29', 'system', 'main-menu', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('30', 'user', 'online', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('31', 'menu', 'devel', 'bartik', '0', '-9', '-1', '0', '0', '', '', '-1'),
('32', 'menu', 'features', 'bartik', '0', '-7', '-1', '0', '0', '', '', '-1'),
('33', 'devel', 'execute_php', 'bartik', '0', '-8', '-1', '0', '0', '', '', '-1'),
('34', 'devel', 'switch_user', 'bartik', '0', '-2', '-1', '0', '0', '', '', '-1'),
('35', 'menu', 'devel', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('36', 'menu', 'features', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('37', 'devel', 'execute_php', 'seven', '0', '0', '-1', '0', '0', '', '', '-1'),
('38', 'devel', 'switch_user', 'seven', '0', '0', '-1', '0', '0', '', '', '-1');
/*!40000 ALTER TABLE block ENABLE KEYS */;

--
-- Table structure for table 'block_custom'
--

CREATE TABLE IF NOT EXISTS `block_custom` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The block’s block.bid.',
  `body` longtext COMMENT 'Block contents.',
  `info` varchar(128) NOT NULL DEFAULT '' COMMENT 'Block description.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the block body.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores contents of custom-made blocks.';

--
-- Dumping data for table 'block_custom'
--

/*!40000 ALTER TABLE block_custom DISABLE KEYS */;
/*!40000 ALTER TABLE block_custom ENABLE KEYS */;

--
-- Table structure for table 'block_node_type'
--

CREATE TABLE IF NOT EXISTS `block_node_type` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.',
  PRIMARY KEY (`module`,`delta`,`type`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Sets up display criteria for blocks based on content types';

--
-- Dumping data for table 'block_node_type'
--

/*!40000 ALTER TABLE block_node_type DISABLE KEYS */;
/*!40000 ALTER TABLE block_node_type ENABLE KEYS */;

--
-- Table structure for table 'block_role'
--

CREATE TABLE IF NOT EXISTS `block_role` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `rid` int(10) unsigned NOT NULL COMMENT 'The user’s role ID from users_roles.rid.',
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Sets up access permissions for blocks based on user roles';

--
-- Dumping data for table 'block_role'
--

/*!40000 ALTER TABLE block_role DISABLE KEYS */;
/*!40000 ALTER TABLE block_role ENABLE KEYS */;

--
-- Table structure for table 'blocked_ips'
--

CREATE TABLE IF NOT EXISTS `blocked_ips` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` varchar(40) NOT NULL DEFAULT '' COMMENT 'IP address',
  PRIMARY KEY (`iid`),
  KEY `blocked_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores blocked IP addresses.';

--
-- Dumping data for table 'blocked_ips'
--

/*!40000 ALTER TABLE blocked_ips DISABLE KEYS */;
/*!40000 ALTER TABLE blocked_ips ENABLE KEYS */;

--
-- Table structure for table 'cache'
--

CREATE TABLE IF NOT EXISTS `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Generic cache table for caching things not separated out...';

--
-- Table structure for table 'cache_block'
--

CREATE TABLE IF NOT EXISTS `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for the Block module to store already built...';

--
-- Table structure for table 'cache_bootstrap'
--

CREATE TABLE IF NOT EXISTS `cache_bootstrap` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for data required to bootstrap Drupal, may be...';

--
-- Table structure for table 'cache_field'
--

CREATE TABLE IF NOT EXISTS `cache_field` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Generic cache table for caching things not separated out...';

--
-- Table structure for table 'cache_filter'
--

CREATE TABLE IF NOT EXISTS `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for the Filter module to store already...';

--
-- Table structure for table 'cache_form'
--

CREATE TABLE IF NOT EXISTS `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for the form system to store recently built...';

--
-- Table structure for table 'cache_image'
--

CREATE TABLE IF NOT EXISTS `cache_image` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table used to store information about image...';

--
-- Dumping data for table 'cache_image'
--

/*!40000 ALTER TABLE cache_image DISABLE KEYS */;
/*!40000 ALTER TABLE cache_image ENABLE KEYS */;

--
-- Table structure for table 'cache_menu'
--

CREATE TABLE IF NOT EXISTS `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for the menu system to store router...';

--
-- Table structure for table 'cache_page'
--

CREATE TABLE IF NOT EXISTS `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table used to store compressed pages for anonymous...';

--
-- Table structure for table 'cache_path'
--

CREATE TABLE IF NOT EXISTS `cache_path` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for path alias lookup.';

--
-- Table structure for table 'cache_token'
--

CREATE TABLE IF NOT EXISTS `cache_token` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for token information.';

--
-- Dumping data for table 'cache_token'
--

/*!40000 ALTER TABLE cache_token DISABLE KEYS */;
INSERT INTO `cache_token` VALUES
('field:info', 'a:1:{s:4:"body";a:5:{s:11:"token types";a:1:{i:0;s:4:"node";}s:6:"labels";a:1:{i:0;s:4:"Body";}s:7:"bundles";a:1:{s:4:"node";a:1:{s:4:"page";s:10:"Basic page";}}s:5:"label";s:4:"Body";s:11:"description";s:28:"Long text and summary field.";}}', '0', '1338716263', 1);
/*!40000 ALTER TABLE cache_token ENABLE KEYS */;

--
-- Table structure for table 'cache_update'
--

CREATE TABLE IF NOT EXISTS `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for the Update module to store information...';

--
-- Table structure for table 'cache_views'
--

CREATE TABLE IF NOT EXISTS `cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Generic cache table for caching things not separated out...';

--
-- Table structure for table 'cache_views_data'
--

CREATE TABLE IF NOT EXISTS `cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '1' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Cache table for views to store pre-rendered queries,...';

--
-- Table structure for table 'comment'
--

CREATE TABLE IF NOT EXISTS `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique comment ID.',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` varchar(64) NOT NULL DEFAULT '' COMMENT 'The comment title.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The author’s host name.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` varchar(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` varchar(60) DEFAULT NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` varchar(64) DEFAULT NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this comment.',
  PRIMARY KEY (`cid`),
  KEY `comment_status_pid` (`pid`,`status`),
  KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  KEY `comment_uid` (`uid`),
  KEY `comment_nid_language` (`nid`,`language`),
  KEY `comment_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores comments and associated data.';

--
-- Dumping data for table 'comment'
--

/*!40000 ALTER TABLE comment DISABLE KEYS */;
/*!40000 ALTER TABLE comment ENABLE KEYS */;

--
-- Table structure for table 'ctools_css_cache'
--

CREATE TABLE IF NOT EXISTS `ctools_css_cache` (
  `cid` varchar(128) NOT NULL COMMENT 'The CSS ID this cache object belongs to.',
  `filename` varchar(255) DEFAULT NULL COMMENT 'The filename this CSS is stored in.',
  `css` longtext COMMENT 'CSS being stored.',
  `filter` tinyint(4) DEFAULT NULL COMMENT 'Whether or not this CSS needs to be filtered.',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A special cache used to store CSS that must be non-volatile.';

--
-- Dumping data for table 'ctools_css_cache'
--

/*!40000 ALTER TABLE ctools_css_cache DISABLE KEYS */;
/*!40000 ALTER TABLE ctools_css_cache ENABLE KEYS */;

--
-- Table structure for table 'ctools_object_cache'
--

CREATE TABLE IF NOT EXISTS `ctools_object_cache` (
  `sid` varchar(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` varchar(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` varchar(32) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` longtext COMMENT 'Serialized data being stored.',
  PRIMARY KEY (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A special cache used to store objects that are being...';

--
-- Table structure for table 'date_format_locale'
--

CREATE TABLE IF NOT EXISTS `date_format_locale` (
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` varchar(12) NOT NULL COMMENT 'A languages.language for this format to be used with.',
  PRIMARY KEY (`type`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores configured date formats for each locale.';

--
-- Dumping data for table 'date_format_locale'
--

/*!40000 ALTER TABLE date_format_locale DISABLE KEYS */;
/*!40000 ALTER TABLE date_format_locale ENABLE KEYS */;

--
-- Table structure for table 'date_format_type'
--

CREATE TABLE IF NOT EXISTS `date_format_type` (
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` varchar(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this is a system provided format.',
  PRIMARY KEY (`type`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores configured date format types.';

--
-- Dumping data for table 'date_format_type'
--

/*!40000 ALTER TABLE date_format_type DISABLE KEYS */;
INSERT INTO `date_format_type` VALUES
('long', 'Long', '1'),
('medium', 'Medium', '1'),
('short', 'Short', '1');
/*!40000 ALTER TABLE date_format_type ENABLE KEYS */;

--
-- Table structure for table 'date_formats'
--

CREATE TABLE IF NOT EXISTS `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.',
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores configured date formats.';

--
-- Dumping data for table 'date_formats'
--

/*!40000 ALTER TABLE date_formats DISABLE KEYS */;
INSERT INTO `date_formats` VALUES
('1', 'Y-m-d H:i', 'short', '1'),
('2', 'm/d/Y - H:i', 'short', '1'),
('3', 'd/m/Y - H:i', 'short', '1'),
('4', 'Y/m/d - H:i', 'short', '1'),
('5', 'd.m.Y - H:i', 'short', '1'),
('6', 'm/d/Y - g:ia', 'short', '1'),
('7', 'd/m/Y - g:ia', 'short', '1'),
('8', 'Y/m/d - g:ia', 'short', '1'),
('9', 'M j Y - H:i', 'short', '1'),
('10', 'j M Y - H:i', 'short', '1'),
('11', 'Y M j - H:i', 'short', '1'),
('12', 'M j Y - g:ia', 'short', '1'),
('13', 'j M Y - g:ia', 'short', '1'),
('14', 'Y M j - g:ia', 'short', '1'),
('15', 'D, Y-m-d H:i', 'medium', '1'),
('16', 'D, m/d/Y - H:i', 'medium', '1'),
('17', 'D, d/m/Y - H:i', 'medium', '1'),
('18', 'D, Y/m/d - H:i', 'medium', '1'),
('19', 'F j, Y - H:i', 'medium', '1'),
('20', 'j F, Y - H:i', 'medium', '1'),
('21', 'Y, F j - H:i', 'medium', '1'),
('22', 'D, m/d/Y - g:ia', 'medium', '1'),
('23', 'D, d/m/Y - g:ia', 'medium', '1'),
('24', 'D, Y/m/d - g:ia', 'medium', '1'),
('25', 'F j, Y - g:ia', 'medium', '1'),
('26', 'j F Y - g:ia', 'medium', '1'),
('27', 'Y, F j - g:ia', 'medium', '1'),
('28', 'j. F Y - G:i', 'medium', '1'),
('29', 'l, F j, Y - H:i', 'long', '1'),
('30', 'l, j F, Y - H:i', 'long', '1'),
('31', 'l, Y,  F j - H:i', 'long', '1'),
('32', 'l, F j, Y - g:ia', 'long', '1'),
('33', 'l, j F Y - g:ia', 'long', '1'),
('34', 'l, Y,  F j - g:ia', 'long', '1'),
('35', 'l, j. F Y - G:i', 'long', '1');
/*!40000 ALTER TABLE date_formats ENABLE KEYS */;

--
-- Table structure for table 'field_config'
--

CREATE TABLE IF NOT EXISTS `field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name` (`field_name`),
  KEY `active` (`active`),
  KEY `storage_active` (`storage_active`),
  KEY `deleted` (`deleted`),
  KEY `module` (`module`),
  KEY `storage_module` (`storage_module`),
  KEY `type` (`type`),
  KEY `storage_type` (`storage_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table 'field_config'
--

/*!40000 ALTER TABLE field_config DISABLE KEYS */;
INSERT INTO `field_config` VALUES
('1', 'comment_body', 'text_long', 'text', '1', 'field_sql_storage', 'field_sql_storage', '1', '0', 'a:6:{s:12:"entity_types";a:1:{i:0;s:7:"comment";}s:12:"translatable";b:0;s:8:"settings";a:0:{}s:7:"storage";a:4:{s:4:"type";s:17:"field_sql_storage";s:8:"settings";a:0:{}s:6:"module";s:17:"field_sql_storage";s:6:"active";i:1;}s:12:"foreign keys";a:1:{s:6:"format";a:2:{s:5:"table";s:13:"filter_format";s:7:"columns";a:1:{s:6:"format";s:6:"format";}}}s:7:"indexes";a:1:{s:6:"format";a:1:{i:0;s:6:"format";}}}', '1', '0', '0'),
('2', 'body', 'text_with_summary', 'text', '1', 'field_sql_storage', 'field_sql_storage', '1', '0', 'a:6:{s:12:"entity_types";a:1:{i:0;s:4:"node";}s:12:"translatable";b:0;s:8:"settings";a:0:{}s:7:"storage";a:4:{s:4:"type";s:17:"field_sql_storage";s:8:"settings";a:0:{}s:6:"module";s:17:"field_sql_storage";s:6:"active";i:1;}s:12:"foreign keys";a:1:{s:6:"format";a:2:{s:5:"table";s:13:"filter_format";s:7:"columns";a:1:{s:6:"format";s:6:"format";}}}s:7:"indexes";a:1:{s:6:"format";a:1:{i:0;s:6:"format";}}}', '1', '0', '0');
/*!40000 ALTER TABLE field_config ENABLE KEYS */;

--
-- Table structure for table 'field_config_instance'
--

CREATE TABLE IF NOT EXISTS `field_config_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table 'field_config_instance'
--

/*!40000 ALTER TABLE field_config_instance DISABLE KEYS */;
INSERT INTO `field_config_instance` VALUES
('1', '1', 'comment_body', 'comment', 'comment_node_page', 'a:6:{s:5:"label";s:7:"Comment";s:8:"settings";a:2:{s:15:"text_processing";i:1;s:18:"user_register_form";b:0;}s:8:"required";b:1;s:7:"display";a:1:{s:7:"default";a:5:{s:5:"label";s:6:"hidden";s:4:"type";s:12:"text_default";s:6:"weight";i:0;s:8:"settings";a:0:{}s:6:"module";s:4:"text";}}s:6:"widget";a:4:{s:4:"type";s:13:"text_textarea";s:8:"settings";a:1:{s:4:"rows";i:5;}s:6:"weight";i:0;s:6:"module";s:4:"text";}s:11:"description";s:0:"";}', '0'),
('2', '2', 'body', 'node', 'page', 'a:6:{s:5:"label";s:4:"Body";s:6:"widget";a:4:{s:4:"type";s:26:"text_textarea_with_summary";s:8:"settings";a:2:{s:4:"rows";i:20;s:12:"summary_rows";i:5;}s:6:"weight";i:-4;s:6:"module";s:4:"text";}s:8:"settings";a:3:{s:15:"display_summary";b:1;s:15:"text_processing";i:1;s:18:"user_register_form";b:0;}s:7:"display";a:2:{s:7:"default";a:5:{s:5:"label";s:6:"hidden";s:4:"type";s:12:"text_default";s:8:"settings";a:0:{}s:6:"module";s:4:"text";s:6:"weight";i:0;}s:6:"teaser";a:5:{s:5:"label";s:6:"hidden";s:4:"type";s:23:"text_summary_or_trimmed";s:8:"settings";a:1:{s:11:"trim_length";i:600;}s:6:"module";s:4:"text";s:6:"weight";i:0;}}s:8:"required";b:0;s:11:"description";s:0:"";}', '0'),
('3', '1', 'comment_body', 'comment', 'comment_node_article', 'a:6:{s:5:"label";s:7:"Comment";s:8:"settings";a:2:{s:15:"text_processing";i:1;s:18:"user_register_form";b:0;}s:8:"required";b:1;s:7:"display";a:1:{s:7:"default";a:5:{s:5:"label";s:6:"hidden";s:4:"type";s:12:"text_default";s:6:"weight";i:0;s:8:"settings";a:0:{}s:6:"module";s:4:"text";}}s:6:"widget";a:4:{s:4:"type";s:13:"text_textarea";s:8:"settings";a:1:{s:4:"rows";i:5;}s:6:"weight";i:0;s:6:"module";s:4:"text";}s:11:"description";s:0:"";}', '0');
/*!40000 ALTER TABLE field_config_instance ENABLE KEYS */;

--
-- Table structure for table 'field_data_body'
--

CREATE TABLE IF NOT EXISTS `field_data_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Data storage for field 2 (body)';

--
-- Dumping data for table 'field_data_body'
--

/*!40000 ALTER TABLE field_data_body DISABLE KEYS */;
INSERT INTO `field_data_body` VALUES
('node', 'page', '0', '1', '1', 'und', '0', '<p>Configuration node</p>\r\n<ul>\r\n<li>User Registration is disabled by default.</li>\r\n<li>Search and Comments are disabled by default/</li>\r\n<li>Only Full HTML format is provided.</li>\r\n<li>Default timezone is Asia/Saigon</li>\r\n<li>Default country is Vietnam.</li>\r\n</ul>\r\n\r\n<p>Checklist for new installation:</p>\r\n<ul>\r\n<li>Change site information to match your project.</li>\r\n<li>Change the home page</li>\r\n<li>Configure timezone and default country in Region Setting</li>\r\n<li>Start the development</li>\r\n</ul>', '', 'full_html');
/*!40000 ALTER TABLE field_data_body ENABLE KEYS */;

--
-- Table structure for table 'field_data_comment_body'
--

CREATE TABLE IF NOT EXISTS `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Data storage for field 1 (comment_body)';

--
-- Dumping data for table 'field_data_comment_body'
--

/*!40000 ALTER TABLE field_data_comment_body DISABLE KEYS */;
/*!40000 ALTER TABLE field_data_comment_body ENABLE KEYS */;

--
-- Table structure for table 'field_revision_body'
--

CREATE TABLE IF NOT EXISTS `field_revision_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Revision archive storage for field 2 (body)';

--
-- Dumping data for table 'field_revision_body'
--

/*!40000 ALTER TABLE field_revision_body DISABLE KEYS */;
INSERT INTO `field_revision_body` VALUES
('node', 'page', '0', '1', '1', 'und', '0', '<p>Configuration node</p>\r\n<ul>\r\n<li>User Registration is disabled by default.</li>\r\n<li>Search and Comments are disabled by default/</li>\r\n<li>Only Full HTML format is provided.</li>\r\n<li>Default timezone is Asia/Saigon</li>\r\n<li>Default country is Vietnam.</li>\r\n</ul>\r\n\r\n<p>Checklist for new installation:</p>\r\n<ul>\r\n<li>Change site information to match your project.</li>\r\n<li>Change the home page</li>\r\n<li>Configure timezone and default country in Region Setting</li>\r\n<li>Start the development</li>\r\n</ul>', '', 'full_html');
/*!40000 ALTER TABLE field_revision_body ENABLE KEYS */;

--
-- Table structure for table 'field_revision_comment_body'
--

CREATE TABLE IF NOT EXISTS `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Revision archive storage for field 1 (comment_body)';

--
-- Dumping data for table 'field_revision_comment_body'
--

/*!40000 ALTER TABLE field_revision_comment_body DISABLE KEYS */;
/*!40000 ALTER TABLE field_revision_comment_body ENABLE KEYS */;

--
-- Table structure for table 'file_managed'
--

CREATE TABLE IF NOT EXISTS `file_managed` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores information for uploaded files.';

--
-- Dumping data for table 'file_managed'
--

/*!40000 ALTER TABLE file_managed DISABLE KEYS */;
/*!40000 ALTER TABLE file_managed ENABLE KEYS */;

--
-- Table structure for table 'file_usage'
--

CREATE TABLE IF NOT EXISTS `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY (`fid`,`type`,`id`,`module`),
  KEY `type_id` (`type`,`id`),
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Track where a file is used.';

--
-- Dumping data for table 'file_usage'
--

/*!40000 ALTER TABLE file_usage DISABLE KEYS */;
/*!40000 ALTER TABLE file_usage ENABLE KEYS */;

--
-- Table structure for table 'filter'
--

CREATE TABLE IF NOT EXISTS `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.',
  PRIMARY KEY (`format`,`name`),
  KEY `list` (`weight`,`module`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table that maps filters (HTML corrector) to text formats ...';

--
-- Dumping data for table 'filter'
--

/*!40000 ALTER TABLE filter DISABLE KEYS */;
INSERT INTO `filter` VALUES
('filtered_html', 'filter', 'filter_autop', '2', '1', 'a:0:{}'),
('filtered_html', 'filter', 'filter_html', '1', '1', 'a:3:{s:12:"allowed_html";s:74:"<a> <em> <strong> <cite> <blockquote> <code> <ul> <ol> <li> <dl> <dt> <dd>";s:16:"filter_html_help";i:1;s:20:"filter_html_nofollow";i:0;}'),
('filtered_html', 'filter', 'filter_htmlcorrector', '10', '1', 'a:0:{}'),
('filtered_html', 'filter', 'filter_html_escape', '10', '0', 'a:0:{}'),
('filtered_html', 'filter', 'filter_url', '0', '1', 'a:1:{s:17:"filter_url_length";i:72;}'),
('full_html', 'filter', 'filter_autop', '1', '0', 'a:0:{}'),
('full_html', 'filter', 'filter_html', '10', '0', 'a:3:{s:12:"allowed_html";s:74:"<a> <em> <strong> <cite> <blockquote> <code> <ul> <ol> <li> <dl> <dt> <dd>";s:16:"filter_html_help";i:1;s:20:"filter_html_nofollow";i:0;}'),
('full_html', 'filter', 'filter_htmlcorrector', '10', '1', 'a:0:{}'),
('full_html', 'filter', 'filter_html_escape', '10', '0', 'a:0:{}'),
('full_html', 'filter', 'filter_url', '0', '0', 'a:1:{s:17:"filter_url_length";s:2:"72";}'),
('plain_text', 'filter', 'filter_autop', '2', '1', 'a:0:{}'),
('plain_text', 'filter', 'filter_html', '10', '0', 'a:3:{s:12:"allowed_html";s:74:"<a> <em> <strong> <cite> <blockquote> <code> <ul> <ol> <li> <dl> <dt> <dd>";s:16:"filter_html_help";i:1;s:20:"filter_html_nofollow";i:0;}'),
('plain_text', 'filter', 'filter_htmlcorrector', '10', '0', 'a:0:{}'),
('plain_text', 'filter', 'filter_html_escape', '0', '1', 'a:0:{}'),
('plain_text', 'filter', 'filter_url', '1', '1', 'a:1:{s:17:"filter_url_length";i:72;}');
/*!40000 ALTER TABLE filter ENABLE KEYS */;

--
-- Table structure for table 'filter_format'
--

CREATE TABLE IF NOT EXISTS `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`),
  KEY `status_weight` (`status`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores text formats: custom groupings of filters, such as...';

--
-- Dumping data for table 'filter_format'
--

/*!40000 ALTER TABLE filter_format DISABLE KEYS */;
INSERT INTO `filter_format` VALUES
('filtered_html', 'Filtered HTML', '1', '0', '0'),
('full_html', 'Full HTML', '1', '1', '1'),
('plain_text', 'Plain text', '1', '1', '10');
/*!40000 ALTER TABLE filter_format ENABLE KEYS */;

--
-- Table structure for table 'flood'
--

CREATE TABLE IF NOT EXISTS `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique flood event ID.',
  `event` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name of event (e.g. contact).',
  `identifier` varchar(128) NOT NULL DEFAULT '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of the event.',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`identifier`,`timestamp`),
  KEY `purge` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Flood controls the threshold of events, such as the...';

--
-- Dumping data for table 'flood'
--

/*!40000 ALTER TABLE flood DISABLE KEYS */;
/*!40000 ALTER TABLE flood ENABLE KEYS */;

--
-- Table structure for table 'history'
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that read the node nid.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid that was read.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp at which the read occurred.',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A record of which users have read which nodes.';

--
-- Dumping data for table 'history'
--

/*!40000 ALTER TABLE history DISABLE KEYS */;
INSERT INTO `history` VALUES
('1', '1', '1338715840');
/*!40000 ALTER TABLE history ENABLE KEYS */;

--
-- Table structure for table 'image_effects'
--

CREATE TABLE IF NOT EXISTS `image_effects` (
  `ieid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.',
  PRIMARY KEY (`ieid`),
  KEY `isid` (`isid`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores configuration options for image effects.';

--
-- Dumping data for table 'image_effects'
--

/*!40000 ALTER TABLE image_effects DISABLE KEYS */;
/*!40000 ALTER TABLE image_effects ENABLE KEYS */;

--
-- Table structure for table 'image_styles'
--

CREATE TABLE IF NOT EXISTS `image_styles` (
  `isid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style name.',
  PRIMARY KEY (`isid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores configuration options for image styles.';

--
-- Dumping data for table 'image_styles'
--

/*!40000 ALTER TABLE image_styles DISABLE KEYS */;
/*!40000 ALTER TABLE image_styles ENABLE KEYS */;

--
-- Table structure for table 'menu_custom'
--

CREATE TABLE IF NOT EXISTS `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title; displayed at top of block.',
  `description` text COMMENT 'Menu description.',
  PRIMARY KEY (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Holds definitions for top-level custom menus (for example...';

--
-- Dumping data for table 'menu_custom'
--

/*!40000 ALTER TABLE menu_custom DISABLE KEYS */;
INSERT INTO `menu_custom` VALUES
('devel', 'Development', 'Development link'),
('features', 'Features', 'Menu items for any enabled features.'),
('main-menu', 'Main menu', 'The <em>Main</em> menu is used on many sites to show the major sections of the site, often in a top navigation bar.'),
('management', 'Management', 'The <em>Management</em> menu contains links for administrative tasks.'),
('navigation', 'Navigation', 'The <em>Navigation</em> menu contains links intended for site visitors. Links are added to the <em>Navigation</em> menu automatically by some modules.'),
('user-menu', 'User menu', 'The <em>User</em> menu contains links related to the user''s account, as well as the ''Log out'' link.');
/*!40000 ALTER TABLE menu_custom ENABLE KEYS */;

--
-- Table structure for table 'menu_links'
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` smallint(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Contains the individual links within a menu.';

--
-- Dumping data for table 'menu_links'
--

/*!40000 ALTER TABLE menu_links DISABLE KEYS */;
INSERT INTO `menu_links` VALUES
('management', '1', '0', 'admin', 'admin', 'Administration', 'a:0:{}', 'system', 0, 0, 1, 0, '9', 1, 0, '1', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('user-menu', '2', '0', 'user', 'user', 'User account', 'a:1:{s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, '-10', 1, 0, '2', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '4', '0', 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, '0', 1, 0, '4', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '5', '0', 'node/%', 'node/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 1, 0, '5', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '6', '0', 'node/add', 'node/add', 'Add content', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 1, 0, '6', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '7', '1', 'admin/appearance', 'admin/appearance', 'Appearance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"Select and configure your themes.";}}', 'system', 0, 0, 0, 0, '-6', 2, 0, '1', '7', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '8', '1', 'admin/config', 'admin/config', 'Configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Administer settings.";}}', 'system', 0, 0, 1, 0, '0', 2, 0, '1', '8', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '9', '1', 'admin/content', 'admin/content', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:24:"Find and manage content.";}}', 'system', 0, 0, 0, 0, '-10', 2, 0, '1', '9', '0', '0', '0', '0', '0', '0', '0', 0),
('user-menu', '10', '2', 'user/register', 'user/register', 'Create new account', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '2', '10', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '12', '1', 'admin/index', 'admin/index', 'Index', 'a:0:{}', 'system', -1, 0, 0, 0, '-18', 2, 0, '1', '12', '0', '0', '0', '0', '0', '0', '0', 0),
('user-menu', '13', '2', 'user/login', 'user/login', 'Log in', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '2', '13', '0', '0', '0', '0', '0', '0', '0', 0),
('user-menu', '14', '0', 'user/logout', 'user/logout', 'Log out', 'a:0:{}', 'system', 0, 0, 0, 0, '10', 1, 0, '14', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '15', '1', 'admin/modules', 'admin/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"Extend site functionality.";}}', 'system', 0, 0, 0, 0, '-2', 2, 0, '1', '15', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '16', '0', 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 1, 0, '16', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '17', '1', 'admin/people', 'admin/people', 'People', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Manage user accounts, roles, and permissions.";}}', 'system', 0, 0, 0, 0, '-4', 2, 0, '1', '17', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '18', '1', 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:34:"View reports, updates, and errors.";}}', 'system', 0, 0, 1, 0, '5', 2, 0, '1', '18', '0', '0', '0', '0', '0', '0', '0', 0),
('user-menu', '19', '2', 'user/password', 'user/password', 'Request new password', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '2', '19', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '20', '1', 'admin/structure', 'admin/structure', 'Structure', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Administer blocks, content types, menus, etc.";}}', 'system', 0, 0, 1, 0, '-8', 2, 0, '1', '20', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '21', '1', 'admin/tasks', 'admin/tasks', 'Tasks', 'a:0:{}', 'system', -1, 0, 0, 0, '-20', 2, 0, '1', '21', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '27', '17', 'admin/people/create', 'admin/people/create', 'Add user', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '17', '27', '0', '0', '0', '0', '0', '0', 0),
('management', '28', '20', 'admin/structure/block', 'admin/structure/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site''s sidebars and other regions.";}}', 'system', 0, 0, 1, 0, '0', 3, 0, '1', '20', '28', '0', '0', '0', '0', '0', '0', 0),
('navigation', '29', '16', 'user/%/cancel', 'user/%/cancel', 'Cancel account', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 2, 0, '16', '29', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '32', '9', 'admin/content/node', 'admin/content/node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 3, 0, '1', '9', '32', '0', '0', '0', '0', '0', '0', 0),
('management', '33', '8', 'admin/config/content', 'admin/config/content', 'Content authoring', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:53:"Settings related to formatting and authoring content.";}}', 'system', 0, 0, 1, 0, '-15', 3, 0, '1', '8', '33', '0', '0', '0', '0', '0', '0', 0),
('management', '34', '20', 'admin/structure/types', 'admin/structure/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Manage content types, including default status, front page promotion, comment settings, etc.";}}', 'system', 0, 0, 1, 0, '0', 3, 0, '1', '20', '34', '0', '0', '0', '0', '0', '0', 0),
('navigation', '36', '5', 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 2, 0, '5', '36', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '37', '8', 'admin/config/development', 'admin/config/development', 'Development', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Development tools.";}}', 'system', 0, 0, 1, 0, '-10', 3, 0, '1', '8', '37', '0', '0', '0', '0', '0', '0', 0),
('navigation', '38', '16', 'user/%/edit', 'user/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '16', '38', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '39', '5', 'node/%/edit', 'node/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '5', '39', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '40', '15', 'admin/modules/list', 'admin/modules/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '15', '40', '0', '0', '0', '0', '0', '0', 0),
('management', '41', '17', 'admin/people/people', 'admin/people/people', 'List', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:50:"Find and manage people interacting with your site.";}}', 'system', -1, 0, 0, 0, '-10', 3, 0, '1', '17', '41', '0', '0', '0', '0', '0', '0', 0),
('management', '42', '7', 'admin/appearance/list', 'admin/appearance/list', 'List', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Select and configure your theme";}}', 'system', -1, 0, 0, 0, '-1', 3, 0, '1', '7', '42', '0', '0', '0', '0', '0', '0', 0),
('management', '43', '8', 'admin/config/media', 'admin/config/media', 'Media', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:12:"Media tools.";}}', 'system', 0, 0, 1, 0, '-10', 3, 0, '1', '8', '43', '0', '0', '0', '0', '0', '0', 0),
('management', '44', '20', 'admin/structure/menu', 'admin/structure/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:86:"Add new menus to your site, edit existing menus, and rename and reorganize menu links.";}}', 'system', 0, 0, 1, 0, '0', 3, 0, '1', '20', '44', '0', '0', '0', '0', '0', '0', 0),
('management', '45', '8', 'admin/config/people', 'admin/config/people', 'People', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:24:"Configure user accounts.";}}', 'system', 0, 0, 1, 0, '-20', 3, 0, '1', '8', '45', '0', '0', '0', '0', '0', '0', 0),
('management', '46', '17', 'admin/people/permissions', 'admin/people/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '17', '46', '0', '0', '0', '0', '0', '0', 0),
('management', '47', '18', 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log messages', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, '-1', 3, 0, '1', '18', '47', '0', '0', '0', '0', '0', '0', 0),
('management', '48', '8', 'admin/config/regional', 'admin/config/regional', 'Regional and language', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:48:"Regional settings, localization and translation.";}}', 'system', 0, 0, 1, 0, '-5', 3, 0, '1', '8', '48', '0', '0', '0', '0', '0', '0', 0),
('navigation', '49', '5', 'node/%/revisions', 'node/%/revisions', 'Revisions', 'a:0:{}', 'system', -1, 0, 1, 0, '2', 2, 0, '5', '49', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '50', '8', 'admin/config/search', 'admin/config/search', 'Search and metadata', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"Local site search, metadata and SEO.";}}', 'system', 0, 0, 1, 0, '-10', 3, 0, '1', '8', '50', '0', '0', '0', '0', '0', '0', 0),
('management', '51', '7', 'admin/appearance/settings', 'admin/appearance/settings', 'Settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Configure default and theme specific settings.";}}', 'system', -1, 0, 0, 0, '20', 3, 0, '1', '7', '51', '0', '0', '0', '0', '0', '0', 0),
('management', '52', '18', 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site''s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, '-60', 3, 0, '1', '18', '52', '0', '0', '0', '0', '0', '0', 0),
('management', '53', '8', 'admin/config/system', 'admin/config/system', 'System', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:37:"General system related configuration.";}}', 'system', 0, 0, 1, 0, '-20', 3, 0, '1', '8', '53', '0', '0', '0', '0', '0', '0', 0),
('management', '54', '18', 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View ''access denied'' errors (403s).";}}', 'system', 0, 0, 0, 0, '0', 3, 0, '1', '18', '54', '0', '0', '0', '0', '0', '0', 0),
('management', '55', '18', 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View ''page not found'' errors (404s).";}}', 'system', 0, 0, 0, 0, '0', 3, 0, '1', '18', '55', '0', '0', '0', '0', '0', '0', 0),
('management', '56', '15', 'admin/modules/uninstall', 'admin/modules/uninstall', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, '20', 3, 0, '1', '15', '56', '0', '0', '0', '0', '0', '0', 0),
('management', '57', '8', 'admin/config/user-interface', 'admin/config/user-interface', 'User interface', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Tools that enhance the user interface.";}}', 'system', 0, 0, 1, 0, '-15', 3, 0, '1', '8', '57', '0', '0', '0', '0', '0', '0', 0),
('navigation', '58', '5', 'node/%/view', 'node/%/view', 'View', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 2, 0, '5', '58', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '59', '16', 'user/%/view', 'user/%/view', 'View', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 2, 0, '16', '59', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '60', '8', 'admin/config/services', 'admin/config/services', 'Web services', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"Tools related to web services.";}}', 'system', 0, 0, 1, 0, '0', 3, 0, '1', '8', '60', '0', '0', '0', '0', '0', '0', 0),
('management', '61', '8', 'admin/config/workflow', 'admin/config/workflow', 'Workflow', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Content workflow, editorial workflow tools.";}}', 'system', 0, 0, 0, 0, '5', 3, 0, '1', '8', '61', '0', '0', '0', '0', '0', '0', 0),
('management', '62', '51', 'admin/appearance/settings/adaptivetheme_admin', 'admin/appearance/settings/adaptivetheme_admin', 'AT Admin', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '62', '0', '0', '0', '0', '0', 0),
('management', '63', '51', 'admin/appearance/settings/adaptivetheme', 'admin/appearance/settings/adaptivetheme', 'AT Core', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '63', '0', '0', '0', '0', '0', 0),
('management', '64', '51', 'admin/appearance/settings/adaptivetheme_subtheme', 'admin/appearance/settings/adaptivetheme_subtheme', 'AT Subtheme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '64', '0', '0', '0', '0', '0', 0),
('management', '65', '45', 'admin/config/people/accounts', 'admin/config/people/accounts', 'Account settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:109:"Configure default behavior of users, including registration requirements, e-mails, fields, and user pictures.";}}', 'system', 0, 0, 0, 0, '-10', 4, 0, '1', '8', '45', '65', '0', '0', '0', '0', '0', 0),
('management', '66', '53', 'admin/config/system/actions', 'admin/config/system/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 1, 0, '0', 4, 0, '1', '8', '53', '66', '0', '0', '0', '0', '0', 0),
('management', '67', '28', 'admin/structure/block/add', 'admin/structure/block/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '67', '0', '0', '0', '0', '0', 0),
('management', '68', '34', 'admin/structure/types/add', 'admin/structure/types/add', 'Add content type', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '34', '68', '0', '0', '0', '0', '0', 0),
('management', '69', '44', 'admin/structure/menu/add', 'admin/structure/menu/add', 'Add menu', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '44', '69', '0', '0', '0', '0', '0', 0),
('management', '70', '51', 'admin/appearance/settings/bartik', 'admin/appearance/settings/bartik', 'Bartik', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '70', '0', '0', '0', '0', '0', 0),
('management', '71', '50', 'admin/config/search/clean-urls', 'admin/config/search/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, '5', 4, 0, '1', '8', '50', '71', '0', '0', '0', '0', '0', 0),
('management', '72', '53', 'admin/config/system/cron', 'admin/config/system/cron', 'Cron', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Manage automatic site maintenance tasks.";}}', 'system', 0, 0, 0, 0, '20', 4, 0, '1', '8', '53', '72', '0', '0', '0', '0', '0', 0),
('management', '73', '48', 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:44:"Configure display formats for date and time.";}}', 'system', 0, 0, 0, 0, '-15', 4, 0, '1', '8', '48', '73', '0', '0', '0', '0', '0', 0),
('management', '74', '18', 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 3, 0, '1', '18', '74', '0', '0', '0', '0', '0', '0', 0),
('management', '75', '43', 'admin/config/media/file-system', 'admin/config/media/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, '-10', 4, 0, '1', '8', '43', '75', '0', '0', '0', '0', '0', 0),
('management', '76', '51', 'admin/appearance/settings/garland', 'admin/appearance/settings/garland', 'Garland', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '76', '0', '0', '0', '0', '0', 0),
('management', '77', '51', 'admin/appearance/settings/global', 'admin/appearance/settings/global', 'Global settings', 'a:0:{}', 'system', -1, 0, 0, 0, '-1', 4, 0, '1', '7', '51', '77', '0', '0', '0', '0', '0', 0),
('management', '78', '45', 'admin/config/people/ip-blocking', 'admin/config/people/ip-blocking', 'IP address blocking', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:28:"Manage blocked IP addresses.";}}', 'system', 0, 0, 1, 0, '10', 4, 0, '1', '8', '45', '78', '0', '0', '0', '0', '0', 0),
('management', '79', '43', 'admin/config/media/image-toolkit', 'admin/config/media/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, '20', 4, 0, '1', '8', '43', '79', '0', '0', '0', '0', '0', 0),
('management', '80', '40', 'admin/modules/list/confirm', 'admin/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '15', '40', '80', '0', '0', '0', '0', '0', 0),
('management', '81', '34', 'admin/structure/types/list', 'admin/structure/types/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '34', '81', '0', '0', '0', '0', '0', 0),
('management', '82', '44', 'admin/structure/menu/list', 'admin/structure/menu/list', 'List menus', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '44', '82', '0', '0', '0', '0', '0', 0),
('management', '83', '37', 'admin/config/development/logging', 'admin/config/development/logging', 'Logging and errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:154:"Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destinations, such as syslog, database, email, etc.";}}', 'system', 0, 0, 0, 0, '-15', 4, 0, '1', '8', '37', '83', '0', '0', '0', '0', '0', 0),
('management', '84', '37', 'admin/config/development/maintenance', 'admin/config/development/maintenance', 'Maintenance mode', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:62:"Take the site offline for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, '-10', 4, 0, '1', '8', '37', '84', '0', '0', '0', '0', '0', 0),
('management', '85', '37', 'admin/config/development/performance', 'admin/config/development/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, '-20', 4, 0, '1', '8', '37', '85', '0', '0', '0', '0', '0', 0),
('management', '86', '46', 'admin/people/permissions/list', 'admin/people/permissions/list', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', -1, 0, 0, 0, '-8', 4, 0, '1', '17', '46', '86', '0', '0', '0', '0', '0', 0),
('management', '88', '60', 'admin/config/services/rss-publishing', 'admin/config/services/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:114:"Configure the site description, the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '8', '60', '88', '0', '0', '0', '0', '0', 0),
('management', '89', '48', 'admin/config/regional/settings', 'admin/config/regional/settings', 'Regional settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:54:"Settings for the site''s default time zone and country.";}}', 'system', 0, 0, 0, 0, '-20', 4, 0, '1', '8', '48', '89', '0', '0', '0', '0', '0', 0),
('management', '90', '46', 'admin/people/permissions/roles', 'admin/people/permissions/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', -1, 0, 1, 0, '-5', 4, 0, '1', '17', '46', '90', '0', '0', '0', '0', '0', 0),
('management', '91', '44', 'admin/structure/menu/settings', 'admin/structure/menu/settings', 'Settings', 'a:0:{}', 'system', -1, 0, 0, 0, '5', 4, 0, '1', '20', '44', '91', '0', '0', '0', '0', '0', 0),
('management', '92', '51', 'admin/appearance/settings/seven', 'admin/appearance/settings/seven', 'Seven', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '92', '0', '0', '0', '0', '0', 0),
('management', '93', '53', 'admin/config/system/site-information', 'admin/config/system/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:104:"Change site name, e-mail address, slogan, default front page, and number of posts per page, error pages.";}}', 'system', 0, 0, 0, 0, '-20', 4, 0, '1', '8', '53', '93', '0', '0', '0', '0', '0', 0),
('management', '94', '51', 'admin/appearance/settings/stark', 'admin/appearance/settings/stark', 'Stark', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '94', '0', '0', '0', '0', '0', 0),
('management', '95', '51', 'admin/appearance/settings/test_theme', 'admin/appearance/settings/test_theme', 'Test theme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '95', '0', '0', '0', '0', '0', 0),
('management', '96', '33', 'admin/config/content/formats', 'admin/config/content/formats', 'Text formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 1, 0, '0', 4, 0, '1', '8', '33', '96', '0', '0', '0', '0', '0', 0),
('management', '98', '56', 'admin/modules/uninstall/confirm', 'admin/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '15', '56', '98', '0', '0', '0', '0', '0', 0),
('management', '99', '51', 'admin/appearance/settings/update_test_basetheme', 'admin/appearance/settings/update_test_basetheme', 'Update test base theme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '99', '0', '0', '0', '0', '0', 0),
('management', '100', '51', 'admin/appearance/settings/update_test_subtheme', 'admin/appearance/settings/update_test_subtheme', 'Update test subtheme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '7', '51', '100', '0', '0', '0', '0', '0', 0),
('navigation', '101', '38', 'user/%/edit/account', 'user/%/edit/account', 'Account', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '16', '38', '101', '0', '0', '0', '0', '0', '0', 0),
('management', '102', '96', 'admin/config/content/formats/%', 'admin/config/content/formats/%', '', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 5, 0, '1', '8', '33', '96', '102', '0', '0', '0', '0', 0),
('management', '103', '28', 'admin/structure/block/list/adaptivetheme_admin', 'admin/structure/block/list/adaptivetheme_admin', 'AT Admin', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '103', '0', '0', '0', '0', '0', 0),
('management', '104', '28', 'admin/structure/block/list/adaptivetheme', 'admin/structure/block/list/adaptivetheme', 'AT Core', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '104', '0', '0', '0', '0', '0', 0),
('management', '105', '28', 'admin/structure/block/list/adaptivetheme_subtheme', 'admin/structure/block/list/adaptivetheme_subtheme', 'AT Subtheme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '105', '0', '0', '0', '0', '0', 0),
('management', '106', '96', 'admin/config/content/formats/add', 'admin/config/content/formats/add', 'Add text format', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 5, 0, '1', '8', '33', '96', '106', '0', '0', '0', '0', 0),
('management', '107', '28', 'admin/structure/block/list/bartik', 'admin/structure/block/list/bartik', 'Bartik', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '28', '107', '0', '0', '0', '0', '0', 0),
('management', '108', '66', 'admin/config/system/actions/configure', 'admin/config/system/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '8', '53', '66', '108', '0', '0', '0', '0', 0),
('management', '109', '44', 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Customize menu', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 4, 0, '1', '20', '44', '109', '0', '0', '0', '0', '0', 0),
('management', '110', '34', 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit content type', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 4, 0, '1', '20', '34', '110', '0', '0', '0', '0', '0', 0),
('management', '111', '73', 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time/formats', 'Formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:51:"Configure display format strings for date and time.";}}', 'system', -1, 0, 1, 0, '-9', 5, 0, '1', '8', '48', '73', '111', '0', '0', '0', '0', 0),
('management', '112', '28', 'admin/structure/block/list/garland', 'admin/structure/block/list/garland', 'Garland', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '112', '0', '0', '0', '0', '0', 0),
('management', '113', '96', 'admin/config/content/formats/list', 'admin/config/content/formats/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '8', '33', '96', '113', '0', '0', '0', '0', 0),
('management', '114', '66', 'admin/config/system/actions/manage', 'admin/config/system/actions/manage', 'Manage actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', -1, 0, 0, 0, '-2', 5, 0, '1', '8', '53', '66', '114', '0', '0', '0', '0', 0),
('management', '115', '65', 'admin/config/people/accounts/settings', 'admin/config/people/accounts/settings', 'Settings', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 5, 0, '1', '8', '45', '65', '115', '0', '0', '0', '0', 0),
('management', '116', '28', 'admin/structure/block/list/seven', 'admin/structure/block/list/seven', 'Seven', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '116', '0', '0', '0', '0', '0', 0),
('management', '117', '28', 'admin/structure/block/list/stark', 'admin/structure/block/list/stark', 'Stark', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '117', '0', '0', '0', '0', '0', 0),
('management', '118', '28', 'admin/structure/block/list/test_theme', 'admin/structure/block/list/test_theme', 'Test theme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '118', '0', '0', '0', '0', '0', 0),
('management', '119', '73', 'admin/config/regional/date-time/types', 'admin/config/regional/date-time/types', 'Types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:44:"Configure display formats for date and time.";}}', 'system', -1, 0, 1, 0, '-10', 5, 0, '1', '8', '48', '73', '119', '0', '0', '0', '0', 0),
('management', '120', '28', 'admin/structure/block/list/update_test_basetheme', 'admin/structure/block/list/update_test_basetheme', 'Update test base theme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '120', '0', '0', '0', '0', '0', 0),
('management', '121', '28', 'admin/structure/block/list/update_test_subtheme', 'admin/structure/block/list/update_test_subtheme', 'Update test subtheme', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '28', '121', '0', '0', '0', '0', '0', 0),
('navigation', '122', '49', 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 3, 0, '5', '49', '122', '0', '0', '0', '0', '0', '0', 0),
('navigation', '123', '49', 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 3, 0, '5', '49', '123', '0', '0', '0', '0', '0', '0', 0),
('navigation', '124', '49', 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 3, 0, '5', '49', '124', '0', '0', '0', '0', '0', '0', 0),
('management', '125', '104', 'admin/structure/block/list/adaptivetheme/add', 'admin/structure/block/list/adaptivetheme/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '104', '125', '0', '0', '0', '0', 0),
('management', '126', '103', 'admin/structure/block/list/adaptivetheme_admin/add', 'admin/structure/block/list/adaptivetheme_admin/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '103', '126', '0', '0', '0', '0', 0),
('management', '127', '105', 'admin/structure/block/list/adaptivetheme_subtheme/add', 'admin/structure/block/list/adaptivetheme_subtheme/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '105', '127', '0', '0', '0', '0', 0),
('management', '128', '112', 'admin/structure/block/list/garland/add', 'admin/structure/block/list/garland/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '112', '128', '0', '0', '0', '0', 0),
('management', '129', '116', 'admin/structure/block/list/seven/add', 'admin/structure/block/list/seven/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '116', '129', '0', '0', '0', '0', 0),
('management', '130', '117', 'admin/structure/block/list/stark/add', 'admin/structure/block/list/stark/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '117', '130', '0', '0', '0', '0', 0),
('management', '131', '118', 'admin/structure/block/list/test_theme/add', 'admin/structure/block/list/test_theme/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '118', '131', '0', '0', '0', '0', 0),
('management', '132', '120', 'admin/structure/block/list/update_test_basetheme/add', 'admin/structure/block/list/update_test_basetheme/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '120', '132', '0', '0', '0', '0', 0),
('management', '133', '121', 'admin/structure/block/list/update_test_subtheme/add', 'admin/structure/block/list/update_test_subtheme/add', 'Add block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '121', '133', '0', '0', '0', '0', 0),
('management', '134', '119', 'admin/config/regional/date-time/types/add', 'admin/config/regional/date-time/types/add', 'Add date type', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:18:"Add new date type.";}}', 'system', -1, 0, 0, 0, '-10', 6, 0, '1', '8', '48', '73', '119', '134', '0', '0', '0', 0),
('management', '135', '111', 'admin/config/regional/date-time/formats/add', 'admin/config/regional/date-time/formats/add', 'Add format', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Allow users to add additional date formats.";}}', 'system', -1, 0, 0, 0, '-10', 6, 0, '1', '8', '48', '73', '111', '135', '0', '0', '0', 0),
('management', '136', '109', 'admin/structure/menu/manage/%/add', 'admin/structure/menu/manage/%/add', 'Add link', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '44', '109', '136', '0', '0', '0', '0', 0),
('management', '137', '28', 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '28', '137', '0', '0', '0', '0', '0', 0),
('navigation', '138', '29', 'user/%/cancel/confirm/%/%', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 3, 0, '16', '29', '138', '0', '0', '0', '0', '0', '0', 0),
('management', '139', '110', 'admin/structure/types/manage/%/delete', 'admin/structure/types/manage/%/delete', 'Delete', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '20', '34', '110', '139', '0', '0', '0', '0', 0),
('management', '140', '78', 'admin/config/people/ip-blocking/delete/%', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '8', '45', '78', '140', '0', '0', '0', '0', 0),
('management', '141', '66', 'admin/config/system/actions/delete/%', 'admin/config/system/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '8', '53', '66', '141', '0', '0', '0', '0', 0),
('management', '142', '109', 'admin/structure/menu/manage/%/delete', 'admin/structure/menu/manage/%/delete', 'Delete menu', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '20', '44', '109', '142', '0', '0', '0', '0', 0),
('management', '143', '44', 'admin/structure/menu/item/%/delete', 'admin/structure/menu/item/%/delete', 'Delete menu link', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '44', '143', '0', '0', '0', '0', '0', 0),
('management', '144', '90', 'admin/people/permissions/roles/delete/%', 'admin/people/permissions/roles/delete/%', 'Delete role', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '17', '46', '90', '144', '0', '0', '0', '0', 0),
('management', '145', '102', 'admin/config/content/formats/%/disable', 'admin/config/content/formats/%/disable', 'Disable text format', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '33', '96', '102', '145', '0', '0', '0', 0),
('management', '146', '110', 'admin/structure/types/manage/%/edit', 'admin/structure/types/manage/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '34', '110', '146', '0', '0', '0', '0', 0),
('management', '147', '109', 'admin/structure/menu/manage/%/edit', 'admin/structure/menu/manage/%/edit', 'Edit menu', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '44', '109', '147', '0', '0', '0', '0', 0),
('management', '148', '44', 'admin/structure/menu/item/%/edit', 'admin/structure/menu/item/%/edit', 'Edit menu link', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '44', '148', '0', '0', '0', '0', '0', 0),
('management', '149', '90', 'admin/people/permissions/roles/edit/%', 'admin/people/permissions/roles/edit/%', 'Edit role', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '17', '46', '90', '149', '0', '0', '0', '0', 0),
('management', '150', '109', 'admin/structure/menu/manage/%/list', 'admin/structure/menu/manage/%/list', 'List links', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 5, 0, '1', '20', '44', '109', '150', '0', '0', '0', '0', 0),
('management', '151', '44', 'admin/structure/menu/item/%/reset', 'admin/structure/menu/item/%/reset', 'Reset menu link', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '44', '151', '0', '0', '0', '0', '0', 0),
('management', '154', '137', 'admin/structure/block/manage/%/%/configure', 'admin/structure/block/manage/%/%/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '137', '154', '0', '0', '0', '0', 0),
('management', '155', '137', 'admin/structure/block/manage/%/%/delete', 'admin/structure/block/manage/%/%/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '28', '137', '155', '0', '0', '0', '0', 0),
('management', '156', '111', 'admin/config/regional/date-time/formats/%/delete', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Allow users to delete a configured date format.";}}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '48', '73', '111', '156', '0', '0', '0', 0),
('management', '157', '119', 'admin/config/regional/date-time/types/%/delete', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Allow users to delete a configured date type.";}}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '48', '73', '119', '157', '0', '0', '0', 0),
('management', '158', '111', 'admin/config/regional/date-time/formats/%/edit', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Allow users to edit a configured date format.";}}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '48', '73', '111', '158', '0', '0', '0', 0),
('management', '159', '44', 'admin/structure/menu/manage/main-menu', 'admin/structure/menu/manage/%', 'Main menu', 'a:0:{}', 'menu', 0, 0, 0, 0, '0', 4, 0, '1', '20', '44', '159', '0', '0', '0', '0', '0', 0),
('management', '160', '44', 'admin/structure/menu/manage/management', 'admin/structure/menu/manage/%', 'Management', 'a:0:{}', 'menu', 0, 0, 0, 0, '0', 4, 0, '1', '20', '44', '160', '0', '0', '0', '0', '0', 0),
('management', '161', '44', 'admin/structure/menu/manage/navigation', 'admin/structure/menu/manage/%', 'Navigation', 'a:0:{}', 'menu', 0, 0, 0, 0, '0', 4, 0, '1', '20', '44', '161', '0', '0', '0', '0', '0', 0),
('management', '162', '44', 'admin/structure/menu/manage/user-menu', 'admin/structure/menu/manage/%', 'User menu', 'a:0:{}', 'menu', 0, 0, 0, 0, '0', 4, 0, '1', '20', '44', '162', '0', '0', '0', '0', '0', 0),
('management', '166', '1', 'admin/help', 'admin/help', 'Help', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:48:"Reference for usage, configuration, and modules.";}}', 'system', 0, 0, 0, 0, '9', 2, 0, '1', '166', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '167', '0', 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 1, 0, '167', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '169', '18', 'admin/reports/fields', 'admin/reports/fields', 'Field list', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:39:"Overview of fields on all entity types.";}}', 'system', 0, 0, 0, 0, '0', 3, 0, '1', '18', '169', '0', '0', '0', '0', '0', '0', 0),
('navigation', '170', '16', 'user/%/shortcuts', 'user/%/shortcuts', 'Shortcuts', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '16', '170', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '171', '20', 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 1, 0, '0', 3, 0, '1', '20', '171', '0', '0', '0', '0', '0', '0', 0),
('management', '174', '166', 'admin/help/block', 'admin/help/block', 'block', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '174', '0', '0', '0', '0', '0', '0', 0),
('management', '177', '166', 'admin/help/contextual', 'admin/help/contextual', 'contextual', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '177', '0', '0', '0', '0', '0', '0', 0),
('management', '179', '166', 'admin/help/dblog', 'admin/help/dblog', 'dblog', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '179', '0', '0', '0', '0', '0', '0', 0),
('management', '180', '166', 'admin/help/field', 'admin/help/field', 'field', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '180', '0', '0', '0', '0', '0', '0', 0),
('management', '181', '166', 'admin/help/field_sql_storage', 'admin/help/field_sql_storage', 'field_sql_storage', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '181', '0', '0', '0', '0', '0', '0', 0),
('management', '182', '166', 'admin/help/field_ui', 'admin/help/field_ui', 'field_ui', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '182', '0', '0', '0', '0', '0', '0', 0),
('management', '183', '166', 'admin/help/file', 'admin/help/file', 'file', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '183', '0', '0', '0', '0', '0', '0', 0),
('management', '184', '166', 'admin/help/filter', 'admin/help/filter', 'filter', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '184', '0', '0', '0', '0', '0', '0', 0),
('management', '185', '166', 'admin/help/help', 'admin/help/help', 'help', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '185', '0', '0', '0', '0', '0', '0', 0),
('management', '186', '166', 'admin/help/image', 'admin/help/image', 'image', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '186', '0', '0', '0', '0', '0', '0', 0),
('management', '187', '166', 'admin/help/list', 'admin/help/list', 'list', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '187', '0', '0', '0', '0', '0', '0', 0),
('management', '188', '166', 'admin/help/menu', 'admin/help/menu', 'menu', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '188', '0', '0', '0', '0', '0', '0', 0),
('management', '189', '166', 'admin/help/node', 'admin/help/node', 'node', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '189', '0', '0', '0', '0', '0', '0', 0),
('management', '190', '166', 'admin/help/number', 'admin/help/number', 'number', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '190', '0', '0', '0', '0', '0', '0', 0),
('management', '191', '166', 'admin/help/options', 'admin/help/options', 'options', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '191', '0', '0', '0', '0', '0', '0', 0),
('management', '193', '166', 'admin/help/path', 'admin/help/path', 'path', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '193', '0', '0', '0', '0', '0', '0', 0),
('management', '194', '166', 'admin/help/rdf', 'admin/help/rdf', 'rdf', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '194', '0', '0', '0', '0', '0', '0', 0),
('management', '196', '166', 'admin/help/shortcut', 'admin/help/shortcut', 'shortcut', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '196', '0', '0', '0', '0', '0', '0', 0),
('management', '197', '166', 'admin/help/system', 'admin/help/system', 'system', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '197', '0', '0', '0', '0', '0', '0', 0),
('management', '198', '166', 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '198', '0', '0', '0', '0', '0', '0', 0),
('management', '199', '166', 'admin/help/text', 'admin/help/text', 'text', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '199', '0', '0', '0', '0', '0', '0', 0),
('management', '200', '166', 'admin/help/user', 'admin/help/user', 'user', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '200', '0', '0', '0', '0', '0', '0', 0),
('navigation', '201', '167', 'taxonomy/term/%/edit', 'taxonomy/term/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 2, 0, '167', '201', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '202', '167', 'taxonomy/term/%/view', 'taxonomy/term/%/view', 'View', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '167', '202', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '203', '171', 'admin/structure/taxonomy/add', 'admin/structure/taxonomy/add', 'Add vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '171', '203', '0', '0', '0', '0', '0', 0),
('management', '204', '43', 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'Image styles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:78:"Configure styles that can be used for resizing or adjusting images on display.";}}', 'system', 0, 0, 1, 0, '0', 4, 0, '1', '8', '43', '204', '0', '0', '0', '0', '0', 0),
('management', '205', '171', 'admin/structure/taxonomy/list', 'admin/structure/taxonomy/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '171', '205', '0', '0', '0', '0', '0', 0),
('management', '207', '57', 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Shortcuts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:29:"Add and modify shortcut sets.";}}', 'system', 0, 0, 1, 0, '0', 4, 0, '1', '8', '57', '207', '0', '0', '0', '0', '0', 0),
('management', '208', '171', 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '171', '208', '0', '0', '0', '0', '0', 0),
('management', '209', '50', 'admin/config/search/path', 'admin/config/search/path', 'URL aliases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Change your site''s URL paths by aliasing them.";}}', 'system', 0, 0, 1, 0, '-5', 4, 0, '1', '8', '50', '209', '0', '0', '0', '0', '0', 0),
('management', '210', '209', 'admin/config/search/path/add', 'admin/config/search/path/add', 'Add alias', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '8', '50', '209', '210', '0', '0', '0', '0', 0),
('management', '211', '207', 'admin/config/user-interface/shortcut/add-set', 'admin/config/user-interface/shortcut/add-set', 'Add shortcut set', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '8', '57', '207', '211', '0', '0', '0', '0', 0),
('management', '212', '204', 'admin/config/media/image-styles/add', 'admin/config/media/image-styles/add', 'Add style', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Add a new image style.";}}', 'system', -1, 0, 0, 0, '2', 5, 0, '1', '8', '43', '204', '212', '0', '0', '0', '0', 0),
('management', '213', '208', 'admin/structure/taxonomy/%/add', 'admin/structure/taxonomy/%/add', 'Add term', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '171', '208', '213', '0', '0', '0', '0', 0),
('management', '215', '208', 'admin/structure/taxonomy/%/edit', 'admin/structure/taxonomy/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 5, 0, '1', '20', '171', '208', '215', '0', '0', '0', '0', 0),
('management', '216', '207', 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 5, 0, '1', '8', '57', '207', '216', '0', '0', '0', '0', 0),
('management', '217', '208', 'admin/structure/taxonomy/%/list', 'admin/structure/taxonomy/%/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '-20', 5, 0, '1', '20', '171', '208', '217', '0', '0', '0', '0', 0),
('management', '218', '209', 'admin/config/search/path/list', 'admin/config/search/path/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 5, 0, '1', '8', '50', '209', '218', '0', '0', '0', '0', 0),
('management', '219', '204', 'admin/config/media/image-styles/list', 'admin/config/media/image-styles/list', 'List', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:42:"List the current image styles on the site.";}}', 'system', -1, 0, 0, 0, '1', 5, 0, '1', '8', '43', '204', '219', '0', '0', '0', '0', 0),
('management', '220', '216', 'admin/config/user-interface/shortcut/%/add-link', 'admin/config/user-interface/shortcut/%/add-link', 'Add shortcut', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 6, 0, '1', '8', '57', '207', '216', '220', '0', '0', '0', 0),
('management', '221', '209', 'admin/config/search/path/delete/%', 'admin/config/search/path/delete/%', 'Delete alias', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '8', '50', '209', '221', '0', '0', '0', '0', 0),
('management', '222', '216', 'admin/config/user-interface/shortcut/%/delete', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '57', '207', '216', '222', '0', '0', '0', 0),
('management', '223', '209', 'admin/config/search/path/edit/%', 'admin/config/search/path/edit/%', 'Edit alias', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '8', '50', '209', '223', '0', '0', '0', '0', 0),
('management', '224', '216', 'admin/config/user-interface/shortcut/%/edit', 'admin/config/user-interface/shortcut/%/edit', 'Edit set name', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 6, 0, '1', '8', '57', '207', '216', '224', '0', '0', '0', 0),
('management', '225', '207', 'admin/config/user-interface/shortcut/link/%', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 'a:0:{}', 'system', 0, 0, 1, 0, '0', 5, 0, '1', '8', '57', '207', '225', '0', '0', '0', '0', 0),
('management', '226', '204', 'admin/config/media/image-styles/edit/%', 'admin/config/media/image-styles/edit/%', 'Edit style', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:25:"Configure an image style.";}}', 'system', 0, 0, 1, 0, '0', 5, 0, '1', '8', '43', '204', '226', '0', '0', '0', '0', 0),
('management', '227', '216', 'admin/config/user-interface/shortcut/%/links', 'admin/config/user-interface/shortcut/%/links', 'List links', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 6, 0, '1', '8', '57', '207', '216', '227', '0', '0', '0', 0),
('management', '228', '204', 'admin/config/media/image-styles/delete/%', 'admin/config/media/image-styles/delete/%', 'Delete style', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Delete an image style.";}}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '8', '43', '204', '228', '0', '0', '0', '0', 0),
('management', '229', '204', 'admin/config/media/image-styles/revert/%', 'admin/config/media/image-styles/revert/%', 'Revert style', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Revert an image style.";}}', 'system', 0, 0, 0, 0, '0', 5, 0, '1', '8', '43', '204', '229', '0', '0', '0', '0', 0),
('management', '230', '225', 'admin/config/user-interface/shortcut/link/%/delete', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '57', '207', '225', '230', '0', '0', '0', 0),
('management', '231', '226', 'admin/config/media/image-styles/edit/%/add/%', 'admin/config/media/image-styles/edit/%/add/%', 'Add image effect', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:28:"Add a new effect to a style.";}}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '43', '204', '226', '231', '0', '0', '0', 0),
('management', '232', '226', 'admin/config/media/image-styles/edit/%/effects/%', 'admin/config/media/image-styles/edit/%/effects/%', 'Edit image effect', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:39:"Edit an existing effect within a style.";}}', 'system', 0, 0, 1, 0, '0', 6, 0, '1', '8', '43', '204', '226', '232', '0', '0', '0', 0),
('management', '233', '232', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'Delete image effect', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:39:"Delete an existing effect from a style.";}}', 'system', 0, 0, 0, 0, '0', 7, 0, '1', '8', '43', '204', '226', '232', '233', '0', '0', 0),
('shortcut-set-1', '234', '0', 'node/add', 'node/add', 'Add content', 'a:0:{}', 'menu', 0, 0, 0, 0, '-50', 1, 0, '234', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('shortcut-set-1', '235', '0', 'admin/content', 'admin/content', 'Find content', 'a:0:{}', 'menu', 0, 0, 0, 0, '-49', 1, 0, '235', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('main-menu', '236', '0', '<front>', '', 'Home', 'a:0:{}', 'menu', 0, 1, 0, 0, '0', 1, 0, '236', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '238', '6', 'node/add/page', 'node/add/page', 'Basic page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:77:"Use <em>basic pages</em> for your static content, such as an ''About us'' page.";}}', 'system', 0, 0, 0, 0, '0', 2, 0, '6', '238', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '239', '166', 'admin/help/toolbar', 'admin/help/toolbar', 'toolbar', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '239', '0', '0', '0', '0', '0', '0', 0),
('management', '278', '18', 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Get a status report about available updates for your installed modules and themes.";}}', 'system', 0, 0, 0, 0, '-50', 3, 0, '1', '18', '278', '0', '0', '0', '0', '0', '0', 0),
('management', '279', '15', 'admin/modules/install', 'admin/modules/install', 'Install new module', 'a:0:{}', 'system', -1, 0, 0, 0, '25', 3, 0, '1', '15', '279', '0', '0', '0', '0', '0', '0', 0),
('management', '280', '7', 'admin/appearance/install', 'admin/appearance/install', 'Install new theme', 'a:0:{}', 'system', -1, 0, 0, 0, '25', 3, 0, '1', '7', '280', '0', '0', '0', '0', '0', '0', 0),
('management', '281', '15', 'admin/modules/update', 'admin/modules/update', 'Update', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 3, 0, '1', '15', '281', '0', '0', '0', '0', '0', '0', 0),
('management', '282', '7', 'admin/appearance/update', 'admin/appearance/update', 'Update', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 3, 0, '1', '7', '282', '0', '0', '0', '0', '0', '0', 0),
('management', '283', '166', 'admin/help/update', 'admin/help/update', 'update', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '283', '0', '0', '0', '0', '0', '0', 0);
INSERT INTO `menu_links` VALUES
('management', '284', '278', 'admin/reports/updates/install', 'admin/reports/updates/install', 'Install new module or theme', 'a:0:{}', 'system', -1, 0, 0, 0, '25', 4, 0, '1', '18', '278', '284', '0', '0', '0', '0', '0', 0),
('management', '285', '278', 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '18', '278', '285', '0', '0', '0', '0', '0', 0),
('management', '286', '278', 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 'a:0:{}', 'system', -1, 0, 0, 0, '50', 4, 0, '1', '18', '278', '286', '0', '0', '0', '0', '0', 0),
('management', '287', '278', 'admin/reports/updates/update', 'admin/reports/updates/update', 'Update', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 4, 0, '1', '18', '278', '287', '0', '0', '0', '0', '0', 0),
('devel', '326', '0', 'devel/settings', 'devel/settings', 'Devel settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:168:"Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href="/admin/structure/block">block administration</a> page.";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '326', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '327', '0', 'devel/php', 'devel/php', 'Execute PHP Code', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Execute some PHP code";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '327', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '328', '0', 'devel/reference', 'devel/reference', 'Function reference', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:73:"View a list of currently defined user functions with documentation links.";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '328', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '329', '0', 'devel/elements', 'devel/elements', 'Hook_elements()', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:51:"View the active form/render elements for this site.";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '329', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '330', '0', 'devel/phpinfo', 'devel/phpinfo', 'PHPinfo()', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View your server''s PHP configuration";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '330', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '331', '0', 'devel/reinstall', 'devel/reinstall', 'Reinstall modules', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:64:"Run hook_uninstall() and then hook_install() for a given module.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, '0', 1, 0, '331', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '332', '0', 'devel/run-cron', 'devel/run-cron', 'Run cron', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 1, 0, '332', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '333', '0', 'devel/session', 'devel/session', 'Session viewer', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"List the contents of $_SESSION.";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '333', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '334', '0', 'devel/variable', 'devel/variable', 'Variable editor', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:31:"Edit and delete site variables.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, '0', 1, 0, '334', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '336', '5', 'node/%/devel', 'node/%/devel', 'Devel', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 2, 0, '5', '336', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '337', '16', 'user/%/devel', 'user/%/devel', 'Devel', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 2, 0, '16', '337', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '338', '0', 'devel/cache/clear', 'devel/cache/clear', 'Empty cache', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:100:"Clear the CSS cache and all database cache tables which store page, node, theme and variable caches.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, '0', 1, 0, '338', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '339', '0', 'devel/entity/info', 'devel/entity/info', 'Entity info', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"View entity information across the whole site.";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '339', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '340', '20', 'admin/structure/features', 'admin/structure/features', 'Features', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"Manage features.";}}', 'system', 0, 0, 0, 0, '0', 3, 0, '1', '20', '340', '0', '0', '0', '0', '0', '0', 0),
('devel', '341', '0', 'devel/field/info', 'devel/field/info', 'Field info', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"View fields information across the whole site.";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '341', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('devel', '342', '0', 'devel/menu/item', 'devel/menu/item', 'Menu item', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:32:"Details about a given menu item.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, '0', 1, 0, '342', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '343', '20', 'admin/structure/pages', 'admin/structure/pages', 'Pages', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:84:"Add, edit and remove overridden system pages and user defined pages from the system.";}}', 'system', 0, 0, 1, 0, '0', 3, 0, '1', '20', '343', '0', '0', '0', '0', '0', '0', 0),
('devel', '344', '0', 'devel/menu/reset', 'devel/menu/reset', 'Rebuild menus', 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:113:"Rebuild menu based on hook_menu() and revert any custom changes. All menu items return to their default settings.";}s:5:"alter";b:1;}', 'system', 0, 0, 0, 0, '0', 1, 0, '344', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '345', '20', 'admin/structure/demo', 'admin/structure/demo', 'Snapshots', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"Create snapshots and reset the site.";}}', 'system', 0, 0, 0, 0, '0', 3, 0, '1', '20', '345', '0', '0', '0', '0', '0', '0', 0),
('devel', '346', '0', 'devel/theme/registry', 'devel/theme/registry', 'Theme registry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"View a list of available theme functions across the whole site.";}}', 'system', 0, 0, 0, 0, '0', 1, 0, '346', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '347', '166', 'admin/help/devel', 'admin/help/devel', 'devel', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '347', '0', '0', '0', '0', '0', '0', 0),
('management', '348', '166', 'admin/help/features', 'admin/help/features', 'features', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '348', '0', '0', '0', '0', '0', '0', 0),
('management', '351', '343', 'admin/structure/pages/add', 'admin/structure/pages/add', 'Add custom page', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '343', '351', '0', '0', '0', '0', '0', 0),
('management', '352', '340', 'admin/structure/features/create', 'admin/structure/features/create', 'Create feature', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Create a new feature.";}}', 'system', -1, 0, 0, 0, '10', 4, 0, '1', '20', '340', '352', '0', '0', '0', '0', '0', 0),
('management', '353', '345', 'admin/structure/demo/dump', 'admin/structure/demo/dump', 'Create snapshot', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '345', '353', '0', '0', '0', '0', '0', 0),
('navigation', '354', '167', 'taxonomy/term/%/devel', 'taxonomy/term/%/devel', 'Devel', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 2, 0, '167', '354', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '355', '37', 'admin/config/development/devel', 'admin/config/development/devel', 'Devel settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:168:"Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href="/admin/structure/block">block administration</a> page.";}}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '8', '37', '355', '0', '0', '0', '0', '0', 0),
('management', '356', '343', 'admin/structure/pages/import', 'admin/structure/pages/import', 'Import page', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '343', '356', '0', '0', '0', '0', '0', 0),
('management', '357', '345', 'admin/structure/demo/list', 'admin/structure/demo/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '345', '357', '0', '0', '0', '0', '0', 0),
('management', '358', '343', 'admin/structure/pages/list', 'admin/structure/pages/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '343', '358', '0', '0', '0', '0', '0', 0),
('navigation', '359', '336', 'node/%/devel/load', 'node/%/devel/load', 'Load', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '5', '336', '359', '0', '0', '0', '0', '0', '0', 0),
('navigation', '360', '337', 'user/%/devel/load', 'user/%/devel/load', 'Load', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '16', '337', '360', '0', '0', '0', '0', '0', '0', 0),
('management', '361', '340', 'admin/structure/features/manage', 'admin/structure/features/manage', 'Manage', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:28:"Enable and disable features.";}}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '340', '361', '0', '0', '0', '0', '0', 0),
('navigation', '362', '336', 'node/%/devel/render', 'node/%/devel/render', 'Render', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 3, 0, '5', '336', '362', '0', '0', '0', '0', '0', '0', 0),
('navigation', '363', '337', 'user/%/devel/render', 'user/%/devel/render', 'Render', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 3, 0, '16', '337', '363', '0', '0', '0', '0', '0', '0', 0),
('management', '364', '345', 'admin/structure/demo/reset', 'admin/structure/demo/reset', 'Reset', 'a:0:{}', 'system', -1, 0, 0, 0, '3', 4, 0, '1', '20', '345', '364', '0', '0', '0', '0', '0', 0),
('management', '365', '345', 'admin/structure/demo/settings', 'admin/structure/demo/settings', 'Settings', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 4, 0, '1', '20', '345', '365', '0', '0', '0', '0', '0', 0),
('management', '366', '343', 'admin/structure/pages/wizard', 'admin/structure/pages/wizard', 'Wizards', 'a:0:{}', 'system', -1, 0, 0, 0, '-5', 4, 0, '1', '20', '343', '366', '0', '0', '0', '0', '0', 0),
('management', '367', '345', 'admin/structure/demo/delete/%', 'admin/structure/demo/delete/%', 'Delete snapshot', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '345', '367', '0', '0', '0', '0', '0', 0),
('management', '368', '343', 'admin/structure/pages/edit/%', 'admin/structure/pages/edit/%', 'Edit', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '343', '368', '0', '0', '0', '0', '0', 0),
('navigation', '369', '354', 'taxonomy/term/%/devel/load', 'taxonomy/term/%/devel/load', 'Load', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '167', '354', '369', '0', '0', '0', '0', '0', '0', 0),
('navigation', '370', '354', 'taxonomy/term/%/devel/render', 'taxonomy/term/%/devel/render', 'Render', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 3, 0, '167', '354', '370', '0', '0', '0', '0', '0', '0', 0),
('management', '371', '340', 'admin/structure/features/%/view', 'admin/structure/features/%/view', 'View', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:32:"Display components of a feature.";}}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '340', '371', '0', '0', '0', '0', '0', 0),
('management', '372', '340', 'admin/structure/features/%/recreate', 'admin/structure/features/%/recreate', 'Recreate', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:29:"Recreate an existing feature.";}}', 'system', -1, 0, 0, 0, '11', 4, 0, '1', '20', '340', '372', '0', '0', '0', '0', '0', 0),
('management', '373', '343', 'admin/structure/pages/%/operation/%', 'admin/structure/pages/%/operation/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '343', '373', '0', '0', '0', '0', '0', 0),
('navigation', '374', '0', 'comment/%comment/devel', 'comment/%comment/devel', 'Devel', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 1, 0, '374', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '375', '374', 'comment/%comment/devel/load', 'comment/%comment/devel/load', 'Load', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 2, 0, '374', '375', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '376', '374', 'comment/%comment/devel/render', 'comment/%comment/devel/render', 'Render', 'a:0:{}', 'system', -1, 0, 0, 0, '100', 2, 0, '374', '376', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '377', '166', 'admin/help/pathauto', 'admin/help/pathauto', 'pathauto', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '377', '0', '0', '0', '0', '0', '0', 0),
('management', '378', '166', 'admin/help/strongarm', 'admin/help/strongarm', 'strongarm', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '378', '0', '0', '0', '0', '0', '0', 0),
('management', '379', '166', 'admin/help/token', 'admin/help/token', 'token', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '379', '0', '0', '0', '0', '0', '0', 0),
('management', '380', '37', 'admin/config/development/strongarm', 'admin/config/development/strongarm', 'Strongarm', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"Manage Drupal variable settings that have been strongarmed.";}}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '8', '37', '380', '0', '0', '0', '0', '0', 0),
('navigation', '381', '374', 'comment/%comment/devel/token', 'comment/%comment/devel/token', 'Tokens', 'a:0:{}', 'system', -1, 0, 0, 0, '5', 2, 0, '374', '381', '0', '0', '0', '0', '0', '0', '0', 0),
('navigation', '382', '336', 'node/%/devel/token', 'node/%/devel/token', 'Tokens', 'a:0:{}', 'system', -1, 0, 0, 0, '5', 3, 0, '5', '336', '382', '0', '0', '0', '0', '0', '0', 0),
('navigation', '383', '337', 'user/%/devel/token', 'user/%/devel/token', 'Tokens', 'a:0:{}', 'system', -1, 0, 0, 0, '5', 3, 0, '16', '337', '383', '0', '0', '0', '0', '0', '0', 0),
('management', '384', '209', 'admin/config/search/path/update_bulk', 'admin/config/search/path/update_bulk', 'Bulk update', 'a:0:{}', 'system', -1, 0, 0, 0, '30', 5, 0, '1', '8', '50', '209', '384', '0', '0', '0', '0', 0),
('management', '385', '209', 'admin/config/search/path/delete_bulk', 'admin/config/search/path/delete_bulk', 'Delete aliases', 'a:0:{}', 'system', -1, 0, 0, 0, '40', 5, 0, '1', '8', '50', '209', '385', '0', '0', '0', '0', 0),
('management', '386', '209', 'admin/config/search/path/patterns', 'admin/config/search/path/patterns', 'Patterns', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 5, 0, '1', '8', '50', '209', '386', '0', '0', '0', '0', 0),
('management', '387', '209', 'admin/config/search/path/settings', 'admin/config/search/path/settings', 'Settings', 'a:0:{}', 'system', -1, 0, 0, 0, '20', 5, 0, '1', '8', '50', '209', '387', '0', '0', '0', '0', 0),
('navigation', '388', '354', 'taxonomy/term/%/devel/token', 'taxonomy/term/%/devel/token', 'Tokens', 'a:0:{}', 'system', -1, 0, 0, 0, '5', 3, 0, '167', '354', '388', '0', '0', '0', '0', '0', '0', 0),
('management', '392', '57', 'admin/config/user-interface/modulefilter', 'admin/config/user-interface/modulefilter', 'Module filter', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:37:"Configure settings for Module Filter.";}}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '8', '57', '392', '0', '0', '0', '0', '0', 0),
('management', '393', '166', 'admin/help/backup_migrate', 'admin/help/backup_migrate', 'backup_migrate', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 3, 0, '1', '166', '393', '0', '0', '0', '0', '0', '0', 0),
('management', '394', '53', 'admin/config/system/backup_migrate', 'admin/config/system/backup_migrate', 'Backup and Migrate', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:76:"Backup/restore your database or migrate data to or from another Drupal site.";}}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '8', '53', '394', '0', '0', '0', '0', '0', 0),
('management', '395', '394', 'admin/config/system/backup_migrate/export', 'admin/config/system/backup_migrate/export', 'Backup', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Backup the database.";}}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '8', '53', '394', '395', '0', '0', '0', '0', 0),
('management', '396', '394', 'admin/config/system/backup_migrate/destination', 'admin/config/system/backup_migrate/destination', 'Destinations', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 5, 0, '1', '8', '53', '394', '396', '0', '0', '0', '0', 0),
('management', '397', '394', 'admin/config/system/backup_migrate/profile', 'admin/config/system/backup_migrate/profile', 'Profiles', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 5, 0, '1', '8', '53', '394', '397', '0', '0', '0', '0', 0),
('management', '398', '394', 'admin/config/system/backup_migrate/restore', 'admin/config/system/backup_migrate/restore', 'Restore', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Restore the database from a previous backup";}}', 'system', -1, 0, 0, 0, '1', 5, 0, '1', '8', '53', '394', '398', '0', '0', '0', '0', 0),
('management', '399', '394', 'admin/config/system/backup_migrate/schedule', 'admin/config/system/backup_migrate/schedule', 'Schedules', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 5, 0, '1', '8', '53', '394', '399', '0', '0', '0', '0', 0),
('management', '400', '395', 'admin/config/system/backup_migrate/export/advanced', 'admin/config/system/backup_migrate/export/advanced', 'Advanced Backup', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Backup the database.";}}', 'system', -1, 0, 0, 0, '1', 6, 0, '1', '8', '53', '394', '395', '400', '0', '0', '0', 0),
('management', '401', '396', 'admin/config/system/backup_migrate/destination/list', 'admin/config/system/backup_migrate/destination/list', 'List !type', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 6, 0, '1', '8', '53', '394', '396', '401', '0', '0', '0', 0),
('management', '402', '397', 'admin/config/system/backup_migrate/profile/list', 'admin/config/system/backup_migrate/profile/list', 'List !type', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 6, 0, '1', '8', '53', '394', '397', '402', '0', '0', '0', 0),
('management', '403', '399', 'admin/config/system/backup_migrate/schedule/list', 'admin/config/system/backup_migrate/schedule/list', 'List !type', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 6, 0, '1', '8', '53', '394', '399', '403', '0', '0', '0', 0),
('management', '404', '395', 'admin/config/system/backup_migrate/export/quick', 'admin/config/system/backup_migrate/export/quick', 'Quick Backup', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Backup the database.";}}', 'system', -1, 0, 0, 0, '0', 6, 0, '1', '8', '53', '394', '395', '404', '0', '0', '0', 0),
('management', '405', '401', 'admin/config/system/backup_migrate/destination/list/add', 'admin/config/system/backup_migrate/destination/list/add', 'Add !type', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 7, 0, '1', '8', '53', '394', '396', '401', '405', '0', '0', 0),
('management', '406', '402', 'admin/config/system/backup_migrate/profile/list/add', 'admin/config/system/backup_migrate/profile/list/add', 'Add !type', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 7, 0, '1', '8', '53', '394', '397', '402', '406', '0', '0', 0),
('management', '407', '403', 'admin/config/system/backup_migrate/schedule/list/add', 'admin/config/system/backup_migrate/schedule/list/add', 'Add !type', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 7, 0, '1', '8', '53', '394', '399', '403', '407', '0', '0', 0),
('management', '408', '401', 'admin/config/system/backup_migrate/destination/list/files', 'admin/config/system/backup_migrate/destination/list/files', 'Destination Files', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '8', '53', '394', '396', '401', '408', '0', '0', 0),
('management', '409', '18', 'admin/reports/views-fields', 'admin/reports/views-fields', 'Fields used in views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:37:"Overview of fields used in all views.";}}', 'system', 0, 0, 0, 0, '0', 3, 0, '1', '18', '409', '0', '0', '0', '0', '0', '0', 0),
('management', '410', '20', 'admin/structure/views', 'admin/structure/views', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"Manage customized lists of content.";}}', 'system', 0, 0, 1, 0, '0', 3, 0, '1', '20', '410', '0', '0', '0', '0', '0', '0', 0),
('management', '411', '410', 'admin/structure/views/add', 'admin/structure/views/add', 'Add new view', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '410', '411', '0', '0', '0', '0', '0', 0),
('management', '412', '410', 'admin/structure/views/add-template', 'admin/structure/views/add-template', 'Add view from template', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '410', '412', '0', '0', '0', '0', '0', 0),
('management', '413', '410', 'admin/structure/views/import', 'admin/structure/views/import', 'Import', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '410', '413', '0', '0', '0', '0', '0', 0),
('management', '414', '410', 'admin/structure/views/list', 'admin/structure/views/list', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 4, 0, '1', '20', '410', '414', '0', '0', '0', '0', '0', 0),
('management', '415', '410', 'admin/structure/views/settings', 'admin/structure/views/settings', 'Settings', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 4, 0, '1', '20', '410', '415', '0', '0', '0', '0', '0', 0),
('management', '416', '415', 'admin/structure/views/settings/advanced', 'admin/structure/views/settings/advanced', 'Advanced', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 5, 0, '1', '20', '410', '415', '416', '0', '0', '0', '0', 0),
('management', '417', '415', 'admin/structure/views/settings/basic', 'admin/structure/views/settings/basic', 'Basic', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '410', '415', '417', '0', '0', '0', '0', 0),
('management', '418', '410', 'admin/structure/views/view/%', 'admin/structure/views/view/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '410', '418', '0', '0', '0', '0', '0', 0),
('management', '419', '418', 'admin/structure/views/view/%/break-lock', 'admin/structure/views/view/%/break-lock', 'Break lock', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '410', '418', '419', '0', '0', '0', '0', 0),
('management', '420', '418', 'admin/structure/views/view/%/edit', 'admin/structure/views/view/%/edit', 'Edit view', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 5, 0, '1', '20', '410', '418', '420', '0', '0', '0', '0', 0),
('management', '421', '418', 'admin/structure/views/view/%/delete', 'admin/structure/views/view/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '410', '418', '421', '0', '0', '0', '0', 0),
('management', '422', '418', 'admin/structure/views/view/%/clone', 'admin/structure/views/view/%/clone', 'Clone', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '410', '418', '422', '0', '0', '0', '0', 0),
('management', '423', '418', 'admin/structure/views/view/%/export', 'admin/structure/views/view/%/export', 'Export', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '410', '418', '423', '0', '0', '0', '0', 0),
('management', '424', '418', 'admin/structure/views/view/%/revert', 'admin/structure/views/view/%/revert', 'Revert', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '410', '418', '424', '0', '0', '0', '0', 0),
('management', '425', '418', 'admin/structure/views/view/%/preview/%', 'admin/structure/views/view/%/preview/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 5, 0, '1', '20', '410', '418', '425', '0', '0', '0', '0', 0),
('management', '426', '410', 'admin/structure/views/nojs/preview/%/%', 'admin/structure/views/nojs/preview/%/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '410', '426', '0', '0', '0', '0', '0', 0),
('management', '427', '410', 'admin/structure/views/ajax/preview/%/%', 'admin/structure/views/ajax/preview/%/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 4, 0, '1', '20', '410', '427', '0', '0', '0', '0', '0', 0),
('shortcut-set-1', '428', '0', 'admin/config/system/backup_migrate', 'admin/config/system/backup_migrate', 'Backup and Migrate', 'a:0:{}', 'menu', 0, 0, 0, 0, '-48', 1, 0, '428', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('shortcut-set-1', '493', '0', 'admin/config/development/performance', 'admin/config/development/performance', 'Performance', 'a:0:{}', 'menu', 0, 0, 0, 0, '-47', 1, 0, '493', '0', '0', '0', '0', '0', '0', '0', '0', 0),
('management', '526', '208', 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%/display', 'Manage display', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 5, 0, '1', '20', '171', '208', '526', '0', '0', '0', '0', 0),
('management', '527', '65', 'admin/config/people/accounts/display', 'admin/config/people/accounts/display', 'Manage display', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 5, 0, '1', '8', '45', '65', '527', '0', '0', '0', '0', 0),
('management', '528', '208', 'admin/structure/taxonomy/%/fields', 'admin/structure/taxonomy/%/fields', 'Manage fields', 'a:0:{}', 'system', -1, 0, 1, 0, '1', 5, 0, '1', '20', '171', '208', '528', '0', '0', '0', '0', 0),
('management', '529', '65', 'admin/config/people/accounts/fields', 'admin/config/people/accounts/fields', 'Manage fields', 'a:0:{}', 'system', -1, 0, 1, 0, '1', 5, 0, '1', '8', '45', '65', '529', '0', '0', '0', '0', 0),
('management', '530', '526', 'admin/structure/taxonomy/%/display/default', 'admin/structure/taxonomy/%/display/default', 'Default', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 6, 0, '1', '20', '171', '208', '526', '530', '0', '0', '0', 0),
('management', '531', '527', 'admin/config/people/accounts/display/default', 'admin/config/people/accounts/display/default', 'Default', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 6, 0, '1', '8', '45', '65', '527', '531', '0', '0', '0', 0),
('management', '532', '110', 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%/display', 'Manage display', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 5, 0, '1', '20', '34', '110', '532', '0', '0', '0', '0', 0),
('management', '533', '110', 'admin/structure/types/manage/%/fields', 'admin/structure/types/manage/%/fields', 'Manage fields', 'a:0:{}', 'system', -1, 0, 1, 0, '1', 5, 0, '1', '20', '34', '110', '533', '0', '0', '0', '0', 0),
('management', '534', '526', 'admin/structure/taxonomy/%/display/full', 'admin/structure/taxonomy/%/display/full', 'Taxonomy term page', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 6, 0, '1', '20', '171', '208', '526', '534', '0', '0', '0', 0),
('management', '535', '526', 'admin/structure/taxonomy/%/display/token', 'admin/structure/taxonomy/%/display/token', 'Tokens', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 6, 0, '1', '20', '171', '208', '526', '535', '0', '0', '0', 0),
('management', '536', '527', 'admin/config/people/accounts/display/token', 'admin/config/people/accounts/display/token', 'Tokens', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 6, 0, '1', '8', '45', '65', '527', '536', '0', '0', '0', 0),
('management', '537', '527', 'admin/config/people/accounts/display/full', 'admin/config/people/accounts/display/full', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 6, 0, '1', '8', '45', '65', '527', '537', '0', '0', '0', 0),
('management', '538', '529', 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '8', '45', '65', '529', '538', '0', '0', '0', 0),
('management', '539', '528', 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '20', '171', '208', '528', '539', '0', '0', '0', 0),
('management', '540', '532', 'admin/structure/types/manage/%/display/default', 'admin/structure/types/manage/%/display/default', 'Default', 'a:0:{}', 'system', -1, 0, 0, 0, '-10', 6, 0, '1', '20', '34', '110', '532', '540', '0', '0', '0', 0),
('management', '541', '532', 'admin/structure/types/manage/%/display/full', 'admin/structure/types/manage/%/display/full', 'Full content', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 6, 0, '1', '20', '34', '110', '532', '541', '0', '0', '0', 0),
('management', '542', '532', 'admin/structure/types/manage/%/display/rss', 'admin/structure/types/manage/%/display/rss', 'RSS', 'a:0:{}', 'system', -1, 0, 0, 0, '2', 6, 0, '1', '20', '34', '110', '532', '542', '0', '0', '0', 0),
('management', '543', '532', 'admin/structure/types/manage/%/display/teaser', 'admin/structure/types/manage/%/display/teaser', 'Teaser', 'a:0:{}', 'system', -1, 0, 0, 0, '1', 6, 0, '1', '20', '34', '110', '532', '543', '0', '0', '0', 0),
('management', '544', '532', 'admin/structure/types/manage/%/display/token', 'admin/structure/types/manage/%/display/token', 'Tokens', 'a:0:{}', 'system', -1, 0, 0, 0, '3', 6, 0, '1', '20', '34', '110', '532', '544', '0', '0', '0', 0),
('management', '545', '533', 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', '', 'a:0:{}', 'system', 0, 0, 0, 0, '0', 6, 0, '1', '20', '34', '110', '533', '545', '0', '0', '0', 0),
('management', '546', '539', 'admin/structure/taxonomy/%/fields/%/delete', 'admin/structure/taxonomy/%/fields/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 7, 0, '1', '20', '171', '208', '528', '539', '546', '0', '0', 0),
('management', '547', '539', 'admin/structure/taxonomy/%/fields/%/edit', 'admin/structure/taxonomy/%/fields/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '20', '171', '208', '528', '539', '547', '0', '0', 0),
('management', '548', '539', 'admin/structure/taxonomy/%/fields/%/field-settings', 'admin/structure/taxonomy/%/fields/%/field-settings', 'Field settings', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '20', '171', '208', '528', '539', '548', '0', '0', 0),
('management', '549', '539', 'admin/structure/taxonomy/%/fields/%/widget-type', 'admin/structure/taxonomy/%/fields/%/widget-type', 'Widget type', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '20', '171', '208', '528', '539', '549', '0', '0', 0),
('management', '550', '538', 'admin/config/people/accounts/fields/%/delete', 'admin/config/people/accounts/fields/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 7, 0, '1', '8', '45', '65', '529', '538', '550', '0', '0', 0),
('management', '551', '538', 'admin/config/people/accounts/fields/%/edit', 'admin/config/people/accounts/fields/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '8', '45', '65', '529', '538', '551', '0', '0', 0),
('management', '552', '538', 'admin/config/people/accounts/fields/%/field-settings', 'admin/config/people/accounts/fields/%/field-settings', 'Field settings', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '8', '45', '65', '529', '538', '552', '0', '0', 0),
('management', '553', '538', 'admin/config/people/accounts/fields/%/widget-type', 'admin/config/people/accounts/fields/%/widget-type', 'Widget type', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '8', '45', '65', '529', '538', '553', '0', '0', 0),
('management', '554', '545', 'admin/structure/types/manage/%/fields/%/delete', 'admin/structure/types/manage/%/fields/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, '10', 7, 0, '1', '20', '34', '110', '533', '545', '554', '0', '0', 0),
('management', '555', '545', 'admin/structure/types/manage/%/fields/%/edit', 'admin/structure/types/manage/%/fields/%/edit', 'Edit', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '20', '34', '110', '533', '545', '555', '0', '0', 0),
('management', '556', '545', 'admin/structure/types/manage/%/fields/%/field-settings', 'admin/structure/types/manage/%/fields/%/field-settings', 'Field settings', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '20', '34', '110', '533', '545', '556', '0', '0', 0),
('management', '557', '545', 'admin/structure/types/manage/%/fields/%/widget-type', 'admin/structure/types/manage/%/fields/%/widget-type', 'Widget type', 'a:0:{}', 'system', -1, 0, 0, 0, '0', 7, 0, '1', '20', '34', '110', '533', '545', '557', '0', '0', 0);
/*!40000 ALTER TABLE menu_links ENABLE KEYS */;

--
-- Table structure for table 'menu_router'
--

CREATE TABLE IF NOT EXISTS `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: the Drupal path this entry describes',
  `load_functions` blob NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` blob NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback which determines the access to this router path. Defaults to user_access.',
  `access_arguments` blob COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that renders the page.',
  `page_arguments` blob COMMENT 'A serialized array of arguments for the page callback.',
  `delivery_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that sends the result of the page_callback function to the browser.',
  `fit` int(11) NOT NULL DEFAULT '0' COMMENT 'A numeric representation of how specific the path is.',
  `number_parts` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Number of parts in this router path.',
  `context` int(11) NOT NULL DEFAULT '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `tab_parent` varchar(255) NOT NULL DEFAULT '' COMMENT 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).',
  `tab_root` varchar(255) NOT NULL DEFAULT '' COMMENT 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title for the current page, or the title for the tab if this is a local task.',
  `title_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which will alter the title. Defaults to t()',
  `title_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.',
  `theme_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.',
  `theme_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the theme callback.',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'Numeric representation of the type of the menu item, like MENU_LOCAL_TASK.',
  `description` text NOT NULL COMMENT 'A description of this item.',
  `position` varchar(255) NOT NULL DEFAULT '' COMMENT 'The position of the block (left or right) on the system administration page for this item.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of the element. Lighter weights are higher up, heavier weights go down.',
  `include_file` mediumtext COMMENT 'The file to include for this element, usually the page callback function lives in this file.',
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`(64),`weight`,`title`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maps paths to various callbacks (access, page and title)';

--
-- Dumping data for table 'menu_router'
--

/*!40000 ALTER TABLE menu_router DISABLE KEYS */;
INSERT INTO `menu_router` VALUES
('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '1', 1, '0', '', 'admin', 'Administration', 't', '', '', 'a:0:{}', '6', '', '', '9', 'modules/system/system.admin.inc'),
('admin/appearance', '', '', 'user_access', 'a:1:{i:0;s:17:"administer themes";}', 'system_themes_page', 'a:0:{}', '', '3', 2, '0', '', 'admin/appearance', 'Appearance', 't', '', '', 'a:0:{}', '6', 'Select and configure your themes.', 'left', '-6', 'modules/system/system.admin.inc'),
('admin/appearance/default', '', '', 'user_access', 'a:1:{i:0;s:17:"administer themes";}', 'system_theme_default', 'a:0:{}', '', '7', 3, '0', '', 'admin/appearance/default', 'Set default theme', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/disable', '', '', 'user_access', 'a:1:{i:0;s:17:"administer themes";}', 'system_theme_disable', 'a:0:{}', '', '7', 3, '0', '', 'admin/appearance/disable', 'Disable theme', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/enable', '', '', 'user_access', 'a:1:{i:0;s:17:"administer themes";}', 'system_theme_enable', 'a:0:{}', '', '7', 3, '0', '', 'admin/appearance/enable', 'Enable theme', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/install', '', '', 'update_manager_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:27:"update_manager_install_form";i:1;s:5:"theme";}', '', '7', 3, '1', 'admin/appearance', 'admin/appearance', 'Install new theme', 't', '', '', 'a:0:{}', '388', '', '', '25', 'modules/update/update.manager.inc'),
('admin/appearance/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer themes";}', 'system_themes_page', 'a:0:{}', '', '7', 3, '1', 'admin/appearance', 'admin/appearance', 'List', 't', '', '', 'a:0:{}', '140', 'Select and configure your theme', '', '-1', 'modules/system/system.admin.inc'),
('admin/appearance/settings', '', '', 'user_access', 'a:1:{i:0;s:17:"administer themes";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', '', '7', 3, '1', 'admin/appearance', 'admin/appearance', 'Settings', 't', '', '', 'a:0:{}', '132', 'Configure default and theme specific settings.', '', '20', 'modules/system/system.admin.inc'),
('admin/appearance/settings/adaptivetheme', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:63:"sites/all/themes/adaptivetheme/adaptivetheme/adaptivetheme.info";s:4:"name";s:13:"adaptivetheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:7:"AT Core";s:11:"description";s:104:"AT Core is the base theme for all Adaptivetheme subthemes. Now with baked in support for mobile devices.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:59:"sites/all/themes/adaptivetheme/adaptivetheme/screenshot.png";s:11:"stylesheets";a:1:{s:3:"all";a:3:{s:15:"css/at.base.css";s:60:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.base.css";s:17:"css/at.layout.css";s:62:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.layout.css";s:19:"css/at.messages.css";s:64:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.messages.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:6:"panels";}}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:3:{s:15:"css/at.base.css";s:60:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.base.css";s:17:"css/at.layout.css";s:62:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.layout.css";s:19:"css/at.messages.css";s:64:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.messages.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:13:"adaptivetheme";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'AT Core', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/adaptivetheme_admin', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_admin/adaptivetheme_admin.info";s:4:"name";s:19:"adaptivetheme_admin";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:8:"AT Admin";s:11:"description";s:152:"A better admin theme for Drupal 7. Clean, calm, invisible. Includes left and right sidebars, Overlay support and settings for font family and font size.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:65:"sites/all/themes/adaptivetheme/adaptivetheme_admin/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:16:"css/at_admin.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_admin/css/at_admin.css";}}s:7:"regions";a:8:{s:7:"content";s:12:"Main content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:6:"footer";s:6:"Footer";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"settings";a:66:{s:20:"shortcut_module_link";s:1:"1";s:16:"bigscreen_layout";s:15:"three-col-right";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:2:"px";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:3:"200";s:24:"bigscreen_sidebar_second";s:3:"160";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-right";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"15";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:13:"one-col-stack";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:13:"one-col-stack";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"1";s:21:"extra_article_classes";s:1:"1";s:21:"extra_comment_classes";s:1:"1";s:19:"extra_block_classes";s:1:"1";s:18:"extra_menu_classes";s:1:"1";s:23:"extra_item_list_classes";s:1:"1";s:23:"menu_item_span_elements";s:1:"0";s:11:"font_family";s:4:"ff-l";s:9:"font_size";s:9:"fs-medium";}s:8:"features";a:5:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:7:"favicon";i:3;s:9:"main_menu";i:4;s:14:"secondary_menu";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:16:"css/at_admin.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_admin/css/at_admin.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:13:"adaptivetheme";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:19:"adaptivetheme_admin";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'AT Admin', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/adaptivetheme_subtheme', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:81:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/adaptivetheme_subtheme.info";s:4:"name";s:22:"adaptivetheme_subtheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:11:"AT Subtheme";s:11:"description";s:439:"Starter subtheme for Adaptivetheme. Copy this subtheme to get started building your own Drupal theme. For help see our <b><a href="http://adaptivethemes.com/documentation/adaptivethemes-documentation">documentation</a></b> and <b><a href="http://vimeo.com/channels/61157">video tutorials</a></b>. If you have a problem and need additional help please use the <b><a href="http://drupal.org/project/issues/adaptivetheme">issue queue</a></b>.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:2:{s:3:"all";a:9:{s:21:"css/html-elements.css";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/html-elements.css";s:13:"css/forms.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/forms.css";s:14:"css/tables.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/tables.css";s:14:"css/fields.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/fields.css";s:12:"css/page.css";s:66:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/page.css";s:18:"css/navigation.css";s:72:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/navigation.css";s:16:"css/articles.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/articles.css";s:16:"css/comments.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/comments.css";s:14:"css/blocks.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/blocks.css";}s:5:"print";a:1:{s:13:"css/print.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/print.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:25:"comment_user_verification";i:6;s:7:"favicon";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"0";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:9:{s:21:"css/html-elements.css";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/html-elements.css";s:13:"css/forms.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/forms.css";s:14:"css/tables.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/tables.css";s:14:"css/fields.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/fields.css";s:12:"css/page.css";s:66:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/page.css";s:18:"css/navigation.css";s:72:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/navigation.css";s:16:"css/articles.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/articles.css";s:16:"css/comments.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/comments.css";s:14:"css/blocks.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/blocks.css";}s:5:"print";a:1:{s:13:"css/print.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/print.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:13:"adaptivetheme";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:22:"adaptivetheme_subtheme";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'AT Subtheme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/bartik', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:25:"themes/bartik/bartik.info";s:4:"name";s:6:"bartik";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:6:"Bartik";s:11:"description";s:48:"A flexible, recolorable theme with many regions.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:3:{s:14:"css/layout.css";s:28:"themes/bartik/css/layout.css";s:13:"css/style.css";s:27:"themes/bartik/css/style.css";s:14:"css/colors.css";s:28:"themes/bartik/css/colors.css";}s:5:"print";a:1:{s:13:"css/print.css";s:27:"themes/bartik/css/print.css";}}s:7:"regions";a:17:{s:6:"header";s:6:"Header";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:11:"highlighted";s:11:"Highlighted";s:8:"featured";s:8:"Featured";s:7:"content";s:7:"Content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:14:"triptych_first";s:14:"Triptych first";s:15:"triptych_middle";s:15:"Triptych middle";s:13:"triptych_last";s:13:"Triptych last";s:18:"footer_firstcolumn";s:19:"Footer first column";s:19:"footer_secondcolumn";s:20:"Footer second column";s:18:"footer_thirdcolumn";s:19:"Footer third column";s:19:"footer_fourthcolumn";s:20:"Footer fourth column";s:6:"footer";s:6:"Footer";}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"0";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:28:"themes/bartik/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:3:{s:14:"css/layout.css";s:28:"themes/bartik/css/layout.css";s:13:"css/style.css";s:27:"themes/bartik/css/style.css";s:14:"css/colors.css";s:28:"themes/bartik/css/colors.css";}s:5:"print";a:1:{s:13:"css/print.css";s:27:"themes/bartik/css/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:6:"bartik";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Bartik', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/garland', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:7:"Garland";s:11:"description";s:111:"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:8:"settings";a:1:{s:13:"garland_width";s:5:"fluid";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"garland";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Garland', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/global', '', '', 'user_access', 'a:1:{i:0;s:17:"administer themes";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Global settings', 't', '', '', 'a:0:{}', '140', '', '', '-1', 'modules/system/system.admin.inc'),
('admin/appearance/settings/seven', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:23:"themes/seven/seven.info";s:4:"name";s:5:"seven";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:5:"Seven";s:11:"description";s:65:"A simple one-column, tableless, fluid width administration theme.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:6:"screen";a:2:{s:9:"reset.css";s:22:"themes/seven/reset.css";s:9:"style.css";s:22:"themes/seven/style.css";}}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"1";}s:7:"regions";a:5:{s:7:"content";s:7:"Content";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:13:"sidebar_first";s:13:"First sidebar";}s:14:"regions_hidden";a:3:{i:0;s:13:"sidebar_first";i:1;s:8:"page_top";i:2;s:11:"page_bottom";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/seven/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:6:"screen";a:2:{s:9:"reset.css";s:22:"themes/seven/reset.css";s:9:"style.css";s:22:"themes/seven/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:5:"seven";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Seven', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/stark', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:23:"themes/stark/stark.info";s:4:"name";s:5:"stark";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:5:"Stark";s:11:"description";s:208:"This theme demonstrates Drupal''s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal''s default code, see the <a href="http://drupal.org/theme-guide">Theming Guide</a>.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"layout.css";s:23:"themes/stark/layout.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/stark/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"layout.css";s:23:"themes/stark/layout.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:5:"stark";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Stark', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/test_theme', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:39:"themes/tests/test_theme/test_theme.info";s:4:"name";s:10:"test_theme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:10:"Test theme";s:11:"description";s:34:"Theme for testing the theme system";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"system.base.css";s:39:"themes/tests/test_theme/system.base.css";}}s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:38:"themes/tests/test_theme/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"system.base.css";s:39:"themes/tests/test_theme/system.base.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"test_theme";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Test theme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/update_test_basetheme', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":10:{s:8:"filename";s:61:"themes/tests/update_test_basetheme/update_test_basetheme.info";s:4:"name";s:21:"update_test_basetheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:22:"Update test base theme";s:11:"description";s:63:"Test theme which acts as a base theme for other test subthemes.";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:49:"themes/tests/update_test_basetheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:21:"update_test_basetheme";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Update test base theme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/settings/update_test_subtheme', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:59:"themes/tests/update_test_subtheme/update_test_subtheme.info";s:4:"name";s:20:"update_test_subtheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:20:"Update test subtheme";s:11:"description";s:62:"Test theme which uses update_test_basetheme as the base theme.";s:4:"core";s:3:"7.x";s:10:"base theme";s:21:"update_test_basetheme";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:48:"themes/tests/update_test_subtheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:21:"update_test_basetheme";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:20:"update_test_subtheme";}', '', '15', 4, '1', 'admin/appearance/settings', 'admin/appearance', 'Update test subtheme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/system/system.admin.inc'),
('admin/appearance/update', '', '', 'update_manager_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:26:"update_manager_update_form";i:1;s:5:"theme";}', '', '7', 3, '1', 'admin/appearance', 'admin/appearance', 'Update', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/update/update.manager.inc'),
('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', '', '3', 2, '0', '', 'admin/compact', 'Compact mode', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/config', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_config_page', 'a:0:{}', '', '3', 2, '0', '', 'admin/config', 'Configuration', 't', '', '', 'a:0:{}', '6', 'Administer settings.', '', '0', 'modules/system/system.admin.inc'),
('admin/config/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/content', 'Content authoring', 't', '', '', 'a:0:{}', '6', 'Settings related to formatting and authoring content.', 'left', '-15', 'modules/system/system.admin.inc'),
('admin/config/content/formats', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', '', '15', 4, '0', '', 'admin/config/content/formats', 'Text formats', 't', '', '', 'a:0:{}', '6', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', '0', 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/%', 'a:1:{i:4;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:4;}', '', '30', 5, '0', '', 'admin/config/content/formats/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', '6', '', '', '0', 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/%/disable', 'a:1:{i:4;s:18:"filter_format_load";}', '', '_filter_disable_format_access', 'a:1:{i:0;i:4;}', 'drupal_get_form', 'a:2:{i:0;s:20:"filter_admin_disable";i:1;i:4;}', '', '61', 6, '0', '', 'admin/config/content/formats/%/disable', 'Disable text format', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', '', '31', 5, '1', 'admin/config/content/formats', 'admin/config/content/formats', 'Add text format', 't', '', '', 'a:0:{}', '388', '', '', '1', 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', '', '31', 5, '1', 'admin/config/content/formats', 'admin/config/content/formats', 'List', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/filter/filter.admin.inc'),
('admin/config/development', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/development', 'Development', 't', '', '', 'a:0:{}', '6', 'Development tools.', 'right', '-10', 'modules/system/system.admin.inc'),
('admin/config/development/devel', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"devel_admin_settings";}', '', '15', 4, '0', '', 'admin/config/development/devel', 'Devel settings', 't', '', '', 'a:0:{}', '6', 'Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href="/admin/structure/block">block administration</a> page.', '', '0', 'sites/all/modules/contrib/devel/devel.admin.inc'),
('admin/config/development/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:23:"system_logging_settings";}', '', '15', 4, '0', '', 'admin/config/development/logging', 'Logging and errors', 't', '', '', 'a:0:{}', '6', 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destinations, such as syslog, database, email, etc.', '', '-15', 'modules/system/system.admin.inc'),
('admin/config/development/maintenance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:28:"system_site_maintenance_mode";}', '', '15', 4, '0', '', 'admin/config/development/maintenance', 'Maintenance mode', 't', '', '', 'a:0:{}', '6', 'Take the site offline for maintenance or bring it back online.', '', '-10', 'modules/system/system.admin.inc'),
('admin/config/development/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', '', '15', 4, '0', '', 'admin/config/development/performance', 'Performance', 't', '', '', 'a:0:{}', '6', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', '-20', 'modules/system/system.admin.inc'),
('admin/config/development/strongarm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"strongarm_admin_form";}', '', '15', 4, '0', '', 'admin/config/development/strongarm', 'Strongarm', 't', '', '', 'a:0:{}', '6', 'Manage Drupal variable settings that have been strongarmed.', '', '0', 'sites/all/modules/contrib/strongarm/strongarm.admin.inc'),
('admin/config/media', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/media', 'Media', 't', '', '', 'a:0:{}', '6', 'Media tools.', 'left', '-10', 'modules/system/system.admin.inc'),
('admin/config/media/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', '', '15', 4, '0', '', 'admin/config/media/file-system', 'File system', 't', '', '', 'a:0:{}', '6', 'Tell Drupal where to store uploaded files and how they are accessed.', '', '-10', 'modules/system/system.admin.inc'),
('admin/config/media/image-styles', '', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'image_style_list', 'a:0:{}', '', '15', 4, '0', '', 'admin/config/media/image-styles', 'Image styles', 't', '', '', 'a:0:{}', '6', 'Configure styles that can be used for resizing or adjusting images on display.', '', '0', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/add', '', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'drupal_get_form', 'a:1:{i:0;s:20:"image_style_add_form";}', '', '31', 5, '1', 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'Add style', 't', '', '', 'a:0:{}', '388', 'Add a new image style.', '', '2', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/delete/%', 'a:1:{i:5;a:1:{s:16:"image_style_load";a:2:{i:0;N;i:1;s:1:"1";}}}', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'drupal_get_form', 'a:2:{i:0;s:23:"image_style_delete_form";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/media/image-styles/delete/%', 'Delete style', 't', '', '', 'a:0:{}', '6', 'Delete an image style.', '', '0', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%', 'a:1:{i:5;s:16:"image_style_load";}', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'drupal_get_form', 'a:2:{i:0;s:16:"image_style_form";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/media/image-styles/edit/%', 'Edit style', 't', '', '', 'a:0:{}', '6', 'Configure an image style.', '', '0', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%/add/%', 'a:2:{i:5;a:1:{s:16:"image_style_load";a:1:{i:0;i:5;}}i:7;a:1:{s:28:"image_effect_definition_load";a:1:{i:0;i:5;}}}', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'drupal_get_form', 'a:3:{i:0;s:17:"image_effect_form";i:1;i:5;i:2;i:7;}', '', '250', 8, '0', '', 'admin/config/media/image-styles/edit/%/add/%', 'Add image effect', 't', '', '', 'a:0:{}', '6', 'Add a new effect to a style.', '', '0', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%/effects/%', 'a:2:{i:5;a:1:{s:16:"image_style_load";a:2:{i:0;i:5;i:1;s:1:"3";}}i:7;a:1:{s:17:"image_effect_load";a:2:{i:0;i:5;i:1;s:1:"3";}}}', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'drupal_get_form', 'a:3:{i:0;s:17:"image_effect_form";i:1;i:5;i:2;i:7;}', '', '250', 8, '0', '', 'admin/config/media/image-styles/edit/%/effects/%', 'Edit image effect', 't', '', '', 'a:0:{}', '6', 'Edit an existing effect within a style.', '', '0', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%/effects/%/delete', 'a:2:{i:5;a:1:{s:16:"image_style_load";a:2:{i:0;i:5;i:1;s:1:"3";}}i:7;a:1:{s:17:"image_effect_load";a:2:{i:0;i:5;i:1;s:1:"3";}}}', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'drupal_get_form', 'a:3:{i:0;s:24:"image_effect_delete_form";i:1;i:5;i:2;i:7;}', '', '501', 9, '0', '', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'Delete image effect', 't', '', '', 'a:0:{}', '6', 'Delete an existing effect from a style.', '', '0', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/list', '', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'image_style_list', 'a:0:{}', '', '31', 5, '1', 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'List', 't', '', '', 'a:0:{}', '140', 'List the current image styles on the site.', '', '1', 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/revert/%', 'a:1:{i:5;a:1:{s:16:"image_style_load";a:2:{i:0;N;i:1;s:1:"2";}}}', '', 'user_access', 'a:1:{i:0;s:23:"administer image styles";}', 'drupal_get_form', 'a:2:{i:0;s:23:"image_style_revert_form";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/media/image-styles/revert/%', 'Revert style', 't', '', '', 'a:0:{}', '6', 'Revert an image style.', '', '0', 'modules/image/image.admin.inc'),
('admin/config/media/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', '', '15', 4, '0', '', 'admin/config/media/image-toolkit', 'Image toolkit', 't', '', '', 'a:0:{}', '6', 'Choose which image toolkit to use if you have installed optional toolkits.', '', '20', 'modules/system/system.admin.inc'),
('admin/config/people', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/people', 'People', 't', '', '', 'a:0:{}', '6', 'Configure user accounts.', 'left', '-20', 'modules/system/system.admin.inc'),
('admin/config/people/accounts', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', '', '15', 4, '0', '', 'admin/config/people/accounts', 'Account settings', 't', '', '', 'a:0:{}', '6', 'Configure default behavior of users, including registration requirements, e-mails, fields, and user pictures.', '', '-10', 'modules/user/user.admin.inc'),
('admin/config/people/accounts/display', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"user";i:2;s:4:"user";i:3;s:7:"default";}', '', '31', 5, '1', 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage display', 't', '', '', 'a:0:{}', '132', '', '', '2', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/display/default', '', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:7:"default";i:3;s:11:"user_access";i:4;s:16:"administer users";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"user";i:2;s:4:"user";i:3;s:7:"default";}', '', '63', 6, '1', 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'Default', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/display/full', '', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:4:"full";i:3;s:11:"user_access";i:4;s:16:"administer users";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"user";i:2;s:4:"user";i:3;s:4:"full";}', '', '63', 6, '1', 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'User account', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/display/token', '', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:5:"token";i:3;s:11:"user_access";i:4;s:16:"administer users";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"user";i:2;s:4:"user";i:3;s:5:"token";}', '', '63', 6, '1', 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'Tokens', 't', '', '', 'a:0:{}', '132', '', '', '1', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:3:{i:0;s:28:"field_ui_field_overview_form";i:1;s:4:"user";i:2;s:4:"user";}', '', '31', 5, '1', 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage fields', 't', '', '', 'a:0:{}', '132', '', '', '1', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%', 'a:1:{i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:1:"0";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:24:"field_ui_field_edit_form";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/people/accounts/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', '', 'a:0:{}', '6', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%/delete', 'a:1:{i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:1:"0";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:26:"field_ui_field_delete_form";i:1;i:5;}', '', '125', 7, '1', 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Delete', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES
('admin/config/people/accounts/fields/%/edit', 'a:1:{i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:1:"0";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:24:"field_ui_field_edit_form";i:1;i:5;}', '', '125', 7, '1', 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Edit', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%/field-settings', 'a:1:{i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:1:"0";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:28:"field_ui_field_settings_form";i:1;i:5;}', '', '125', 7, '1', 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Field settings', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%/widget-type', 'a:1:{i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"user";i:1;s:4:"user";i:2;s:1:"0";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:25:"field_ui_widget_type_form";i:1;i:5;}', '', '125', 7, '1', 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Widget type', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', '', '31', 5, '1', 'admin/config/people/accounts', 'admin/config/people/accounts', 'Settings', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/user/user.admin.inc'),
('admin/config/people/ip-blocking', '', '', 'user_access', 'a:1:{i:0;s:18:"block IP addresses";}', 'system_ip_blocking', 'a:0:{}', '', '15', 4, '0', '', 'admin/config/people/ip-blocking', 'IP address blocking', 't', '', '', 'a:0:{}', '6', 'Manage blocked IP addresses.', '', '10', 'modules/system/system.admin.inc'),
('admin/config/people/ip-blocking/delete/%', 'a:1:{i:5;s:15:"blocked_ip_load";}', '', 'user_access', 'a:1:{i:0;s:18:"block IP addresses";}', 'drupal_get_form', 'a:2:{i:0;s:25:"system_ip_blocking_delete";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/system/system.admin.inc'),
('admin/config/regional', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/regional', 'Regional and language', 't', '', '', 'a:0:{}', '6', 'Regional settings, localization and translation.', 'left', '-5', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', '', '15', 4, '0', '', 'admin/config/regional/date-time', 'Date and time', 't', '', '', 'a:0:{}', '6', 'Configure display formats for date and time.', '', '-15', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_formats', 'a:0:{}', '', '31', 5, '1', 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Formats', 't', '', '', 'a:0:{}', '132', 'Configure display format strings for date and time.', '', '-9', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/%/delete', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:30:"system_date_delete_format_form";i:1;i:5;}', '', '125', 7, '0', '', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 't', '', '', 'a:0:{}', '6', 'Allow users to delete a configured date format.', '', '0', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/%/edit', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:34:"system_configure_date_formats_form";i:1;i:5;}', '', '125', 7, '0', '', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 't', '', '', 'a:0:{}', '6', 'Allow users to edit a configured date format.', '', '0', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/add', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:34:"system_configure_date_formats_form";}', '', '63', 6, '1', 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time', 'Add format', 't', '', '', 'a:0:{}', '388', 'Allow users to add additional date formats.', '', '-10', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', '', '63', 6, '0', '', 'admin/config/regional/date-time/formats/lookup', 'Date and time lookup', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/types', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', '', '31', 5, '1', 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Types', 't', '', '', 'a:0:{}', '140', 'Configure display formats for date and time.', '', '-10', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/types/%/delete', 'a:1:{i:5;N;}', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:35:"system_delete_date_format_type_form";i:1;i:5;}', '', '125', 7, '0', '', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 't', '', '', 'a:0:{}', '6', 'Allow users to delete a configured date type.', '', '0', 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/types/add', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_add_date_format_type_form";}', '', '63', 6, '1', 'admin/config/regional/date-time/types', 'admin/config/regional/date-time', 'Add date type', 't', '', '', 'a:0:{}', '388', 'Add new date type.', '', '-10', 'modules/system/system.admin.inc'),
('admin/config/regional/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_regional_settings";}', '', '15', 4, '0', '', 'admin/config/regional/settings', 'Regional settings', 't', '', '', 'a:0:{}', '6', 'Settings for the site''s default time zone and country.', '', '-20', 'modules/system/system.admin.inc'),
('admin/config/search', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/search', 'Search and metadata', 't', '', '', 'a:0:{}', '6', 'Local site search, metadata and SEO.', 'left', '-10', 'modules/system/system.admin.inc'),
('admin/config/search/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', '', '15', 4, '0', '', 'admin/config/search/clean-urls', 'Clean URLs', 't', '', '', 'a:0:{}', '6', 'Enable or disable clean URLs for your site.', '', '5', 'modules/system/system.admin.inc'),
('admin/config/search/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json_output', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', '', '31', 5, '0', '', 'admin/config/search/clean-urls/check', 'Clean URL check', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/config/search/path', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', '', '15', 4, '0', '', 'admin/config/search/path', 'URL aliases', 't', '', '', 'a:0:{}', '6', 'Change your site''s URL paths by aliasing them.', '', '-5', 'modules/path/path.admin.inc'),
('admin/config/search/path/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', '', '31', 5, '1', 'admin/config/search/path', 'admin/config/search/path', 'Add alias', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/path/path.admin.inc'),
('admin/config/search/path/delete/%', 'a:1:{i:5;s:9:"path_load";}', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:2:{i:0;s:25:"path_admin_delete_confirm";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/search/path/delete/%', 'Delete alias', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/path/path.admin.inc'),
('admin/config/search/path/delete_bulk', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:21:"pathauto_admin_delete";}', '', '31', 5, '1', 'admin/config/search/path', 'admin/config/search/path', 'Delete aliases', 't', '', '', 'a:0:{}', '132', '', '', '40', 'sites/all/modules/contrib/pathauto/pathauto.admin.inc'),
('admin/config/search/path/edit/%', 'a:1:{i:5;s:9:"path_load";}', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:1:{i:0;i:5;}', '', '62', 6, '0', '', 'admin/config/search/path/edit/%', 'Edit alias', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/path/path.admin.inc'),
('admin/config/search/path/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', '', '31', 5, '1', 'admin/config/search/path', 'admin/config/search/path', 'List', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/path/path.admin.inc'),
('admin/config/search/path/patterns', '', '', 'user_access', 'a:1:{i:0;s:19:"administer pathauto";}', 'drupal_get_form', 'a:1:{i:0;s:22:"pathauto_patterns_form";}', '', '31', 5, '1', 'admin/config/search/path', 'admin/config/search/path', 'Patterns', 't', '', '', 'a:0:{}', '132', '', '', '10', 'sites/all/modules/contrib/pathauto/pathauto.admin.inc'),
('admin/config/search/path/settings', '', '', 'user_access', 'a:1:{i:0;s:19:"administer pathauto";}', 'drupal_get_form', 'a:1:{i:0;s:22:"pathauto_settings_form";}', '', '31', 5, '1', 'admin/config/search/path', 'admin/config/search/path', 'Settings', 't', '', '', 'a:0:{}', '132', '', '', '20', 'sites/all/modules/contrib/pathauto/pathauto.admin.inc'),
('admin/config/search/path/update_bulk', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:25:"pathauto_bulk_update_form";}', '', '31', 5, '1', 'admin/config/search/path', 'admin/config/search/path', 'Bulk update', 't', '', '', 'a:0:{}', '132', '', '', '30', 'sites/all/modules/contrib/pathauto/pathauto.admin.inc'),
('admin/config/services', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/services', 'Web services', 't', '', '', 'a:0:{}', '6', 'Tools related to web services.', 'right', '0', 'modules/system/system.admin.inc'),
('admin/config/services/rss-publishing', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_rss_feeds_settings";}', '', '15', 4, '0', '', 'admin/config/services/rss-publishing', 'RSS publishing', 't', '', '', 'a:0:{}', '6', 'Configure the site description, the number of items per feed and whether feeds should be titles/teasers/full-text.', '', '0', 'modules/system/system.admin.inc'),
('admin/config/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/system', 'System', 't', '', '', 'a:0:{}', '6', 'General system related configuration.', 'right', '-20', 'modules/system/system.admin.inc'),
('admin/config/system/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', '', '15', 4, '0', '', 'admin/config/system/actions', 'Actions', 't', '', '', 'a:0:{}', '6', 'Manage the actions defined for your site.', '', '0', 'modules/system/system.admin.inc'),
('admin/config/system/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', '', '31', 5, '0', '', 'admin/config/system/actions/configure', 'Configure an advanced action', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/system/system.admin.inc'),
('admin/config/system/actions/delete/%', 'a:1:{i:5;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/system/actions/delete/%', 'Delete action', 't', '', '', 'a:0:{}', '6', 'Delete an action.', '', '0', 'modules/system/system.admin.inc'),
('admin/config/system/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', '', '31', 5, '1', 'admin/config/system/actions', 'admin/config/system/actions', 'Manage actions', 't', '', '', 'a:0:{}', '140', 'Manage the actions defined for your site.', '', '-2', 'modules/system/system.admin.inc'),
('admin/config/system/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', '', '31', 5, '0', '', 'admin/config/system/actions/orphan', 'Remove orphans', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/config/system/backup_migrate', '', '', 'user_access', 'a:1:{i:0;s:25:"access backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:0:"";i:1;s:37:"backup_migrate_ui_manual_backup_quick";i:2;b:1;}', '', '15', 4, '0', '', 'admin/config/system/backup_migrate', 'Backup and Migrate', 't', '', '', 'a:0:{}', '6', 'Backup/restore your database or migrate data to or from another Drupal site.', '', '0', ''),
('admin/config/system/backup_migrate/destination', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_list";i:2;b:1;}', '', '31', 5, '1', 'admin/config/system/backup_migrate', 'admin/config/system/backup_migrate', 'Destinations', 't', '', '', 'a:0:{}', '132', '', '', '2', ''),
('admin/config/system/backup_migrate/destination/deletefile', '', '', 'user_access', 'a:1:{i:0;s:19:"delete backup files";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:12:"destinations";i:1;s:41:"backup_migrate_ui_destination_delete_file";i:2;b:1;}', '', '63', 6, '0', '', 'admin/config/system/backup_migrate/destination/deletefile', 'Delete File', 't', '', '', 'a:0:{}', '0', 'Delete a backup file', '', '0', ''),
('admin/config/system/backup_migrate/destination/downloadfile', '', '', 'user_access', 'a:1:{i:0;s:19:"access backup files";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:12:"destinations";i:1;s:43:"backup_migrate_ui_destination_download_file";i:2;b:1;}', '', '63', 6, '0', '', 'admin/config/system/backup_migrate/destination/downloadfile', 'Download File', 't', '', '', 'a:0:{}', '0', 'Download a backup file', '', '0', ''),
('admin/config/system/backup_migrate/destination/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_list";i:2;b:1;}', '', '63', 6, '1', 'admin/config/system/backup_migrate/destination', 'admin/config/system/backup_migrate', 'List !type', 't', 'a:1:{s:5:"!type";s:12:"Destinations";}', '', 'a:0:{}', '140', '', '', '1', ''),
('admin/config/system/backup_migrate/destination/list/add', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_create";i:2;b:1;}', '', '127', 7, '1', 'admin/config/system/backup_migrate/destination/list', 'admin/config/system/backup_migrate', 'Add !type', 't', 'a:1:{s:5:"!type";s:11:"Destination";}', '', 'a:0:{}', '388', '', '', '2', ''),
('admin/config/system/backup_migrate/destination/list/delete', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_delete";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/destination/list/delete', 'Delete !type', 't', 'a:1:{s:5:"!type";s:11:"Destination";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/destination/list/edit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_edit";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/destination/list/edit', 'Edit !type', 't', 'a:1:{s:5:"!type";s:11:"Destination";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/destination/list/export', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_export";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/destination/list/export', 'Export !type', 't', 'a:1:{s:5:"!type";s:11:"Destination";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/destination/list/files', '', '', 'user_access', 'a:1:{i:0;s:19:"access backup files";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:12:"destinations";i:1;s:43:"backup_migrate_ui_destination_display_files";i:2;b:1;}', '', '127', 7, '1', 'admin/config/system/backup_migrate/destination/list', 'admin/config/system/backup_migrate', 'Destination Files', 't', '', '', 'a:0:{}', '132', '', '', '0', ''),
('admin/config/system/backup_migrate/destination/restorefile', '', '', 'user_access', 'a:1:{i:0;s:19:"restore from backup";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:12:"destinations";i:1;s:42:"backup_migrate_ui_destination_restore_file";i:2;b:1;}', '', '63', 6, '0', '', 'admin/config/system/backup_migrate/destination/restorefile', 'Restore from backup', 't', '', '', 'a:0:{}', '0', 'Restore database from a backup file on the server', '', '0', ''),
('admin/config/system/backup_migrate/export', '', '', 'user_access', 'a:1:{i:0;s:25:"access backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:0:"";i:1;s:37:"backup_migrate_ui_manual_backup_quick";i:2;b:1;}', '', '31', 5, '1', 'admin/config/system/backup_migrate', 'admin/config/system/backup_migrate', 'Backup', 't', '', '', 'a:0:{}', '140', 'Backup the database.', '', '0', ''),
('admin/config/system/backup_migrate/export/advanced', '', '', 'user_access', 'a:1:{i:0;s:14:"perform backup";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:0:"";i:1;s:40:"backup_migrate_ui_manual_backup_advanced";i:2;b:1;}', '', '63', 6, '1', 'admin/config/system/backup_migrate/export', 'admin/config/system/backup_migrate', 'Advanced Backup', 't', '', '', 'a:0:{}', '132', 'Backup the database.', '', '1', ''),
('admin/config/system/backup_migrate/export/quick', '', '', 'user_access', 'a:1:{i:0;s:25:"access backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:0:"";i:1;s:37:"backup_migrate_ui_manual_backup_quick";i:2;b:1;}', '', '63', 6, '1', 'admin/config/system/backup_migrate/export', 'admin/config/system/backup_migrate', 'Quick Backup', 't', '', '', 'a:0:{}', '140', 'Backup the database.', '', '0', ''),
('admin/config/system/backup_migrate/profile', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_list";i:2;b:1;}', '', '31', 5, '1', 'admin/config/system/backup_migrate', 'admin/config/system/backup_migrate', 'Profiles', 't', '', '', 'a:0:{}', '132', '', '', '2', ''),
('admin/config/system/backup_migrate/profile/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_list";i:2;b:1;}', '', '63', 6, '1', 'admin/config/system/backup_migrate/profile', 'admin/config/system/backup_migrate', 'List !type', 't', 'a:1:{s:5:"!type";s:8:"Profiles";}', '', 'a:0:{}', '140', '', '', '1', ''),
('admin/config/system/backup_migrate/profile/list/add', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_create";i:2;b:1;}', '', '127', 7, '1', 'admin/config/system/backup_migrate/profile/list', 'admin/config/system/backup_migrate', 'Add !type', 't', 'a:1:{s:5:"!type";s:7:"Profile";}', '', 'a:0:{}', '388', '', '', '2', ''),
('admin/config/system/backup_migrate/profile/list/delete', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_delete";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/profile/list/delete', 'Delete !type', 't', 'a:1:{s:5:"!type";s:7:"Profile";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/profile/list/edit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_edit";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/profile/list/edit', 'Edit !type', 't', 'a:1:{s:5:"!type";s:7:"Profile";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/profile/list/export', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_export";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/profile/list/export', 'Export !type', 't', 'a:1:{s:5:"!type";s:7:"Profile";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/restore', '', '', 'user_access', 'a:1:{i:0;s:19:"restore from backup";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:0:"";i:1;s:32:"backup_migrate_ui_manual_restore";i:2;b:1;}', '', '31', 5, '1', 'admin/config/system/backup_migrate', 'admin/config/system/backup_migrate', 'Restore', 't', '', '', 'a:0:{}', '132', 'Restore the database from a previous backup', '', '1', ''),
('admin/config/system/backup_migrate/schedule', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_list";i:2;b:1;}', '', '31', 5, '1', 'admin/config/system/backup_migrate', 'admin/config/system/backup_migrate', 'Schedules', 't', '', '', 'a:0:{}', '132', '', '', '2', ''),
('admin/config/system/backup_migrate/schedule/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_list";i:2;b:1;}', '', '63', 6, '1', 'admin/config/system/backup_migrate/schedule', 'admin/config/system/backup_migrate', 'List !type', 't', 'a:1:{s:5:"!type";s:9:"Schedules";}', '', 'a:0:{}', '140', '', '', '1', ''),
('admin/config/system/backup_migrate/schedule/list/add', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_create";i:2;b:1;}', '', '127', 7, '1', 'admin/config/system/backup_migrate/schedule/list', 'admin/config/system/backup_migrate', 'Add !type', 't', 'a:1:{s:5:"!type";s:8:"Schedule";}', '', 'a:0:{}', '388', '', '', '2', ''),
('admin/config/system/backup_migrate/schedule/list/delete', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_delete";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/schedule/list/delete', 'Delete !type', 't', 'a:1:{s:5:"!type";s:8:"Schedule";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/schedule/list/edit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:27:"backup_migrate_crud_ui_edit";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/schedule/list/edit', 'Edit !type', 't', 'a:1:{s:5:"!type";s:8:"Schedule";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/backup_migrate/schedule/list/export', '', '', 'user_access', 'a:1:{i:0;s:29:"administer backup and migrate";}', 'backup_migrate_menu_callback', 'a:3:{i:0;s:4:"crud";i:1;s:29:"backup_migrate_crud_ui_export";i:2;b:1;}', '', '127', 7, '0', '', 'admin/config/system/backup_migrate/schedule/list/export', 'Export !type', 't', 'a:1:{s:5:"!type";s:8:"Schedule";}', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/config/system/cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"system_cron_settings";}', '', '15', 4, '0', '', 'admin/config/system/cron', 'Cron', 't', '', '', 'a:0:{}', '6', 'Manage automatic site maintenance tasks.', '', '20', 'modules/system/system.admin.inc'),
('admin/config/system/site-information', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_information_settings";}', '', '15', 4, '0', '', 'admin/config/system/site-information', 'Site information', 't', '', '', 'a:0:{}', '6', 'Change site name, e-mail address, slogan, default front page, and number of posts per page, error pages.', '', '-20', 'modules/system/system.admin.inc'),
('admin/config/user-interface', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/user-interface', 'User interface', 't', '', '', 'a:0:{}', '6', 'Tools that enhance the user interface.', 'right', '-15', 'modules/system/system.admin.inc'),
('admin/config/user-interface/modulefilter', '', '', 'user_access', 'a:1:{i:0;s:24:"administer module filter";}', 'drupal_get_form', 'a:1:{i:0;s:22:"module_filter_settings";}', '', '15', 4, '0', '', 'admin/config/user-interface/modulefilter', 'Module filter', 't', '', '', 'a:0:{}', '6', 'Configure settings for Module Filter.', '', '0', 'sites/all/modules/contrib/module_filter/module_filter.admin.inc'),
('admin/config/user-interface/shortcut', '', '', 'user_access', 'a:1:{i:0;s:20:"administer shortcuts";}', 'shortcut_set_admin', 'a:0:{}', '', '15', 4, '0', '', 'admin/config/user-interface/shortcut', 'Shortcuts', 't', '', '', 'a:0:{}', '6', 'Add and modify shortcut sets.', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%', 'a:1:{i:4;s:17:"shortcut_set_load";}', '', 'shortcut_set_edit_access', 'a:1:{i:0;i:4;}', 'drupal_get_form', 'a:2:{i:0;s:22:"shortcut_set_customize";i:1;i:4;}', '', '30', 5, '0', '', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 'shortcut_set_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', '6', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/add-link', 'a:1:{i:4;s:17:"shortcut_set_load";}', '', 'shortcut_set_edit_access', 'a:1:{i:0;i:4;}', 'drupal_get_form', 'a:2:{i:0;s:17:"shortcut_link_add";i:1;i:4;}', '', '61', 6, '1', 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Add shortcut', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/add-link-inline', 'a:1:{i:4;s:17:"shortcut_set_load";}', '', 'shortcut_set_edit_access', 'a:1:{i:0;i:4;}', 'shortcut_link_add_inline', 'a:1:{i:0;i:4;}', '', '61', 6, '0', '', 'admin/config/user-interface/shortcut/%/add-link-inline', 'Add shortcut', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/delete', 'a:1:{i:4;s:17:"shortcut_set_load";}', '', 'shortcut_set_delete_access', 'a:1:{i:0;i:4;}', 'drupal_get_form', 'a:2:{i:0;s:24:"shortcut_set_delete_form";i:1;i:4;}', '', '61', 6, '0', '', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/edit', 'a:1:{i:4;s:17:"shortcut_set_load";}', '', 'shortcut_set_edit_access', 'a:1:{i:0;i:4;}', 'drupal_get_form', 'a:2:{i:0;s:22:"shortcut_set_edit_form";i:1;i:4;}', '', '61', 6, '1', 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit set name', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/links', 'a:1:{i:4;s:17:"shortcut_set_load";}', '', 'shortcut_set_edit_access', 'a:1:{i:0;i:4;}', 'drupal_get_form', 'a:2:{i:0;s:22:"shortcut_set_customize";i:1;i:4;}', '', '61', 6, '1', 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'List links', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/add-set', '', '', 'user_access', 'a:1:{i:0;s:20:"administer shortcuts";}', 'drupal_get_form', 'a:1:{i:0;s:21:"shortcut_set_add_form";}', '', '31', 5, '1', 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Add shortcut set', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/link/%', 'a:1:{i:5;s:14:"menu_link_load";}', '', 'shortcut_link_access', 'a:1:{i:0;i:5;}', 'drupal_get_form', 'a:2:{i:0;s:18:"shortcut_link_edit";i:1;i:5;}', '', '62', 6, '0', '', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/link/%/delete', 'a:1:{i:5;s:14:"menu_link_load";}', '', 'shortcut_link_access', 'a:1:{i:0;i:5;}', 'drupal_get_form', 'a:2:{i:0;s:20:"shortcut_link_delete";i:1;i:5;}', '', '125', 7, '0', '', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('admin/config/workflow', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/config/workflow', 'Workflow', 't', '', '', 'a:0:{}', '6', 'Content workflow, editorial workflow tools.', 'right', '5', 'modules/system/system.admin.inc'),
('admin/content', '', '', 'user_access', 'a:1:{i:0;s:23:"access content overview";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', '', '3', 2, '0', '', 'admin/content', 'Content', 't', '', '', 'a:0:{}', '6', 'Find and manage content.', '', '-10', 'modules/node/node.admin.inc'),
('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:23:"access content overview";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', '', '7', 3, '1', 'admin/content', 'admin/content', 'Content', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/node/node.admin.inc'),
('admin/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_main', 'a:0:{}', '', '3', 2, '0', '', 'admin/help', 'Help', 't', '', '', 'a:0:{}', '6', 'Reference for usage, configuration, and modules.', '', '9', 'modules/help/help.admin.inc'),
('admin/help/backup_migrate', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/backup_migrate', 'backup_migrate', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/block', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/block', 'block', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/contextual', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/contextual', 'contextual', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/dblog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/dblog', 'dblog', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/devel', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/devel', 'devel', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/features', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/features', 'features', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/field', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/field', 'field', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/field_sql_storage', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/field_sql_storage', 'field_sql_storage', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/field_ui', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/field_ui', 'field_ui', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/file', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/file', 'file', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/filter', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/filter', 'filter', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/help', 'help', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/image', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/image', 'image', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/list', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/list', 'list', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/menu', 'menu', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/node', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/node', 'node', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/number', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/number', 'number', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/options', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/options', 'options', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/path', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/path', 'path', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/pathauto', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/pathauto', 'pathauto', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/rdf', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/rdf', 'rdf', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/shortcut', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/shortcut', 'shortcut', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/strongarm', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/strongarm', 'strongarm', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/system', 'system', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/taxonomy', 'taxonomy', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/text', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/text', 'text', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/token', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/token', 'token', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/toolbar', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/toolbar', 'toolbar', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/update', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/update', 'update', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/help/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', '', '7', 3, '0', '', 'admin/help/user', 'user', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/help/help.admin.inc'),
('admin/index', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_index', 'a:0:{}', '', '3', 2, '1', 'admin', 'admin', 'Index', 't', '', '', 'a:0:{}', '132', '', '', '-18', 'modules/system/system.admin.inc'),
('admin/modules', '', '', 'user_access', 'a:1:{i:0;s:18:"administer modules";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', '', '3', 2, '0', '', 'admin/modules', 'Modules', 't', '', '', 'a:0:{}', '6', 'Extend site functionality.', '', '-2', 'modules/system/system.admin.inc'),
('admin/modules/install', '', '', 'update_manager_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:27:"update_manager_install_form";i:1;s:6:"module";}', '', '7', 3, '1', 'admin/modules', 'admin/modules', 'Install new module', 't', '', '', 'a:0:{}', '388', '', '', '25', 'modules/update/update.manager.inc'),
('admin/modules/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer modules";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', '', '7', 3, '1', 'admin/modules', 'admin/modules', 'List', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/system/system.admin.inc'),
('admin/modules/list/confirm', '', '', 'user_access', 'a:1:{i:0;s:18:"administer modules";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', '', '15', 4, '0', '', 'admin/modules/list/confirm', 'List', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/system/system.admin.inc'),
('admin/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:18:"administer modules";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', '', '7', 3, '1', 'admin/modules', 'admin/modules', 'Uninstall', 't', '', '', 'a:0:{}', '132', '', '', '20', 'modules/system/system.admin.inc'),
('admin/modules/uninstall/confirm', '', '', 'user_access', 'a:1:{i:0;s:18:"administer modules";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', '', '15', 4, '0', '', 'admin/modules/uninstall/confirm', 'Uninstall', 't', '', '', 'a:0:{}', '4', '', '', '0', 'modules/system/system.admin.inc'),
('admin/modules/update', '', '', 'update_manager_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:26:"update_manager_update_form";i:1;s:6:"module";}', '', '7', 3, '1', 'admin/modules', 'admin/modules', 'Update', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/update/update.manager.inc'),
('admin/people', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', '', '3', 2, '0', '', 'admin/people', 'People', 't', '', '', 'a:0:{}', '6', 'Manage user accounts, roles, and permissions.', 'left', '-4', 'modules/user/user.admin.inc'),
('admin/people/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', '', '7', 3, '1', 'admin/people', 'admin/people', 'Add user', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/user/user.admin.inc'),
('admin/people/people', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', '', '7', 3, '1', 'admin/people', 'admin/people', 'List', 't', '', '', 'a:0:{}', '140', 'Find and manage people interacting with your site.', '', '-10', 'modules/user/user.admin.inc'),
('admin/people/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:22:"user_admin_permissions";}', '', '7', 3, '1', 'admin/people', 'admin/people', 'Permissions', 't', '', '', 'a:0:{}', '132', 'Determine access to features by selecting permissions for roles.', '', '0', 'modules/user/user.admin.inc'),
('admin/people/permissions/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:22:"user_admin_permissions";}', '', '15', 4, '1', 'admin/people/permissions', 'admin/people', 'Permissions', 't', '', '', 'a:0:{}', '140', 'Determine access to features by selecting permissions for roles.', '', '-8', 'modules/user/user.admin.inc'),
('admin/people/permissions/roles', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:16:"user_admin_roles";}', '', '15', 4, '1', 'admin/people/permissions', 'admin/people', 'Roles', 't', '', '', 'a:0:{}', '132', 'List, edit, or add user roles.', '', '-5', 'modules/user/user.admin.inc'),
('admin/people/permissions/roles/delete/%', 'a:1:{i:5;s:14:"user_role_load";}', '', 'user_role_edit_access', 'a:1:{i:0;i:5;}', 'drupal_get_form', 'a:2:{i:0;s:30:"user_admin_role_delete_confirm";i:1;i:5;}', '', '62', 6, '0', '', 'admin/people/permissions/roles/delete/%', 'Delete role', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/user/user.admin.inc'),
('admin/people/permissions/roles/edit/%', 'a:1:{i:5;s:14:"user_role_load";}', '', 'user_role_edit_access', 'a:1:{i:0;i:5;}', 'drupal_get_form', 'a:2:{i:0;s:15:"user_admin_role";i:1;i:5;}', '', '62', 6, '0', '', 'admin/people/permissions/roles/edit/%', 'Edit role', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/user/user.admin.inc'),
('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', '', '3', 2, '0', '', 'admin/reports', 'Reports', 't', '', '', 'a:0:{}', '6', 'View reports, updates, and errors.', 'left', '5', 'modules/system/system.admin.inc'),
('admin/reports/access-denied', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:13:"access denied";}', '', '7', 3, '0', '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', '', 'a:0:{}', '6', 'View ''access denied'' errors (403s).', '', '0', 'modules/dblog/dblog.admin.inc'),
('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', '', '7', 3, '0', '', 'admin/reports/dblog', 'Recent log messages', 't', '', '', 'a:0:{}', '6', 'View events that have recently been logged.', '', '-1', 'modules/dblog/dblog.admin.inc'),
('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', '', '14', 4, '0', '', 'admin/reports/event/%', 'Details', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/dblog/dblog.admin.inc'),
('admin/reports/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'field_ui_fields_list', 'a:0:{}', '', '7', 3, '0', '', 'admin/reports/fields', 'Field list', 't', '', '', 'a:0:{}', '6', 'Overview of fields on all entity types.', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/reports/page-not-found', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:14:"page not found";}', '', '7', 3, '0', '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', '', 'a:0:{}', '6', 'View ''page not found'' errors (404s).', '', '0', 'modules/dblog/dblog.admin.inc'),
('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', '', '7', 3, '0', '', 'admin/reports/status', 'Status report', 't', '', '', 'a:0:{}', '6', 'Get a status report about your site''s operation and any detected problems.', '', '-60', 'modules/system/system.admin.inc'),
('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', '', '15', 4, '0', '', 'admin/reports/status/php', 'PHP', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/reports/status/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', '', '15', 4, '0', '', 'admin/reports/status/rebuild', 'Rebuild permissions', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', '', '15', 4, '0', '', 'admin/reports/status/run-cron', 'Run cron', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('admin/reports/updates', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', '', '7', 3, '0', '', 'admin/reports/updates', 'Available updates', 't', '', '', 'a:0:{}', '6', 'Get a status report about available updates for your installed modules and themes.', '', '-50', 'modules/update/update.report.inc'),
('admin/reports/updates/check', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_manual_status', 'a:0:{}', '', '15', 4, '0', '', 'admin/reports/updates/check', 'Manual update check', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/update/update.fetch.inc'),
('admin/reports/updates/install', '', '', 'update_manager_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:27:"update_manager_install_form";i:1;s:6:"report";}', '', '15', 4, '1', 'admin/reports/updates', 'admin/reports/updates', 'Install new module or theme', 't', '', '', 'a:0:{}', '388', '', '', '25', 'modules/update/update.manager.inc'),
('admin/reports/updates/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', '', '15', 4, '1', 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/update/update.report.inc'),
('admin/reports/updates/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:15:"update_settings";}', '', '15', 4, '1', 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', '', 'a:0:{}', '132', '', '', '50', 'modules/update/update.settings.inc'),
('admin/reports/updates/update', '', '', 'update_manager_access', 'a:0:{}', 'drupal_get_form', 'a:2:{i:0;s:26:"update_manager_update_form";i:1;s:6:"report";}', '', '15', 4, '1', 'admin/reports/updates', 'admin/reports/updates', 'Update', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/update/update.manager.inc'),
('admin/reports/views-fields', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_field_list', 'a:0:{}', '', '7', 3, '0', '', 'admin/reports/views-fields', 'Fields used in views', 't', '', '', 'a:0:{}', '6', 'Overview of fields used in all views.', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '3', 2, '0', '', 'admin/structure', 'Structure', 't', '', '', 'a:0:{}', '6', 'Administer blocks, content types, menus, etc.', 'right', '-8', 'modules/system/system.admin.inc'),
('admin/structure/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:1:{i:0;s:6:"bartik";}', '', '7', 3, '0', '', 'admin/structure/block', 'Blocks', 't', '', '', 'a:0:{}', '6', 'Configure what block content appears in your site''s sidebars and other regions.', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '15', 4, '1', 'admin/structure/block', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES
('admin/structure/block/demo/adaptivetheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:63:"sites/all/themes/adaptivetheme/adaptivetheme/adaptivetheme.info";s:4:"name";s:13:"adaptivetheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:7:"AT Core";s:11:"description";s:104:"AT Core is the base theme for all Adaptivetheme subthemes. Now with baked in support for mobile devices.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:59:"sites/all/themes/adaptivetheme/adaptivetheme/screenshot.png";s:11:"stylesheets";a:1:{s:3:"all";a:3:{s:15:"css/at.base.css";s:60:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.base.css";s:17:"css/at.layout.css";s:62:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.layout.css";s:19:"css/at.messages.css";s:64:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.messages.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:6:"panels";}}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:3:{s:15:"css/at.base.css";s:60:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.base.css";s:17:"css/at.layout.css";s:62:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.layout.css";s:19:"css/at.messages.css";s:64:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.messages.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_demo', 'a:1:{i:0;s:13:"adaptivetheme";}', '', '31', 5, '0', '', 'admin/structure/block/demo/adaptivetheme', 'AT Core', 't', '', '_block_custom_theme', 'a:1:{i:0;s:13:"adaptivetheme";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/adaptivetheme_admin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_admin/adaptivetheme_admin.info";s:4:"name";s:19:"adaptivetheme_admin";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:8:"AT Admin";s:11:"description";s:152:"A better admin theme for Drupal 7. Clean, calm, invisible. Includes left and right sidebars, Overlay support and settings for font family and font size.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:65:"sites/all/themes/adaptivetheme/adaptivetheme_admin/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:16:"css/at_admin.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_admin/css/at_admin.css";}}s:7:"regions";a:8:{s:7:"content";s:12:"Main content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:6:"footer";s:6:"Footer";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"settings";a:66:{s:20:"shortcut_module_link";s:1:"1";s:16:"bigscreen_layout";s:15:"three-col-right";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:2:"px";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:3:"200";s:24:"bigscreen_sidebar_second";s:3:"160";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-right";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"15";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:13:"one-col-stack";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:13:"one-col-stack";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"1";s:21:"extra_article_classes";s:1:"1";s:21:"extra_comment_classes";s:1:"1";s:19:"extra_block_classes";s:1:"1";s:18:"extra_menu_classes";s:1:"1";s:23:"extra_item_list_classes";s:1:"1";s:23:"menu_item_span_elements";s:1:"0";s:11:"font_family";s:4:"ff-l";s:9:"font_size";s:9:"fs-medium";}s:8:"features";a:5:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:7:"favicon";i:3;s:9:"main_menu";i:4;s:14:"secondary_menu";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:16:"css/at_admin.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_admin/css/at_admin.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:13:"adaptivetheme";}}', 'block_admin_demo', 'a:1:{i:0;s:19:"adaptivetheme_admin";}', '', '31', 5, '0', '', 'admin/structure/block/demo/adaptivetheme_admin', 'AT Admin', 't', '', '_block_custom_theme', 'a:1:{i:0;s:19:"adaptivetheme_admin";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/adaptivetheme_subtheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:81:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/adaptivetheme_subtheme.info";s:4:"name";s:22:"adaptivetheme_subtheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:11:"AT Subtheme";s:11:"description";s:439:"Starter subtheme for Adaptivetheme. Copy this subtheme to get started building your own Drupal theme. For help see our <b><a href="http://adaptivethemes.com/documentation/adaptivethemes-documentation">documentation</a></b> and <b><a href="http://vimeo.com/channels/61157">video tutorials</a></b>. If you have a problem and need additional help please use the <b><a href="http://drupal.org/project/issues/adaptivetheme">issue queue</a></b>.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:2:{s:3:"all";a:9:{s:21:"css/html-elements.css";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/html-elements.css";s:13:"css/forms.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/forms.css";s:14:"css/tables.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/tables.css";s:14:"css/fields.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/fields.css";s:12:"css/page.css";s:66:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/page.css";s:18:"css/navigation.css";s:72:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/navigation.css";s:16:"css/articles.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/articles.css";s:16:"css/comments.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/comments.css";s:14:"css/blocks.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/blocks.css";}s:5:"print";a:1:{s:13:"css/print.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/print.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:25:"comment_user_verification";i:6;s:7:"favicon";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"0";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:9:{s:21:"css/html-elements.css";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/html-elements.css";s:13:"css/forms.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/forms.css";s:14:"css/tables.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/tables.css";s:14:"css/fields.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/fields.css";s:12:"css/page.css";s:66:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/page.css";s:18:"css/navigation.css";s:72:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/navigation.css";s:16:"css/articles.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/articles.css";s:16:"css/comments.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/comments.css";s:14:"css/blocks.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/blocks.css";}s:5:"print";a:1:{s:13:"css/print.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/print.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:13:"adaptivetheme";}}', 'block_admin_demo', 'a:1:{i:0;s:22:"adaptivetheme_subtheme";}', '', '31', 5, '0', '', 'admin/structure/block/demo/adaptivetheme_subtheme', 'AT Subtheme', 't', '', '_block_custom_theme', 'a:1:{i:0;s:22:"adaptivetheme_subtheme";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/bartik', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:25:"themes/bartik/bartik.info";s:4:"name";s:6:"bartik";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:6:"Bartik";s:11:"description";s:48:"A flexible, recolorable theme with many regions.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:3:{s:14:"css/layout.css";s:28:"themes/bartik/css/layout.css";s:13:"css/style.css";s:27:"themes/bartik/css/style.css";s:14:"css/colors.css";s:28:"themes/bartik/css/colors.css";}s:5:"print";a:1:{s:13:"css/print.css";s:27:"themes/bartik/css/print.css";}}s:7:"regions";a:17:{s:6:"header";s:6:"Header";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:11:"highlighted";s:11:"Highlighted";s:8:"featured";s:8:"Featured";s:7:"content";s:7:"Content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:14:"triptych_first";s:14:"Triptych first";s:15:"triptych_middle";s:15:"Triptych middle";s:13:"triptych_last";s:13:"Triptych last";s:18:"footer_firstcolumn";s:19:"Footer first column";s:19:"footer_secondcolumn";s:20:"Footer second column";s:18:"footer_thirdcolumn";s:19:"Footer third column";s:19:"footer_fourthcolumn";s:20:"Footer fourth column";s:6:"footer";s:6:"Footer";}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"0";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:28:"themes/bartik/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:3:{s:14:"css/layout.css";s:28:"themes/bartik/css/layout.css";s:13:"css/style.css";s:27:"themes/bartik/css/style.css";s:14:"css/colors.css";s:28:"themes/bartik/css/colors.css";}s:5:"print";a:1:{s:13:"css/print.css";s:27:"themes/bartik/css/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_demo', 'a:1:{i:0;s:6:"bartik";}', '', '31', 5, '0', '', 'admin/structure/block/demo/bartik', 'Bartik', 't', '', '_block_custom_theme', 'a:1:{i:0;s:6:"bartik";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:7:"Garland";s:11:"description";s:111:"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:8:"settings";a:1:{s:13:"garland_width";s:5:"fluid";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_demo', 'a:1:{i:0;s:7:"garland";}', '', '31', 5, '0', '', 'admin/structure/block/demo/garland', 'Garland', 't', '', '_block_custom_theme', 'a:1:{i:0;s:7:"garland";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/seven', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:23:"themes/seven/seven.info";s:4:"name";s:5:"seven";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:5:"Seven";s:11:"description";s:65:"A simple one-column, tableless, fluid width administration theme.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:6:"screen";a:2:{s:9:"reset.css";s:22:"themes/seven/reset.css";s:9:"style.css";s:22:"themes/seven/style.css";}}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"1";}s:7:"regions";a:5:{s:7:"content";s:7:"Content";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:13:"sidebar_first";s:13:"First sidebar";}s:14:"regions_hidden";a:3:{i:0;s:13:"sidebar_first";i:1;s:8:"page_top";i:2;s:11:"page_bottom";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/seven/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:6:"screen";a:2:{s:9:"reset.css";s:22:"themes/seven/reset.css";s:9:"style.css";s:22:"themes/seven/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_demo', 'a:1:{i:0;s:5:"seven";}', '', '31', 5, '0', '', 'admin/structure/block/demo/seven', 'Seven', 't', '', '_block_custom_theme', 'a:1:{i:0;s:5:"seven";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/stark', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:23:"themes/stark/stark.info";s:4:"name";s:5:"stark";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:5:"Stark";s:11:"description";s:208:"This theme demonstrates Drupal''s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal''s default code, see the <a href="http://drupal.org/theme-guide">Theming Guide</a>.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"layout.css";s:23:"themes/stark/layout.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/stark/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"layout.css";s:23:"themes/stark/layout.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_demo', 'a:1:{i:0;s:5:"stark";}', '', '31', 5, '0', '', 'admin/structure/block/demo/stark', 'Stark', 't', '', '_block_custom_theme', 'a:1:{i:0;s:5:"stark";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/test_theme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:39:"themes/tests/test_theme/test_theme.info";s:4:"name";s:10:"test_theme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:10:"Test theme";s:11:"description";s:34:"Theme for testing the theme system";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"system.base.css";s:39:"themes/tests/test_theme/system.base.css";}}s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:38:"themes/tests/test_theme/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"system.base.css";s:39:"themes/tests/test_theme/system.base.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_demo', 'a:1:{i:0;s:10:"test_theme";}', '', '31', 5, '0', '', 'admin/structure/block/demo/test_theme', 'Test theme', 't', '', '_block_custom_theme', 'a:1:{i:0;s:10:"test_theme";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/update_test_basetheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":10:{s:8:"filename";s:61:"themes/tests/update_test_basetheme/update_test_basetheme.info";s:4:"name";s:21:"update_test_basetheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:22:"Update test base theme";s:11:"description";s:63:"Test theme which acts as a base theme for other test subthemes.";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:49:"themes/tests/update_test_basetheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_demo', 'a:1:{i:0;s:21:"update_test_basetheme";}', '', '31', 5, '0', '', 'admin/structure/block/demo/update_test_basetheme', 'Update test base theme', 't', '', '_block_custom_theme', 'a:1:{i:0;s:21:"update_test_basetheme";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/demo/update_test_subtheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:59:"themes/tests/update_test_subtheme/update_test_subtheme.info";s:4:"name";s:20:"update_test_subtheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:20:"Update test subtheme";s:11:"description";s:62:"Test theme which uses update_test_basetheme as the base theme.";s:4:"core";s:3:"7.x";s:10:"base theme";s:21:"update_test_basetheme";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:48:"themes/tests/update_test_subtheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:21:"update_test_basetheme";}}', 'block_admin_demo', 'a:1:{i:0;s:20:"update_test_subtheme";}', '', '31', 5, '0', '', 'admin/structure/block/demo/update_test_subtheme', 'Update test subtheme', 't', '', '_block_custom_theme', 'a:1:{i:0;s:20:"update_test_subtheme";}', '0', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/adaptivetheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:63:"sites/all/themes/adaptivetheme/adaptivetheme/adaptivetheme.info";s:4:"name";s:13:"adaptivetheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:7:"AT Core";s:11:"description";s:104:"AT Core is the base theme for all Adaptivetheme subthemes. Now with baked in support for mobile devices.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:59:"sites/all/themes/adaptivetheme/adaptivetheme/screenshot.png";s:11:"stylesheets";a:1:{s:3:"all";a:3:{s:15:"css/at.base.css";s:60:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.base.css";s:17:"css/at.layout.css";s:62:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.layout.css";s:19:"css/at.messages.css";s:64:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.messages.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:6:"panels";}}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:3:{s:15:"css/at.base.css";s:60:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.base.css";s:17:"css/at.layout.css";s:62:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.layout.css";s:19:"css/at.messages.css";s:64:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.messages.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:13:"adaptivetheme";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'AT Core', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/adaptivetheme/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/adaptivetheme', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/adaptivetheme_admin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_admin/adaptivetheme_admin.info";s:4:"name";s:19:"adaptivetheme_admin";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:8:"AT Admin";s:11:"description";s:152:"A better admin theme for Drupal 7. Clean, calm, invisible. Includes left and right sidebars, Overlay support and settings for font family and font size.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:65:"sites/all/themes/adaptivetheme/adaptivetheme_admin/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:16:"css/at_admin.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_admin/css/at_admin.css";}}s:7:"regions";a:8:{s:7:"content";s:12:"Main content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:6:"footer";s:6:"Footer";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"settings";a:66:{s:20:"shortcut_module_link";s:1:"1";s:16:"bigscreen_layout";s:15:"three-col-right";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:2:"px";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:3:"200";s:24:"bigscreen_sidebar_second";s:3:"160";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-right";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"15";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:13:"one-col-stack";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:13:"one-col-stack";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"1";s:21:"extra_article_classes";s:1:"1";s:21:"extra_comment_classes";s:1:"1";s:19:"extra_block_classes";s:1:"1";s:18:"extra_menu_classes";s:1:"1";s:23:"extra_item_list_classes";s:1:"1";s:23:"menu_item_span_elements";s:1:"0";s:11:"font_family";s:4:"ff-l";s:9:"font_size";s:9:"fs-medium";}s:8:"features";a:5:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:7:"favicon";i:3;s:9:"main_menu";i:4;s:14:"secondary_menu";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:16:"css/at_admin.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_admin/css/at_admin.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:13:"adaptivetheme";}}', 'block_admin_display', 'a:1:{i:0;s:19:"adaptivetheme_admin";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'AT Admin', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/adaptivetheme_admin/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/adaptivetheme_admin', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES
('admin/structure/block/list/adaptivetheme_subtheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:81:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/adaptivetheme_subtheme.info";s:4:"name";s:22:"adaptivetheme_subtheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:11:"AT Subtheme";s:11:"description";s:439:"Starter subtheme for Adaptivetheme. Copy this subtheme to get started building your own Drupal theme. For help see our <b><a href="http://adaptivethemes.com/documentation/adaptivethemes-documentation">documentation</a></b> and <b><a href="http://vimeo.com/channels/61157">video tutorials</a></b>. If you have a problem and need additional help please use the <b><a href="http://drupal.org/project/issues/adaptivetheme">issue queue</a></b>.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:2:{s:3:"all";a:9:{s:21:"css/html-elements.css";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/html-elements.css";s:13:"css/forms.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/forms.css";s:14:"css/tables.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/tables.css";s:14:"css/fields.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/fields.css";s:12:"css/page.css";s:66:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/page.css";s:18:"css/navigation.css";s:72:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/navigation.css";s:16:"css/articles.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/articles.css";s:16:"css/comments.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/comments.css";s:14:"css/blocks.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/blocks.css";}s:5:"print";a:1:{s:13:"css/print.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/print.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:25:"comment_user_verification";i:6;s:7:"favicon";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"0";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:9:{s:21:"css/html-elements.css";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/html-elements.css";s:13:"css/forms.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/forms.css";s:14:"css/tables.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/tables.css";s:14:"css/fields.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/fields.css";s:12:"css/page.css";s:66:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/page.css";s:18:"css/navigation.css";s:72:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/navigation.css";s:16:"css/articles.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/articles.css";s:16:"css/comments.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/comments.css";s:14:"css/blocks.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/blocks.css";}s:5:"print";a:1:{s:13:"css/print.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/print.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:13:"adaptivetheme";}}', 'block_admin_display', 'a:1:{i:0;s:22:"adaptivetheme_subtheme";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'AT Subtheme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/adaptivetheme_subtheme/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/adaptivetheme_subtheme', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/bartik', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:25:"themes/bartik/bartik.info";s:4:"name";s:6:"bartik";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:6:"Bartik";s:11:"description";s:48:"A flexible, recolorable theme with many regions.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:3:{s:14:"css/layout.css";s:28:"themes/bartik/css/layout.css";s:13:"css/style.css";s:27:"themes/bartik/css/style.css";s:14:"css/colors.css";s:28:"themes/bartik/css/colors.css";}s:5:"print";a:1:{s:13:"css/print.css";s:27:"themes/bartik/css/print.css";}}s:7:"regions";a:17:{s:6:"header";s:6:"Header";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:11:"highlighted";s:11:"Highlighted";s:8:"featured";s:8:"Featured";s:7:"content";s:7:"Content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:14:"triptych_first";s:14:"Triptych first";s:15:"triptych_middle";s:15:"Triptych middle";s:13:"triptych_last";s:13:"Triptych last";s:18:"footer_firstcolumn";s:19:"Footer first column";s:19:"footer_secondcolumn";s:20:"Footer second column";s:18:"footer_thirdcolumn";s:19:"Footer third column";s:19:"footer_fourthcolumn";s:20:"Footer fourth column";s:6:"footer";s:6:"Footer";}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"0";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:28:"themes/bartik/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:3:{s:14:"css/layout.css";s:28:"themes/bartik/css/layout.css";s:13:"css/style.css";s:27:"themes/bartik/css/style.css";s:14:"css/colors.css";s:28:"themes/bartik/css/colors.css";}s:5:"print";a:1:{s:13:"css/print.css";s:27:"themes/bartik/css/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:6:"bartik";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'Bartik', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/block/block.admin.inc'),
('admin/structure/block/list/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:7:"Garland";s:11:"description";s:111:"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:8:"settings";a:1:{s:13:"garland_width";s:5:"fluid";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"garland";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'Garland', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/garland/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/garland', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/seven', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:23:"themes/seven/seven.info";s:4:"name";s:5:"seven";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:5:"Seven";s:11:"description";s:65:"A simple one-column, tableless, fluid width administration theme.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:6:"screen";a:2:{s:9:"reset.css";s:22:"themes/seven/reset.css";s:9:"style.css";s:22:"themes/seven/style.css";}}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"1";}s:7:"regions";a:5:{s:7:"content";s:7:"Content";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:13:"sidebar_first";s:13:"First sidebar";}s:14:"regions_hidden";a:3:{i:0;s:13:"sidebar_first";i:1;s:8:"page_top";i:2;s:11:"page_bottom";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/seven/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:6:"screen";a:2:{s:9:"reset.css";s:22:"themes/seven/reset.css";s:9:"style.css";s:22:"themes/seven/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:5:"seven";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'Seven', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/seven/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/seven', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/stark', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:23:"themes/stark/stark.info";s:4:"name";s:5:"stark";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:5:"Stark";s:11:"description";s:208:"This theme demonstrates Drupal''s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal''s default code, see the <a href="http://drupal.org/theme-guide">Theming Guide</a>.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"layout.css";s:23:"themes/stark/layout.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/stark/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"layout.css";s:23:"themes/stark/layout.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:5:"stark";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'Stark', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/stark/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/stark', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/test_theme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:39:"themes/tests/test_theme/test_theme.info";s:4:"name";s:10:"test_theme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:10:"Test theme";s:11:"description";s:34:"Theme for testing the theme system";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"system.base.css";s:39:"themes/tests/test_theme/system.base.css";}}s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:38:"themes/tests/test_theme/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"system.base.css";s:39:"themes/tests/test_theme/system.base.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"test_theme";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'Test theme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/test_theme/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/test_theme', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/update_test_basetheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":10:{s:8:"filename";s:61:"themes/tests/update_test_basetheme/update_test_basetheme.info";s:4:"name";s:21:"update_test_basetheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:16:{s:4:"name";s:22:"Update test base theme";s:11:"description";s:63:"Test theme which acts as a base theme for other test subthemes.";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:49:"themes/tests/update_test_basetheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:21:"update_test_basetheme";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'Update test base theme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/update_test_basetheme/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/update_test_basetheme', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/update_test_subtheme', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:59:"themes/tests/update_test_subtheme/update_test_subtheme.info";s:4:"name";s:20:"update_test_subtheme";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:20:"Update test subtheme";s:11:"description";s:62:"Test theme which uses update_test_basetheme as the base theme.";s:4:"core";s:3:"7.x";s:10:"base theme";s:21:"update_test_basetheme";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:48:"themes/tests/update_test_subtheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:21:"update_test_basetheme";}}', 'block_admin_display', 'a:1:{i:0;s:20:"update_test_subtheme";}', '', '31', 5, '1', 'admin/structure/block', 'admin/structure/block', 'Update test subtheme', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/list/update_test_subtheme/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', '', '63', 6, '1', 'admin/structure/block/list/update_test_subtheme', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/manage/%/%', 'a:2:{i:4;N;i:5;N;}', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:3:{i:0;s:21:"block_admin_configure";i:1;i:4;i:2;i:5;}', '', '60', 6, '0', '', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/manage/%/%/configure', 'a:2:{i:4;N;i:5;N;}', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:3:{i:0;s:21:"block_admin_configure";i:1;i:4;i:2;i:5;}', '', '121', 7, '2', 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/block/manage/%/%/delete', 'a:2:{i:4;N;i:5;N;}', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:3:{i:0;s:25:"block_custom_block_delete";i:1;i:4;i:2;i:5;}', '', '121', 7, '0', 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Delete block', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/block/block.admin.inc'),
('admin/structure/demo', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:16:"demo_manage_form";}', '', '7', 3, '0', '', 'admin/structure/demo', 'Snapshots', 't', '', '', 'a:0:{}', '6', 'Create snapshots and reset the site.', '', '0', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/structure/demo/delete/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:2:{i:0;s:19:"demo_delete_confirm";i:1;i:4;}', '', '30', 5, '0', '', 'admin/structure/demo/delete/%', 'Delete snapshot', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/structure/demo/dump', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:14:"demo_dump_form";}', '', '15', 4, '1', 'admin/structure/demo', 'admin/structure/demo', 'Create snapshot', 't', '', '', 'a:0:{}', '388', '', '', '0', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/structure/demo/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:16:"demo_manage_form";}', '', '15', 4, '1', 'admin/structure/demo', 'admin/structure/demo', 'List', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/structure/demo/reset', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:18:"demo_reset_confirm";}', '', '15', 4, '1', 'admin/structure/demo', 'admin/structure/demo', 'Reset', 't', '', '', 'a:0:{}', '132', '', '', '3', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/structure/demo/settings', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'drupal_get_form', 'a:1:{i:0;s:19:"demo_admin_settings";}', '', '15', 4, '1', 'admin/structure/demo', 'admin/structure/demo', 'Settings', 't', '', '', 'a:0:{}', '132', '', '', '10', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('admin/structure/features', '', '', 'user_access', 'a:1:{i:0;s:15:"manage features";}', 'drupal_get_form', 'a:1:{i:0;s:19:"features_admin_form";}', '', '7', 3, '0', '', 'admin/structure/features', 'Features', 't', '', '', 'a:0:{}', '6', 'Manage features.', '', '0', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/features/%', 'a:1:{i:3;a:1:{s:12:"feature_load";a:2:{i:0;i:3;i:1;b:1;}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer features";}', 'drupal_get_form', 'a:2:{i:0;s:25:"features_admin_components";i:1;i:3;}', '', '14', 4, '0', '', 'admin/structure/features/%', '', 'features_get_feature_title', 'a:1:{i:0;i:3;}', '', 'a:0:{}', '0', 'Display components of a feature.', '', '0', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/features/%/recreate', 'a:1:{i:3;a:1:{s:12:"feature_load";a:2:{i:0;i:3;i:1;b:1;}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer features";}', 'drupal_get_form', 'a:2:{i:0;s:20:"features_export_form";i:1;i:3;}', '', '29', 5, '1', 'admin/structure/features/%', 'admin/structure/features/%', 'Recreate', 't', '', '', 'a:0:{}', '132', 'Recreate an existing feature.', '', '11', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/features/%/status', 'a:1:{i:3;a:1:{s:12:"feature_load";a:2:{i:0;i:3;i:1;b:1;}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer features";}', 'features_feature_status', 'a:1:{i:0;i:3;}', '', '29', 5, '0', '', 'admin/structure/features/%/status', 'Status', 't', '', '', 'a:0:{}', '0', 'Javascript status call back.', '', '0', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/features/%/view', 'a:1:{i:3;a:1:{s:12:"feature_load";a:2:{i:0;i:3;i:1;b:1;}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer features";}', 'drupal_get_form', 'a:2:{i:0;s:25:"features_admin_components";i:1;i:3;}', '', '29', 5, '1', 'admin/structure/features/%', 'admin/structure/features/%', 'View', 't', '', '', 'a:0:{}', '140', 'Display components of a feature.', '', '-10', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/features/cleanup', '', '', 'user_access', 'a:1:{i:0;s:15:"manage features";}', 'drupal_get_form', 'a:2:{i:0;s:21:"features_cleanup_form";i:1;i:4;}', '', '15', 4, '0', '', 'admin/structure/features/cleanup', 'Cleanup', 't', '', '', 'a:0:{}', '0', 'Detect and disable any orphaned feature dependencies.', '', '1', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/features/create', '', '', 'user_access', 'a:1:{i:0;s:19:"administer features";}', 'drupal_get_form', 'a:1:{i:0;s:20:"features_export_form";}', '', '15', 4, '1', 'admin/structure/features', 'admin/structure/features', 'Create feature', 't', '', '', 'a:0:{}', '132', 'Create a new feature.', '', '10', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/features/manage', '', '', 'user_access', 'a:1:{i:0;s:15:"manage features";}', 'drupal_get_form', 'a:1:{i:0;s:19:"features_admin_form";}', '', '15', 4, '1', 'admin/structure/features', 'admin/structure/features', 'Manage', 't', '', '', 'a:0:{}', '140', 'Enable and disable features.', '', '0', 'sites/all/modules/contrib/features/features.admin.inc'),
('admin/structure/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/structure/menu', 'Menus', 't', '', '', 'a:0:{}', '6', 'Add new menus to your site, edit existing menus, and rename and reorganize menu links.', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', '', '15', 4, '1', 'admin/structure/menu', 'admin/structure/menu', 'Add menu', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', '', '61', 6, '0', '', 'admin/structure/menu/item/%/delete', 'Delete menu link', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', '', '61', 6, '0', '', 'admin/structure/menu/item/%/edit', 'Edit menu link', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', '', '61', 6, '0', '', 'admin/structure/menu/item/%/reset', 'Reset menu link', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', '', '15', 4, '1', 'admin/structure/menu', 'admin/structure/menu', 'List menus', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%', 'a:1:{i:4;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:4;}', '', '30', 5, '0', '', 'admin/structure/menu/manage/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', '6', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/add', 'a:1:{i:4;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:4;}', '', '61', 6, '1', 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Add link', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/delete', 'a:1:{i:4;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:4;}', '', '61', 6, '0', '', 'admin/structure/menu/manage/%/delete', 'Delete menu', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/edit', 'a:1:{i:4;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:4;}', '', '61', 6, '3', 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Edit menu', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/list', 'a:1:{i:4;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:4;}', '', '61', 6, '3', 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'List links', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/menu/menu.admin.inc'),
('admin/structure/menu/parents', '', '', 'user_access', 'a:1:{i:0;b:1;}', 'menu_parent_options_js', 'a:0:{}', '', '15', 4, '0', '', 'admin/structure/menu/parents', 'Parent menu items', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('admin/structure/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', '', '15', 4, '1', 'admin/structure/menu', 'admin/structure/menu', 'Settings', 't', '', '', 'a:0:{}', '132', '', '', '5', 'modules/menu/menu.admin.inc'),
('admin/structure/pages', '', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_list_page', 'a:0:{}', '', '7', 3, '0', '', 'admin/structure/pages', 'Pages', 't', '', 'ajax_base_page_theme', 'a:0:{}', '6', 'Add, edit and remove overridden system pages and user defined pages from the system.', '', '0', 'sites/all/modules/contrib/ctools/page_manager/page_manager.admin.inc'),
('admin/structure/pages/%/disable/%', 'a:2:{i:3;s:14:"ctools_js_load";i:5;s:23:"page_manager_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_enable_page', 'a:3:{i:0;b:1;i:1;i:3;i:2;i:5;}', '', '58', 6, '0', '', 'admin/structure/pages/%/disable/%', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/page_manager/page_manager.admin.inc'),
('admin/structure/pages/%/enable/%', 'a:2:{i:3;s:14:"ctools_js_load";i:5;s:23:"page_manager_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_enable_page', 'a:3:{i:0;b:0;i:1;i:3;i:2;i:5;}', '', '58', 6, '0', '', 'admin/structure/pages/%/enable/%', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/page_manager/page_manager.admin.inc'),
('admin/structure/pages/%/operation/%', 'a:2:{i:3;s:14:"ctools_js_load";i:5;s:23:"page_manager_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_edit_page_operation', 'a:2:{i:0;i:3;i:1;i:5;}', '', '58', 6, '0', '', 'admin/structure/pages/%/operation/%', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '6', '', '', '0', 'sites/all/modules/contrib/ctools/page_manager/page_manager.admin.inc'),
('admin/structure/pages/add', '', '', 'user_access', 'a:1:{i:0;s:23:"administer page manager";}', 'page_manager_page_add_subtask', 'a:0:{}', '', '15', 4, '1', 'admin/structure/pages', 'admin/structure/pages', 'Add custom page', 't', '', 'ajax_base_page_theme', 'a:0:{}', '388', '', '', '0', 'sites/all/modules/contrib/ctools/page_manager/plugins/tasks/page.admin.inc'),
('admin/structure/pages/argument', '', '', 'user_access', 'a:1:{i:0;s:23:"administer page manager";}', 'page_manager_page_subtask_argument_ajax', 'a:0:{}', '', '15', 4, '0', '', 'admin/structure/pages/argument', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/page_manager/plugins/tasks/page.admin.inc'),
('admin/structure/pages/edit/%', 'a:1:{i:4;s:23:"page_manager_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_edit_page', 'a:1:{i:0;i:4;}', '', '30', 5, '0', '', 'admin/structure/pages/edit/%', 'Edit', 't', '', 'ajax_base_page_theme', 'a:0:{}', '6', '', '', '0', 'sites/all/modules/contrib/ctools/page_manager/page_manager.admin.inc'),
('admin/structure/pages/import', '', '', 'ctools_access_multiperm', 'a:2:{i:0;s:23:"administer page manager";i:1;s:20:"use PHP for settings";}', 'drupal_get_form', 'a:2:{i:0;s:32:"page_manager_page_import_subtask";i:1;s:4:"page";}', '', '15', 4, '1', 'admin/structure/pages', 'admin/structure/pages', 'Import page', 't', '', 'ajax_base_page_theme', 'a:0:{}', '388', '', '', '0', 'sites/all/modules/contrib/ctools/page_manager/plugins/tasks/page.admin.inc'),
('admin/structure/pages/list', '', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_list_page', 'a:0:{}', '', '15', 4, '1', 'admin/structure/pages', 'admin/structure/pages', 'List', 't', '', 'ajax_base_page_theme', 'a:0:{}', '140', '', '', '-10', 'sites/all/modules/contrib/ctools/page_manager/page_manager.admin.inc'),
('admin/structure/pages/wizard', '', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_page_wizard_list', 'a:1:{i:0;i:4;}', '', '15', 4, '1', 'admin/structure/pages', 'admin/structure/pages', 'Wizards', 't', '', 'ajax_base_page_theme', 'a:0:{}', '132', '', '', '-5', 'sites/all/modules/contrib/ctools/includes/page-wizard.inc'),
('admin/structure/pages/wizard/%', 'a:1:{i:4;N;}', '', 'user_access', 'a:1:{i:0;s:16:"use page manager";}', 'page_manager_page_wizard', 'a:1:{i:0;i:4;}', '', '30', 5, '0', '', 'admin/structure/pages/wizard/%', 'Wizard', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/page-wizard.inc'),
('admin/structure/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', '', '7', 3, '0', '', 'admin/structure/taxonomy', 'Taxonomy', 't', '', '', 'a:0:{}', '6', 'Manage tagging, categorization, and classification of your content.', '', '0', 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', '', '14', 4, '0', '', 'admin/structure/taxonomy/%', '', 'taxonomy_admin_vocabulary_title_callback', 'a:1:{i:0;i:3;}', '', 'a:0:{}', '6', '', '', '0', 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%/add', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:3:{i:0;s:18:"taxonomy_form_term";i:1;a:0:{}i:2;i:3;}', '', '29', 5, '1', 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Add term', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%/display', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:13:"taxonomy_term";i:2;i:3;i:3;s:7:"default";}', '', '29', 5, '1', 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage display', 't', '', '', 'a:0:{}', '132', '', '', '2', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/display/default', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:7:"default";i:3;s:11:"user_access";i:4;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:13:"taxonomy_term";i:2;i:3;i:3;s:7:"default";}', '', '59', 6, '1', 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Default', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/display/full', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:4:"full";i:3;s:11:"user_access";i:4;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:13:"taxonomy_term";i:2;i:3;i:3;s:4:"full";}', '', '59', 6, '1', 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Taxonomy term page', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/display/token', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:5:"token";i:3;s:11:"user_access";i:4;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:13:"taxonomy_term";i:2;i:3;i:3;s:5:"token";}', '', '59', 6, '1', 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Tokens', 't', '', '', 'a:0:{}', '132', '', '', '1', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/edit', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:24:"taxonomy_form_vocabulary";i:1;i:3;}', '', '29', 5, '1', 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Edit', 't', '', '', 'a:0:{}', '132', '', '', '-10', 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%/fields', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:3:{i:0;s:28:"field_ui_field_overview_form";i:1;s:13:"taxonomy_term";i:2;i:3;}', '', '29', 5, '1', 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage fields', 't', '', '', 'a:0:{}', '132', '', '', '1', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%', 'a:2:{i:3;a:1:{s:37:"taxonomy_vocabulary_machine_name_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:24:"field_ui_field_edit_form";i:1;i:5;}', '', '58', 6, '0', '', 'admin/structure/taxonomy/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', '', 'a:0:{}', '6', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/delete', 'a:2:{i:3;a:1:{s:37:"taxonomy_vocabulary_machine_name_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:26:"field_ui_field_delete_form";i:1;i:5;}', '', '117', 7, '1', 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Delete', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/edit', 'a:2:{i:3;a:1:{s:37:"taxonomy_vocabulary_machine_name_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:24:"field_ui_field_edit_form";i:1;i:5;}', '', '117', 7, '1', 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Edit', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/field-settings', 'a:2:{i:3;a:1:{s:37:"taxonomy_vocabulary_machine_name_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:28:"field_ui_field_settings_form";i:1;i:5;}', '', '117', 7, '1', 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Field settings', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/widget-type', 'a:2:{i:3;a:1:{s:37:"taxonomy_vocabulary_machine_name_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}i:5;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:13:"taxonomy_term";i:1;i:3;i:2;s:1:"3";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:25:"field_ui_widget_type_form";i:1;i:5;}', '', '117', 7, '1', 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Widget type', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/list', 'a:1:{i:3;s:37:"taxonomy_vocabulary_machine_name_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', '', '29', 5, '1', 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'List', 't', '', '', 'a:0:{}', '140', '', '', '-20', 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/add', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', '', '15', 4, '1', 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Add vocabulary', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', '', '15', 4, '1', 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'List', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', '', '7', 3, '0', '', 'admin/structure/types', 'Content types', 't', '', '', 'a:0:{}', '6', 'Manage content types, including default status, front page promotion, comment settings, etc.', '', '0', 'modules/node/content_types.inc'),
('admin/structure/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', '', '15', 4, '1', 'admin/structure/types', 'admin/structure/types', 'Add content type', 't', '', '', 'a:0:{}', '388', '', '', '0', 'modules/node/content_types.inc'),
('admin/structure/types/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', '', '15', 4, '1', 'admin/structure/types', 'admin/structure/types', 'List', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/node/content_types.inc'),
('admin/structure/types/manage/%', 'a:1:{i:4;s:14:"node_type_load";}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;i:4;}', '', '30', 5, '0', '', 'admin/structure/types/manage/%', 'Edit content type', 'node_type_page_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', '6', '', '', '0', 'modules/node/content_types.inc'),
('admin/structure/types/manage/%/delete', 'a:1:{i:4;s:14:"node_type_load";}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;i:4;}', '', '61', 6, '0', '', 'admin/structure/types/manage/%/delete', 'Delete', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/node/content_types.inc'),
('admin/structure/types/manage/%/display', 'a:1:{i:4;s:14:"node_type_load";}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"node";i:2;i:4;i:3;s:7:"default";}', '', '61', 6, '1', 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage display', 't', '', '', 'a:0:{}', '132', '', '', '2', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/default', 'a:1:{i:4;s:14:"node_type_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"node";i:1;i:4;i:2;s:7:"default";i:3;s:11:"user_access";i:4;s:24:"administer content types";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"node";i:2;i:4;i:3;s:7:"default";}', '', '123', 7, '1', 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Default', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES
('admin/structure/types/manage/%/display/full', 'a:1:{i:4;s:14:"node_type_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"node";i:1;i:4;i:2;s:4:"full";i:3;s:11:"user_access";i:4;s:24:"administer content types";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"node";i:2;i:4;i:3;s:4:"full";}', '', '123', 7, '1', 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Full content', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/rss', 'a:1:{i:4;s:14:"node_type_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"node";i:1;i:4;i:2;s:3:"rss";i:3;s:11:"user_access";i:4;s:24:"administer content types";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"node";i:2;i:4;i:3;s:3:"rss";}', '', '123', 7, '1', 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'RSS', 't', '', '', 'a:0:{}', '132', '', '', '2', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/teaser', 'a:1:{i:4;s:14:"node_type_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"node";i:1;i:4;i:2;s:6:"teaser";i:3;s:11:"user_access";i:4;s:24:"administer content types";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"node";i:2;i:4;i:3;s:6:"teaser";}', '', '123', 7, '1', 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Teaser', 't', '', '', 'a:0:{}', '132', '', '', '1', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/token', 'a:1:{i:4;s:14:"node_type_load";}', '', '_field_ui_view_mode_menu_access', 'a:5:{i:0;s:4:"node";i:1;i:4;i:2;s:5:"token";i:3;s:11:"user_access";i:4;s:24:"administer content types";}', 'drupal_get_form', 'a:4:{i:0;s:30:"field_ui_display_overview_form";i:1;s:4:"node";i:2;i:4;i:3;s:5:"token";}', '', '123', 7, '1', 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Tokens', 't', '', '', 'a:0:{}', '132', '', '', '3', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/edit', 'a:1:{i:4;s:14:"node_type_load";}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;i:4;}', '', '61', 6, '1', 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/node/content_types.inc'),
('admin/structure/types/manage/%/fields', 'a:1:{i:4;s:14:"node_type_load";}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:28:"field_ui_field_overview_form";i:1;s:4:"node";i:2;i:4;}', '', '61', 6, '1', 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage fields', 't', '', '', 'a:0:{}', '132', '', '', '1', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%', 'a:2:{i:4;a:1:{s:14:"node_type_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}i:6;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"field_ui_field_edit_form";i:1;i:6;}', '', '122', 7, '0', '', 'admin/structure/types/manage/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:6;}', '', 'a:0:{}', '6', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%/delete', 'a:2:{i:4;a:1:{s:14:"node_type_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}i:6;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:26:"field_ui_field_delete_form";i:1;i:6;}', '', '245', 8, '1', 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Delete', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%/edit', 'a:2:{i:4;a:1:{s:14:"node_type_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}i:6;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"field_ui_field_edit_form";i:1;i:6;}', '', '245', 8, '1', 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Edit', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%/field-settings', 'a:2:{i:4;a:1:{s:14:"node_type_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}i:6;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:28:"field_ui_field_settings_form";i:1;i:6;}', '', '245', 8, '1', 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Field settings', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%/widget-type', 'a:2:{i:4;a:1:{s:14:"node_type_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}i:6;a:1:{s:18:"field_ui_menu_load";a:4:{i:0;s:4:"node";i:1;i:4;i:2;s:1:"4";i:3;s:4:"%map";}}}', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:25:"field_ui_widget_type_form";i:1;i:6;}', '', '245', 8, '1', 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Widget type', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/views', '', '', 'ctools_export_ui_task_access', 'a:2:{i:0;s:8:"views_ui";i:1;s:4:"list";}', 'ctools_export_ui_switcher_page', 'a:2:{i:0;s:8:"views_ui";i:1;s:4:"list";}', '', '7', 3, '0', '', 'admin/structure/views', 'Views', 't', '', '', 'a:0:{}', '6', 'Manage customized lists of content.', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/add', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_page', 'a:0:{}', '', '15', 4, '1', 'admin/structure/views', 'admin/structure/views', 'Add new view', 't', '', '', 'a:0:{}', '388', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/add-template', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_template_page', 'a:0:{}', '', '15', 4, '0', '', 'admin/structure/views/add-template', 'Add view from template', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/ajax/%/%', 'a:2:{i:4;N;i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_ajax_form', 'a:3:{i:0;b:1;i:1;i:4;i:2;i:5;}', 'ajax_deliver', '60', 6, '0', '', 'admin/structure/views/ajax/%/%', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/ajax/preview/%/%', 'a:2:{i:5;s:19:"views_ui_cache_load";i:6;N;}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_preview', 'a:2:{i:0;i:5;i:1;i:6;}', 'ajax_deliver', '124', 7, '0', '', 'admin/structure/views/ajax/preview/%/%', '', 't', '', '', 'a:0:{}', '6', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/import', '', '', 'views_import_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_import_page";}', '', '15', 4, '1', 'admin/structure/views', 'admin/structure/views', 'Import', 't', '', '', 'a:0:{}', '388', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/list', '', '', 'ctools_export_ui_task_access', 'a:2:{i:0;s:8:"views_ui";i:1;s:4:"list";}', 'ctools_export_ui_switcher_page', 'a:2:{i:0;s:8:"views_ui";i:1;s:4:"list";}', '', '15', 4, '1', 'admin/structure/views', 'admin/structure/views', 'List', 't', '', '', 'a:0:{}', '140', '', '', '-10', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/nojs/%/%', 'a:2:{i:4;N;i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_ajax_form', 'a:3:{i:0;b:0;i:1;i:4;i:2;i:5;}', '', '60', 6, '0', '', 'admin/structure/views/nojs/%/%', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/nojs/preview/%/%', 'a:2:{i:5;s:19:"views_ui_cache_load";i:6;N;}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_preview', 'a:2:{i:0;i:5;i:1;i:6;}', '', '124', 7, '0', '', 'admin/structure/views/nojs/preview/%/%', '', 't', '', '', 'a:0:{}', '6', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:29:"views_ui_admin_settings_basic";}', '', '15', 4, '1', 'admin/structure/views', 'admin/structure/views', 'Settings', 't', '', '', 'a:0:{}', '132', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/settings/advanced', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:32:"views_ui_admin_settings_advanced";}', '', '31', 5, '1', 'admin/structure/views/settings', 'admin/structure/views', 'Advanced', 't', '', '', 'a:0:{}', '132', '', '', '1', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/settings/basic', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:29:"views_ui_admin_settings_basic";}', '', '31', 5, '1', 'admin/structure/views/settings', 'admin/structure/views', 'Basic', 't', '', '', 'a:0:{}', '140', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/template/%/add', 'a:1:{i:4;N;}', '', 'ctools_export_ui_task_access', 'a:3:{i:0;s:8:"views_ui";i:1;s:12:"add_template";i:2;i:4;}', 'ctools_export_ui_switcher_page', 'a:3:{i:0;s:8:"views_ui";i:1;s:12:"add_template";i:2;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/template/%/add', 'Add from template', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_page', 'a:1:{i:0;i:4;}', '', '30', 5, '0', '', 'admin/structure/views/view/%', '', 'views_ui_edit_page_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', '6', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/view/%/break-lock', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:27:"views_ui_break_lock_confirm";i:1;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/view/%/break-lock', 'Break lock', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/view/%/clone', 'a:1:{i:4;a:1:{s:21:"ctools_export_ui_load";a:1:{i:0;s:8:"views_ui";}}}', '', 'ctools_export_ui_task_access', 'a:3:{i:0;s:8:"views_ui";i:1;s:5:"clone";i:2;i:4;}', 'ctools_export_ui_switcher_page', 'a:3:{i:0;s:8:"views_ui";i:1;s:5:"clone";i:2;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/view/%/clone', 'Clone', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/delete', 'a:1:{i:4;a:1:{s:21:"ctools_export_ui_load";a:1:{i:0;s:8:"views_ui";}}}', '', 'ctools_export_ui_task_access', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"delete";i:2;i:4;}', 'ctools_export_ui_switcher_page', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"delete";i:2;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/view/%/delete', 'Delete', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/disable', 'a:1:{i:4;a:1:{s:21:"ctools_export_ui_load";a:1:{i:0;s:8:"views_ui";}}}', '', 'ctools_export_ui_task_access', 'a:3:{i:0;s:8:"views_ui";i:1;s:7:"disable";i:2;i:4;}', 'ctools_export_ui_switcher_page', 'a:3:{i:0;s:8:"views_ui";i:1;s:7:"disable";i:2;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/view/%/disable', 'Disable', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/edit', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_page', 'a:1:{i:0;i:4;}', '', '61', 6, '3', 'admin/structure/views/view/%', 'admin/structure/views/view/%', 'Edit view', 't', '', 'ajax_base_page_theme', 'a:0:{}', '140', '', '', '-10', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/view/%/edit/%/ajax', 'a:2:{i:4;s:19:"views_ui_cache_load";i:6;N;}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_ajax_get_form', 'a:3:{i:0;s:18:"views_ui_edit_form";i:1;i:4;i:2;i:6;}', 'ajax_deliver', '245', 8, '0', '', 'admin/structure/views/view/%/edit/%/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/view/%/enable', 'a:1:{i:4;a:1:{s:21:"ctools_export_ui_load";a:1:{i:0;s:8:"views_ui";}}}', '', 'ctools_export_ui_task_access', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"enable";i:2;i:4;}', 'ctools_export_ui_switcher_page', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"enable";i:2;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/view/%/enable', 'Enable', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/export', 'a:1:{i:4;a:1:{s:21:"ctools_export_ui_load";a:1:{i:0;s:8:"views_ui";}}}', '', 'ctools_export_ui_task_access', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"export";i:2;i:4;}', 'ctools_export_ui_switcher_page', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"export";i:2;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/view/%/export', 'Export', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/preview/%', 'a:2:{i:4;s:19:"views_ui_cache_load";i:6;N;}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_build_preview', 'a:2:{i:0;i:4;i:1;i:6;}', '', '122', 7, '3', '', 'admin/structure/views/view/%/preview/%', '', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/view/%/preview/%/ajax', 'a:2:{i:4;s:19:"views_ui_cache_load";i:6;N;}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_build_preview', 'a:2:{i:0;i:4;i:1;i:6;}', 'ajax_deliver', '245', 8, '0', '', 'admin/structure/views/view/%/preview/%/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/structure/views/view/%/revert', 'a:1:{i:4;a:1:{s:21:"ctools_export_ui_load";a:1:{i:0;s:8:"views_ui";}}}', '', 'ctools_export_ui_task_access', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"revert";i:2;i:4;}', 'ctools_export_ui_switcher_page', 'a:3:{i:0;s:8:"views_ui";i:1;s:6:"delete";i:2;i:4;}', '', '61', 6, '0', '', 'admin/structure/views/view/%/revert', 'Revert', 't', '', '', 'a:0:{}', '4', '', '', '0', 'sites/all/modules/contrib/ctools/includes/export-ui.inc'),
('admin/tasks', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', '', '3', 2, '1', 'admin', 'admin', 'Tasks', 't', '', '', 'a:0:{}', '140', '', '', '-20', 'modules/system/system.admin.inc'),
('admin/update/ready', '', '', 'update_manager_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:32:"update_manager_update_ready_form";}', '', '7', 3, '0', '', 'admin/update/ready', 'Ready to update', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/update/update.manager.inc'),
('admin/views/ajax/autocomplete/tag', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_autocomplete_tag', 'a:0:{}', '', '31', 5, '0', '', 'admin/views/ajax/autocomplete/tag', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/views/includes/admin.inc'),
('admin/views/ajax/autocomplete/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'views_ajax_autocomplete_taxonomy', 'a:0:{}', '', '31', 5, '0', '', 'admin/views/ajax/autocomplete/taxonomy', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/views/includes/ajax.inc'),
('admin/views/ajax/autocomplete/user', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'views_ajax_autocomplete_user', 'a:0:{}', '', '31', 5, '0', '', 'admin/views/ajax/autocomplete/user', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/views/includes/ajax.inc'),
('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', '', '1', 1, '0', '', 'batch', '', 't', '', '_system_batch_theme', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('comment/%comment/devel', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;s:7:"comment";i:1;i:1;}', '', '7', 3, '1', '', 'comment/%comment/devel', 'Devel', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('comment/%comment/devel/load', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;s:7:"comment";i:1;i:1;}', '', '15', 4, '1', 'comment/%comment/devel', 'comment/%comment/devel/load', 'Load', 't', '', '', 'a:0:{}', '140', '', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('comment/%comment/devel/render', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_render_object', 'a:2:{i:0;s:7:"comment";i:1;i:1;}', '', '15', 4, '1', 'comment/%comment/devel', 'comment/%comment/devel/render', 'Render', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('comment/%comment/devel/token', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'token_devel_token_object', 'a:2:{i:0;s:7:"comment";i:1;i:1;}', '', '15', 4, '1', 'comment/%comment/devel', 'comment/%comment/devel/token', 'Tokens', 't', '', '', 'a:0:{}', '132', '', '', '5', 'sites/all/modules/contrib/token/token.pages.inc'),
('ctools/autocomplete/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'ctools_content_autocomplete_entity', 'a:1:{i:0;i:2;}', '', '6', 3, '0', '', 'ctools/autocomplete/%', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/content.menu.inc'),
('ctools/context/ajax/access/add', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'ctools_access_ajax_add', 'a:0:{}', '', '31', 5, '0', '', 'ctools/context/ajax/access/add', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/context-access-admin.inc'),
('ctools/context/ajax/access/configure', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'ctools_access_ajax_edit', 'a:0:{}', '', '31', 5, '0', '', 'ctools/context/ajax/access/configure', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/context-access-admin.inc'),
('ctools/context/ajax/access/delete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'ctools_access_ajax_delete', 'a:0:{}', '', '31', 5, '0', '', 'ctools/context/ajax/access/delete', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/context-access-admin.inc'),
('ctools/context/ajax/add', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'ctools_context_ajax_item_add', 'a:0:{}', '', '15', 4, '0', '', 'ctools/context/ajax/add', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/context-admin.inc'),
('ctools/context/ajax/configure', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'ctools_context_ajax_item_edit', 'a:0:{}', '', '15', 4, '0', '', 'ctools/context/ajax/configure', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/context-admin.inc'),
('ctools/context/ajax/delete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'ctools_context_ajax_item_delete', 'a:0:{}', '', '15', 4, '0', '', 'ctools/context/ajax/delete', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/ctools/includes/context-admin.inc'),
('demo/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'demo_autocomplete', 'a:0:{}', '', '3', 2, '0', '', 'demo/autocomplete', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('demo/download', '', '', 'user_access', 'a:1:{i:0;s:24:"administer demo settings";}', 'demo_download', 'a:0:{}', '', '3', 2, '0', '', 'demo/download', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/demo/demo.admin.inc'),
('devel/arguments', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_querylog_arguments', 'a:0:{}', '', '3', 2, '0', '', 'devel/arguments', 'Arguments query', 't', '', '', 'a:0:{}', '0', 'Return a given query, with arguments instead of placeholders. Used by query log', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/cache/clear', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_cache_clear', 'a:0:{}', '', '7', 3, '0', '', 'devel/cache/clear', 'Empty cache', 't', '', '', 'a:0:{}', '6', 'Clear the CSS cache and all database cache tables which store page, node, theme and variable caches.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/elements', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_elements_page', 'a:0:{}', '', '3', 2, '0', '', 'devel/elements', 'Hook_elements()', 't', '', '', 'a:0:{}', '6', 'View the active form/render elements for this site.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/entity/info', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_entity_info_page', 'a:0:{}', '', '7', 3, '0', '', 'devel/entity/info', 'Entity info', 't', '', '', 'a:0:{}', '6', 'View entity information across the whole site.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/explain', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_querylog_explain', 'a:0:{}', '', '3', 2, '0', '', 'devel/explain', 'Explain query', 't', '', '', 'a:0:{}', '0', 'Run an EXPLAIN on a given query. Used by query log', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/field/info', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_field_info_page', 'a:0:{}', '', '7', 3, '0', '', 'devel/field/info', 'Field info', 't', '', '', 'a:0:{}', '6', 'View fields information across the whole site.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/menu/item', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_menu_item', 'a:0:{}', '', '7', 3, '0', '', 'devel/menu/item', 'Menu item', 't', '', '', 'a:0:{}', '6', 'Details about a given menu item.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/menu/reset', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'drupal_get_form', 'a:1:{i:0;s:18:"devel_menu_rebuild";}', '', '7', 3, '0', '', 'devel/menu/reset', 'Rebuild menus', 't', '', '', 'a:0:{}', '6', 'Rebuild menu based on hook_menu() and revert any custom changes. All menu items return to their default settings.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/php', '', '', 'user_access', 'a:1:{i:0;s:16:"execute php code";}', 'drupal_get_form', 'a:1:{i:0;s:18:"devel_execute_form";}', '', '3', 2, '0', '', 'devel/php', 'Execute PHP Code', 't', '', '', 'a:0:{}', '6', 'Execute some PHP code', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/phpinfo', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_phpinfo', 'a:0:{}', '', '3', 2, '0', '', 'devel/phpinfo', 'PHPinfo()', 't', '', '', 'a:0:{}', '6', 'View your server''s PHP configuration', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/reference', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_function_reference', 'a:0:{}', '', '3', 2, '0', '', 'devel/reference', 'Function reference', 't', '', '', 'a:0:{}', '6', 'View a list of currently defined user functions with documentation links.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/reinstall', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'drupal_get_form', 'a:1:{i:0;s:15:"devel_reinstall";}', '', '3', 2, '0', '', 'devel/reinstall', 'Reinstall modules', 't', '', '', 'a:0:{}', '6', 'Run hook_uninstall() and then hook_install() for a given module.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', '', '3', 2, '0', '', 'devel/run-cron', 'Run cron', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/system/system.admin.inc'),
('devel/session', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_session', 'a:0:{}', '', '3', 2, '0', '', 'devel/session', 'Session viewer', 't', '', '', 'a:0:{}', '6', 'List the contents of $_SESSION.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"devel_admin_settings";}', '', '3', 2, '0', '', 'devel/settings', 'Devel settings', 't', '', '', 'a:0:{}', '6', 'Helper functions, pages, and blocks to assist Drupal developers. The devel blocks can be managed via the <a href="/admin/structure/block">block administration</a> page.', '', '0', 'sites/all/modules/contrib/devel/devel.admin.inc'),
('devel/switch', '', '', 'user_access', 'a:1:{i:0;s:12:"switch users";}', 'devel_switch_user', 'a:0:{}', '', '3', 2, '0', '', 'devel/switch', 'Switch user', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/theme/registry', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_theme_registry', 'a:0:{}', '', '7', 3, '0', '', 'devel/theme/registry', 'Theme registry', 't', '', '', 'a:0:{}', '6', 'View a list of available theme functions across the whole site.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/variable', '', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_variable_page', 'a:0:{}', '', '3', 2, '0', '', 'devel/variable', 'Variable editor', 't', '', '', 'a:0:{}', '6', 'Edit and delete site variables.', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('devel/variable/edit/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'drupal_get_form', 'a:2:{i:0;s:19:"devel_variable_edit";i:1;i:3;}', '', '14', 4, '0', '', 'devel/variable/edit/%', 'Variable editor', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('features/autocomplete/packages', '', '', 'user_access', 'a:1:{i:0;s:15:"manage features";}', 'features_autocomplete_packages', 'a:0:{}', '', '7', 3, '0', '', 'features/autocomplete/packages', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/features/features.admin.inc'),
('file/ajax', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'file_ajax_upload', 'a:0:{}', 'ajax_deliver', '3', 2, '0', '', 'file/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', ''),
('file/progress', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'file_ajax_progress', 'a:0:{}', '', '3', 2, '0', '', 'file/progress', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', ''),
('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', '', '3', 2, '0', '', 'filter/tips', 'Compose tips', 't', '', '', 'a:0:{}', '20', '', '', '0', 'modules/filter/filter.pages.inc'),
('node', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_page_default', 'a:0:{}', '', '1', 1, '0', '', 'node', '', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', '', '2', 2, '0', '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', '', 'a:0:{}', '6', '', '', '0', ''),
('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', '', '5', 3, '2', 'node/%', 'node/%', 'Delete', 't', '', '', 'a:0:{}', '132', '', '', '1', 'modules/node/node.pages.inc'),
('node/%/devel', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;s:4:"node";i:1;i:1;}', '', '5', 3, '1', 'node/%', 'node/%', 'Devel', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('node/%/devel/load', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;s:4:"node";i:1;i:1;}', '', '11', 4, '1', 'node/%/devel', 'node/%', 'Load', 't', '', '', 'a:0:{}', '140', '', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('node/%/devel/render', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_render_object', 'a:2:{i:0;s:4:"node";i:1;i:1;}', '', '11', 4, '1', 'node/%/devel', 'node/%', 'Render', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('node/%/devel/token', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'token_devel_token_object', 'a:2:{i:0;s:4:"node";i:1;i:1;}', '', '11', 4, '1', 'node/%/devel', 'node/%', 'Tokens', 't', '', '', 'a:0:{}', '132', '', '', '5', 'sites/all/modules/contrib/token/token.pages.inc'),
('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', '', '5', 3, '3', 'node/%', 'node/%', 'Edit', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/node/node.pages.inc'),
('node/%/revisions', 'a:1:{i:1;s:9:"node_load";}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_revision_overview', 'a:1:{i:0;i:1;}', '', '5', 3, '1', 'node/%', 'node/%', 'Revisions', 't', '', '', 'a:0:{}', '132', '', '', '2', 'modules/node/node.pages.inc'),
('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', '', '21', 5, '0', '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/node/node.pages.inc'),
('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', '', '21', 5, '0', '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/node/node.pages.inc'),
('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:2:{i:0;i:1;i:1;b:1;}', '', '21', 5, '0', '', 'node/%/revisions/%/view', 'Revisions', 't', '', '', 'a:0:{}', '6', '', '', '0', ''),
('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', '', '5', 3, '1', 'node/%', 'node/%', 'View', 't', '', '', 'a:0:{}', '140', '', '', '-10', ''),
('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', '', '3', 2, '0', '', 'node/add', 'Add content', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/node/node.pages.inc'),
('node/add/page', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"page";}', 'node_add', 'a:1:{i:0;s:4:"page";}', '', '7', 3, '0', '', 'node/add/page', 'Basic page', 'check_plain', '', '', 'a:0:{}', '6', 'Use <em>basic pages</em> for your static content, such as an ''About us'' page.', '', '0', 'modules/node/node.pages.inc'),
('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', '', '1', 1, '0', '', 'rss.xml', 'RSS feed', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('sites/default/files/styles/%', 'a:1:{i:4;s:16:"image_style_load";}', '', '1', 'a:0:{}', 'image_style_deliver', 'a:1:{i:0;i:4;}', '', '30', 5, '0', '', 'sites/default/files/styles/%', 'Generate image style', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('system/ajax', '', '', '1', 'a:0:{}', 'ajax_form_callback', 'a:0:{}', 'ajax_deliver', '3', 2, '0', '', 'system/ajax', 'AHAH callback', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', '', '', '0', 'includes/form.inc'),
('system/files', '', '', '1', 'a:0:{}', 'file_download', 'a:1:{i:0;s:7:"private";}', '', '3', 2, '0', '', 'system/files', 'File download', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('system/files/styles/%', 'a:1:{i:3;s:16:"image_style_load";}', '', '1', 'a:0:{}', 'image_style_deliver', 'a:1:{i:0;i:3;}', '', '14', 4, '0', '', 'system/files/styles/%', 'Generate image style', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('system/temporary', '', '', '1', 'a:0:{}', 'file_download', 'a:1:{i:0;s:9:"temporary";}', '', '3', 2, '0', '', 'system/temporary', 'Temporary files', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('system/timezone', '', '', '1', 'a:0:{}', 'system_timezone', 'a:0:{}', '', '3', 2, '0', '', 'system/timezone', 'Time zone', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/system/system.admin.inc'),
('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', '', '3', 2, '0', '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/taxonomy/taxonomy.pages.inc'),
('taxonomy/term/%', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', '', '6', 3, '0', '', 'taxonomy/term/%', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', '', 'a:0:{}', '6', '', '', '0', 'modules/taxonomy/taxonomy.pages.inc'),
('taxonomy/term/%/devel', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:3:{i:0;s:13:"taxonomy_term";i:1;i:2;i:2;s:4:"term";}', '', '13', 4, '1', 'taxonomy/term/%', 'taxonomy/term/%', 'Devel', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('taxonomy/term/%/devel/load', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:3:{i:0;s:13:"taxonomy_term";i:1;i:2;i:2;s:4:"term";}', '', '27', 5, '1', 'taxonomy/term/%/devel', 'taxonomy/term/%', 'Load', 't', '', '', 'a:0:{}', '140', '', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('taxonomy/term/%/devel/render', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_render_object', 'a:3:{i:0;s:13:"taxonomy_term";i:1;i:2;i:2;s:4:"term";}', '', '27', 5, '1', 'taxonomy/term/%/devel', 'taxonomy/term/%', 'Render', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('taxonomy/term/%/devel/token', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'token_devel_token_object', 'a:2:{i:0;s:13:"taxonomy_term";i:1;i:2;}', '', '27', 5, '1', 'taxonomy/term/%/devel', 'taxonomy/term/%', 'Tokens', 't', '', '', 'a:0:{}', '132', '', '', '5', 'sites/all/modules/contrib/token/token.pages.inc'),
('taxonomy/term/%/edit', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'taxonomy_term_edit_access', 'a:1:{i:0;i:2;}', 'drupal_get_form', 'a:3:{i:0;s:18:"taxonomy_form_term";i:1;i:2;i:2;N;}', '', '13', 4, '1', 'taxonomy/term/%', 'taxonomy/term/%', 'Edit', 't', '', '', 'a:0:{}', '132', '', '', '10', 'modules/taxonomy/taxonomy.admin.inc'),
('taxonomy/term/%/feed', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_feed', 'a:1:{i:0;i:2;}', '', '13', 4, '0', '', 'taxonomy/term/%/feed', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', '', 'a:0:{}', '0', '', '', '0', 'modules/taxonomy/taxonomy.pages.inc'),
('taxonomy/term/%/view', 'a:1:{i:2;s:18:"taxonomy_term_load";}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', '', '13', 4, '1', 'taxonomy/term/%', 'taxonomy/term/%', 'View', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/taxonomy/taxonomy.pages.inc'),
('token/autocomplete/%', 'a:1:{i:2;s:15:"token_type_load";}', '', '1', 'a:0:{}', 'token_autocomplete_token', 'a:1:{i:0;i:2;}', '', '6', 3, '0', '', 'token/autocomplete/%', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/token/token.pages.inc'),
('token/flush-cache', '', '', 'user_access', 'a:1:{i:0;s:12:"flush caches";}', 'token_flush_cache_callback', 'a:0:{}', '', '3', 2, '0', '', 'token/flush-cache', '', 't', '', '', 'a:0:{}', '0', '', '', '0', 'sites/all/modules/contrib/token/token.pages.inc'),
('toolbar/toggle', '', '', 'user_access', 'a:1:{i:0;s:14:"access toolbar";}', 'toolbar_toggle_page', 'a:0:{}', '', '3', 2, '0', '', 'toolbar/toggle', 'Toggle drawer visibility', 't', '', '', 'a:0:{}', '0', '', '', '0', ''),
('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', '', '1', 1, '0', '', 'user', 'User account', 'user_menu_title', '', '', 'a:0:{}', '6', '', '', '-10', 'modules/user/user.pages.inc'),
('user/%', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view_page', 'a:1:{i:0;i:1;}', '', '2', 2, '0', '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', '', 'a:0:{}', '6', '', '', '0', ''),
('user/%/cancel', 'a:1:{i:1;s:9:"user_load";}', '', 'user_cancel_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:24:"user_cancel_confirm_form";i:1;i:1;}', '', '5', 3, '0', '', 'user/%/cancel', 'Cancel account', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/user/user.pages.inc'),
('user/%/cancel/confirm/%/%', 'a:3:{i:1;s:9:"user_load";i:4;N;i:5;N;}', '', 'user_cancel_access', 'a:1:{i:0;i:1;}', 'user_cancel_confirm', 'a:3:{i:0;i:1;i:1;i:4;i:2;i:5;}', '', '44', 6, '0', '', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 't', '', '', 'a:0:{}', '6', '', '', '0', 'modules/user/user.pages.inc'),
('user/%/devel', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;s:4:"user";i:1;i:1;}', '', '5', 3, '1', 'user/%', 'user/%', 'Devel', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('user/%/devel/load', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_load_object', 'a:2:{i:0;s:4:"user";i:1;i:1;}', '', '11', 4, '1', 'user/%/devel', 'user/%', 'Load', 't', '', '', 'a:0:{}', '140', '', '', '0', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('user/%/devel/render', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'devel_render_object', 'a:2:{i:0;s:4:"user";i:1;i:1;}', '', '11', 4, '1', 'user/%/devel', 'user/%', 'Render', 't', '', '', 'a:0:{}', '132', '', '', '100', 'sites/all/modules/contrib/devel/devel.pages.inc'),
('user/%/devel/token', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:24:"access devel information";}', 'token_devel_token_object', 'a:2:{i:0;s:4:"user";i:1;i:1;}', '', '11', 4, '1', 'user/%/devel', 'user/%', 'Tokens', 't', '', '', 'a:0:{}', '132', '', '', '5', 'sites/all/modules/contrib/token/token.pages.inc'),
('user/%/edit', 'a:1:{i:1;s:9:"user_load";}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:17:"user_profile_form";i:1;i:1;}', '', '5', 3, '1', 'user/%', 'user/%', 'Edit', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/user/user.pages.inc'),
('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:17:"user_profile_form";i:1;i:1;}', '', '11', 4, '1', 'user/%/edit', 'user/%', 'Account', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/user/user.pages.inc'),
('user/%/shortcuts', 'a:1:{i:1;s:9:"user_load";}', '', 'shortcut_set_switch_access', 'a:1:{i:0;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"shortcut_set_switch";i:1;i:1;}', '', '5', 3, '1', 'user/%', 'user/%', 'Shortcuts', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/shortcut/shortcut.admin.inc'),
('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view_page', 'a:1:{i:0;i:1;}', '', '5', 3, '1', 'user/%', 'user/%', 'View', 't', '', '', 'a:0:{}', '140', '', '', '-10', ''),
('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', '', '3', 2, '0', '', 'user/autocomplete', 'User autocomplete', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/user/user.pages.inc'),
('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', '', '3', 2, '1', 'user', 'user', 'Log in', 't', '', '', 'a:0:{}', '140', '', '', '0', 'modules/user/user.pages.inc'),
('user/logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', '', '3', 2, '0', '', 'user/logout', 'Log out', 't', '', '', 'a:0:{}', '6', '', '', '10', 'modules/user/user.pages.inc'),
('user/password', '', '', '1', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', '', '3', 2, '1', 'user', 'user', 'Request new password', 't', '', '', 'a:0:{}', '132', '', '', '0', 'modules/user/user.pages.inc'),
('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:18:"user_register_form";}', '', '3', 2, '1', 'user', 'user', 'Create new account', 't', '', '', 'a:0:{}', '132', '', '', '0', ''),
('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', '', '24', 5, '0', '', 'user/reset/%/%/%', 'Reset password', 't', '', '', 'a:0:{}', '0', '', '', '0', 'modules/user/user.pages.inc'),
('views/ajax', '', '', '1', 'a:0:{}', 'views_ajax', 'a:0:{}', 'ajax_deliver', '3', 2, '0', '', 'views/ajax', 'Views', 't', '', 'ajax_base_page_theme', 'a:0:{}', '0', 'Ajax callback for view loading.', '', '0', 'sites/all/modules/contrib/views/includes/ajax.inc');
/*!40000 ALTER TABLE menu_router ENABLE KEYS */;

--
-- Table structure for table 'node'
--

CREATE TABLE IF NOT EXISTS `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `vid` int(10) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='The base table for nodes.';

--
-- Dumping data for table 'node'
--

/*!40000 ALTER TABLE node DISABLE KEYS */;
INSERT INTO `node` VALUES
('1', '1', 'page', 'und', 'Introduction', '1', '1', '1335372429', '1335373213', '0', '0', '0', '0', '0');
/*!40000 ALTER TABLE node ENABLE KEYS */;

--
-- Table structure for table 'node_access'
--

CREATE TABLE IF NOT EXISTS `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` varchar(255) NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Identifies which realm/grant pairs a user must possess in...';

--
-- Dumping data for table 'node_access'
--

/*!40000 ALTER TABLE node_access DISABLE KEYS */;
INSERT INTO `node_access` VALUES
('0', '0', 'all', '1', '0', '0');
/*!40000 ALTER TABLE node_access ENABLE KEYS */;

--
-- Table structure for table 'node_comment_statistics'
--

CREATE TABLE IF NOT EXISTS `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maintains statistics of node and comments posts to show ...';

--
-- Dumping data for table 'node_comment_statistics'
--

/*!40000 ALTER TABLE node_comment_statistics DISABLE KEYS */;
/*!40000 ALTER TABLE node_comment_statistics ENABLE KEYS */;

--
-- Table structure for table 'node_revision'
--

CREATE TABLE IF NOT EXISTS `node_revision` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores information about each saved version of a node.';

--
-- Dumping data for table 'node_revision'
--

/*!40000 ALTER TABLE node_revision DISABLE KEYS */;
INSERT INTO `node_revision` VALUES
('1', '1', '1', 'Introduction', '', '1335373213', '1', '0', '0', '0');
/*!40000 ALTER TABLE node_revision ENABLE KEYS */;

--
-- Table structure for table 'node_type'
--

CREATE TABLE IF NOT EXISTS `node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` varchar(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `help` mediumtext NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` tinyint(3) unsigned NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores information about all defined node types.';

--
-- Dumping data for table 'node_type'
--

/*!40000 ALTER TABLE node_type DISABLE KEYS */;
INSERT INTO `node_type` VALUES
('page', 'Basic page', 'node_content', 'node', 'Use <em>basic pages</em> for your static content, such as an ''About us'' page.', '', '1', 'Title', '1', '1', '0', '0', 'page');
/*!40000 ALTER TABLE node_type ENABLE KEYS */;

--
-- Table structure for table 'page_manager_handlers'
--

CREATE TABLE IF NOT EXISTS `page_manager_handlers` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `task` varchar(64) DEFAULT NULL COMMENT 'ID of the task this handler is for.',
  `subtask` varchar(64) NOT NULL DEFAULT '' COMMENT 'ID of the subtask this handler is for.',
  `handler` varchar(64) DEFAULT NULL COMMENT 'ID of the task handler being used.',
  `weight` int(11) DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.',
  `conf` longtext NOT NULL COMMENT 'Serialized configuration of the handler, if needed.',
  PRIMARY KEY (`did`),
  UNIQUE KEY `name` (`name`),
  KEY `fulltask` (`task`,`subtask`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table 'page_manager_handlers'
--

/*!40000 ALTER TABLE page_manager_handlers DISABLE KEYS */;
/*!40000 ALTER TABLE page_manager_handlers ENABLE KEYS */;

--
-- Table structure for table 'page_manager_pages'
--

CREATE TABLE IF NOT EXISTS `page_manager_pages` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this subtask. Used to identify it programmatically.',
  `task` varchar(64) DEFAULT 'page' COMMENT 'What type of page this is, so that we can use the same mechanism for creating tighter UIs for targeted pages.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Human readable title for this page subtask.',
  `admin_description` longtext COMMENT 'Administrative description of this item.',
  `path` varchar(255) DEFAULT NULL COMMENT 'The menu path that will invoke this task.',
  `access` longtext NOT NULL COMMENT 'Access configuration for this path.',
  `menu` longtext NOT NULL COMMENT 'Serialized configuration of Drupal menu visibility settings for this item.',
  `arguments` longtext NOT NULL COMMENT 'Configuration of arguments for this menu item.',
  `conf` longtext NOT NULL COMMENT 'Serialized configuration of the page, if needed.',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `name` (`name`),
  KEY `task` (`task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Contains page subtasks for implementing pages with...';

--
-- Dumping data for table 'page_manager_pages'
--

/*!40000 ALTER TABLE page_manager_pages DISABLE KEYS */;
/*!40000 ALTER TABLE page_manager_pages ENABLE KEYS */;

--
-- Table structure for table 'page_manager_weights'
--

CREATE TABLE IF NOT EXISTS `page_manager_weights` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `weight` int(11) DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.',
  PRIMARY KEY (`name`),
  KEY `weights` (`name`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Contains override weights for page_manager handlers that...';

--
-- Dumping data for table 'page_manager_weights'
--

/*!40000 ALTER TABLE page_manager_weights DISABLE KEYS */;
/*!40000 ALTER TABLE page_manager_weights ENABLE KEYS */;

--
-- Table structure for table 'queue'
--

CREATE TABLE IF NOT EXISTS `queue` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY (`item_id`),
  KEY `name_created` (`name`,`created`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores items in queues.';

--
-- Dumping data for table 'queue'
--

/*!40000 ALTER TABLE queue DISABLE KEYS */;
INSERT INTO `queue` VALUES
('75', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"drupal";s:4:"info";a:6:{s:4:"name";s:5:"Block";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.12";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1328134560";s:16:"_info_file_ctime";i:1335368882;}s:9:"datestamp";s:10:"1328134560";s:8:"includes";a:26:{s:5:"block";s:5:"Block";s:10:"contextual";s:16:"Contextual links";s:5:"dblog";s:16:"Database logging";s:5:"field";s:5:"Field";s:17:"field_sql_storage";s:17:"Field SQL storage";s:8:"field_ui";s:8:"Field UI";s:4:"file";s:4:"File";s:6:"filter";s:6:"Filter";s:4:"help";s:4:"Help";s:5:"image";s:5:"Image";s:4:"list";s:4:"List";s:4:"menu";s:4:"Menu";s:4:"node";s:4:"Node";s:6:"number";s:6:"Number";s:7:"options";s:7:"Options";s:4:"path";s:4:"Path";s:3:"rdf";s:3:"RDF";s:8:"shortcut";s:8:"Shortcut";s:6:"system";s:6:"System";s:8:"taxonomy";s:8:"Taxonomy";s:4:"text";s:4:"Text";s:7:"toolbar";s:7:"Toolbar";s:6:"update";s:14:"Update manager";s:4:"user";s:4:"User";s:6:"bartik";s:6:"Bartik";s:5:"seven";s:5:"Seven";}s:12:"project_type";s:4:"core";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('76', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"ctools";s:4:"info";a:6:{s:4:"name";s:11:"Chaos tools";s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:16:"_info_file_ctime";i:1335368823;}s:9:"datestamp";s:10:"1332962446";s:8:"includes";a:2:{s:6:"ctools";s:11:"Chaos tools";s:12:"page_manager";s:12:"Page manager";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('77', 'update_fetch_tasks', 'a:8:{s:4:"name";s:4:"demo";s:4:"info";a:6:{s:4:"name";s:18:"Demonstration site";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1294543925";s:16:"_info_file_ctime";i:1335368831;}s:9:"datestamp";s:10:"1294543925";s:8:"includes";a:1:{s:4:"demo";s:18:"Demonstration site";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('78', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"devel";s:4:"info";a:6:{s:4:"name";s:5:"Devel";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:16:"_info_file_ctime";i:1335368831;}s:9:"datestamp";s:10:"1311355316";s:8:"includes";a:1:{s:5:"devel";s:5:"Devel";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('79', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"entity";s:4:"info";a:6:{s:4:"name";s:10:"Entity API";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1335099086";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335368835;}s:9:"datestamp";s:10:"1335099086";s:8:"includes";a:2:{s:6:"entity";s:10:"Entity API";s:12:"entity_token";s:13:"Entity tokens";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('80', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"features";s:4:"info";a:6:{s:4:"name";s:8:"Features";s:7:"package";s:8:"Features";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1334345807";s:16:"_info_file_ctime";i:1335368838;}s:9:"datestamp";s:10:"1334345807";s:8:"includes";a:1:{s:8:"features";s:8:"Features";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('81', 'update_fetch_tasks', 'a:8:{s:4:"name";s:13:"module_filter";s:4:"info";a:6:{s:4:"name";s:13:"Module filter";s:7:"version";s:7:"7.x-1.6";s:7:"project";s:13:"module_filter";s:9:"datestamp";s:10:"1316105205";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335368842;}s:9:"datestamp";s:10:"1316105205";s:8:"includes";a:1:{s:13:"module_filter";s:13:"Module filter";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('82', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"pathauto";s:4:"info";a:6:{s:4:"name";s:8:"Pathauto";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1320072936";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335368847;}s:9:"datestamp";s:10:"1320072936";s:8:"includes";a:1:{s:8:"pathauto";s:8:"Pathauto";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('83', 'update_fetch_tasks', 'a:8:{s:4:"name";s:9:"strongarm";s:4:"info";a:6:{s:4:"name";s:9:"Strongarm";s:7:"version";s:11:"7.x-2.0-rc1";s:7:"project";s:9:"strongarm";s:9:"datestamp";s:10:"1332787846";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335368853;}s:9:"datestamp";s:10:"1332787846";s:8:"includes";a:1:{s:9:"strongarm";s:9:"Strongarm";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('84', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"token";s:4:"info";a:6:{s:4:"name";s:5:"Token";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1333672577";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335368856;}s:9:"datestamp";s:10:"1333672577";s:8:"includes";a:1:{s:5:"token";s:5:"Token";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('85', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"views";s:4:"info";a:6:{s:4:"name";s:5:"Views";s:7:"package";s:5:"Views";s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:16:"_info_file_ctime";i:1335368862;}s:9:"datestamp";s:10:"1329946249";s:8:"includes";a:2:{s:5:"views";s:5:"Views";s:8:"views_ui";s:8:"Views UI";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1335372841'),
('86', 'update_fetch_tasks', 'a:8:{s:4:"name";s:14:"backup_migrate";s:4:"info";a:6:{s:4:"name";s:18:"Backup and Migrate";s:7:"version";s:7:"7.x-2.2";s:7:"project";s:14:"backup_migrate";s:9:"datestamp";s:10:"1310528214";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1331958024;}s:9:"datestamp";s:10:"1310528214";s:8:"includes";a:1:{s:14:"backup_migrate";s:18:"Backup and Migrate";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('87', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"drupal";s:4:"info";a:6:{s:4:"name";s:5:"Block";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:16:"_info_file_ctime";i:1336107691;}s:9:"datestamp";s:10:"1335997555";s:8:"includes";a:26:{s:5:"block";s:5:"Block";s:10:"contextual";s:16:"Contextual links";s:5:"dblog";s:16:"Database logging";s:5:"field";s:5:"Field";s:17:"field_sql_storage";s:17:"Field SQL storage";s:8:"field_ui";s:8:"Field UI";s:4:"file";s:4:"File";s:6:"filter";s:6:"Filter";s:4:"help";s:4:"Help";s:5:"image";s:5:"Image";s:4:"list";s:4:"List";s:4:"menu";s:4:"Menu";s:4:"node";s:4:"Node";s:6:"number";s:6:"Number";s:7:"options";s:7:"Options";s:4:"path";s:4:"Path";s:3:"rdf";s:3:"RDF";s:8:"shortcut";s:8:"Shortcut";s:6:"system";s:6:"System";s:8:"taxonomy";s:8:"Taxonomy";s:4:"text";s:4:"Text";s:7:"toolbar";s:7:"Toolbar";s:6:"update";s:14:"Update manager";s:4:"user";s:4:"User";s:6:"bartik";s:6:"Bartik";s:5:"seven";s:5:"Seven";}s:12:"project_type";s:4:"core";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('88', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"ctools";s:4:"info";a:6:{s:4:"name";s:11:"Chaos tools";s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:16:"_info_file_ctime";i:1332475091;}s:9:"datestamp";s:10:"1332962446";s:8:"includes";a:2:{s:6:"ctools";s:11:"Chaos tools";s:12:"page_manager";s:12:"Page manager";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('89', 'update_fetch_tasks', 'a:8:{s:4:"name";s:4:"demo";s:4:"info";a:6:{s:4:"name";s:18:"Demonstration site";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1294543925";s:16:"_info_file_ctime";i:1332693113;}s:9:"datestamp";s:10:"1294543925";s:8:"includes";a:1:{s:4:"demo";s:18:"Demonstration site";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('90', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"devel";s:4:"info";a:6:{s:4:"name";s:5:"Devel";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:16:"_info_file_ctime";i:1328675144;}s:9:"datestamp";s:10:"1311355316";s:8:"includes";a:1:{s:5:"devel";s:5:"Devel";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('91', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"entity";s:4:"info";a:6:{s:4:"name";s:10:"Entity API";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1335099086";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335277449;}s:9:"datestamp";s:10:"1335099086";s:8:"includes";a:2:{s:6:"entity";s:10:"Entity API";s:12:"entity_token";s:13:"Entity tokens";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('92', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"features";s:4:"info";a:6:{s:4:"name";s:8:"Features";s:7:"package";s:8:"Features";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1334345807";s:16:"_info_file_ctime";i:1335276067;}s:9:"datestamp";s:10:"1334345807";s:8:"includes";a:1:{s:8:"features";s:8:"Features";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('93', 'update_fetch_tasks', 'a:8:{s:4:"name";s:13:"module_filter";s:4:"info";a:6:{s:4:"name";s:13:"Module filter";s:7:"version";s:7:"7.x-1.6";s:7:"project";s:13:"module_filter";s:9:"datestamp";s:10:"1316105205";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1332997947;}s:9:"datestamp";s:10:"1316105205";s:8:"includes";a:1:{s:13:"module_filter";s:13:"Module filter";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('94', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"pathauto";s:4:"info";a:6:{s:4:"name";s:8:"Pathauto";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1320072936";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1328675359;}s:9:"datestamp";s:10:"1320072936";s:8:"includes";a:1:{s:8:"pathauto";s:8:"Pathauto";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('95', 'update_fetch_tasks', 'a:8:{s:4:"name";s:9:"strongarm";s:4:"info";a:6:{s:4:"name";s:9:"Strongarm";s:7:"version";s:11:"7.x-2.0-rc1";s:7:"project";s:9:"strongarm";s:9:"datestamp";s:10:"1332787846";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1328675750;}s:9:"datestamp";s:10:"1332787846";s:8:"includes";a:1:{s:9:"strongarm";s:9:"Strongarm";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('96', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"token";s:4:"info";a:6:{s:4:"name";s:5:"Token";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1333672577";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335277532;}s:9:"datestamp";s:10:"1333672577";s:8:"includes";a:1:{s:5:"token";s:5:"Token";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('97', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"views";s:4:"info";a:6:{s:4:"name";s:5:"Views";s:7:"package";s:5:"Views";s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:16:"_info_file_ctime";i:1330485109;}s:9:"datestamp";s:10:"1329946249";s:8:"includes";a:2:{s:5:"views";s:5:"Views";s:8:"views_ui";s:8:"Views UI";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715395'),
('102', 'update_fetch_tasks', 'a:8:{s:4:"name";s:14:"backup_migrate";s:4:"info";a:6:{s:4:"name";s:18:"Backup and Migrate";s:7:"version";s:7:"7.x-2.2";s:7:"project";s:14:"backup_migrate";s:9:"datestamp";s:10:"1310528214";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1331958024;}s:9:"datestamp";s:10:"1310528214";s:8:"includes";a:1:{s:14:"backup_migrate";s:18:"Backup and Migrate";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('103', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"drupal";s:4:"info";a:6:{s:4:"name";s:5:"Block";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:16:"_info_file_ctime";i:1336107691;}s:9:"datestamp";s:10:"1335997555";s:8:"includes";a:26:{s:5:"block";s:5:"Block";s:10:"contextual";s:16:"Contextual links";s:5:"dblog";s:16:"Database logging";s:5:"field";s:5:"Field";s:17:"field_sql_storage";s:17:"Field SQL storage";s:8:"field_ui";s:8:"Field UI";s:4:"file";s:4:"File";s:6:"filter";s:6:"Filter";s:4:"help";s:4:"Help";s:5:"image";s:5:"Image";s:4:"list";s:4:"List";s:4:"menu";s:4:"Menu";s:4:"node";s:4:"Node";s:6:"number";s:6:"Number";s:7:"options";s:7:"Options";s:4:"path";s:4:"Path";s:3:"rdf";s:3:"RDF";s:8:"shortcut";s:8:"Shortcut";s:6:"system";s:6:"System";s:8:"taxonomy";s:8:"Taxonomy";s:4:"text";s:4:"Text";s:7:"toolbar";s:7:"Toolbar";s:6:"update";s:14:"Update manager";s:4:"user";s:4:"User";s:6:"bartik";s:6:"Bartik";s:5:"seven";s:5:"Seven";}s:12:"project_type";s:4:"core";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('104', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"ctools";s:4:"info";a:6:{s:4:"name";s:11:"Chaos tools";s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:16:"_info_file_ctime";i:1332475091;}s:9:"datestamp";s:10:"1332962446";s:8:"includes";a:2:{s:6:"ctools";s:11:"Chaos tools";s:12:"page_manager";s:12:"Page manager";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('105', 'update_fetch_tasks', 'a:8:{s:4:"name";s:4:"demo";s:4:"info";a:6:{s:4:"name";s:18:"Demonstration site";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1294543925";s:16:"_info_file_ctime";i:1332693113;}s:9:"datestamp";s:10:"1294543925";s:8:"includes";a:1:{s:4:"demo";s:18:"Demonstration site";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('106', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"devel";s:4:"info";a:6:{s:4:"name";s:5:"Devel";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:16:"_info_file_ctime";i:1328675144;}s:9:"datestamp";s:10:"1311355316";s:8:"includes";a:1:{s:5:"devel";s:5:"Devel";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('107', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"entity";s:4:"info";a:6:{s:4:"name";s:10:"Entity API";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1335099086";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335277449;}s:9:"datestamp";s:10:"1335099086";s:8:"includes";a:2:{s:6:"entity";s:10:"Entity API";s:12:"entity_token";s:13:"Entity tokens";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('108', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"features";s:4:"info";a:6:{s:4:"name";s:8:"Features";s:7:"package";s:8:"Features";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1334345807";s:16:"_info_file_ctime";i:1335276067;}s:9:"datestamp";s:10:"1334345807";s:8:"includes";a:1:{s:8:"features";s:8:"Features";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('109', 'update_fetch_tasks', 'a:8:{s:4:"name";s:13:"module_filter";s:4:"info";a:6:{s:4:"name";s:13:"Module filter";s:7:"version";s:7:"7.x-1.6";s:7:"project";s:13:"module_filter";s:9:"datestamp";s:10:"1316105205";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1332997947;}s:9:"datestamp";s:10:"1316105205";s:8:"includes";a:1:{s:13:"module_filter";s:13:"Module filter";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('110', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"pathauto";s:4:"info";a:6:{s:4:"name";s:8:"Pathauto";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1320072936";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1328675359;}s:9:"datestamp";s:10:"1320072936";s:8:"includes";a:1:{s:8:"pathauto";s:8:"Pathauto";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('111', 'update_fetch_tasks', 'a:8:{s:4:"name";s:9:"strongarm";s:4:"info";a:6:{s:4:"name";s:9:"Strongarm";s:7:"version";s:11:"7.x-2.0-rc1";s:7:"project";s:9:"strongarm";s:9:"datestamp";s:10:"1332787846";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1328675750;}s:9:"datestamp";s:10:"1332787846";s:8:"includes";a:1:{s:9:"strongarm";s:9:"Strongarm";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('112', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"token";s:4:"info";a:6:{s:4:"name";s:5:"Token";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1333672577";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335277532;}s:9:"datestamp";s:10:"1333672577";s:8:"includes";a:1:{s:5:"token";s:5:"Token";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('113', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"views";s:4:"info";a:6:{s:4:"name";s:5:"Views";s:7:"package";s:5:"Views";s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:16:"_info_file_ctime";i:1330485109;}s:9:"datestamp";s:10:"1329946249";s:8:"includes";a:2:{s:5:"views";s:5:"Views";s:8:"views_ui";s:8:"Views UI";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715487'),
('116', 'update_fetch_tasks', 'a:8:{s:4:"name";s:14:"backup_migrate";s:4:"info";a:6:{s:4:"name";s:18:"Backup and Migrate";s:7:"version";s:7:"7.x-2.3";s:7:"project";s:14:"backup_migrate";s:9:"datestamp";s:10:"1336146650";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715665;}s:9:"datestamp";s:10:"1336146650";s:8:"includes";a:1:{s:14:"backup_migrate";s:18:"Backup and Migrate";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('117', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"drupal";s:4:"info";a:6:{s:4:"name";s:5:"Block";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:16:"_info_file_ctime";i:1336107691;}s:9:"datestamp";s:10:"1335997555";s:8:"includes";a:26:{s:5:"block";s:5:"Block";s:10:"contextual";s:16:"Contextual links";s:5:"dblog";s:16:"Database logging";s:5:"field";s:5:"Field";s:17:"field_sql_storage";s:17:"Field SQL storage";s:8:"field_ui";s:8:"Field UI";s:4:"file";s:4:"File";s:6:"filter";s:6:"Filter";s:4:"help";s:4:"Help";s:5:"image";s:5:"Image";s:4:"list";s:4:"List";s:4:"menu";s:4:"Menu";s:4:"node";s:4:"Node";s:6:"number";s:6:"Number";s:7:"options";s:7:"Options";s:4:"path";s:4:"Path";s:3:"rdf";s:3:"RDF";s:8:"shortcut";s:8:"Shortcut";s:6:"system";s:6:"System";s:8:"taxonomy";s:8:"Taxonomy";s:4:"text";s:4:"Text";s:7:"toolbar";s:7:"Toolbar";s:6:"update";s:14:"Update manager";s:4:"user";s:4:"User";s:6:"bartik";s:6:"Bartik";s:5:"seven";s:5:"Seven";}s:12:"project_type";s:4:"core";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('118', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"ctools";s:4:"info";a:6:{s:4:"name";s:11:"Chaos tools";s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:16:"_info_file_ctime";i:1332475091;}s:9:"datestamp";s:10:"1332962446";s:8:"includes";a:2:{s:6:"ctools";s:11:"Chaos tools";s:12:"page_manager";s:12:"Page manager";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('119', 'update_fetch_tasks', 'a:8:{s:4:"name";s:4:"demo";s:4:"info";a:6:{s:4:"name";s:18:"Demonstration site";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1294543925";s:16:"_info_file_ctime";i:1332693113;}s:9:"datestamp";s:10:"1294543925";s:8:"includes";a:1:{s:4:"demo";s:18:"Demonstration site";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('120', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"devel";s:4:"info";a:6:{s:4:"name";s:5:"Devel";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:16:"_info_file_ctime";i:1328675144;}s:9:"datestamp";s:10:"1311355316";s:8:"includes";a:1:{s:5:"devel";s:5:"Devel";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('121', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"entity";s:4:"info";a:6:{s:4:"name";s:10:"Entity API";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1335099086";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1335277449;}s:9:"datestamp";s:10:"1335099086";s:8:"includes";a:2:{s:6:"entity";s:10:"Entity API";s:12:"entity_token";s:13:"Entity tokens";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('122', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"features";s:4:"info";a:6:{s:4:"name";s:8:"Features";s:7:"package";s:8:"Features";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1334345807";s:16:"_info_file_ctime";i:1335276067;}s:9:"datestamp";s:10:"1334345807";s:8:"includes";a:1:{s:8:"features";s:8:"Features";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('123', 'update_fetch_tasks', 'a:8:{s:4:"name";s:13:"module_filter";s:4:"info";a:6:{s:4:"name";s:13:"Module filter";s:7:"version";s:7:"7.x-1.6";s:7:"project";s:13:"module_filter";s:9:"datestamp";s:10:"1316105205";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1332997947;}s:9:"datestamp";s:10:"1316105205";s:8:"includes";a:1:{s:13:"module_filter";s:13:"Module filter";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('124', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"pathauto";s:4:"info";a:6:{s:4:"name";s:8:"Pathauto";s:7:"version";s:7:"7.x-1.1";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1336950382";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715679;}s:9:"datestamp";s:10:"1336950382";s:8:"includes";a:1:{s:8:"pathauto";s:8:"Pathauto";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('125', 'update_fetch_tasks', 'a:8:{s:4:"name";s:9:"strongarm";s:4:"info";a:6:{s:4:"name";s:9:"Strongarm";s:7:"version";s:11:"7.x-2.0-rc1";s:7:"project";s:9:"strongarm";s:9:"datestamp";s:10:"1332787846";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1328675750;}s:9:"datestamp";s:10:"1332787846";s:8:"includes";a:1:{s:9:"strongarm";s:9:"Strongarm";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('126', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"token";s:4:"info";a:6:{s:4:"name";s:5:"Token";s:7:"version";s:7:"7.x-1.1";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1337115392";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715639;}s:9:"datestamp";s:10:"1337115392";s:8:"includes";a:1:{s:5:"token";s:5:"Token";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('127', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"views";s:4:"info";a:6:{s:4:"name";s:5:"Views";s:7:"package";s:5:"Views";s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:16:"_info_file_ctime";i:1330485109;}s:9:"datestamp";s:10:"1329946249";s:8:"includes";a:2:{s:5:"views";s:5:"Views";s:8:"views_ui";s:8:"Views UI";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715727'),
('128', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"entity";s:4:"info";a:6:{s:4:"name";s:10:"Entity API";s:7:"version";s:11:"7.x-1.0-rc3";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1337981155";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715797;}s:9:"datestamp";s:10:"1337981155";s:8:"includes";a:2:{s:6:"entity";s:10:"Entity API";s:12:"entity_token";s:13:"Entity tokens";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715810'),
('129', 'update_fetch_tasks', 'a:8:{s:4:"name";s:14:"backup_migrate";s:4:"info";a:6:{s:4:"name";s:18:"Backup and Migrate";s:7:"version";s:7:"7.x-2.3";s:7:"project";s:14:"backup_migrate";s:9:"datestamp";s:10:"1336146650";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715665;}s:9:"datestamp";s:10:"1336146650";s:8:"includes";a:1:{s:14:"backup_migrate";s:18:"Backup and Migrate";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('130', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"drupal";s:4:"info";a:6:{s:4:"name";s:5:"Block";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:16:"_info_file_ctime";i:1336107691;}s:9:"datestamp";s:10:"1335997555";s:8:"includes";a:26:{s:5:"block";s:5:"Block";s:10:"contextual";s:16:"Contextual links";s:5:"dblog";s:16:"Database logging";s:5:"field";s:5:"Field";s:17:"field_sql_storage";s:17:"Field SQL storage";s:8:"field_ui";s:8:"Field UI";s:4:"file";s:4:"File";s:6:"filter";s:6:"Filter";s:4:"help";s:4:"Help";s:5:"image";s:5:"Image";s:4:"list";s:4:"List";s:4:"menu";s:4:"Menu";s:4:"node";s:4:"Node";s:6:"number";s:6:"Number";s:7:"options";s:7:"Options";s:4:"path";s:4:"Path";s:3:"rdf";s:3:"RDF";s:8:"shortcut";s:8:"Shortcut";s:6:"system";s:6:"System";s:8:"taxonomy";s:8:"Taxonomy";s:4:"text";s:4:"Text";s:7:"toolbar";s:7:"Toolbar";s:6:"update";s:14:"Update manager";s:4:"user";s:4:"User";s:6:"bartik";s:6:"Bartik";s:5:"seven";s:5:"Seven";}s:12:"project_type";s:4:"core";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('131', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"ctools";s:4:"info";a:6:{s:4:"name";s:11:"Chaos tools";s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:16:"_info_file_ctime";i:1332475091;}s:9:"datestamp";s:10:"1332962446";s:8:"includes";a:2:{s:6:"ctools";s:11:"Chaos tools";s:12:"page_manager";s:12:"Page manager";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('132', 'update_fetch_tasks', 'a:8:{s:4:"name";s:4:"demo";s:4:"info";a:6:{s:4:"name";s:18:"Demonstration site";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1294543925";s:16:"_info_file_ctime";i:1332693113;}s:9:"datestamp";s:10:"1294543925";s:8:"includes";a:1:{s:4:"demo";s:18:"Demonstration site";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('133', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"devel";s:4:"info";a:6:{s:4:"name";s:5:"Devel";s:7:"package";s:11:"Development";s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:16:"_info_file_ctime";i:1328675144;}s:9:"datestamp";s:10:"1311355316";s:8:"includes";a:1:{s:5:"devel";s:5:"Devel";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('134', 'update_fetch_tasks', 'a:8:{s:4:"name";s:6:"entity";s:4:"info";a:6:{s:4:"name";s:10:"Entity API";s:7:"version";s:11:"7.x-1.0-rc3";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1337981155";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715797;}s:9:"datestamp";s:10:"1337981155";s:8:"includes";a:2:{s:6:"entity";s:10:"Entity API";s:12:"entity_token";s:13:"Entity tokens";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('135', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"features";s:4:"info";a:6:{s:4:"name";s:8:"Features";s:7:"package";s:8:"Features";s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1334345807";s:16:"_info_file_ctime";i:1335276067;}s:9:"datestamp";s:10:"1334345807";s:8:"includes";a:1:{s:8:"features";s:8:"Features";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('136', 'update_fetch_tasks', 'a:8:{s:4:"name";s:13:"module_filter";s:4:"info";a:6:{s:4:"name";s:13:"Module filter";s:7:"version";s:7:"7.x-1.6";s:7:"project";s:13:"module_filter";s:9:"datestamp";s:10:"1316105205";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1332997947;}s:9:"datestamp";s:10:"1316105205";s:8:"includes";a:1:{s:13:"module_filter";s:13:"Module filter";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('137', 'update_fetch_tasks', 'a:8:{s:4:"name";s:8:"pathauto";s:4:"info";a:6:{s:4:"name";s:8:"Pathauto";s:7:"version";s:7:"7.x-1.1";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1336950382";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715679;}s:9:"datestamp";s:10:"1336950382";s:8:"includes";a:1:{s:8:"pathauto";s:8:"Pathauto";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('138', 'update_fetch_tasks', 'a:8:{s:4:"name";s:9:"strongarm";s:4:"info";a:6:{s:4:"name";s:9:"Strongarm";s:7:"version";s:11:"7.x-2.0-rc1";s:7:"project";s:9:"strongarm";s:9:"datestamp";s:10:"1332787846";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1328675750;}s:9:"datestamp";s:10:"1332787846";s:8:"includes";a:1:{s:9:"strongarm";s:9:"Strongarm";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('139', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"token";s:4:"info";a:6:{s:4:"name";s:5:"Token";s:7:"version";s:7:"7.x-1.1";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1337115392";s:7:"package";s:5:"Other";s:16:"_info_file_ctime";i:1338715639;}s:9:"datestamp";s:10:"1337115392";s:8:"includes";a:1:{s:5:"token";s:5:"Token";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846'),
('140', 'update_fetch_tasks', 'a:8:{s:4:"name";s:5:"views";s:4:"info";a:6:{s:4:"name";s:5:"Views";s:7:"package";s:5:"Views";s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:16:"_info_file_ctime";i:1330485109;}s:9:"datestamp";s:10:"1329946249";s:8:"includes";a:2:{s:5:"views";s:5:"Views";s:8:"views_ui";s:8:"Views UI";}s:12:"project_type";s:6:"module";s:14:"project_status";b:1;s:10:"sub_themes";a:0:{}s:11:"base_themes";a:0:{}}', '0', '1338715846');
/*!40000 ALTER TABLE queue ENABLE KEYS */;

--
-- Table structure for table 'rdf_mapping'
--

CREATE TABLE IF NOT EXISTS `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.',
  PRIMARY KEY (`type`,`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores custom RDF mappings for user defined content types...';

--
-- Dumping data for table 'rdf_mapping'
--

/*!40000 ALTER TABLE rdf_mapping DISABLE KEYS */;
INSERT INTO `rdf_mapping` VALUES
('node', 'article', 'a:11:{s:11:"field_image";a:2:{s:10:"predicates";a:2:{i:0;s:8:"og:image";i:1;s:12:"rdfs:seeAlso";}s:4:"type";s:3:"rel";}s:10:"field_tags";a:2:{s:10:"predicates";a:1:{i:0;s:10:"dc:subject";}s:4:"type";s:3:"rel";}s:7:"rdftype";a:2:{i:0;s:9:"sioc:Item";i:1;s:13:"foaf:Document";}s:5:"title";a:1:{s:10:"predicates";a:1:{i:0;s:8:"dc:title";}}s:7:"created";a:3:{s:10:"predicates";a:2:{i:0;s:7:"dc:date";i:1;s:10:"dc:created";}s:8:"datatype";s:12:"xsd:dateTime";s:8:"callback";s:12:"date_iso8601";}s:7:"changed";a:3:{s:10:"predicates";a:1:{i:0;s:11:"dc:modified";}s:8:"datatype";s:12:"xsd:dateTime";s:8:"callback";s:12:"date_iso8601";}s:4:"body";a:1:{s:10:"predicates";a:1:{i:0;s:15:"content:encoded";}}s:3:"uid";a:2:{s:10:"predicates";a:1:{i:0;s:16:"sioc:has_creator";}s:4:"type";s:3:"rel";}s:4:"name";a:1:{s:10:"predicates";a:1:{i:0;s:9:"foaf:name";}}s:13:"comment_count";a:2:{s:10:"predicates";a:1:{i:0;s:16:"sioc:num_replies";}s:8:"datatype";s:11:"xsd:integer";}s:13:"last_activity";a:3:{s:10:"predicates";a:1:{i:0;s:23:"sioc:last_activity_date";}s:8:"datatype";s:12:"xsd:dateTime";s:8:"callback";s:12:"date_iso8601";}}'),
('node', 'page', 'a:9:{s:7:"rdftype";a:1:{i:0;s:13:"foaf:Document";}s:5:"title";a:1:{s:10:"predicates";a:1:{i:0;s:8:"dc:title";}}s:7:"created";a:3:{s:10:"predicates";a:2:{i:0;s:7:"dc:date";i:1;s:10:"dc:created";}s:8:"datatype";s:12:"xsd:dateTime";s:8:"callback";s:12:"date_iso8601";}s:7:"changed";a:3:{s:10:"predicates";a:1:{i:0;s:11:"dc:modified";}s:8:"datatype";s:12:"xsd:dateTime";s:8:"callback";s:12:"date_iso8601";}s:4:"body";a:1:{s:10:"predicates";a:1:{i:0;s:15:"content:encoded";}}s:3:"uid";a:2:{s:10:"predicates";a:1:{i:0;s:16:"sioc:has_creator";}s:4:"type";s:3:"rel";}s:4:"name";a:1:{s:10:"predicates";a:1:{i:0;s:9:"foaf:name";}}s:13:"comment_count";a:2:{s:10:"predicates";a:1:{i:0;s:16:"sioc:num_replies";}s:8:"datatype";s:11:"xsd:integer";}s:13:"last_activity";a:3:{s:10:"predicates";a:1:{i:0;s:23:"sioc:last_activity_date";}s:8:"datatype";s:12:"xsd:dateTime";s:8:"callback";s:12:"date_iso8601";}}');
/*!40000 ALTER TABLE rdf_mapping ENABLE KEYS */;

--
-- Table structure for table 'registry'
--

CREATE TABLE IF NOT EXISTS `registry` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function, class, or interface.',
  `type` varchar(9) NOT NULL DEFAULT '' COMMENT 'Either function or class or interface.',
  `filename` varchar(255) NOT NULL COMMENT 'Name of the file.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the module the file belongs to.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  PRIMARY KEY (`name`,`type`),
  KEY `hook` (`type`,`weight`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Each record is a function, class, or interface name and...';

--
-- Dumping data for table 'registry'
--

/*!40000 ALTER TABLE registry DISABLE KEYS */;
INSERT INTO `registry` VALUES
('AccessDeniedTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('AdminMetaTagTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('ArchiverInterface', 'interface', 'includes/archiver.inc', '', '0'),
('ArchiverTar', 'class', 'modules/system/system.archiver.inc', 'system', '0'),
('ArchiverZip', 'class', 'modules/system/system.archiver.inc', 'system', '0'),
('Archive_Tar', 'class', 'modules/system/system.tar.inc', 'system', '0'),
('backup_migrate_destination', 'class', 'sites/all/modules/contrib/backup_migrate/includes/destinations.inc', 'backup_migrate', '0'),
('backup_migrate_destination_remote', 'class', 'sites/all/modules/contrib/backup_migrate/includes/destinations.inc', 'backup_migrate', '0'),
('backup_migrate_profile', 'class', 'sites/all/modules/contrib/backup_migrate/includes/profiles.inc', 'backup_migrate', '0'),
('backup_migrate_schedule', 'class', 'sites/all/modules/contrib/backup_migrate/includes/schedules.inc', 'backup_migrate', '0'),
('BatchMemoryQueue', 'class', 'includes/batch.queue.inc', '', '0'),
('BatchQueue', 'class', 'includes/batch.queue.inc', '', '0'),
('BlockAdminThemeTestCase', 'class', 'modules/block/block.test', 'block', '-5'),
('BlockCacheTestCase', 'class', 'modules/block/block.test', 'block', '-5'),
('BlockHiddenRegionTestCase', 'class', 'modules/block/block.test', 'block', '-5'),
('BlockHTMLIdTestCase', 'class', 'modules/block/block.test', 'block', '-5'),
('BlockInvalidRegionTestCase', 'class', 'modules/block/block.test', 'block', '-5'),
('BlockTemplateSuggestionsUnitTest', 'class', 'modules/block/block.test', 'block', '-5'),
('BlockTestCase', 'class', 'modules/block/block.test', 'block', '-5'),
('ContextualDynamicContextTestCase', 'class', 'modules/contextual/contextual.test', 'contextual', '0'),
('CronRunTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('ctools_context', 'class', 'sites/all/modules/contrib/ctools/includes/context.inc', 'ctools', '0'),
('ctools_context_optional', 'class', 'sites/all/modules/contrib/ctools/includes/context.inc', 'ctools', '0'),
('ctools_context_required', 'class', 'sites/all/modules/contrib/ctools/includes/context.inc', 'ctools', '0'),
('ctools_export_ui', 'class', 'sites/all/modules/contrib/ctools/plugins/export_ui/ctools_export_ui.class.php', 'ctools', '0'),
('ctools_math_expr', 'class', 'sites/all/modules/contrib/ctools/includes/math-expr.inc', 'ctools', '0'),
('ctools_math_expr_stack', 'class', 'sites/all/modules/contrib/ctools/includes/math-expr.inc', 'ctools', '0'),
('ctools_stylizer_image_processor', 'class', 'sites/all/modules/contrib/ctools/includes/stylizer.inc', 'ctools', '0'),
('Database', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseCondition', 'class', 'includes/database/query.inc', '', '0'),
('DatabaseConnection', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseConnectionNotDefinedException', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseConnection_mysql', 'class', 'includes/database/mysql/database.inc', '', '0'),
('DatabaseConnection_pgsql', 'class', 'includes/database/pgsql/database.inc', '', '0'),
('DatabaseConnection_sqlite', 'class', 'includes/database/sqlite/database.inc', '', '0'),
('DatabaseDriverNotSpecifiedException', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseLog', 'class', 'includes/database/log.inc', '', '0'),
('DatabaseSchema', 'class', 'includes/database/schema.inc', '', '0'),
('DatabaseSchemaObjectDoesNotExistException', 'class', 'includes/database/schema.inc', '', '0'),
('DatabaseSchemaObjectExistsException', 'class', 'includes/database/schema.inc', '', '0'),
('DatabaseSchema_mysql', 'class', 'includes/database/mysql/schema.inc', '', '0'),
('DatabaseSchema_pgsql', 'class', 'includes/database/pgsql/schema.inc', '', '0'),
('DatabaseSchema_sqlite', 'class', 'includes/database/sqlite/schema.inc', '', '0'),
('DatabaseStatementBase', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseStatementEmpty', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseStatementInterface', 'interface', 'includes/database/database.inc', '', '0'),
('DatabaseStatementPrefetch', 'class', 'includes/database/prefetch.inc', '', '0'),
('DatabaseStatement_sqlite', 'class', 'includes/database/sqlite/database.inc', '', '0'),
('DatabaseTaskException', 'class', 'includes/install.inc', '', '0'),
('DatabaseTasks', 'class', 'includes/install.inc', '', '0'),
('DatabaseTasks_mysql', 'class', 'includes/database/mysql/install.inc', '', '0'),
('DatabaseTasks_pgsql', 'class', 'includes/database/pgsql/install.inc', '', '0'),
('DatabaseTasks_sqlite', 'class', 'includes/database/sqlite/install.inc', '', '0'),
('DatabaseTransaction', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseTransactionCommitFailedException', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseTransactionExplicitCommitNotAllowedException', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseTransactionNameNonUniqueException', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseTransactionNoActiveException', 'class', 'includes/database/database.inc', '', '0'),
('DatabaseTransactionOutOfOrderException', 'class', 'includes/database/database.inc', '', '0'),
('DateTimeFunctionalTest', 'class', 'modules/system/system.test', 'system', '0'),
('DBLogTestCase', 'class', 'modules/dblog/dblog.test', 'dblog', '0'),
('DefaultMailSystem', 'class', 'modules/system/system.mail.inc', 'system', '0'),
('DeleteQuery', 'class', 'includes/database/query.inc', '', '0'),
('DeleteQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', '0'),
('DevelMailLog', 'class', 'sites/all/modules/contrib/devel/devel.mail.inc', 'devel', '0'),
('DevelMailTest', 'class', 'sites/all/modules/contrib/devel/devel.test', 'devel', '0'),
('DrupalCacheArray', 'class', 'includes/bootstrap.inc', '', '0'),
('DrupalCacheInterface', 'interface', 'includes/cache.inc', '', '0'),
('DrupalDatabaseCache', 'class', 'includes/cache.inc', '', '0'),
('DrupalDefaultEntityController', 'class', 'includes/entity.inc', '', '0'),
('DrupalEntityControllerInterface', 'interface', 'includes/entity.inc', '', '0'),
('DrupalFakeCache', 'class', 'includes/cache-install.inc', '', '0'),
('DrupalLocalStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', '0'),
('DrupalPrivateStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', '0'),
('DrupalPublicStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', '0'),
('DrupalQueue', 'class', 'modules/system/system.queue.inc', 'system', '0'),
('DrupalQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', '0'),
('DrupalReliableQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', '0'),
('DrupalStreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', '0'),
('DrupalTemporaryStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', '0'),
('DrupalUpdateException', 'class', 'includes/update.inc', '', '0'),
('DrupalUpdaterInterface', 'interface', 'includes/updater.inc', '', '0'),
('EnableDisableTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('Entity', 'class', 'sites/all/modules/contrib/entity/includes/entity.inc', 'entity', '0'),
('EntityAPIController', 'class', 'sites/all/modules/contrib/entity/includes/entity.controller.inc', 'entity', '0'),
('EntityAPIControllerExportable', 'class', 'sites/all/modules/contrib/entity/includes/entity.controller.inc', 'entity', '0'),
('EntityAPIControllerInterface', 'interface', 'sites/all/modules/contrib/entity/includes/entity.controller.inc', 'entity', '0'),
('EntityAPIi18nItegrationTestCase', 'class', 'sites/all/modules/contrib/entity/entity.test', 'entity', '0'),
('EntityAPIRulesIntegrationTestCase', 'class', 'sites/all/modules/contrib/entity/entity.test', 'entity', '0'),
('EntityAPITestCase', 'class', 'sites/all/modules/contrib/entity/entity.test', 'entity', '0'),
('EntityDB', 'class', 'sites/all/modules/contrib/entity/includes/entity.inc', 'entity', '0'),
('EntityDBExtendable', 'class', 'sites/all/modules/contrib/entity/includes/entity.inc', 'entity', '0'),
('EntityDefaultFeaturesController', 'class', 'sites/all/modules/contrib/entity/entity.features.inc', 'entity', '0'),
('EntityDefaultI18nStringController', 'class', 'sites/all/modules/contrib/entity/entity.i18n.inc', 'entity', '0'),
('EntityDefaultMetadataController', 'class', 'sites/all/modules/contrib/entity/entity.info.inc', 'entity', '0'),
('EntityDefaultRulesController', 'class', 'sites/all/modules/contrib/entity/entity.rules.inc', 'entity', '0'),
('EntityDefaultUIController', 'class', 'sites/all/modules/contrib/entity/includes/entity.ui.inc', 'entity', '0'),
('EntityDefaultViewsController', 'class', 'sites/all/modules/contrib/entity/views/entity.views.inc', 'entity', '0'),
('EntityDrupalWrapper', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityExtendable', 'class', 'sites/all/modules/contrib/entity/includes/entity.inc', 'entity', '0'),
('EntityFieldHandlerHelper', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_field_handler_helper.inc', 'entity', '0'),
('EntityFieldQuery', 'class', 'includes/entity.inc', '', '0'),
('EntityFieldQueryException', 'class', 'includes/entity.inc', '', '0'),
('EntityListWrapper', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityMalformedException', 'class', 'includes/entity.inc', '', '0'),
('EntityMetadataArrayObject', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityMetadataIntegrationTestCase', 'class', 'sites/all/modules/contrib/entity/entity.test', 'entity', '0'),
('EntityMetadataTestCase', 'class', 'sites/all/modules/contrib/entity/entity.test', 'entity', '0'),
('EntityMetadataWrapper', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityMetadataWrapperException', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityMetadataWrapperIterator', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityPropertiesTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('EntityStructureWrapper', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityTokenTestCase', 'class', 'sites/all/modules/contrib/entity/entity.test', 'entity', '0'),
('EntityValueWrapper', 'class', 'sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'entity', '0'),
('EntityWebTestCase', 'class', 'sites/all/modules/contrib/entity/entity.test', 'entity', '0'),
('entity_views_handler_area_entity', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_area_entity.inc', 'entity', '0'),
('entity_views_handler_field_boolean', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_boolean.inc', 'entity', '0'),
('entity_views_handler_field_date', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_date.inc', 'entity', '0'),
('entity_views_handler_field_duration', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_duration.inc', 'entity', '0'),
('entity_views_handler_field_entity', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_entity.inc', 'entity', '0'),
('entity_views_handler_field_field', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_field.inc', 'entity', '0'),
('entity_views_handler_field_numeric', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_numeric.inc', 'entity', '0'),
('entity_views_handler_field_options', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_options.inc', 'entity', '0'),
('entity_views_handler_field_text', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_text.inc', 'entity', '0'),
('entity_views_handler_field_uri', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_uri.inc', 'entity', '0'),
('entity_views_handler_relationship', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_relationship.inc', 'entity', '0'),
('entity_views_handler_relationship_by_bundle', 'class', 'sites/all/modules/contrib/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc', 'entity', '0'),
('entity_views_plugin_row_entity_view', 'class', 'sites/all/modules/contrib/entity/views/plugins/entity_views_plugin_row_entity_view.inc', 'entity', '0'),
('FeaturesUserTestCase', 'class', 'sites/all/modules/contrib/features/tests/features.test', 'features', '0'),
('FieldAttachOtherTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldAttachStorageTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldAttachTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldBulkDeleteTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldDisplayAPITestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldException', 'class', 'modules/field/field.module', 'field', '0'),
('FieldFormTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldInfoTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldInstanceCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldsOverlapException', 'class', 'includes/database/database.inc', '', '0'),
('FieldSqlStorageTestCase', 'class', 'modules/field/modules/field_sql_storage/field_sql_storage.test', 'field_sql_storage', '0'),
('FieldTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldTranslationsTestCase', 'class', 'modules/field/tests/field.test', 'field', '0'),
('FieldUIAlterTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', '0'),
('FieldUIManageDisplayTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', '0'),
('FieldUIManageFieldsTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', '0'),
('FieldUITestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', '0'),
('FieldUpdateForbiddenException', 'class', 'modules/field/field.module', 'field', '0'),
('FieldValidationException', 'class', 'modules/field/field.attach.inc', 'field', '0'),
('FileFieldDisplayTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileFieldPathTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileFieldRevisionTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileFieldTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileFieldValidateTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileFieldWidgetTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileManagedFileElementTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FilePrivateTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileTokenReplaceTestCase', 'class', 'modules/file/tests/file.test', 'file', '0'),
('FileTransfer', 'class', 'includes/filetransfer/filetransfer.inc', '', '0'),
('FileTransferChmodInterface', 'interface', 'includes/filetransfer/filetransfer.inc', '', '0'),
('FileTransferException', 'class', 'includes/filetransfer/filetransfer.inc', '', '0'),
('FileTransferFTP', 'class', 'includes/filetransfer/ftp.inc', '', '0'),
('FileTransferFTPExtension', 'class', 'includes/filetransfer/ftp.inc', '', '0'),
('FileTransferLocal', 'class', 'includes/filetransfer/local.inc', '', '0'),
('FileTransferSSH', 'class', 'includes/filetransfer/ssh.inc', '', '0'),
('FilterAdminTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterCRUDTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterDefaultFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterFormatAccessTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterHooksTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterNoFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterSecurityTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterSettingsTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FilterUnitTestCase', 'class', 'modules/filter/filter.test', 'filter', '0'),
('FloodFunctionalTest', 'class', 'modules/system/system.test', 'system', '0'),
('FrontPageTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('HelpTestCase', 'class', 'modules/help/help.test', 'help', '0'),
('HookRequirementsTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('ImageAdminStylesUnitTest', 'class', 'modules/image/image.test', 'image', '0'),
('ImageDimensionsScaleTestCase', 'class', 'modules/image/image.test', 'image', '0'),
('ImageDimensionsTestCase', 'class', 'modules/image/image.test', 'image', '0'),
('ImageEffectsUnitTest', 'class', 'modules/image/image.test', 'image', '0'),
('ImageFieldDefaultImagesTestCase', 'class', 'modules/image/image.test', 'image', '0'),
('ImageFieldDisplayTestCase', 'class', 'modules/image/image.test', 'image', '0'),
('ImageFieldTestCase', 'class', 'modules/image/image.test', 'image', '0'),
('ImageFieldValidateTestCase', 'class', 'modules/image/image.test', 'image', '0'),
('ImageStylesPathAndUrlTestCase', 'class', 'modules/image/image.test', 'image', '0'),
('InfoFileParserTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('InsertQuery', 'class', 'includes/database/query.inc', '', '0'),
('InsertQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', '0'),
('InsertQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', '0'),
('InsertQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', '0'),
('InvalidMergeQueryException', 'class', 'includes/database/database.inc', '', '0'),
('IPAddressBlockingTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('ListDynamicValuesTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', '0'),
('ListDynamicValuesValidationTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', '0'),
('ListFieldTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', '0'),
('ListFieldUITestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', '0'),
('MailSystemInterface', 'interface', 'includes/mail.inc', '', '0'),
('MemoryQueue', 'class', 'modules/system/system.queue.inc', 'system', '0'),
('MenuNodeTestCase', 'class', 'modules/menu/menu.test', 'menu', '0'),
('MenuTestCase', 'class', 'modules/menu/menu.test', 'menu', '0'),
('MergeQuery', 'class', 'includes/database/query.inc', '', '0'),
('ModuleDependencyTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('ModuleRequiredTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('ModuleTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('ModuleUpdater', 'class', 'modules/system/system.updater.inc', 'system', '0'),
('ModuleVersionTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('MultiStepNodeFormBasicOptionsTest', 'class', 'modules/node/node.test', 'node', '0'),
('NewDefaultThemeBlocks', 'class', 'modules/block/block.test', 'block', '-5'),
('NodeAccessBaseTableTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeAccessPagerTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeAccessRebuildTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeAccessRecordsTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeAccessTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeAdminTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeBlockFunctionalTest', 'class', 'modules/node/node.test', 'node', '0'),
('NodeBlockTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeBuildContent', 'class', 'modules/node/node.test', 'node', '0'),
('NodeController', 'class', 'modules/node/node.module', 'node', '0'),
('NodeCreationTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeEntityFieldQueryAlter', 'class', 'modules/node/node.test', 'node', '0'),
('NodeFeedTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeLoadHooksTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeLoadMultipleTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodePostSettingsTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeQueryAlter', 'class', 'modules/node/node.test', 'node', '0'),
('NodeRevisionPermissionsTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeRevisionsTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeRSSContentTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeSaveTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeTitleTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeTitleXSSTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeTokenReplaceTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeTypePersistenceTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NodeTypeTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('NoFieldsException', 'class', 'includes/database/database.inc', '', '0'),
('NoHelpTestCase', 'class', 'modules/help/help.test', 'help', '0'),
('NonDefaultBlockAdmin', 'class', 'modules/block/block.test', 'block', '-5'),
('NumberFieldTestCase', 'class', 'modules/field/modules/number/number.test', 'number', '0'),
('OptionsSelectDynamicValuesTestCase', 'class', 'modules/field/modules/options/options.test', 'options', '0'),
('OptionsWidgetsTestCase', 'class', 'modules/field/modules/options/options.test', 'options', '0'),
('PageEditTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('PageNotFoundTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('PagePreviewTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('PagerDefault', 'class', 'includes/pager.inc', '', '0'),
('PageTitleFiltering', 'class', 'modules/system/system.test', 'system', '0'),
('PageViewTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('PathautoBulkUpdateTestCase', 'class', 'sites/all/modules/contrib/pathauto/pathauto.test', 'pathauto', '1'),
('PathautoFunctionalTestCase', 'class', 'sites/all/modules/contrib/pathauto/pathauto.test', 'pathauto', '1'),
('PathautoFunctionalTestHelper', 'class', 'sites/all/modules/contrib/pathauto/pathauto.test', 'pathauto', '1'),
('PathautoLocaleTestCase', 'class', 'sites/all/modules/contrib/pathauto/pathauto.test', 'pathauto', '1'),
('PathautoTestHelper', 'class', 'sites/all/modules/contrib/pathauto/pathauto.test', 'pathauto', '1'),
('PathautoTokenTestCase', 'class', 'sites/all/modules/contrib/pathauto/pathauto.test', 'pathauto', '1'),
('PathautoUnitTestCase', 'class', 'sites/all/modules/contrib/pathauto/pathauto.test', 'pathauto', '1'),
('PathLanguageTestCase', 'class', 'modules/path/path.test', 'path', '0'),
('PathLanguageUITestCase', 'class', 'modules/path/path.test', 'path', '0'),
('PathMonolingualTestCase', 'class', 'modules/path/path.test', 'path', '0'),
('PathTaxonomyTermTestCase', 'class', 'modules/path/path.test', 'path', '0'),
('PathTestCase', 'class', 'modules/path/path.test', 'path', '0'),
('Query', 'class', 'includes/database/query.inc', '', '0'),
('QueryAlterableInterface', 'interface', 'includes/database/query.inc', '', '0'),
('QueryConditionInterface', 'interface', 'includes/database/query.inc', '', '0'),
('QueryExtendableInterface', 'interface', 'includes/database/select.inc', '', '0'),
('QueryPlaceholderInterface', 'interface', 'includes/database/query.inc', '', '0'),
('QueueTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('RdfCommentAttributesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', '0'),
('RdfCrudTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', '0'),
('RdfGetRdfNamespacesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', '0'),
('RdfMappingDefinitionTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', '0'),
('RdfMappingHookTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', '0'),
('RdfRdfaMarkupTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', '0'),
('RdfTrackerAttributesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', '0'),
('RetrieveFileTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('SchemaCache', 'class', 'includes/bootstrap.inc', '', '0'),
('SelectQuery', 'class', 'includes/database/select.inc', '', '0'),
('SelectQueryExtender', 'class', 'includes/database/select.inc', '', '0'),
('SelectQueryInterface', 'interface', 'includes/database/select.inc', '', '0'),
('SelectQuery_pgsql', 'class', 'includes/database/pgsql/select.inc', '', '0'),
('SelectQuery_sqlite', 'class', 'includes/database/sqlite/select.inc', '', '0'),
('ShortcutLinksTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', '0'),
('ShortcutSetsTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', '0'),
('ShortcutTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', '0'),
('ShutdownFunctionsTest', 'class', 'modules/system/system.test', 'system', '0'),
('SiteMaintenanceTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('SkipDotsRecursiveDirectoryIterator', 'class', 'includes/filetransfer/filetransfer.inc', '', '0'),
('StreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', '0'),
('SummaryLengthTestCase', 'class', 'modules/node/node.test', 'node', '0'),
('SystemAdminTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('SystemAuthorizeCase', 'class', 'modules/system/system.test', 'system', '0'),
('SystemBlockTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('SystemIndexPhpTest', 'class', 'modules/system/system.test', 'system', '0'),
('SystemInfoAlterTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('SystemMainContentFallback', 'class', 'modules/system/system.test', 'system', '0'),
('SystemQueue', 'class', 'modules/system/system.queue.inc', 'system', '0'),
('SystemThemeFunctionalTest', 'class', 'modules/system/system.test', 'system', '0'),
('TableSort', 'class', 'includes/tablesort.inc', '', '0'),
('TaxonomyHooksTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyLegacyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyLoadMultipleTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyRSSTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyTermController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', '0'),
('TaxonomyTermFieldMultipleVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyTermFieldTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyTermFunctionTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyTermIndexTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyTermTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyThemeTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyTokenReplaceTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyVocabularyController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', '0'),
('TaxonomyVocabularyFunctionalTest', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TaxonomyWebTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', '0'),
('TestingMailSystem', 'class', 'modules/system/system.mail.inc', 'system', '0'),
('TextFieldTestCase', 'class', 'modules/field/modules/text/text.test', 'text', '0'),
('TextSummaryTestCase', 'class', 'modules/field/modules/text/text.test', 'text', '0'),
('TextTranslationTestCase', 'class', 'modules/field/modules/text/text.test', 'text', '0'),
('ThemeRegistry', 'class', 'includes/theme.inc', '', '0'),
('ThemeUpdater', 'class', 'modules/system/system.updater.inc', 'system', '0'),
('TokenArrayTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenBlockTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenCommentTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenCurrentPageTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenDateTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenEntityTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenFileTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenMenuTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenNodeTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenProfileTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenRandomTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenReplaceTestCase', 'class', 'modules/system/system.test', 'system', '0'),
('TokenTaxonomyTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenTestHelper', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenUnitTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenURLTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TokenUserTestCase', 'class', 'sites/all/modules/contrib/token/token.test', 'token', '0'),
('TruncateQuery', 'class', 'includes/database/query.inc', '', '0'),
('TruncateQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', '0'),
('TruncateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', '0'),
('UpdateCoreTestCase', 'class', 'modules/update/update.test', 'update', '0'),
('UpdateCoreUnitTestCase', 'class', 'modules/update/update.test', 'update', '0'),
('UpdateQuery', 'class', 'includes/database/query.inc', '', '0'),
('UpdateQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', '0'),
('UpdateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', '0'),
('Updater', 'class', 'includes/updater.inc', '', '0'),
('UpdaterException', 'class', 'includes/updater.inc', '', '0'),
('UpdaterFileTransferException', 'class', 'includes/updater.inc', '', '0'),
('UpdateScriptFunctionalTest', 'class', 'modules/system/system.test', 'system', '0'),
('UpdateTestContribCase', 'class', 'modules/update/update.test', 'update', '0'),
('UpdateTestHelper', 'class', 'modules/update/update.test', 'update', '0'),
('UpdateTestUploadCase', 'class', 'modules/update/update.test', 'update', '0'),
('UserAccountLinksUnitTests', 'class', 'modules/user/user.test', 'user', '0'),
('UserAdminTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserAuthmapAssignmentTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserAutocompleteTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserBlocksUnitTests', 'class', 'modules/user/user.test', 'user', '0'),
('UserCancelTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserController', 'class', 'modules/user/user.module', 'user', '0'),
('UserCreateTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserEditedOwnAccountTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserEditTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserLoginTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserPermissionsTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserPictureTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserRegistrationTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserRoleAdminTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserRolesAssignmentTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserSaveTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserSignatureTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserTimeZoneFunctionalTest', 'class', 'modules/user/user.test', 'user', '0'),
('UserTokenReplaceTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserUserSearchTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('UserValidateCurrentPassCustomForm', 'class', 'modules/user/user.test', 'user', '0'),
('UserValidationTestCase', 'class', 'modules/user/user.test', 'user', '0'),
('view', 'class', 'sites/all/modules/contrib/views/includes/view.inc', 'views', '0'),
('ViewsAccessTest', 'class', 'sites/all/modules/contrib/views/tests/views_access.test', 'views', '0'),
('ViewsAnalyzeTest', 'class', 'sites/all/modules/contrib/views/tests/views_analyze.test', 'views', '0'),
('ViewsArgumentDefaultTest', 'class', 'sites/all/modules/contrib/views/tests/views_argument_default.test', 'views', '0'),
('ViewsArgumentValidatorTest', 'class', 'sites/all/modules/contrib/views/tests/views_argument_validator.test', 'views', '0'),
('ViewsBasicTest', 'class', 'sites/all/modules/contrib/views/tests/views_basic.test', 'views', '0'),
('ViewsCacheTest', 'class', 'sites/all/modules/contrib/views/tests/views_cache.test', 'views', '0'),
('ViewsExposedFormTest', 'class', 'sites/all/modules/contrib/views/tests/views_exposed_form.test', 'views', '0'),
('ViewsGlossaryTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_glossary.test', 'views', '0'),
('ViewsHandlerAreaTextTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_area_text.test', 'views', '0'),
('viewsHandlerArgumentCommentUserUidTest', 'class', 'sites/all/modules/contrib/views/tests/comment/views_handler_argument_comment_user_uid.test', 'views', '0'),
('ViewsHandlerArgumentNullTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_argument_null.test', 'views', '0'),
('ViewsHandlerFieldBooleanTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_boolean.test', 'views', '0'),
('ViewsHandlerFieldCustomTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_custom.test', 'views', '0'),
('ViewsHandlerFieldDateTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_date.test', 'views', '0'),
('ViewsHandlerFieldMath', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_math.test', 'views', '0'),
('ViewsHandlerFieldTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field.test', 'views', '0'),
('ViewsHandlerFieldUrlTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_url.test', 'views', '0'),
('viewsHandlerFieldUserNameTest', 'class', 'sites/all/modules/contrib/views/tests/user/views_handler_field_user_name.test', 'views', '0'),
('viewsHandlerFilterCommentUserUidTest', 'class', 'sites/all/modules/contrib/views/tests/comment/views_handler_filter_comment_user_uid.test', 'views', '0'),
('ViewsHandlerFilterCounterTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_counter.test', 'views', '0'),
('ViewsHandlerFilterDateTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_filter_date.test', 'views', '0'),
('ViewsHandlerFilterEqualityTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_filter_equality.test', 'views', '0'),
('ViewsHandlerFilterInOperator', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_filter_in_operator.test', 'views', '0'),
('ViewsHandlerFilterNumericTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_filter_numeric.test', 'views', '0'),
('ViewsHandlerFilterStringTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_filter_string.test', 'views', '0'),
('ViewsHandlerSortDateTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_sort_date.test', 'views', '0'),
('ViewsHandlerSortRandomTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_sort_random.test', 'views', '0'),
('ViewsHandlerSortTest', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_sort.test', 'views', '0'),
('ViewsHandlersTest', 'class', 'sites/all/modules/contrib/views/tests/views_handlers.test', 'views', '0'),
('ViewsHandlerTestFileSize', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_file_size.test', 'views', '0'),
('ViewsHandlerTestXss', 'class', 'sites/all/modules/contrib/views/tests/handlers/views_handler_field_xss.test', 'views', '0'),
('ViewsModuleTest', 'class', 'sites/all/modules/contrib/views/tests/views_module.test', 'views', '0'),
('ViewsPagerTest', 'class', 'sites/all/modules/contrib/views/tests/views_pager.test', 'views', '0'),
('viewsPluginStyleJumpMenuTest', 'class', 'sites/all/modules/contrib/views/tests/styles/views_plugin_style_jump_menu.test', 'views', '0'),
('ViewsPluginStyleTestCase', 'class', 'sites/all/modules/contrib/views/tests/styles/views_plugin_style.test', 'views', '0'),
('ViewsQueryGroupByTest', 'class', 'sites/all/modules/contrib/views/tests/views_groupby.test', 'views', '0'),
('viewsSearchQuery', 'class', 'sites/all/modules/contrib/views/modules/search/views_handler_filter_search.inc', 'views', '0'),
('ViewsSqlTest', 'class', 'sites/all/modules/contrib/views/tests/views_query.test', 'views', '0'),
('ViewsTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_query.test', 'views', '0'),
('ViewsTranslatableTest', 'class', 'sites/all/modules/contrib/views/tests/views_translatable.test', 'views', '0'),
('ViewsUiBaseViewsWizard', 'class', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', '0'),
('ViewsUiFileManagedViewsWizard', 'class', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_file_managed_views_wizard.class.php', 'views_ui', '0'),
('viewsUiGroupbyTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_groupby.test', 'views', '0'),
('ViewsUiNodeRevisionViewsWizard', 'class', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_node_revision_views_wizard.class.php', 'views_ui', '0'),
('ViewsUiNodeViewsWizard', 'class', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_node_views_wizard.class.php', 'views_ui', '0'),
('ViewsUiTaxonomyTermViewsWizard', 'class', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_taxonomy_term_views_wizard.class.php', 'views_ui', '0'),
('ViewsUiUsersViewsWizard', 'class', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_users_views_wizard.class.php', 'views_ui', '0'),
('ViewsUIWizardBasicTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardDefaultViewsTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardHelper', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardItemsPerPageTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardJumpMenuTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardMenuTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardOverrideDisplaysTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardSortingTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUIWizardTaggedWithTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_ui.test', 'views', '0'),
('ViewsUpgradeTestCase', 'class', 'sites/all/modules/contrib/views/tests/views_upgrade.test', 'views', '0'),
('ViewsUserArgumentDefault', 'class', 'sites/all/modules/contrib/views/tests/user/views_user_argument_default.test', 'views', '0'),
('ViewsUserArgumentValidate', 'class', 'sites/all/modules/contrib/views/tests/user/views_user_argument_validate.test', 'views', '0'),
('ViewsUserTestCase', 'class', 'sites/all/modules/contrib/views/tests/user/views_user.test', 'views', '0'),
('ViewsViewTest', 'class', 'sites/all/modules/contrib/views/tests/views_view.test', 'views', '0'),
('ViewsWizardException', 'class', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', '0'),
('ViewsWizardInterface', 'interface', 'sites/all/modules/contrib/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', '0'),
('views_db_object', 'class', 'sites/all/modules/contrib/views/includes/view.inc', 'views', '0'),
('views_display', 'class', 'sites/all/modules/contrib/views/includes/view.inc', 'views', '0'),
('views_handler', 'class', 'sites/all/modules/contrib/views/includes/handlers.inc', 'views', '0'),
('views_handler_area', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_area.inc', 'views', '0'),
('views_handler_area_broken', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_area.inc', 'views', '0'),
('views_handler_area_result', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_area_result.inc', 'views', '0'),
('views_handler_area_text', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_area_text.inc', 'views', '0'),
('views_handler_area_view', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_area_view.inc', 'views', '0'),
('views_handler_argument', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument.inc', 'views', '0'),
('views_handler_argument_aggregator_category_cid', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_handler_argument_aggregator_category_cid.inc', 'views', '0'),
('views_handler_argument_aggregator_fid', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_handler_argument_aggregator_fid.inc', 'views', '0'),
('views_handler_argument_aggregator_iid', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_handler_argument_aggregator_iid.inc', 'views', '0'),
('views_handler_argument_broken', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument.inc', 'views', '0'),
('views_handler_argument_comment_user_uid', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_argument_comment_user_uid.inc', 'views', '0'),
('views_handler_argument_date', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument_date.inc', 'views', '0'),
('views_handler_argument_field_list', 'class', 'sites/all/modules/contrib/views/modules/field/views_handler_argument_field_list.inc', 'views', '0'),
('views_handler_argument_file_fid', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_argument_file_fid.inc', 'views', '0'),
('views_handler_argument_formula', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument_formula.inc', 'views', '0'),
('views_handler_argument_group_by_numeric', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument_group_by_numeric.inc', 'views', '0'),
('views_handler_argument_locale_group', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_argument_locale_group.inc', 'views', '0'),
('views_handler_argument_locale_language', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_argument_locale_language.inc', 'views', '0'),
('views_handler_argument_many_to_one', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument_many_to_one.inc', 'views', '0'),
('views_handler_argument_node_created_day', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_dates_various.inc', 'views', '0'),
('views_handler_argument_node_created_fulldate', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_dates_various.inc', 'views', '0'),
('views_handler_argument_node_created_month', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_dates_various.inc', 'views', '0'),
('views_handler_argument_node_created_week', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_dates_various.inc', 'views', '0'),
('views_handler_argument_node_created_year', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_dates_various.inc', 'views', '0'),
('views_handler_argument_node_created_year_month', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_dates_various.inc', 'views', '0'),
('views_handler_argument_node_language', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_node_language.inc', 'views', '0'),
('views_handler_argument_node_nid', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_node_nid.inc', 'views', '0'),
('views_handler_argument_node_tnid', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_argument_node_tnid.inc', 'views', '0'),
('views_handler_argument_node_type', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_node_type.inc', 'views', '0'),
('views_handler_argument_node_uid_revision', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_node_uid_revision.inc', 'views', '0'),
('views_handler_argument_node_vid', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_argument_node_vid.inc', 'views', '0'),
('views_handler_argument_null', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument_null.inc', 'views', '0'),
('views_handler_argument_numeric', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument_numeric.inc', 'views', '0'),
('views_handler_argument_search', 'class', 'sites/all/modules/contrib/views/modules/search/views_handler_argument_search.inc', 'views', '0'),
('views_handler_argument_string', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_argument_string.inc', 'views', '0'),
('views_handler_argument_taxonomy', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_taxonomy.inc', 'views', '0'),
('views_handler_argument_term_node_tid', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_term_node_tid.inc', 'views', '0'),
('views_handler_argument_term_node_tid_depth', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_term_node_tid_depth.inc', 'views', '0'),
('views_handler_argument_term_node_tid_depth_modifier', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_modifier.inc', 'views', '0'),
('views_handler_argument_users_roles_rid', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_argument_users_roles_rid.inc', 'views', '0'),
('views_handler_argument_user_uid', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_argument_user_uid.inc', 'views', '0'),
('views_handler_argument_vocabulary_machine_name', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_vocabulary_machine_name.inc', 'views', '0'),
('views_handler_argument_vocabulary_vid', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_vocabulary_vid.inc', 'views', '0'),
('views_handler_field', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field.inc', 'views', '0'),
('views_handler_field_accesslog_path', 'class', 'sites/all/modules/contrib/views/modules/statistics/views_handler_field_accesslog_path.inc', 'views', '0'),
('views_handler_field_aggregator_category', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_handler_field_aggregator_category.inc', 'views', '0'),
('views_handler_field_aggregator_title_link', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_handler_field_aggregator_title_link.inc', 'views', '0'),
('views_handler_field_aggregator_xss', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_handler_field_aggregator_xss.inc', 'views', '0'),
('views_handler_field_boolean', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_boolean.inc', 'views', '0'),
('views_handler_field_broken', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field.inc', 'views', '0'),
('views_handler_field_comment', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment.inc', 'views', '0'),
('views_handler_field_comment_depth', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_depth.inc', 'views', '0'),
('views_handler_field_comment_link', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link.inc', 'views', '0'),
('views_handler_field_comment_link_approve', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_approve.inc', 'views', '0'),
('views_handler_field_comment_link_delete', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_delete.inc', 'views', '0'),
('views_handler_field_comment_link_edit', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_edit.inc', 'views', '0'),
('views_handler_field_comment_link_reply', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_reply.inc', 'views', '0'),
('views_handler_field_comment_node_link', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_node_link.inc', 'views', '0'),
('views_handler_field_comment_username', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_username.inc', 'views', '0'),
('views_handler_field_contact_link', 'class', 'sites/all/modules/contrib/views/modules/contact/views_handler_field_contact_link.inc', 'views', '0'),
('views_handler_field_contextual_links', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_contextual_links.inc', 'views', '0'),
('views_handler_field_counter', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_counter.inc', 'views', '0'),
('views_handler_field_custom', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_custom.inc', 'views', '0'),
('views_handler_field_date', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_date.inc', 'views', '0'),
('views_handler_field_entity', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_entity.inc', 'views', '0'),
('views_handler_field_field', 'class', 'sites/all/modules/contrib/views/modules/field/views_handler_field_field.inc', 'views', '0');
INSERT INTO `registry` VALUES
('views_handler_field_file', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_field_file.inc', 'views', '0'),
('views_handler_field_file_extension', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_field_file_extension.inc', 'views', '0'),
('views_handler_field_file_filemime', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_field_file_filemime.inc', 'views', '0'),
('views_handler_field_file_size', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field.inc', 'views', '0'),
('views_handler_field_file_status', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_field_file_status.inc', 'views', '0'),
('views_handler_field_file_uri', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_field_file_uri.inc', 'views', '0'),
('views_handler_field_filter_format_name', 'class', 'sites/all/modules/contrib/views/modules/filter/views_handler_field_filter_format_name.inc', 'views', '0'),
('views_handler_field_history_user_timestamp', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_history_user_timestamp.inc', 'views', '0'),
('views_handler_field_last_comment_timestamp', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_last_comment_timestamp.inc', 'views', '0'),
('views_handler_field_locale_group', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_field_locale_group.inc', 'views', '0'),
('views_handler_field_locale_language', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_field_locale_language.inc', 'views', '0'),
('views_handler_field_locale_link_edit', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_field_locale_link_edit.inc', 'views', '0'),
('views_handler_field_machine_name', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_machine_name.inc', 'views', '0'),
('views_handler_field_markup', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_markup.inc', 'views', '0'),
('views_handler_field_math', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_math.inc', 'views', '0'),
('views_handler_field_ncs_last_comment_name', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_ncs_last_comment_name.inc', 'views', '0'),
('views_handler_field_ncs_last_updated', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_ncs_last_updated.inc', 'views', '0'),
('views_handler_field_node', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node.inc', 'views', '0'),
('views_handler_field_node_comment', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_node_comment.inc', 'views', '0'),
('views_handler_field_node_language', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_field_node_language.inc', 'views', '0'),
('views_handler_field_node_link', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_link.inc', 'views', '0'),
('views_handler_field_node_link_delete', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_link_delete.inc', 'views', '0'),
('views_handler_field_node_link_edit', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_link_edit.inc', 'views', '0'),
('views_handler_field_node_link_translate', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_field_node_link_translate.inc', 'views', '0'),
('views_handler_field_node_new_comments', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_field_node_new_comments.inc', 'views', '0'),
('views_handler_field_node_path', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_path.inc', 'views', '0'),
('views_handler_field_node_revision', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_revision.inc', 'views', '0'),
('views_handler_field_node_revision_link_delete', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_revision_link_delete.inc', 'views', '0'),
('views_handler_field_node_revision_link_revert', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_revision_link_revert.inc', 'views', '0'),
('views_handler_field_node_translation_link', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_field_node_translation_link.inc', 'views', '0'),
('views_handler_field_node_type', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_field_node_type.inc', 'views', '0'),
('views_handler_field_numeric', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_numeric.inc', 'views', '0'),
('views_handler_field_prerender_list', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_prerender_list.inc', 'views', '0'),
('views_handler_field_profile_date', 'class', 'sites/all/modules/contrib/views/modules/profile/views_handler_field_profile_date.inc', 'views', '0'),
('views_handler_field_profile_list', 'class', 'sites/all/modules/contrib/views/modules/profile/views_handler_field_profile_list.inc', 'views', '0'),
('views_handler_field_search_score', 'class', 'sites/all/modules/contrib/views/modules/search/views_handler_field_search_score.inc', 'views', '0'),
('views_handler_field_serialized', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_serialized.inc', 'views', '0'),
('views_handler_field_taxonomy', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_field_taxonomy.inc', 'views', '0'),
('views_handler_field_term_link_edit', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_field_term_link_edit.inc', 'views', '0'),
('views_handler_field_term_node_tid', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_field_term_node_tid.inc', 'views', '0'),
('views_handler_field_time_interval', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_time_interval.inc', 'views', '0'),
('views_handler_field_upload_description', 'class', 'sites/all/modules/contrib/views/modules/upload/views_handler_field_upload_description.inc', 'views', '0'),
('views_handler_field_upload_fid', 'class', 'sites/all/modules/contrib/views/modules/upload/views_handler_field_upload_fid.inc', 'views', '0'),
('views_handler_field_url', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field_url.inc', 'views', '0'),
('views_handler_field_user', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user.inc', 'views', '0'),
('views_handler_field_user_language', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_language.inc', 'views', '0'),
('views_handler_field_user_link', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_link.inc', 'views', '0'),
('views_handler_field_user_link_cancel', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_link_cancel.inc', 'views', '0'),
('views_handler_field_user_link_edit', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_link_edit.inc', 'views', '0'),
('views_handler_field_user_mail', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_mail.inc', 'views', '0'),
('views_handler_field_user_name', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_name.inc', 'views', '0'),
('views_handler_field_user_permissions', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_permissions.inc', 'views', '0'),
('views_handler_field_user_picture', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_picture.inc', 'views', '0'),
('views_handler_field_user_roles', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_field_user_roles.inc', 'views', '0'),
('views_handler_field_xss', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_field.inc', 'views', '0'),
('views_handler_filter', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter.inc', 'views', '0'),
('views_handler_filter_aggregator_category_cid', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_handler_filter_aggregator_category_cid.inc', 'views', '0'),
('views_handler_filter_boolean_operator', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_boolean_operator.inc', 'views', '0'),
('views_handler_filter_boolean_operator_string', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_boolean_operator_string.inc', 'views', '0'),
('views_handler_filter_broken', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter.inc', 'views', '0'),
('views_handler_filter_comment_user_uid', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_filter_comment_user_uid.inc', 'views', '0'),
('views_handler_filter_date', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_date.inc', 'views', '0'),
('views_handler_filter_equality', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_equality.inc', 'views', '0'),
('views_handler_filter_field_list', 'class', 'sites/all/modules/contrib/views/modules/field/views_handler_filter_field_list.inc', 'views', '0'),
('views_handler_filter_file_status', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_filter_file_status.inc', 'views', '0'),
('views_handler_filter_group_by_numeric', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_group_by_numeric.inc', 'views', '0'),
('views_handler_filter_history_user_timestamp', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_filter_history_user_timestamp.inc', 'views', '0'),
('views_handler_filter_in_operator', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_in_operator.inc', 'views', '0'),
('views_handler_filter_locale_group', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_filter_locale_group.inc', 'views', '0'),
('views_handler_filter_locale_language', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_filter_locale_language.inc', 'views', '0'),
('views_handler_filter_locale_version', 'class', 'sites/all/modules/contrib/views/modules/locale/views_handler_filter_locale_version.inc', 'views', '0'),
('views_handler_filter_many_to_one', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_many_to_one.inc', 'views', '0'),
('views_handler_filter_ncs_last_updated', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_filter_ncs_last_updated.inc', 'views', '0'),
('views_handler_filter_node_access', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_filter_node_access.inc', 'views', '0'),
('views_handler_filter_node_comment', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_filter_node_comment.inc', 'views', '0'),
('views_handler_filter_node_language', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_filter_node_language.inc', 'views', '0'),
('views_handler_filter_node_status', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_filter_node_status.inc', 'views', '0'),
('views_handler_filter_node_tnid', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_filter_node_tnid.inc', 'views', '0'),
('views_handler_filter_node_tnid_child', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_filter_node_tnid_child.inc', 'views', '0'),
('views_handler_filter_node_type', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_filter_node_type.inc', 'views', '0'),
('views_handler_filter_node_uid_revision', 'class', 'sites/all/modules/contrib/views/modules/node/views_handler_filter_node_uid_revision.inc', 'views', '0'),
('views_handler_filter_numeric', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_numeric.inc', 'views', '0'),
('views_handler_filter_profile_selection', 'class', 'sites/all/modules/contrib/views/modules/profile/views_handler_filter_profile_selection.inc', 'views', '0'),
('views_handler_filter_search', 'class', 'sites/all/modules/contrib/views/modules/search/views_handler_filter_search.inc', 'views', '0'),
('views_handler_filter_string', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_filter_string.inc', 'views', '0'),
('views_handler_filter_system_type', 'class', 'sites/all/modules/contrib/views/modules/system/views_handler_filter_system_type.inc', 'views', '0'),
('views_handler_filter_term_node_tid', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_term_node_tid.inc', 'views', '0'),
('views_handler_filter_term_node_tid_depth', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_term_node_tid_depth.inc', 'views', '0'),
('views_handler_filter_upload_fid', 'class', 'sites/all/modules/contrib/views/modules/upload/views_handler_filter_upload_fid.inc', 'views', '0'),
('views_handler_filter_user_current', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_filter_user_current.inc', 'views', '0'),
('views_handler_filter_user_name', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_filter_user_name.inc', 'views', '0'),
('views_handler_filter_user_permissions', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_filter_user_permissions.inc', 'views', '0'),
('views_handler_filter_user_roles', 'class', 'sites/all/modules/contrib/views/modules/user/views_handler_filter_user_roles.inc', 'views', '0'),
('views_handler_filter_vocabulary_machine_name', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_vocabulary_machine_name.inc', 'views', '0'),
('views_handler_filter_vocabulary_vid', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_vocabulary_vid.inc', 'views', '0'),
('views_handler_relationship', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_relationship.inc', 'views', '0'),
('views_handler_relationship_broken', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_relationship.inc', 'views', '0'),
('views_handler_relationship_entity_reverse', 'class', 'sites/all/modules/contrib/views/modules/field/views_handler_relationship_entity_reverse.inc', 'views', '0'),
('views_handler_relationship_groupwise_max', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_relationship_groupwise_max.inc', 'views', '0'),
('views_handler_relationship_node_term_data', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_handler_relationship_node_term_data.inc', 'views', '0'),
('views_handler_relationship_translation', 'class', 'sites/all/modules/contrib/views/modules/translation/views_handler_relationship_translation.inc', 'views', '0'),
('views_handler_sort', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_sort.inc', 'views', '0'),
('views_handler_sort_broken', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_sort.inc', 'views', '0'),
('views_handler_sort_comment_thread', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_sort_comment_thread.inc', 'views', '0'),
('views_handler_sort_date', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_sort_date.inc', 'views', '0'),
('views_handler_sort_group_by_numeric', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_sort_group_by_numeric.inc', 'views', '0'),
('views_handler_sort_menu_hierarchy', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_sort_menu_hierarchy.inc', 'views', '0'),
('views_handler_sort_ncs_last_comment_name', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_sort_ncs_last_comment_name.inc', 'views', '0'),
('views_handler_sort_ncs_last_updated', 'class', 'sites/all/modules/contrib/views/modules/comment/views_handler_sort_ncs_last_updated.inc', 'views', '0'),
('views_handler_sort_random', 'class', 'sites/all/modules/contrib/views/handlers/views_handler_sort_random.inc', 'views', '0'),
('views_handler_sort_search_score', 'class', 'sites/all/modules/contrib/views/modules/search/views_handler_sort_search_score.inc', 'views', '0'),
('views_join', 'class', 'sites/all/modules/contrib/views/includes/handlers.inc', 'views', '0'),
('views_join_subquery', 'class', 'sites/all/modules/contrib/views/includes/handlers.inc', 'views', '0'),
('views_many_to_one_helper', 'class', 'sites/all/modules/contrib/views/includes/handlers.inc', 'views', '0'),
('views_object', 'class', 'sites/all/modules/contrib/views/includes/base.inc', 'views', '0'),
('views_plugin', 'class', 'sites/all/modules/contrib/views/includes/plugins.inc', 'views', '0'),
('views_plugin_access', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_access.inc', 'views', '0'),
('views_plugin_access_none', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_access_none.inc', 'views', '0'),
('views_plugin_access_perm', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_access_perm.inc', 'views', '0'),
('views_plugin_access_role', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_access_role.inc', 'views', '0'),
('views_plugin_argument_default', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_argument_default.inc', 'views', '0'),
('views_plugin_argument_default_current_user', 'class', 'sites/all/modules/contrib/views/modules/user/views_plugin_argument_default_current_user.inc', 'views', '0'),
('views_plugin_argument_default_fixed', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_argument_default_fixed.inc', 'views', '0'),
('views_plugin_argument_default_node', 'class', 'sites/all/modules/contrib/views/modules/node/views_plugin_argument_default_node.inc', 'views', '0'),
('views_plugin_argument_default_php', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_argument_default_php.inc', 'views', '0'),
('views_plugin_argument_default_raw', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_argument_default_raw.inc', 'views', '0'),
('views_plugin_argument_default_taxonomy_tid', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_plugin_argument_default_taxonomy_tid.inc', 'views', '0'),
('views_plugin_argument_default_user', 'class', 'sites/all/modules/contrib/views/modules/user/views_plugin_argument_default_user.inc', 'views', '0'),
('views_plugin_argument_validate', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_argument_validate.inc', 'views', '0'),
('views_plugin_argument_validate_node', 'class', 'sites/all/modules/contrib/views/modules/node/views_plugin_argument_validate_node.inc', 'views', '0'),
('views_plugin_argument_validate_numeric', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_argument_validate_numeric.inc', 'views', '0'),
('views_plugin_argument_validate_php', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_argument_validate_php.inc', 'views', '0'),
('views_plugin_argument_validate_taxonomy_term', 'class', 'sites/all/modules/contrib/views/modules/taxonomy/views_plugin_argument_validate_taxonomy_term.inc', 'views', '0'),
('views_plugin_argument_validate_user', 'class', 'sites/all/modules/contrib/views/modules/user/views_plugin_argument_validate_user.inc', 'views', '0'),
('views_plugin_cache', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_cache.inc', 'views', '0'),
('views_plugin_cache_none', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_cache_none.inc', 'views', '0'),
('views_plugin_cache_time', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_cache_time.inc', 'views', '0'),
('views_plugin_display', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_display.inc', 'views', '0'),
('views_plugin_display_attachment', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_display_attachment.inc', 'views', '0'),
('views_plugin_display_block', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_display_block.inc', 'views', '0'),
('views_plugin_display_default', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_display_default.inc', 'views', '0'),
('views_plugin_display_extender', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_display_extender.inc', 'views', '0'),
('views_plugin_display_feed', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_display_feed.inc', 'views', '0'),
('views_plugin_display_page', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_display_page.inc', 'views', '0'),
('views_plugin_exposed_form', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_exposed_form.inc', 'views', '0'),
('views_plugin_exposed_form_basic', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_exposed_form_basic.inc', 'views', '0'),
('views_plugin_exposed_form_input_required', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_exposed_form_input_required.inc', 'views', '0'),
('views_plugin_localization', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_localization.inc', 'views', '0'),
('views_plugin_localization_core', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_localization_core.inc', 'views', '0'),
('views_plugin_localization_none', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_localization_none.inc', 'views', '0'),
('views_plugin_localization_test', 'class', 'sites/all/modules/contrib/views/tests/views_plugin_localization_test.inc', 'views', '0'),
('views_plugin_pager', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_pager.inc', 'views', '0'),
('views_plugin_pager_full', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_pager_full.inc', 'views', '0'),
('views_plugin_pager_mini', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_pager_mini.inc', 'views', '0'),
('views_plugin_pager_none', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_pager_none.inc', 'views', '0'),
('views_plugin_pager_some', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_pager_some.inc', 'views', '0'),
('views_plugin_query', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_query.inc', 'views', '0'),
('views_plugin_query_default', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_query_default.inc', 'views', '0'),
('views_plugin_row', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_row.inc', 'views', '0'),
('views_plugin_row_aggregator_rss', 'class', 'sites/all/modules/contrib/views/modules/aggregator/views_plugin_row_aggregator_rss.inc', 'views', '0'),
('views_plugin_row_comment_rss', 'class', 'sites/all/modules/contrib/views/modules/comment/views_plugin_row_comment_rss.inc', 'views', '0'),
('views_plugin_row_comment_view', 'class', 'sites/all/modules/contrib/views/modules/comment/views_plugin_row_comment_view.inc', 'views', '0'),
('views_plugin_row_fields', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_row_fields.inc', 'views', '0'),
('views_plugin_row_node_rss', 'class', 'sites/all/modules/contrib/views/modules/node/views_plugin_row_node_rss.inc', 'views', '0'),
('views_plugin_row_node_view', 'class', 'sites/all/modules/contrib/views/modules/node/views_plugin_row_node_view.inc', 'views', '0'),
('views_plugin_row_search_view', 'class', 'sites/all/modules/contrib/views/modules/search/views_plugin_row_search_view.inc', 'views', '0'),
('views_plugin_row_user_view', 'class', 'sites/all/modules/contrib/views/modules/user/views_plugin_row_user_view.inc', 'views', '0'),
('views_plugin_style', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style.inc', 'views', '0'),
('views_plugin_style_default', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_default.inc', 'views', '0'),
('views_plugin_style_grid', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_grid.inc', 'views', '0'),
('views_plugin_style_jump_menu', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_jump_menu.inc', 'views', '0'),
('views_plugin_style_list', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_list.inc', 'views', '0'),
('views_plugin_style_rss', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_rss.inc', 'views', '0'),
('views_plugin_style_summary', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_summary.inc', 'views', '0'),
('views_plugin_style_summary_jump_menu', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_summary_jump_menu.inc', 'views', '0'),
('views_plugin_style_summary_unformatted', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_summary_unformatted.inc', 'views', '0'),
('views_plugin_style_table', 'class', 'sites/all/modules/contrib/views/plugins/views_plugin_style_table.inc', 'views', '0'),
('views_test_plugin_access_test_dynamic', 'class', 'sites/all/modules/contrib/views/tests/test_plugins/views_test_plugin_access_test_dynamic.inc', 'views', '0'),
('views_test_plugin_access_test_static', 'class', 'sites/all/modules/contrib/views/tests/test_plugins/views_test_plugin_access_test_static.inc', 'views', '0'),
('views_ui', 'class', 'sites/all/modules/contrib/views/plugins/export_ui/views_ui.class.php', 'views_ui', '0');
/*!40000 ALTER TABLE registry ENABLE KEYS */;

--
-- Table structure for table 'registry_file'
--

CREATE TABLE IF NOT EXISTS `registry_file` (
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file.',
  `hash` varchar(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Files parsed to build the registry.';

--
-- Dumping data for table 'registry_file'
--

/*!40000 ALTER TABLE registry_file DISABLE KEYS */;
INSERT INTO `registry_file` VALUES
('includes/actions.inc', 'f36b066681463c7dfe189e0430cb1a89bf66f7e228cbb53cdfcd93987193f759'),
('includes/ajax.inc', 'e9c0653a0df32a81577d64980d74ef4f2423573b15fc86e9d7aa65227b52f470'),
('includes/archiver.inc', 'bdbb21b712a62f6b913590b609fd17cd9f3c3b77c0d21f68e71a78427ed2e3e9'),
('includes/authorize.inc', 'a8f26e722ddba490cdc0fcf80238af45f0f88e977b2e0c90c0c21d9df3380748'),
('includes/batch.inc', '059da9e36e1f3717f27840aae73f10dea7d6c8daf16f6520401cc1ca3b4c0388'),
('includes/batch.queue.inc', '554b2e92e1dad0f7fd5a19cb8dff7e109f10fbe2441a5692d076338ec908de0f'),
('includes/bootstrap.inc', '1ad376074bf816f88251357fd55be2df573177f43460587f87b6ec13d4414083'),
('includes/cache-install.inc', 'e7ed123c5805703c84ad2cce9c1ca46b3ce8caeeea0d8ef39a3024a4ab95fa0e'),
('includes/cache.inc', '0a70a291f7ce423d1aab4816ef06a6eaf58b454a03a1f419ff309c1147c4765b'),
('includes/common.inc', '406419b0744dcfd092fe4ef8eb0df4dccb282c2c61e7eb43f4dd210abb8cffaa'),
('includes/database/database.inc', 'a9ae2e56f476a49e643b54fb20565de67d9408e025da1def7213407d2f02fc3c'),
('includes/database/log.inc', '4ecbdf9022d8c612310b41af575f10b0d4c041c0fbc41c6dc7e1f2ab6eacce6b'),
('includes/database/mysql/database.inc', 'dee977eebac5a6e933a6bdfd50d30563d442ae225eef506c21c73051ee880b64'),
('includes/database/mysql/install.inc', '6ae316941f771732fbbabed7e1d6b4cbb41b1f429dd097d04b3345aa15e461a0'),
('includes/database/mysql/query.inc', 'e2a5457ec40a8f88f6a822bdc77f74865e4c02206fc733c2945c8897f46093de'),
('includes/database/mysql/schema.inc', '53fdbfa7edb9722eaf1cfe2862652c4d1c9d8f97a9d558af525cfba35dd1c945'),
('includes/database/pgsql/database.inc', 'c2e61154b2307e8c4e9b60ace82c7e09ab8182aa8910a34cd8f2a7c66e1d5864'),
('includes/database/pgsql/install.inc', '585b80c5bbd6f134bff60d06397f15154657a577d4da8d1b181858905f09dea5'),
('includes/database/pgsql/query.inc', 'cb4c84f8f1ffc73098ed71137248dcd078a505a7530e60d979d74b3a3cdaa658'),
('includes/database/pgsql/schema.inc', '8fd647e4557522283caef63e528c6e403fc0751a46e94aac867a281af85eac27'),
('includes/database/pgsql/select.inc', 'ce06c4353d4322e519e1c90ca863e6666edc370fb3c12568fedf466334b2e2be'),
('includes/database/prefetch.inc', 'd32c8be47de08641f48327260d0df0dfa97543a2cd8902979bbe1586e273fee4'),
('includes/database/query.inc', 'cf7063348d0fed4366265347a274a1f5bbf1448531205cf3bd68055f20c0c992'),
('includes/database/schema.inc', '7eb7251f331109757173353263d1031493c1198ae17a165a6f5a03d3f14f93e7'),
('includes/database/select.inc', '80f33c7685b08a2f89178d82143225ade9bd464a8a5dac8bdff3b89f48270386'),
('includes/database/sqlite/database.inc', '5e27f620705c731fa4d301894e82e30637a0742de0c0309be50ad30244b31e52'),
('includes/database/sqlite/install.inc', '381f3db8c59837d961978ba3097bb6443534ed1659fd713aa563963fa0c42cc5'),
('includes/database/sqlite/query.inc', '61e0459c0c9252ca465b86c475d88e09ea34c8cdb28220eb37a7d44357f5474f'),
('includes/database/sqlite/schema.inc', '238414785aa96dd27f10f48c961783f4d1091392beee8d0e7ca8ae774e917da2'),
('includes/database/sqlite/select.inc', '4ecb9d21d2f07237f7603e925519886dde0b8da82f96999b865ff0803438744e'),
('includes/date.inc', '18c047be64f201e16d189f1cc47ed9dcf0a145151b1ee187e90511b24e5d2b36'),
('includes/entity.inc', '26686167f5d515d17f607daef9eb1ab8858dc257cd0c807ec625681b3e3bf479'),
('includes/errors.inc', 'b4adafbd9ccbc578bc42af78d14d7d3fa508fa10981555aacc9ff5e00a1fa1d8'),
('includes/file.inc', '042fed00746880123a3e4d95f138a3d8bc169a77b9cbae98cd05c1840375297d'),
('includes/file.mimetypes.inc', 'f88c967550576694b7a1ce2afd0f2f1bbc1a91d21cc2c20f86c44d39ff353867'),
('includes/filetransfer/filetransfer.inc', '4391b7228bd952fb351c9431a7c226b4e8a23d9a7307b9ffa63e097c17b25467'),
('includes/filetransfer/ftp.inc', '589ebf4b8bd4a2973aa56a156ac1fa83b6c73e703391361fb573167670e0d832'),
('includes/filetransfer/local.inc', '7cbfdb46abbdf539640db27e66fb30e5265128f31002bd0dfc3af16ae01a9492'),
('includes/filetransfer/ssh.inc', '002e24a24cac133d12728bd3843868ce378681237d7fad420761af84e6efe5ad'),
('includes/form.inc', 'dff72a18902a749492117ab349e35de34ea239543e7cd47df0d41ebc4e88fd97'),
('includes/graph.inc', 'd9ab806d219478d71f8cdc3861c0d44d5defc62872bf829e2194aba552da7f3e'),
('includes/image.inc', '22c8ff48d46276b9bea1ad2cf4af9b65abcf69fb5ebca441259e774190fa5863'),
('includes/install.core.inc', 'a56ff7412d5fb68221a9f3bdd9f710d9f331f2d2c4bbb62ed98cb3c79c6882d5'),
('includes/install.inc', '23455f095ebd75c49ef8bf2a18145f77b6633670a5eb9eab860d907b0ba25f35'),
('includes/iso.inc', 'f53653843c75e12aa0b05e7197c5aebdf794e2517b9902fc07994fb7cb8f3ed6'),
('includes/json-encode.inc', '02a822a652d00151f79db9aa9e171c310b69b93a12f549bc2ce00533a8efa14e'),
('includes/language.inc', '2660a308eefd99f1aec300d1f8e51365a4331ca8af2b9056e5df528cd5b03a89'),
('includes/locale.inc', '2ec00f6167fda3eca53a031344070b1d16398951acba735c55fedd1a2f178321'),
('includes/lock.inc', 'daa62e95528f6b986b85680b600a896452bf2ce6f38921242857dcc5a3460a1b'),
('includes/mail.inc', 'bb50727f20717ffa17cbe11ddb27bd004bd814fc26115c3fca4b06f4cec179fa'),
('includes/menu.inc', '1fa6f6b0ffc711e352b48ef7f78e399536ed91ba56ad7ed333e34ed7a93228c1'),
('includes/module.inc', 'c12df1e05bb0c546722fe9c5221e3a1a91de504a66b5aeb6fe8ef8348a048d35'),
('includes/pager.inc', '6f9494b85c07a2cc3be4e54aff2d2757485238c476a7da084d25bde1d88be6d8'),
('includes/password.inc', 'aba5df25a237c14cc69335c4cf72d57da130144410ab04d10917d9da21cd606c'),
('includes/path.inc', '1d939d6b59b07ef41e71c9d616c2e9a34712dd81f6110e1a1f280613b3228738'),
('includes/registry.inc', '4ffb8c9c8c179c1417ff01790f339edf50b5f7cc0c8bb976eef6858cc71e9bc8'),
('includes/session.inc', '8293e6cc9f081ecdc4e8cfcdec885a79df01b9007030fe6b467a85c87ebb5d82'),
('includes/stream_wrappers.inc', '323e418fda2fdd29a44d8618f8855a92172c377eb745412d58ca55fdcaa8f2d1'),
('includes/tablesort.inc', '3f3cb2820920f7edc0c3d046ffba4fc4e3b73a699a2492780371141cf501aa50'),
('includes/theme.inc', '2d32fc405e7bbede8d0b5baf1f83aed679179cd0e679a8c4630916a0899954b5'),
('includes/theme.maintenance.inc', 'd110314b4d943c3e965fcefe452f6873b53cd6a8844154467dfcbb2b6142dc82'),
('includes/token.inc', 'a975300558711bb49406a5c7f78294648baa2e5c912cb66f0c78bb2991c0f3c3'),
('includes/unicode.entities.inc', '2b858138596d961fbaa4c6e3986e409921df7f76b6ee1b109c4af5970f1e0f54'),
('includes/unicode.inc', '3d5a4756f7af1f9de84f7614b6cd87449af43f4bb1e2a77bb2c73589f5826f61'),
('includes/update.inc', 'fff87274155c7c8243baf14440b21034dfde792bc3482839eb530764bd2ee349'),
('includes/updater.inc', 'd2da0e74ed86e93c209f16069f3d32e1a134ceb6c06a0044f78e841a1b54e380'),
('includes/utility.inc', '9b834814fd3f5ef10ce1946be30ef1ddf3f283c749f1ef1a4ebf845ecd524d59'),
('includes/xmlrpc.inc', 'c5b6ea78adeb135373d11aeaaea057d9fa8995faa4e8c0fec9b7c647f15cc4e0'),
('includes/xmlrpcs.inc', '79dc6e9882f4c506123d7dd8e228a61e22c46979c3aab21a5b1afa315ef6639c'),
('modules/block/block.test', 'efba42e5afd01ccd3233a48ec3260e405d75f215faa320ed90fdb8adf59f2911'),
('modules/contextual/contextual.test', '023dafa199bd325ecc55a17b2a3db46ac0a31e23059f701f789f3bc42427ba0b'),
('modules/dblog/dblog.test', '702c6a6207a73d8a29c857d8ca298e9740a02f09072da2f5624e7090e8a92acf'),
('modules/field/field.attach.inc', 'f576b1b8d3d6bf7bb6c8684bc6e7e9e752002c3a4735a5b93e44cef35ffbd024'),
('modules/field/field.module', 'dc83d93ab1f2ad80e8ae419eaf0a5e67250000cd787f8e873f810ce9c7ccf538'),
('modules/field/modules/field_sql_storage/field_sql_storage.test', '8ede9843d771e307dfd3d7e7562976b07e0e0a9310a5cf409413581f199c897f'),
('modules/field/modules/list/tests/list.test', '9f366469763beb3fe0571d66318bac6df293fd15f4eb5cfe4850b9fb9a509f38'),
('modules/field/modules/number/number.test', 'cb55fbc3a1ceed154af673af727b4c5ee6ac2e7dc9d4e1cbc33f3f8e2269146c'),
('modules/field/modules/options/options.test', '8c6dd464fdb5cca90b0260bcfa5f56941b4b28edd879b23a795f0442f5368d4c'),
('modules/field/modules/text/text.test', '9d74c6d039f55dd7d6447a59186da8d48bf20617bfe58424612798f649797586'),
('modules/field/tests/field.test', 'fc642546736b585471d76d6e6bc35c7709381026b0e147a095e4037c64d9cdba'),
('modules/field_ui/field_ui.test', 'c40ecf17d601036f92b419938617a51d64a92821cdb2171793b76f7abdd2c9ff'),
('modules/file/tests/file.test', 'bb776eb42762d3b429600d591fb0781982951f5cc74e09f860eb89dc4d0fb8f6'),
('modules/filter/filter.test', '7fc6863df7cd7f2b3ba9e8fcdb92675f97d8c39ec8dad4fb93db48dca679c236'),
('modules/help/help.test', 'c6f03ece30548a6a345afcfac920d85afc418596a19dc4cf43f994391c5050d9'),
('modules/image/image.test', '4ff412f8946d1354971c950b0bff12179b8f95fe1585da0d46267ecb42109da6'),
('modules/menu/menu.test', 'b8ee602184584fab464900a946090dc1f3d81c15b8176004ee62022814632430'),
('modules/node/node.module', '179ea020a2832645a41f9241a7b7abf1626c954e9c2bbd36d781e27b48471557'),
('modules/node/node.test', 'a9e2c0e334ac50916e8b7b99c25e3470fe0900f82716770655ad00e8d9c1967b'),
('modules/path/path.test', 'c05b26db575e93a73f2e4c8eaa6091b4fe8fc805f59620c2f7e1276cc206ba9d'),
('modules/rdf/rdf.test', '358e2ae2069a15c6ba828f3428ab979632ece7aa0ba33a6a5bdbc1d065961373'),
('modules/shortcut/shortcut.test', 'b506a253353066e1f995e7f0e3541dadb8ef3c3ff9cf795db96e26599a0b6b7a'),
('modules/system/system.archiver.inc', 'faa849f3e646a910ab82fd6c8bbf0a4e6b8c60725d7ba81ec0556bd716616cd1'),
('modules/system/system.mail.inc', '3c2c06b55bded609e72add89db41af3bb405d42b9553793acba5fe51be8861d8'),
('modules/system/system.queue.inc', 'caf4feda51bdf7ad62cf782bc23274d367154e51897f2732f07bd06982d85ab1'),
('modules/system/system.tar.inc', '8a31d91f7b3cd7eac25b3fa46e1ed9a8527c39718ba76c3f8c0bbbeaa3aa4086'),
('modules/system/system.test', 'ca539539bea3d2c070552f79dbae279e2872ba9d48af386c89ab6c1fc95488da'),
('modules/system/system.updater.inc', 'e2eeed65b833a6215f807b113f6fb4cc3cc487e93efcb1402ed87c536d2c9ea6'),
('modules/taxonomy/taxonomy.module', '68f8fb4ec2f8e212b2c639dc07175a43682a34e19413dffcf940d43b2eba9413'),
('modules/taxonomy/taxonomy.test', '382c35ed6dfaf5b046a481dae4f16da4ed89bdc12c17d91efa50a9deaa1775ec'),
('modules/update/update.test', '6775fc28b2a9f9f9b6536c5abecf3f4007fbe4c8ea29a08705be9d0579844137'),
('modules/user/user.module', 'e85b89e1dd716dbd77c2f7152a0d9e3fe622ae73ac9ced242beba15999e2d280'),
('modules/user/user.test', '9ea5caaa81214da80156b5282baf88f35cd810f86d7ec12a81495b28aecc8715'),
('sites/all/modules/contrib/backup_migrate/backup_migrate.install', '0e83df95e100a337a1ab2f3579460e05bce9acbf5ff75c834be925a2b2670006'),
('sites/all/modules/contrib/backup_migrate/backup_migrate.module', 'c7ffd42143da94296d6c8df285e49bf90ae12ec72ef55ffea2e94755b1adebb8'),
('sites/all/modules/contrib/backup_migrate/includes/destinations.inc', '7af85c76b5d31fcf771cc8ccaca573e78b298eeb95f1acc44d6e3fd0f8c8d237'),
('sites/all/modules/contrib/backup_migrate/includes/profiles.inc', 'ad2e8010b03445b6c84f2d385ed51c95ca8d40d7883bb9ad54ab6d90a0fa6211'),
('sites/all/modules/contrib/backup_migrate/includes/schedules.inc', 'a8477b1fcc88440d4a490a3095d1c8e228a35995f968c1491ff1379669dabf00'),
('sites/all/modules/contrib/ctools/includes/context.inc', '0c155dc983c1b739ac9c4562684bd6d7d69e4035a7c49b3be32eb813c8f7acc7'),
('sites/all/modules/contrib/ctools/includes/math-expr.inc', '3386323b01da62e02c9f3607cd7f0a0d46f1af90a107a07aed726b1fa8c28235'),
('sites/all/modules/contrib/ctools/includes/stylizer.inc', 'd04102c9076971a712e422ccf4011b7d428f14385501044361fe5b4b6f9f1c6d'),
('sites/all/modules/contrib/ctools/plugins/export_ui/ctools_export_ui.class.php', 'e4a74565ebb5c9cd9c98246790ea36c7b9cd3febd347a5b764736d8460c32d89'),
('sites/all/modules/contrib/demo/database_mysql_dump.inc', '9a22ad998838998eda232db42d500ce5715ad683659d2b069c88103d5762f0e1'),
('sites/all/modules/contrib/demo/demo.admin.inc', '3f05554a8656015b2dff5109f76091fcc0709043c9516494d9a53994865f0ffd'),
('sites/all/modules/contrib/demo/demo.module', 'e7480187e2777fda9abaa861389f76043d677970df5619219018860f3f6b2ce3'),
('sites/all/modules/contrib/devel/devel.mail.inc', 'dbdc696b3e023a588359ec1207ac6997e1abe425ed301d1b1513f68a0abcf9c2'),
('sites/all/modules/contrib/devel/devel.test', '7ee8668c46ce85c9307cf5f35ad2b18a0793dec8455114ee8c05eee36be76302'),
('sites/all/modules/contrib/entity/entity.features.inc', 'b77e91ea988218fd939a4e5f283b2c745d53e39159af5ab770eda6b66fcb33cb'),
('sites/all/modules/contrib/entity/entity.i18n.inc', '41e0e62af7e2774f62b162d597bb3244551c280296b692b29d039a2c243d7059'),
('sites/all/modules/contrib/entity/entity.info.inc', '962cf92c630a2954c4e430164e1d04b8125eb1103dbefb7b954182b4382d072d'),
('sites/all/modules/contrib/entity/entity.rules.inc', '774199059d1b3ebe6d3fe7a49dbb1550df489055a3d066b5de54edda8dd7ba84'),
('sites/all/modules/contrib/entity/entity.test', '80139f908ab540b4a30300c027d33b87ab250bfcf4fb44ec18adae7844b1d635'),
('sites/all/modules/contrib/entity/entity_token.module', '0c1ad6fb6f8c430e47a81be6d08180883c5a1ee728ce8b5dd0775713b34fb862'),
('sites/all/modules/contrib/entity/entity_token.tokens.inc', 'd9246ed9a7d4cfdf16370d3c68f991fb103838b6e2c9682c385d2144629504ee'),
('sites/all/modules/contrib/entity/includes/entity.controller.inc', '26df053bd4866bf94f57d6ae57bf2d7e3230e74723956ad03fd606a05b41ecf5'),
('sites/all/modules/contrib/entity/includes/entity.inc', '71161b01ef9e007fd3d8e40b5ae8652194da7cb208c9f9538b63f90d8f0e6ac7'),
('sites/all/modules/contrib/entity/includes/entity.ui.inc', 'b2bdd28eb3af34cb7c2ff1e58e0cf679d26cfd68cd9414dc3abfbd297443874d'),
('sites/all/modules/contrib/entity/includes/entity.wrapper.inc', 'fb771c3dc1ea5d0444bc97246b4cf0d8a4609fc66d24ed2b0de507dcc8fb776c'),
('sites/all/modules/contrib/entity/views/entity.views.inc', 'c2949770db351bc894ab5d715a3e9c9c97c4477e0c42cd90347160ddd228bbfa'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_field_handler_helper.inc', '69d5ac25d8686ee43be607d682795b2cae0278500392f5f7970ac9f45913ee84'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_area_entity.inc', 'e86aceccf21cbbca4bef7d2c049dc93a8f5a01c6bc73e7b2f92f5659a9eedd03'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_boolean.inc', 'b28b8eee8761ba7a6af35d97ab7aaee28406e6c227271f9769818560626c5791'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_date.inc', 'b0f5be5b399de94934b24e84c8cf6053a043f6b00c60dcffa752daeafdd38778'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_duration.inc', '6a7f83e4ce141428d3d782db0c71f3cf4b141eff4f551b826fef7e52ac728e01'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_entity.inc', 'f0ea06a0d67b0f4f498414def4d0989aad56d97780107b2fbabdaafc807adbf2'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_field.inc', '893121efbce2a7181e31147bade260c9cc657cbd33b0d254cb28b2650e57566d'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_numeric.inc', 'f14e2b063930e8820af381b4f5e83c7278440e7804ab88cfde865b6c94e7c0f6'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_options.inc', '16317359cf59afb290d78eb61228f93dda408081e8c2f88db2f90a60d68d31d6'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_text.inc', 'ae26b8a9a86c36a166644a1f5a9bae0676f535345c092d882df0177ded305bdd'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_field_uri.inc', '79ecaa3eb17dfdd0ca077351b75a2c0adf411ebc04720e7cc0e2397674225f24'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_relationship.inc', 'b69bc538d1e1e0f91f8485ca54c3b6e2be025caa47619734c467377cf89041b9'),
('sites/all/modules/contrib/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc', '25aebf66cd2437bd5867fef8f0e0e25d4308b9ce491cc79801e9d3cbed68bcba'),
('sites/all/modules/contrib/entity/views/plugins/entity_views_plugin_row_entity_view.inc', 'ba557790215f2658146424d933e0d17787a0b15180c5815f23428448ccf056a0'),
('sites/all/modules/contrib/features/tests/features.test', '3e02be511611b8ab3e3edc6420a57ba677d3aedcb0c416d08b85546bfb67e9bf'),
('sites/all/modules/contrib/module_filter/css/module_filter.css', '69609136efe52982305062cdf17756ad168aaf35920b7840ea1323e22b0ea0d0'),
('sites/all/modules/contrib/module_filter/css/module_filter_tab.css', '1789901bbb6bed007fff82895bf6d3ecfed7e237b408930c6c51a1c08e648487'),
('sites/all/modules/contrib/module_filter/js/module_filter.js', '90e47a6803c96a0e61219fd4e39e0e0055d7c8899d7cec2c23095d05e158c8a1'),
('sites/all/modules/contrib/module_filter/js/module_filter_tab.js', 'c0d5c3e74b1eaf0f9a85df654866c15539ffe3eac286a3947481dab8014f8081'),
('sites/all/modules/contrib/module_filter/module_filter.admin.inc', '30b1be9c743e4a4d468c2382cbe74666b45e50cfd9251deb0b1a149357c9d03a'),
('sites/all/modules/contrib/module_filter/module_filter.install', 'b05b0010641a06ed8f5d67403cae6c3a3a27aa687835b8f012136d3f68a3cbb3'),
('sites/all/modules/contrib/module_filter/module_filter.module', 'b84535147bd21ed59818d94c2f7aede7c75d8ea0b334c37d0b9f25912217a4aa'),
('sites/all/modules/contrib/module_filter/module_filter.theme.inc', '1f94a041fbdb8bbd6637a30b57d7aa9a171fdea61a4707eb3e2a0a08c0b497f0'),
('sites/all/modules/contrib/pathauto/pathauto.test', '9204240a755119e02eae68c77e7b9ab816747423ccaaf51742231fbaef1f604f'),
('sites/all/modules/contrib/strongarm/strongarm.admin.inc', '5e50651c629ba2bdc71f73051cd876e91f76d523d6fd4ad1d6d66d1f092d3af4'),
('sites/all/modules/contrib/strongarm/strongarm.install', 'd198563f5fcc7a1b4b9a98c1ed8439d48a6d7d10577cc966d3a55edd06a4a365'),
('sites/all/modules/contrib/strongarm/strongarm.module', '63f5e3a0b255f701768c194049a28030279c16dd521d52e8b101d3a90383cafc'),
('sites/all/modules/contrib/token/token.install', '4dda5878d48025dfc72faeda487f5f28c19318517b37a3da16aacd6e2c08fc2c'),
('sites/all/modules/contrib/token/token.module', '390167879ce366e9cd9fb7657dbc7f12b3adea38965b9769d7eec9554788e44d'),
('sites/all/modules/contrib/token/token.pages.inc', 'aa499251b92fc23e7a3c132e4191e86b04dfe805a0fda72a4a537379da05ceca'),
('sites/all/modules/contrib/token/token.test', '5a6645242bcd29498e995c9dacefc4434eed3c679202c5bea606f766cddf9fef'),
('sites/all/modules/contrib/token/token.tokens.inc', '203fae107b8947b3e8a5762f127d09985fa968feb437f129ca677cd40cf3ff1d'),
('sites/all/modules/contrib/views/handlers/views_handler_area.inc', '38724826fb6634f4d2c430eb8a4ee5e6b1d41f0591c502e23927a69bbfd5ce43'),
('sites/all/modules/contrib/views/handlers/views_handler_area_result.inc', 'ea8067c651c4bcc7c275529153b17d5f98aae2aaa727f0b323e22cccecd56c23'),
('sites/all/modules/contrib/views/handlers/views_handler_area_text.inc', 'c7e1bdcd91a1d5db3ff93f854fdf156021976bbd475039ffe16fb9d9443ec455'),
('sites/all/modules/contrib/views/handlers/views_handler_area_view.inc', 'edbdd64949db641f010955691e338f88dc6c8d5f05ec15c14cc5f7b4461ec0bc'),
('sites/all/modules/contrib/views/handlers/views_handler_argument.inc', 'd8d8a25b7df43c83ac38daef9264a6f85eaa7bd3e9556e79d1e88bdf03ab48be'),
('sites/all/modules/contrib/views/handlers/views_handler_argument_date.inc', '5823b8b88795618ecb48dd3e3831afc7f329af3169a535449fa8a9696e8c6431'),
('sites/all/modules/contrib/views/handlers/views_handler_argument_formula.inc', '1c6c0302525148d7124ee5c8afde9105f06255ff4d2a645b2dfca59336ea2939'),
('sites/all/modules/contrib/views/handlers/views_handler_argument_group_by_numeric.inc', '6c008a379e84c2b68f0e43f4c150150f819a816f1d6ea4a6117dd4738757b15d'),
('sites/all/modules/contrib/views/handlers/views_handler_argument_many_to_one.inc', 'abe661b795db33fc60cafc394fc17b88fd4a0d8326a29255acbdb75a3bf3fd43'),
('sites/all/modules/contrib/views/handlers/views_handler_argument_null.inc', '73a022e90c7a933b5d857680c54f8ab298ad972073780c279f222b75f4d4cd2c'),
('sites/all/modules/contrib/views/handlers/views_handler_argument_numeric.inc', 'a96f4b26dfceb3236a833d2869a518914c6237c9af45b19d0d02b01018b02d36'),
('sites/all/modules/contrib/views/handlers/views_handler_argument_string.inc', '052b0adbb7aafd922c3c0ba7cd8f920a3cd3e7733aeb11ccd0e7a39ed5ee6ec0'),
('sites/all/modules/contrib/views/handlers/views_handler_field.inc', 'd73a4a5c3df4aedb767590e6f63a999626ee102f4cb3462ba87db723c85d6b46'),
('sites/all/modules/contrib/views/handlers/views_handler_field_boolean.inc', '21e7f54c094fb28f8b93236cb40905df3e52920f9f574bec80a3e92e0ee36cd6'),
('sites/all/modules/contrib/views/handlers/views_handler_field_contextual_links.inc', '70f1d244b90a904826886b625964a5994a3e15cf7555cd80e925bd80002b507a'),
('sites/all/modules/contrib/views/handlers/views_handler_field_counter.inc', '2a846f52aae3c017c6f445040ab680de60953382d575412b213ce5b1eaac6cc2'),
('sites/all/modules/contrib/views/handlers/views_handler_field_custom.inc', '264375d30cf7c91ced040fd37d337bd43248cdcf96ca7315548403fa3880b4a8'),
('sites/all/modules/contrib/views/handlers/views_handler_field_date.inc', '5ccbdbfd86799558973219c8c4763284934ed2449f3d00f6353a0b69abcac81f'),
('sites/all/modules/contrib/views/handlers/views_handler_field_entity.inc', 'cdc3240e54bb149b95dab8fc3903570f7dbd5f367b30cc95fb8611d706e6da5d'),
('sites/all/modules/contrib/views/handlers/views_handler_field_machine_name.inc', 'b64013c85b02c107d2c15c26b1c3320fc3ef1f6909730bebe7eb063c8a663cc7'),
('sites/all/modules/contrib/views/handlers/views_handler_field_markup.inc', '3088014e96bf72c591550f4a66719372a92e006b2f370c098c8eaada5b83e51e'),
('sites/all/modules/contrib/views/handlers/views_handler_field_math.inc', '8a9fad407cbf5b172756ae2e6198cb6b73605fb97919e1cce7e05392bab5a15d'),
('sites/all/modules/contrib/views/handlers/views_handler_field_numeric.inc', 'f271285273c27a3064b6af976e7276955caaccadef66c3619dbb03d366b12043'),
('sites/all/modules/contrib/views/handlers/views_handler_field_prerender_list.inc', '9c4e02e69d86c761e3daf42e3cad1b98ef6e673ac32d37a06ec3ac6cbd87c8d7'),
('sites/all/modules/contrib/views/handlers/views_handler_field_serialized.inc', 'e0df3ba002de38f6c9d84faa88123fd3475a0db65280359c247d6660e9504b94'),
('sites/all/modules/contrib/views/handlers/views_handler_field_time_interval.inc', '7ed2d4a5aad1492ceed5a008c23564698bfffef5f7b55371fa413554d457fa17'),
('sites/all/modules/contrib/views/handlers/views_handler_field_url.inc', '62cf62165b8b4647981decd5e552eedb021eba3639e298c5f2405eece53780df'),
('sites/all/modules/contrib/views/handlers/views_handler_filter.inc', 'aa810aa0bd2efaf2b8eaf6c190041eee19bd4cadd7df268dffa271a79bb64b19'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_boolean_operator.inc', 'f8cb5fb8ddc7ce3be39b6f75e9ed8788d6d37a146de7f96d7b04c894b6bd6890'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_boolean_operator_string.inc', 'be9e033d829cf682b3f8815676d34522c605b6d4690ada7aa7ac38fe738994d9'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_date.inc', 'decd76c0d5b728c23ba5a41a19fb0d691f43f77c89b9ec3f851af27c3fef1cc8'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_equality.inc', '0a7c92884ef84877b98410589a3251d8d3f98e934bb352a3c72a311bcae4e4ec'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_group_by_numeric.inc', 'f0569c4137f71c0772b6b1a6b8871c5b7459c9fd863ab3346ae183d183deda45'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_in_operator.inc', 'c6bb59aa0b24cd2fa48bc7ae320de8725aac223b129032a59eb5afd7ff39ddd7'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_many_to_one.inc', 'e9f03d99cb402e73dff587eb1396c8c526819fc17c17b3281ba80d2fa6bb5fad'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_numeric.inc', 'f709fe4410e9450fbccb3efdb0e128d0ae3ed60616d31d05f0b923bb983fe51f'),
('sites/all/modules/contrib/views/handlers/views_handler_filter_string.inc', '876595d4777cdec699154faf110e45fb54019c7017ee58ba775700cef3047e91'),
('sites/all/modules/contrib/views/handlers/views_handler_relationship.inc', '88cff2941680ea83144e3a27aa9e239fa877901abeb490138de36b79fc7899fc'),
('sites/all/modules/contrib/views/handlers/views_handler_relationship_groupwise_max.inc', '89a1bed9b7d47d7566b3dee90215bdbf16ebe5a23497c26ba767fd8a5406d41a'),
('sites/all/modules/contrib/views/handlers/views_handler_sort.inc', '90203164f507d75a689787cc0af200085d88537c66046197cc5a790c99143e62'),
('sites/all/modules/contrib/views/handlers/views_handler_sort_date.inc', '45e7e1a10e8bd3200ad5a8e3acb44c69886988f90f3ac03acf15651505f29ba5'),
('sites/all/modules/contrib/views/handlers/views_handler_sort_group_by_numeric.inc', '07edd49f58658f281b42fd4efdaf066037d61b1447c2be97ea948eb40469de86'),
('sites/all/modules/contrib/views/handlers/views_handler_sort_menu_hierarchy.inc', '6c99b64431cbf92e51488d977060c6a37825019621ce7251ef0a2ebd4faf7863'),
('sites/all/modules/contrib/views/handlers/views_handler_sort_random.inc', 'de222b78b5422dac43677728864f8308a1a9b29f89354467d702db8ff5fdefb6'),
('sites/all/modules/contrib/views/includes/base.inc', '85ece4b3f27da18a7ba6a8814683e1a4e044ee1cc9a468f8fceb4297d2e39aba'),
('sites/all/modules/contrib/views/includes/handlers.inc', '3d2f9b061da848c8f729808e9202be1c4c69e408b570f0b9d676b67e2246fb13'),
('sites/all/modules/contrib/views/includes/plugins.inc', 'fb79c75f6940617f6cc76c85ebd7a7fde75f8eb8de7bdeabafdfd7b6012d8017'),
('sites/all/modules/contrib/views/includes/view.inc', '9b618f93d36c9602a086697560d843dcfa3cee65ca829e0f539506a995566636'),
('sites/all/modules/contrib/views/modules/aggregator/views_handler_argument_aggregator_category_cid.inc', '1e2c6da1659296994b59af832fb41f2f5670030c6cc2b5cd809eebfd0813771b'),
('sites/all/modules/contrib/views/modules/aggregator/views_handler_argument_aggregator_fid.inc', '07b65d57942ae1e88f2f80a399e580f47c8be693abbe212d46081d577ec369b2'),
('sites/all/modules/contrib/views/modules/aggregator/views_handler_argument_aggregator_iid.inc', '15662feb4007640011741ab46ffa65c68d67244300e9c0809a989bc4fefa8082'),
('sites/all/modules/contrib/views/modules/aggregator/views_handler_field_aggregator_category.inc', '956e8419c3c01ada5f7a7c402a1d28819cfbc3f51287ea1edf4ac8d7557c0ced'),
('sites/all/modules/contrib/views/modules/aggregator/views_handler_field_aggregator_title_link.inc', '6fef41eec6979478fe9a29a964ae2683dd8481b0d0c14b1f4a0f6f05d0211627'),
('sites/all/modules/contrib/views/modules/aggregator/views_handler_field_aggregator_xss.inc', 'd2c3c6ab6c8f40d5b8a0de60031701329bc776dea9f4c8354fa05819eaeb811c'),
('sites/all/modules/contrib/views/modules/aggregator/views_handler_filter_aggregator_category_cid.inc', '3e1a3dfca668c1d59b280f10b97d2ca70e8b554efb954c847fba3bba147da518'),
('sites/all/modules/contrib/views/modules/aggregator/views_plugin_row_aggregator_rss.inc', '2b3803d135f43fd0d8ffca491a392ab61c37c3e51913bfa26d93a6db8cf689ca'),
('sites/all/modules/contrib/views/modules/comment/views_handler_argument_comment_user_uid.inc', 'c88a7d7e6baf355f08b991fbc65339ac8ac6153d7960198a4da6a77182b22e1f'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment.inc', '0f4f0bb95c4ffc4612ce12263ee47bd08427c0d5c6fabd6397e8de54366a8a86'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_depth.inc', '923509b84de82c6946cd2b10e37cfe947bc4ac75b0a378ad8baca1c58bb2a45a'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link.inc', 'db3d3e6cb886e3fd54469a8b6fef197552c9e6ef2c053c7b3a5413c25b135807'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_approve.inc', '388736cc5e76f94c9d2199f58363579bda625551b7cc1a41ca3bf53e7aec8644'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_delete.inc', '7fcec33f27c380c8732e07d9e10ace50e315451fd8d277cee13b47ba512eac75'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_edit.inc', '78f42deba35fd6ba2998780b48472d01e42c406c2aaf72e5f9f842034d49dcb4'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_link_reply.inc', 'f35a25e525abb0806e35760c5ac624db36e51368639da5b0472269fe23bda4a1'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_node_link.inc', '144a598cce30cf9c8dfef118c83a18a9109a4a859121d09d011a4486cb844c80'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_comment_username.inc', 'dbc47798f26f2228600938a854c219347928a183bece331eeddf1514c618967e'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_last_comment_timestamp.inc', '3b05bfd2fed0442d9cdc64605611ed5eeee996558723724de5f9274814370c8a'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_ncs_last_comment_name.inc', '678812ab9ffc81db2b7b872212743956eb6f1f1435e81f829862c56f7b379e8b'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_ncs_last_updated.inc', '4bca3e5b8bf968d282dfe80d47c137f8ba201e7e5badfd0506f43fa3d607443f'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_node_comment.inc', 'afedd3e03f195efdb5bd289c805a78dd9efffc118a4708d02aa70afbf234dd31'),
('sites/all/modules/contrib/views/modules/comment/views_handler_field_node_new_comments.inc', '46453ca74895c7a8a4275126e05e3b292bfb202faa1a48573624e8e51250317a'),
('sites/all/modules/contrib/views/modules/comment/views_handler_filter_comment_user_uid.inc', 'dc6b29748e836ece3f019dbd5ce5dd044b6eae4076ced7d80456565f2f5e8bd8'),
('sites/all/modules/contrib/views/modules/comment/views_handler_filter_ncs_last_updated.inc', '5a32c92f5c3b531b0c0ab79c99b8a7ea40326f346a10369dabe1f34068ad60d0'),
('sites/all/modules/contrib/views/modules/comment/views_handler_filter_node_comment.inc', '9ca56f66a8539043a83aa036f3b906ce2bc48357e6efd1c47ada987948c918f6'),
('sites/all/modules/contrib/views/modules/comment/views_handler_sort_comment_thread.inc', '6bc31427734ecc09428862ff5dc0a45db8618ab9df0adfd030ab5fcca4b5dfb7'),
('sites/all/modules/contrib/views/modules/comment/views_handler_sort_ncs_last_comment_name.inc', '5d5e7ec9a91963a0c4d63827e938baec19980673512268eea359b26fe9f27452'),
('sites/all/modules/contrib/views/modules/comment/views_handler_sort_ncs_last_updated.inc', '6a9b1cdf749c56eb7a679d4543dfa05b0f95f4233cb369541041e6f7f866b86e'),
('sites/all/modules/contrib/views/modules/comment/views_plugin_row_comment_rss.inc', 'e8e8068587b2f9b341b2755c3e611197ebfe0267392218bbde52d57a560d6aed'),
('sites/all/modules/contrib/views/modules/comment/views_plugin_row_comment_view.inc', '74bbb78c11e57a5025e4e319d379a583b53ba9c60848c44263cc76fa24355263'),
('sites/all/modules/contrib/views/modules/contact/views_handler_field_contact_link.inc', '14eb20cae2c8954d9698f925f6b3726276f31f0f889d96e6fdcd98f4adcf1879'),
('sites/all/modules/contrib/views/modules/field/views_handler_argument_field_list.inc', '21a945ddabf0d8327b7ac58cc6f24ab8ec01a8e3ac8fd14f529c1ccd30101695'),
('sites/all/modules/contrib/views/modules/field/views_handler_field_field.inc', '0ddbd2e976e13ef5ab56616380f3c621a4f93e6f43c7cbe59d5521286c367694'),
('sites/all/modules/contrib/views/modules/field/views_handler_filter_field_list.inc', 'd16dcda175489fce0dee494800c1cd7a2da138ffe01dc23fec5aae8f8e312020'),
('sites/all/modules/contrib/views/modules/field/views_handler_relationship_entity_reverse.inc', '7ca0265a0c6aa5a8869acd3dd3d1a429e5c00a1f431c80866cbad9424f8c87d1'),
('sites/all/modules/contrib/views/modules/filter/views_handler_field_filter_format_name.inc', 'a8dcb05b4a4c160e236596aa620d0bb9c00f6759dc68b1fd218a000f575e1e7b'),
('sites/all/modules/contrib/views/modules/locale/views_handler_argument_locale_group.inc', 'f3728c0a23a97442577203411f1c8d07c0671711de268fc75a96fb8967553076'),
('sites/all/modules/contrib/views/modules/locale/views_handler_argument_locale_language.inc', 'ec542c661cd144f93267359be52e75d5e924b5e60dc6bed5ff06394471351251'),
('sites/all/modules/contrib/views/modules/locale/views_handler_field_locale_group.inc', '760fa4700e9dab23769cabb756d48ddb031dff12c4d6dea8be4f0bab053bd3e4'),
('sites/all/modules/contrib/views/modules/locale/views_handler_field_locale_language.inc', 'ae0981be36bf46db4b975e137f09c7c573e860ebf4f36369c25a72803c17a837'),
('sites/all/modules/contrib/views/modules/locale/views_handler_field_locale_link_edit.inc', '0077bd6d5322b3de3b7270d9d3e230f9caa2cf1938fe665fff6e9c8cbbdadb77'),
('sites/all/modules/contrib/views/modules/locale/views_handler_filter_locale_group.inc', '7182f4d0fcbfa2ac1f0adcfc16cf2cfbf645789b4a1611e9854520281953266c'),
('sites/all/modules/contrib/views/modules/locale/views_handler_filter_locale_language.inc', '46598e399775dceb845baa8763c3ad4ce86009684addcb85f728888b26de394d'),
('sites/all/modules/contrib/views/modules/locale/views_handler_filter_locale_version.inc', 'c486456fbab4a7f369734b7c4f78c66ebc8fc7efd116761bd06d93a3c5bec2ec'),
('sites/all/modules/contrib/views/modules/node/views_handler_argument_dates_various.inc', '7a5765b8014079f7d94e653697129f61bdf4cf1181a0ee7401b6e29e8f3daa91'),
('sites/all/modules/contrib/views/modules/node/views_handler_argument_node_language.inc', 'd8e60b1e20b1d2245267aee9a4510e2d77af59a4ed126f2ca2eb167809a75258'),
('sites/all/modules/contrib/views/modules/node/views_handler_argument_node_nid.inc', '6cc1552d75e7294acfd5fdbf28b2f390b9df7fdb1658b8667d17a11cd59ab9ea'),
('sites/all/modules/contrib/views/modules/node/views_handler_argument_node_type.inc', '2eb283cad11d49bef3a05cedf7606dc46aca5831a663235b26d1c6b77f059689'),
('sites/all/modules/contrib/views/modules/node/views_handler_argument_node_uid_revision.inc', 'a3cdd9b72d353aa7dcc9433700f18933cb46c684a379d90ef7fa719a1f0414d4'),
('sites/all/modules/contrib/views/modules/node/views_handler_argument_node_vid.inc', '786c911f85782bb86a84060b4e14963bd1ac06095c36e3a5cdd48065fac27acb'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_history_user_timestamp.inc', 'a1306d8d088076499629c7b99fb86f00d26c6eacefff7fcc46cecd08dd54acdb'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node.inc', '6255479f680c89affa7210161be4416f312c2eb6a8f63af7c57678cff0250dbd'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_link.inc', '6408c83bb785a45ca14d6f28301edf0f78657533dd12ae3697a5a5ab59a97d5d'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_link_delete.inc', '48a9c7a9a6a895e600957156dad28b72baa52da9c0d1af3284e6e436781e9f98'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_link_edit.inc', '747ac11e5a3c1bb61559e147ff1eea0205dab136b982ab7196869a1ed16468ba'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_path.inc', 'b9b7440bc1ed05e3cc83e122f5eb00b34de738d29e7b10868232d185150aafff'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_revision.inc', 'db42464cadaae4eb8deb4bebbd500b2d377dfb2cf5d9399fe87c9e01f0dfa247'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_revision_link_delete.inc', '84e03d57fb01c8e839ae6e89edcdd1c2491888c7d062ac93036d132570f694bb'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_revision_link_revert.inc', '1145d1b8e014950fc6af969072268a57c956e6626a948f01c8d3319e9ef8081c'),
('sites/all/modules/contrib/views/modules/node/views_handler_field_node_type.inc', '2e4a86f8f3110776191d18580e5a6293ebc2b6f0610362417aeff85a3ba0a4d1'),
('sites/all/modules/contrib/views/modules/node/views_handler_filter_history_user_timestamp.inc', '4ff02b60652e7dc627e5baa91fa61c032f2857af4c58b58fccd4865d1d6cf48f'),
('sites/all/modules/contrib/views/modules/node/views_handler_filter_node_access.inc', 'c751edd9527477ee0f95389c545220371f7761e10aa25c70d6eecfa908fbd157'),
('sites/all/modules/contrib/views/modules/node/views_handler_filter_node_status.inc', 'f2478237dc9ca71035435f11592e0d075cc4ef96b9c42cb0eda5cffc2f494319'),
('sites/all/modules/contrib/views/modules/node/views_handler_filter_node_type.inc', 'd36304617b444d1d12ae8ebca4700840944bd8e66598537ca27a962070789fb6'),
('sites/all/modules/contrib/views/modules/node/views_handler_filter_node_uid_revision.inc', 'fdd24e4c103d9ef8f9df5ddadd08b15c8095371720f25729b5f416abd41eeb4b'),
('sites/all/modules/contrib/views/modules/node/views_plugin_argument_default_node.inc', '653376a572ae15a748b9cb3e0e06590de53bd2a3afc50d77da89350ec337cfaf'),
('sites/all/modules/contrib/views/modules/node/views_plugin_argument_validate_node.inc', 'd069d549f59a60c54d923d70c4580794180a8454d5531bde70a5baaa6f0ea748'),
('sites/all/modules/contrib/views/modules/node/views_plugin_row_node_rss.inc', '5be3f41fac85a68c4d4cebca1094bff1d1d9e4b7a6e85444e33fcdd3335b36b9'),
('sites/all/modules/contrib/views/modules/node/views_plugin_row_node_view.inc', '5b0bbc28f19ad80a2d0e3b1dfca77da51d0bdf9c50415cb681a55ca28d660ad7'),
('sites/all/modules/contrib/views/modules/profile/views_handler_field_profile_date.inc', '8e491636473dba467ec5d8bfd57c3b42ff3338169dbf64054a0732195d634fb0'),
('sites/all/modules/contrib/views/modules/profile/views_handler_field_profile_list.inc', 'c9a2d1f8b29423da6099c2040704ce35f893ab743fa5fed7467008474c342fa2'),
('sites/all/modules/contrib/views/modules/profile/views_handler_filter_profile_selection.inc', '74c85ece8f3dae715da2498cbfd6aad68da54b990dbe709ca9739ad1c0db1888'),
('sites/all/modules/contrib/views/modules/search/views_handler_argument_search.inc', 'b04a505f4091a094ae87d5dd517827e1029c6feb6dda3ca44e28696610deb311'),
('sites/all/modules/contrib/views/modules/search/views_handler_field_search_score.inc', '9e3c790efb6e371a957be5f6fbd12007de172d5238c4dee632f7fedcecceaa02'),
('sites/all/modules/contrib/views/modules/search/views_handler_filter_search.inc', '2594387903c9f2c7dca48cee33ec28c7f4e3c797209aadc4367df048025166d4'),
('sites/all/modules/contrib/views/modules/search/views_handler_sort_search_score.inc', '1464cc315fea14158e71ee03a58a16f75034b7aba698ee25accef06e66afe15a'),
('sites/all/modules/contrib/views/modules/search/views_plugin_row_search_view.inc', '8b389f6e66dcf18e1a0c6455ba2375450c45cb7a58c4bf7004823fb670906e43'),
('sites/all/modules/contrib/views/modules/statistics/views_handler_field_accesslog_path.inc', 'a6bf9be0857a44843a69533b306165793e61af07d00a1f02283271c69c128afa'),
('sites/all/modules/contrib/views/modules/system/views_handler_argument_file_fid.inc', '0ddd0bcc73f1410601977eaf5953f306f13ee704ef70a6c70b99d838283685f3'),
('sites/all/modules/contrib/views/modules/system/views_handler_field_file.inc', '9004e4e2441e828ead43612b9e6b774ffcb57daa46916d4b10cdd13a952c435b'),
('sites/all/modules/contrib/views/modules/system/views_handler_field_file_extension.inc', 'a8ec5dd4ccc5288383af32375b4d24e94ea4df6ee3fd1ff42214ea3490894306'),
('sites/all/modules/contrib/views/modules/system/views_handler_field_file_filemime.inc', '6bf472e71b3a73d146f2e391029930c4f12aa16a6ca92be813f309fcc895bdc7'),
('sites/all/modules/contrib/views/modules/system/views_handler_field_file_status.inc', 'a61bd1a03540f0955c30b2f1e59c953b136aa253060c8d654b8722b51421967d'),
('sites/all/modules/contrib/views/modules/system/views_handler_field_file_uri.inc', '6b8102905053558df0d322c6e60c7c3d9015cc2868eee19fe84a360c13aee2cb'),
('sites/all/modules/contrib/views/modules/system/views_handler_filter_file_status.inc', '7f025243d3e865dadebc97d106ddde1e9fcde2beaa2b280bc4b59d911d669f9a'),
('sites/all/modules/contrib/views/modules/system/views_handler_filter_system_type.inc', '6eb07619b086adb64568b476a88e7b4ccea01c00dc02e442c658a65a149470cf'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_taxonomy.inc', '982245ed833ef0c74eb740c9ec1f02a81f50501d77ddf1ff2b3f0b284b355dab'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_term_node_tid.inc', '0554538be9c048b03b305d3954a25a5cf06fef580847cd4494dbe219b8a6f071'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_term_node_tid_depth.inc', '83a36b755487997701def69c3b52b8dba0b34a282faed3b41806cc078d311f66'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_modifier.inc', '237efb86ad9d280a45f6954867cc1acf5792f6022572df3b95df41a6171f5d0f'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_vocabulary_machine_name.inc', '1feb84984ead065fd27e3ff545664d9991103196e43ddc7c2dbcbe79add4267f'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_argument_vocabulary_vid.inc', '26c035fecea66e6a52f17032e3208e4756f3727ed46c4203db8645eb7146efa4'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_field_taxonomy.inc', '72b2837b56bdf85ebb1ba1890f14762fafb5441502bec65074cbe63c5ae64265'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_field_term_link_edit.inc', '1fa914a8b3c632f715a5be91706c3dbcc0bb41745aa93a0ab32e901a85b186c8'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_field_term_node_tid.inc', 'eb1f471696dc96a14b8c0ac05e4fc9e6cdb9d2afc62d39db7f653b0156e32754'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_term_node_tid.inc', '3f4a651b2ae6170e7695208163f2446aae2e55dd7dd63f45973f4cec0e9fc04a'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_term_node_tid_depth.inc', '327359e06a4da4710c07ff00e3968ccd2ca54056992c63c12bb4184b3b552c6a'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_vocabulary_machine_name.inc', 'a413ad0653d65c3201136ec04d63404590a298fea527c4145053da5b901b5475'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_filter_vocabulary_vid.inc', 'b359396f18c6ab89b32670b364561675ad6f0611a10af4a660ff7eb0d01b9f56'),
('sites/all/modules/contrib/views/modules/taxonomy/views_handler_relationship_node_term_data.inc', '37f14c45d53facc984c62bb3690997701e8235f2ab30ded8ba8b47d73bb7ba80'),
('sites/all/modules/contrib/views/modules/taxonomy/views_plugin_argument_default_taxonomy_tid.inc', '93b0c8e652d02a8a8b3dc0d5a7528e2c720a6bc9f1cc39b641f619afad12e2c0'),
('sites/all/modules/contrib/views/modules/taxonomy/views_plugin_argument_validate_taxonomy_term.inc', '3ae2e2c44e6b7c20ed8f78977f35aed1d1e02716d358aded9b89352046c26adc'),
('sites/all/modules/contrib/views/modules/translation/views_handler_argument_node_tnid.inc', 'cbc266e896ab4e65a2ee79d84053fe2f5e8959f4931c2b36bc87b9a19d9abca9'),
('sites/all/modules/contrib/views/modules/translation/views_handler_field_node_language.inc', 'a782af2839da625159b37f64472036b1145bfd13000624326d24f0bde8548b25'),
('sites/all/modules/contrib/views/modules/translation/views_handler_field_node_link_translate.inc', '01a32c694991618743c1ab4e5ce97acebecee7db3c7aa689c0cfb5d8ff1e621c'),
('sites/all/modules/contrib/views/modules/translation/views_handler_field_node_translation_link.inc', 'c3b1b7b9494bb355461c837866563732ce205c1ae8507ac221feb69332320ec4'),
('sites/all/modules/contrib/views/modules/translation/views_handler_filter_node_language.inc', '7b8e54048ee13edef311aad84cd88becc761a60829f93d236d4585ec4f8e63e4'),
('sites/all/modules/contrib/views/modules/translation/views_handler_filter_node_tnid.inc', 'b016ab25b1bfdf843815317b3a371fef0f7366606fe3823f581d4c4ca4730018'),
('sites/all/modules/contrib/views/modules/translation/views_handler_filter_node_tnid_child.inc', '28c5d7e2e484d678046fb6cdb6ccddcfe92bae4695f54088af08afe232a877dd'),
('sites/all/modules/contrib/views/modules/translation/views_handler_relationship_translation.inc', '6c3f069393fd4b84440f55c27fa83575187aa1025705a6eb580100065cfddce8'),
('sites/all/modules/contrib/views/modules/upload/views_handler_field_upload_description.inc', 'f00b5562bd81f371d12d2496b2acc0f5dcb581547605801c4fd04c099a578c42'),
('sites/all/modules/contrib/views/modules/upload/views_handler_field_upload_fid.inc', '1c0f5078c03e596869e00d9792e85ee6b5d97b7654503680817d8936e710468d'),
('sites/all/modules/contrib/views/modules/upload/views_handler_filter_upload_fid.inc', 'a4e9de9468a81655982d3e0c54358d847e0e43d4cc80da4ea65d063c5944d73d'),
('sites/all/modules/contrib/views/modules/user/views_handler_argument_users_roles_rid.inc', '353e61cd0770705da9dc5e3c2c78cc07b1b2a6e353b62343765bf17823416433'),
('sites/all/modules/contrib/views/modules/user/views_handler_argument_user_uid.inc', '40bbcd91951233383789c3e78123214796e346a096db73f4293ed54640b9eeb8'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user.inc', '2440bc297a011323da6755cf722bb7b0c52c4d233f4a161f6b44824721c86384'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_language.inc', 'b94a5cb52f3ac61c0ba9c3235d29308814ec3e6540372de9975eb87108135573'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_link.inc', '132a1e5ff54b93bd292a78ac36c04e909950d303ee3201a98320f91e7de508db'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_link_cancel.inc', 'ea5ba61ac096a13c454e5fe189b92cf97a38fd258722a53d6823b4c163876b9d'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_link_edit.inc', '34f87f9f9e5cd8252eafa05c0d40365597b5baa03566235cc45b8a32f3fd978c'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_mail.inc', '456866c64c3502df30ddd20edb15d1f55acf7494187a8c4eb27b91c8beed321c'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_name.inc', 'e97cfaee3c6b196d6f5572ecf10f95fe53c79c6366c345a17f9c4bd881dff60e'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_permissions.inc', '6104522cbf31c17a6ae5e9bdde46a6079f3ce1e377aadf1484d298479078bdb0'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_picture.inc', '7ab2ee03074dd8cd4adebd527a76f68869b50a1b445e80a16d6b40e85922ec70'),
('sites/all/modules/contrib/views/modules/user/views_handler_field_user_roles.inc', '7d905ee7c28dae9f48543943575d56d994b578a0bba6bd32e302cf554586022c'),
('sites/all/modules/contrib/views/modules/user/views_handler_filter_user_current.inc', 'd9e4b21e438e3eb3fc57179fe07fb114316df05c83c53d12409e20f3071e8fb7'),
('sites/all/modules/contrib/views/modules/user/views_handler_filter_user_name.inc', 'da29a3355844a57f5f44a28f0c195d8eaa0ed7044b496eb3d0388dfcc6df6aa0'),
('sites/all/modules/contrib/views/modules/user/views_handler_filter_user_permissions.inc', '50f4974d13b234c18b61b9d8b90b76e8063af652f661a73ad75f3f5dfec45bfe'),
('sites/all/modules/contrib/views/modules/user/views_handler_filter_user_roles.inc', 'd5169b1bf4466386a955226552bedbb73e637e9e27555a21f7c47f88393a1acf'),
('sites/all/modules/contrib/views/modules/user/views_plugin_argument_default_current_user.inc', '79200cf6647c1064bd7474bfe948d777a929f3d2c3709353f6c789468234e364'),
('sites/all/modules/contrib/views/modules/user/views_plugin_argument_default_user.inc', 'fd13f620bcbcd99371747d23c38522f814a64a93849d501990bf5d8e3fa6adfc'),
('sites/all/modules/contrib/views/modules/user/views_plugin_argument_validate_user.inc', '228b698b681bde74e565dd2c66bf4a2feafe3dde5b4b228d6e327d6eb3b57591'),
('sites/all/modules/contrib/views/modules/user/views_plugin_row_user_view.inc', '52548cca3f18d25b06cfce15ee00acea530b85bd22a10944d984b5a798c5969f'),
('sites/all/modules/contrib/views/plugins/export_ui/views_ui.class.php', '6e90fbc82e631c61dbf2c3ac807ae0f2df4c12ab636b8a30d320b44c75bd0b7e'),
('sites/all/modules/contrib/views/plugins/views_plugin_access.inc', 'eb853525c8483b57ce5ed868660359f2ddfcbbf734f20e930620825bda8a16b2'),
('sites/all/modules/contrib/views/plugins/views_plugin_access_none.inc', '76fcb2ee85d8e14ef889082b099a75dd84bb63559162e646353772c7bd954a38'),
('sites/all/modules/contrib/views/plugins/views_plugin_access_perm.inc', 'a645f8ebead301ffa59d0ccae01680eadebbed6b712ec1676bee5909dc64a265'),
('sites/all/modules/contrib/views/plugins/views_plugin_access_role.inc', '23306bd8161a3bb45d86f81db058e729d614f6387ad1eb5e84bf6ec161092ff6'),
('sites/all/modules/contrib/views/plugins/views_plugin_argument_default.inc', '6895e571d11d022db523cc5348524df66a7b0866bd8ccb1175dc72e0f75da979'),
('sites/all/modules/contrib/views/plugins/views_plugin_argument_default_fixed.inc', '1351b921dbfb880cac961c32322c6662a6a8b3bf27f235d8235696b849ef730e'),
('sites/all/modules/contrib/views/plugins/views_plugin_argument_default_php.inc', '9a2b0af3f59d720afb51138f3473ae6880cc51b65101fd1e2be5181ea70d9221'),
('sites/all/modules/contrib/views/plugins/views_plugin_argument_default_raw.inc', '5e4aa88cc6849af5d86074bb7db0892d0cc5211a5fdadb4143d6f60df8088e26'),
('sites/all/modules/contrib/views/plugins/views_plugin_argument_validate.inc', '954b0f0e516f7890ebc3b1b08d2d776a7e1a95b3dee3db5241cfbfeb574c69f0'),
('sites/all/modules/contrib/views/plugins/views_plugin_argument_validate_numeric.inc', '7f95c57de9d1df74ff65ba01ef6c481797d3271382dc6aeadcfb50ebe545345e'),
('sites/all/modules/contrib/views/plugins/views_plugin_argument_validate_php.inc', '7151ff7597cdce3aedbf4863d23d698bc0195bcb796c731268fbbd14f92f9b70'),
('sites/all/modules/contrib/views/plugins/views_plugin_cache.inc', '2b1b7dd4507dde4fb6601a25cff9ef42400d7bdf95c0f4e0a98887bb2f04bce6'),
('sites/all/modules/contrib/views/plugins/views_plugin_cache_none.inc', '0a175ca3f6597a075d5e7a13a2a6d1a7bf87726995687d19d03126f135b77364'),
('sites/all/modules/contrib/views/plugins/views_plugin_cache_time.inc', 'ebeb4e288ccb5a0f1d7e7bb75c5d8a96899634a617326b6c8d01cc2f843da7df'),
('sites/all/modules/contrib/views/plugins/views_plugin_display.inc', 'dcc06aab07e2290b4bb6f51d91cc33a08c98fc18647aed4cb5b58c84f091c6f2'),
('sites/all/modules/contrib/views/plugins/views_plugin_display_attachment.inc', 'da6d1d8c40b14b898896c5d917f009d6666736ea438e1b6137138f0d5ca96068'),
('sites/all/modules/contrib/views/plugins/views_plugin_display_block.inc', 'e95f3cdf809e071fa24c914573252fc9ae77b665b791ee07e584a80feece935c'),
('sites/all/modules/contrib/views/plugins/views_plugin_display_default.inc', '8542aaa29d8be6dd424d7579d6931f2aeb71a21286036bcca7e7966e2e5f7cff'),
('sites/all/modules/contrib/views/plugins/views_plugin_display_extender.inc', 'c07fd5685f633e4bd5a7a46a9d102bba97fc012074f46b0c8f083dbcc98e0b96'),
('sites/all/modules/contrib/views/plugins/views_plugin_display_feed.inc', '4c6539e96cd21b076b34ec18675ffeafe26a178c21184f31a59ce292736171c6'),
('sites/all/modules/contrib/views/plugins/views_plugin_display_page.inc', '67dee83b8845b651dac69650ebfc60340aa19971fb4a7c82aaf56afe82e676ee'),
('sites/all/modules/contrib/views/plugins/views_plugin_exposed_form.inc', 'd56e5ec778224101b3ca8456f72e144d6feadbe5dcfede224271532e81130d18'),
('sites/all/modules/contrib/views/plugins/views_plugin_exposed_form_basic.inc', '0cd6f0c4703fcf075b98e50a5b17f6bd2ad9b83d703416a767c3b47477f77501'),
('sites/all/modules/contrib/views/plugins/views_plugin_exposed_form_input_required.inc', 'a679accb9162d548704f68d253249dbfbdbedabcb8bbbacf731fe92aad814db1'),
('sites/all/modules/contrib/views/plugins/views_plugin_localization.inc', 'd5ab0ef8b15d49c939f6491258430b5e9257ec37419ddcfe3b99fea6f667f21a'),
('sites/all/modules/contrib/views/plugins/views_plugin_localization_core.inc', 'f0900c0640e7c779e9b876223ea395f613c8fe8449f6c8eb5d060e2d54a6afcc'),
('sites/all/modules/contrib/views/plugins/views_plugin_localization_none.inc', '4930c3a13ddc0df3065f4920a836ffdc933b037e1337764e6687d7311f49dd8a');
INSERT INTO `registry_file` VALUES
('sites/all/modules/contrib/views/plugins/views_plugin_pager.inc', '0eedcbdd9cafc8188adc41165cad5f3d1ddbf9315db8a91e920f6bf8003be973'),
('sites/all/modules/contrib/views/plugins/views_plugin_pager_full.inc', 'af6e6c82bae0ec33c53863b34ce002d139d2a918e1684a4408bf8f1148e0d3a5'),
('sites/all/modules/contrib/views/plugins/views_plugin_pager_mini.inc', '627733f65b1d08d20ae03a531c99daacda97df37af9792cf6f3357d9379546ec'),
('sites/all/modules/contrib/views/plugins/views_plugin_pager_none.inc', '30d08bb09cf63ca24e1cab5576e0262702672c193e429252918bb31e39de11b7'),
('sites/all/modules/contrib/views/plugins/views_plugin_pager_some.inc', 'ca7f99097c907fbd7c110cdee084993accde000f12d59e661b7a9753a808fd00'),
('sites/all/modules/contrib/views/plugins/views_plugin_query.inc', '8efc4d7b27771a4e60177a53ff0381dc762b4d47d8cc58bbe3da98714597d694'),
('sites/all/modules/contrib/views/plugins/views_plugin_query_default.inc', 'bfca2ab0195f1fb250464c3b31ff5b49b6964931633eeb224482454297fdeba9'),
('sites/all/modules/contrib/views/plugins/views_plugin_row.inc', '50b10dd4150cfc75a04e431048a65ed05e59250cd587c1e482beaada98ee20cc'),
('sites/all/modules/contrib/views/plugins/views_plugin_row_fields.inc', '8977e0973e786dd09c2200c6b294f9306ce480482a546866ebba6c17f823f486'),
('sites/all/modules/contrib/views/plugins/views_plugin_style.inc', 'a30ab426f90638388be422e40071b81bdfa7f9e946cfa3f28f856d75d38570ef'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_default.inc', '37d4711f237efb201e96e74fe1f1f9d3a32a8adb65fa789bb09b81b8f439b039'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_grid.inc', 'ab5e59a3287c4eff4ffaaedf91bcbd7b1ac091ee1204b5767b8184aff2743788'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_jump_menu.inc', 'ee718836eab271af2b2f42dc75f5bc1fad698632f2a26ff4f2ecc0cd77368b90'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_list.inc', '2d4831c6c55ee9bc415922d6ecb32deff93ff63e5962b6b67e3497fa6965ccc1'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_rss.inc', 'fa1b3b9619c1e2eeb3e0253575a95102ec6595a2ae3d6f5237f2d8e6853a9186'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_summary.inc', '17d143c20fd9f9efea0fe4d70c0e04ee1b4acd18b4fcabae00470d1d70aac0c4'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_summary_jump_menu.inc', 'c67efb6088bf737f4d79c80bdd07a0ef5613be95a80c7cd2c4c1f4e9d140e6f4'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_summary_unformatted.inc', '6e07b64ec8758e309e28303a232932bef4f3843d992de95f1421376677f054a2'),
('sites/all/modules/contrib/views/plugins/views_plugin_style_table.inc', '9c19b95f6df036d100af73ed9a7bacf87770d06a6880b0e7d8906369ac242cb1'),
('sites/all/modules/contrib/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', '0f95fa318e7b472003b93aa7225478948a8995719fbca70b2d8e3db986464758'),
('sites/all/modules/contrib/views/plugins/views_wizard/views_ui_file_managed_views_wizard.class.php', 'b0c72a676dff32fa25b2f7a22df3a0d2dee84a7d004dc44be0265fe9e809c3bc'),
('sites/all/modules/contrib/views/plugins/views_wizard/views_ui_node_revision_views_wizard.class.php', '398d35874dd2d48b491c87319716d276f647c40e7d87c318086776b8f5643d69'),
('sites/all/modules/contrib/views/plugins/views_wizard/views_ui_node_views_wizard.class.php', '6406a99a4c04a651433b46a282aae9bf97fd72f3deaf99fab40fdde3984e5cb9'),
('sites/all/modules/contrib/views/plugins/views_wizard/views_ui_taxonomy_term_views_wizard.class.php', '92b641b8d13d883993150f8d74b43fcb382a520f26c2ef83c1b2c8a86c23e5b1'),
('sites/all/modules/contrib/views/plugins/views_wizard/views_ui_users_views_wizard.class.php', '6419a9e125aefbef0bd13879b4e57ee158f4e0b7d1f05832879054cdbb03833d'),
('sites/all/modules/contrib/views/tests/comment/views_handler_argument_comment_user_uid.test', '83a5528be29cac578cae139e6afb741b5de555a0e42332716555effe61ddd548'),
('sites/all/modules/contrib/views/tests/comment/views_handler_filter_comment_user_uid.test', 'bdb7e9f7a31c17b025363ef7fc1a2f95bad6281990c6ac8759436080727c6bcc'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_area_text.test', '944b1211d872e0342f7e6cda8a8d66cb85adf73c5e0ee6396a22ae3f260b3c0e'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_argument_null.test', 'b12e2b0cc9b7a14424920912c5908ea0aae9fc5be1ae5e892880225d01624292'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field.test', '508ec461e1d7c6eae45fbb83cde0446043d8a87a366c6e5dacb4d0e949c104aa'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_boolean.test', '84e6fe1b125d2fb9429175bbb7b76d07dd05afeb94e31287680e240b9d88d676'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_counter.test', 'bec20808b9c22057de453341809fe01d6b6fffde27c32a803e2d1f345ddfcc02'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_custom.test', 'a13349d6429b35a01e105b25186b7f55469e4b813c5ed8be4a79c58e5dc3a67c'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_date.test', 'a14e4f07ee03e49082d111832c21b86cba83c7abfb7de1859e461e90330bdc40'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_file_size.test', 'a28ede0e98211f2204e3a2ca2c6bfd253c67bd04e22d8474b5b058843fa97340'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_math.test', '0916b7b53ebef9e16a9a45e22123a4a2b1ad8fdd06c0d670db5e2396df86c5c7'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_url.test', '922f7dba511ff4e9d2a24bb4d445265b86a1560b76d097e8d6e0a41cc59a6b29'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_field_xss.test', 'df777917cb8568938ced57578936d92bf4c9e00734868676b94b13bf251c963a'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_filter_date.test', 'a5c510b72d4559878183081622ce268dcf71f42c70a5480a51a214afc6c0ebca'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_filter_equality.test', '05006487eb97c7214aab1e1e8f4d58a8661f678bcd3b691ce9a84c7955bf76fd'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_filter_in_operator.test', '0d5252ce92c4a51182644b5d229e3d6b639526466298a8fcec02a045078530e4'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_filter_numeric.test', '65c67e9c0de483511280742a2bb73ba61fd447a8d8e52bb071d84910760ca672'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_filter_string.test', '93a349a671004b75b41a939623f198974a891bf251f990f1711d07f13ed749e4'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_sort.test', 'f79dbd877823ac5bda4060ef1b308303c59d4a6b5b58447db7d4c2ad142f0f5d'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_sort_date.test', '3fdad803c29ce009b2e129c4b1b19d8043a62ef15611be5d116f28e185edd8a4'),
('sites/all/modules/contrib/views/tests/handlers/views_handler_sort_random.test', '65f455f2a770efde4e91e01885a1b50fc783499b68477ab7214c5dd868fac6c4'),
('sites/all/modules/contrib/views/tests/styles/views_plugin_style.test', 'd77b4d488c4f8929c053cded6e26433c142d6a8d7200de7c373a8b62d91c0a3e'),
('sites/all/modules/contrib/views/tests/styles/views_plugin_style_jump_menu.test', '522296bcfaa74f77787b9b99dcd453a008f029a85c512ce93fa5ab1b183e6d7d'),
('sites/all/modules/contrib/views/tests/test_plugins/views_test_plugin_access_test_dynamic.inc', 'c524281180d91ef1cd256beb615e14a34ec6f44cd7a733a9c7e8e521779bfa21'),
('sites/all/modules/contrib/views/tests/test_plugins/views_test_plugin_access_test_static.inc', 'a1d341165b48dacb4149b4837687e371e81b742c34afa3522168b84e29f2cc50'),
('sites/all/modules/contrib/views/tests/user/views_handler_field_user_name.test', 'a131beaa03883575f68efef7aa5789caa05798e78cf2051a770493d095bf05ae'),
('sites/all/modules/contrib/views/tests/user/views_user.test', '2e9e6cad540ab20e47c4532c047164e9186ed90db5bfa96da73ff997096bc56f'),
('sites/all/modules/contrib/views/tests/user/views_user_argument_default.test', '2a1c7f4bc3c8a3cbdfd7ea2eab1811345cd5053bafe5793f7ace71b28839640f'),
('sites/all/modules/contrib/views/tests/user/views_user_argument_validate.test', '98ce7c348f1e579983ebeb2e1ddc60643e3b262e3a3dcbee1c2da45f7b1ee2dc'),
('sites/all/modules/contrib/views/tests/views_access.test', '1324b42772e38b5cdc079837b33abc25a27ccc9fe26a2bee68c150f035bf8ad1'),
('sites/all/modules/contrib/views/tests/views_analyze.test', '501464be8a5a3800f07d4f03b9244f7174c7a550b10db268a27646701eaea6e7'),
('sites/all/modules/contrib/views/tests/views_argument_default.test', '05372c66b95ce941c2ae2cf763646602ad8075c9f239e43dc7095faf2181f507'),
('sites/all/modules/contrib/views/tests/views_argument_validator.test', 'fb35d39bfea4fc83b14bcaf33b6ed388e618ffa638fbe0c5ea363a40971fdf78'),
('sites/all/modules/contrib/views/tests/views_basic.test', '8237d5e8a554dcbb35ac54db739bf2088bce077e63e9c774a2b7501665bd529a'),
('sites/all/modules/contrib/views/tests/views_cache.test', '10a4ed1f5027d765d1a795d15ab2fe03cc7267cc8569fff77a0bdae72adc93ff'),
('sites/all/modules/contrib/views/tests/views_exposed_form.test', '77e5472b5428594835cc1aa8dd4fc2985a793a3d08b951f2f49e41b9945c7174'),
('sites/all/modules/contrib/views/tests/views_glossary.test', '184432181da26bfbc17c50c1bdfc7c34f5b5a00f4001550895ad826382cf8cd3'),
('sites/all/modules/contrib/views/tests/views_groupby.test', '3009f7519b90410277792a9404d83cdb61942dfa0d958f310862031420ca0c1b'),
('sites/all/modules/contrib/views/tests/views_handlers.test', 'ca465bc554474576e5d0600ca5791c66e240776f8af87490b417b60b069f38e0'),
('sites/all/modules/contrib/views/tests/views_module.test', 'e4ff61004332c0682a001ffd8e197b5a5413160b82f101da3d606f0b0bb9d525'),
('sites/all/modules/contrib/views/tests/views_pager.test', '878e698e4c70e2cad839834bfc9f9e95014e2a46ba4d8ed1425a6c21033e3240'),
('sites/all/modules/contrib/views/tests/views_plugin_localization_test.inc', '2443243936d5b2e560d5e49b371a6511c01a53eb82e6e04ac2032feec0033633'),
('sites/all/modules/contrib/views/tests/views_query.test', '1bba0df04ed8bbfcf8ba1c2ecf30c6bfe7095eb594521bed86871dac11837ce3'),
('sites/all/modules/contrib/views/tests/views_test.views_default.inc', '3fa0e17e35b4b49ad981156768d59e175a8edbca995b423ec78e35a55dc333db'),
('sites/all/modules/contrib/views/tests/views_translatable.test', '4738bcbe52a143bbea66234eb89f918dc29a47e8d7fc1af6f4b3cfc42e8685f0'),
('sites/all/modules/contrib/views/tests/views_ui.test', '2190cd05c1b69107bae060d6d55b7112082d0bdfcfee55b7773933a24ad47fad'),
('sites/all/modules/contrib/views/tests/views_upgrade.test', '152d28c537fb66dbfebf2b38393afc3c0d88b9995ad4ef0b5d39eb4febefd3c7'),
('sites/all/modules/contrib/views/tests/views_view.test', '34f5f0b515353db81ec44839fae85db792955185a33c906fa7918591485d9d15'),
('sites/all/modules/contrib/views/views_ui.module', '111cef03bed51ad0356a5437de2ae2fa05778e2c6945ca6aac07a28be993751f');
/*!40000 ALTER TABLE registry_file ENABLE KEYS */;

--
-- Table structure for table 'role'
--

CREATE TABLE IF NOT EXISTS `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Unique role name.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this role in listings and the user interface.',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_weight` (`name`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores user roles.';

--
-- Dumping data for table 'role'
--

/*!40000 ALTER TABLE role DISABLE KEYS */;
INSERT INTO `role` VALUES
('3', 'administrator', '2'),
('1', 'anonymous user', '0'),
('2', 'authenticated user', '1'),
('4', 'moderator', '3');
/*!40000 ALTER TABLE role ENABLE KEYS */;

--
-- Table structure for table 'role_permission'
--

CREATE TABLE IF NOT EXISTS `role_permission` (
  `rid` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores the permissions assigned to user roles.';

--
-- Dumping data for table 'role_permission'
--

/*!40000 ALTER TABLE role_permission DISABLE KEYS */;
INSERT INTO `role_permission` VALUES
('1', 'access comments', 'comment'),
('1', 'access content', 'node'),
('1', 'use text format filtered_html', 'filter'),
('2', 'access comments', 'comment'),
('2', 'access content', 'node'),
('2', 'post comments', 'comment'),
('2', 'skip comment approval', 'comment'),
('2', 'use text format filtered_html', 'filter'),
('3', 'access administration pages', 'system'),
('3', 'access all views', 'views'),
('3', 'access backup and migrate', 'backup_migrate'),
('3', 'access backup files', 'backup_migrate'),
('3', 'access comments', 'comment'),
('3', 'access content', 'node'),
('3', 'access content overview', 'node'),
('3', 'access contextual links', 'contextual'),
('3', 'access dashboard', 'dashboard'),
('3', 'access devel information', 'devel'),
('3', 'access overlay', 'overlay'),
('3', 'access site in maintenance mode', 'system'),
('3', 'access site reports', 'system'),
('3', 'access toolbar', 'toolbar'),
('3', 'access user profiles', 'user'),
('3', 'administer actions', 'system'),
('3', 'administer backup and migrate', 'backup_migrate'),
('3', 'administer blocks', 'block'),
('3', 'administer comments', 'comment'),
('3', 'administer content types', 'node'),
('3', 'administer demo settings', 'demo'),
('3', 'administer features', 'features'),
('3', 'administer filters', 'filter'),
('3', 'administer image styles', 'image'),
('3', 'administer menu', 'menu'),
('3', 'administer module filter', 'module_filter'),
('3', 'administer modules', 'system'),
('3', 'administer nodes', 'node'),
('3', 'administer page manager', 'page_manager'),
('3', 'administer pathauto', 'pathauto'),
('3', 'administer permissions', 'user'),
('3', 'administer search', 'search'),
('3', 'administer shortcuts', 'shortcut'),
('3', 'administer site configuration', 'system'),
('3', 'administer software updates', 'system'),
('3', 'administer taxonomy', 'taxonomy'),
('3', 'administer themes', 'system'),
('3', 'administer url aliases', 'path'),
('3', 'administer users', 'user'),
('3', 'administer views', 'views'),
('3', 'block IP addresses', 'system'),
('3', 'bypass node access', 'node'),
('3', 'cancel account', 'user'),
('3', 'change own username', 'user'),
('3', 'create article content', 'node'),
('3', 'create page content', 'node'),
('3', 'create url aliases', 'path'),
('3', 'customize shortcut links', 'shortcut'),
('3', 'delete any article content', 'node'),
('3', 'delete any page content', 'node'),
('3', 'delete backup files', 'backup_migrate'),
('3', 'delete own article content', 'node'),
('3', 'delete own page content', 'node'),
('3', 'delete revisions', 'node'),
('3', 'delete terms in 1', 'taxonomy'),
('3', 'edit any article content', 'node'),
('3', 'edit any page content', 'node'),
('3', 'edit own article content', 'node'),
('3', 'edit own comments', 'comment'),
('3', 'edit own page content', 'node'),
('3', 'edit terms in 1', 'taxonomy'),
('3', 'execute php code', 'devel'),
('3', 'manage features', 'features'),
('3', 'notify of path changes', 'pathauto'),
('3', 'perform backup', 'backup_migrate'),
('3', 'post comments', 'comment'),
('3', 'restore from backup', 'backup_migrate'),
('3', 'revert revisions', 'node'),
('3', 'search content', 'search'),
('3', 'select account cancellation method', 'user'),
('3', 'skip comment approval', 'comment'),
('3', 'switch shortcut sets', 'shortcut'),
('3', 'switch users', 'devel'),
('3', 'use advanced search', 'search'),
('3', 'use page manager', 'page_manager'),
('3', 'use text format filtered_html', 'filter'),
('3', 'use text format full_html', 'filter'),
('3', 'view own unpublished content', 'node'),
('3', 'view revisions', 'node'),
('3', 'view the administration theme', 'system'),
('4', 'use text format full_html', 'filter');
/*!40000 ALTER TABLE role_permission ENABLE KEYS */;

--
-- Table structure for table 'search_dataset'
--

CREATE TABLE IF NOT EXISTS `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Search item ID, e.g. node ID for nodes.',
  `type` varchar(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` longtext NOT NULL COMMENT 'List of space-separated words from the item.',
  `reindex` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Set to force node reindexing.',
  PRIMARY KEY (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores items that will be searched.';

--
-- Dumping data for table 'search_dataset'
--

/*!40000 ALTER TABLE search_dataset DISABLE KEYS */;
/*!40000 ALTER TABLE search_dataset ENABLE KEYS */;

--
-- Table structure for table 'search_index'
--

CREATE TABLE IF NOT EXISTS `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float DEFAULT NULL COMMENT 'The numeric score of the word, higher being more important.',
  PRIMARY KEY (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores the search index, associating words, items and...';

--
-- Dumping data for table 'search_index'
--

/*!40000 ALTER TABLE search_index DISABLE KEYS */;
/*!40000 ALTER TABLE search_index ENABLE KEYS */;

--
-- Table structure for table 'search_node_links'
--

CREATE TABLE IF NOT EXISTS `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item containing the link to the node.',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT 'The search_dataset.type of the searchable item containing the link to the node.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid that this item links to.',
  `caption` longtext COMMENT 'The text used to link to the node.nid.',
  PRIMARY KEY (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores items (like nodes) that link to other nodes, used...';

--
-- Dumping data for table 'search_node_links'
--

/*!40000 ALTER TABLE search_node_links DISABLE KEYS */;
/*!40000 ALTER TABLE search_node_links ENABLE KEYS */;

--
-- Table structure for table 'search_total'
--

CREATE TABLE IF NOT EXISTS `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float DEFAULT NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores search totals for words.';

--
-- Dumping data for table 'search_total'
--

/*!40000 ALTER TABLE search_total DISABLE KEYS */;
/*!40000 ALTER TABLE search_total ENABLE KEYS */;

--
-- Table structure for table 'semaphore'
--

CREATE TABLE IF NOT EXISTS `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique name.',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'A value for the semaphore.',
  `expire` double NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.',
  PRIMARY KEY (`name`),
  KEY `value` (`value`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table for holding semaphores, locks, flags, etc. that...';

--
-- Dumping data for table 'semaphore'
--

/*!40000 ALTER TABLE semaphore DISABLE KEYS */;
/*!40000 ALTER TABLE semaphore ENABLE KEYS */;

--
-- Table structure for table 'sequences'
--

CREATE TABLE IF NOT EXISTS `sequences` (
  `value` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.',
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores IDs.';

--
-- Dumping data for table 'sequences'
--

/*!40000 ALTER TABLE sequences DISABLE KEYS */;
INSERT INTO `sequences` VALUES
('4');
/*!40000 ALTER TABLE sequences ENABLE KEYS */;

--
-- Table structure for table 'sessions'
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `uid` int(10) unsigned NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` int(11) NOT NULL DEFAULT '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.',
  PRIMARY KEY (`sid`,`ssid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`),
  KEY `ssid` (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Drupal’s session handlers read and write into the...';

--
-- Dumping data for table 'sessions'
--

/*!40000 ALTER TABLE sessions DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('1', 'HImK2bu3q3iG1sI58sZbkAz77SfANXxbR3-9ykVPizY', '', '127.0.0.1', '1338716441', '0', 'batches|a:2:{i:3;b:1;i:4;b:1;}updates_remaining|a:0:{}');
/*!40000 ALTER TABLE sessions ENABLE KEYS */;

--
-- Table structure for table 'shortcut_set'
--

CREATE TABLE IF NOT EXISTS `shortcut_set` (
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.',
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores information about sets of shortcuts links.';

--
-- Dumping data for table 'shortcut_set'
--

/*!40000 ALTER TABLE shortcut_set DISABLE KEYS */;
INSERT INTO `shortcut_set` VALUES
('shortcut-set-1', 'Default');
/*!40000 ALTER TABLE shortcut_set ENABLE KEYS */;

--
-- Table structure for table 'shortcut_set_users'
--

CREATE TABLE IF NOT EXISTS `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maps users to shortcut sets.';

--
-- Dumping data for table 'shortcut_set_users'
--

/*!40000 ALTER TABLE shortcut_set_users DISABLE KEYS */;
/*!40000 ALTER TABLE shortcut_set_users ENABLE KEYS */;

--
-- Table structure for table 'system'
--

CREATE TABLE IF NOT EXISTS `system` (
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the item; e.g. node.',
  `type` varchar(12) NOT NULL DEFAULT '' COMMENT 'The type of the item, either module, theme, or theme_engine.',
  `owner` varchar(255) NOT NULL DEFAULT '' COMMENT 'A theme’s ’parent’ . Can be either a theme or an engine.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether or not this item is enabled.',
  `bootstrap` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether this module is loaded during Drupal’s early bootstrapping phase (e.g. even before the page cache is consulted).',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1' COMMENT 'The module’s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module’s hook_update_N() function that has either been run or existed when the module was first installed.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  `info` blob COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.',
  PRIMARY KEY (`filename`),
  KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`),
  KEY `type_name` (`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of all modules, themes, and theme engines that are...';

--
-- Dumping data for table 'system'
--

/*!40000 ALTER TABLE system DISABLE KEYS */;
INSERT INTO `system` VALUES
('modules/aggregator/aggregator.module', 'aggregator', 'module', '', '0', '0', -1, '0', 'a:13:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:15:"aggregator.test";}s:9:"configure";s:41:"admin/config/services/aggregator/settings";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:14:"aggregator.css";s:33:"modules/aggregator/aggregator.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/aggregator/tests/aggregator_test.module', 'aggregator_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:23:"Aggregator module tests";s:11:"description";s:46:"Support module for aggregator related testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/block/block.module', 'block', 'module', '', '1', '0', 7008, '-5', 'a:12:{s:4:"name";s:5:"Block";s:11:"description";s:140:"Controls the visual building blocks a page is constructed with. Blocks are boxes of content rendered into an area, or region, of a web page.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:10:"block.test";}s:9:"configure";s:21:"admin/structure/block";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/block/tests/block_test.module', 'block_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Block test";s:11:"description";s:21:"Provides test blocks.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/blog/blog.module', 'blog', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:4:"Blog";s:11:"description";s:25:"Enables multi-user blogs.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:9:"blog.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/book/book.module', 'book', 'module', '', '0', '0', -1, '0', 'a:13:{s:4:"name";s:4:"Book";s:11:"description";s:66:"Allows users to create and organize related content in an outline.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:9:"book.test";}s:9:"configure";s:27:"admin/content/book/settings";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:8:"book.css";s:21:"modules/book/book.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/color/color.module', 'color', 'module', '', '0', '0', 7001, '0', 'a:11:{s:4:"name";s:5:"Color";s:11:"description";s:70:"Allows administrators to change the color scheme of compatible themes.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:10:"color.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/comment/comment.module', 'comment', 'module', '', '0', '0', 7009, '0', 'a:13:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:4:"text";}s:5:"files";a:2:{i:0;s:14:"comment.module";i:1;s:12:"comment.test";}s:9:"configure";s:21:"admin/content/comment";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:11:"comment.css";s:27:"modules/comment/comment.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/contact/contact.module', 'contact', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:12:"contact.test";}s:9:"configure";s:23:"admin/structure/contact";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/contextual/contextual.module', 'contextual', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:16:"Contextual links";s:11:"description";s:75:"Provides contextual links to perform actions related to elements on a page.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:15:"contextual.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/dashboard/dashboard.module', 'dashboard', 'module', '', '0', '0', 0, '0', 'a:12:{s:4:"name";s:9:"Dashboard";s:11:"description";s:136:"Provides a dashboard page in the administrative interface for organizing administrative tasks and tracking information within your site.";s:4:"core";s:3:"7.x";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:5:"files";a:1:{i:0;s:14:"dashboard.test";}s:12:"dependencies";a:1:{i:0;s:5:"block";}s:9:"configure";s:25:"admin/dashboard/customize";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/dblog/dblog.module', 'dblog', 'module', '', '1', '1', 7001, '0', 'a:11:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:10:"dblog.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/field/field.module', 'field', 'module', '', '1', '0', 7002, '0', 'a:13:{s:4:"name";s:5:"Field";s:11:"description";s:57:"Field API to add fields to entities like nodes and users.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:3:{i:0;s:12:"field.module";i:1;s:16:"field.attach.inc";i:2;s:16:"tests/field.test";}s:12:"dependencies";a:1:{i:0;s:17:"field_sql_storage";}s:8:"required";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"theme/field.css";s:29:"modules/field/theme/field.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/field/modules/field_sql_storage/field_sql_storage.module', 'field_sql_storage', 'module', '', '1', '0', 7002, '0', 'a:12:{s:4:"name";s:17:"Field SQL storage";s:11:"description";s:37:"Stores field data in an SQL database.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"field";}s:5:"files";a:1:{i:0;s:22:"field_sql_storage.test";}s:8:"required";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/field/modules/list/list.module', 'list', 'module', '', '1', '0', 7002, '0', 'a:11:{s:4:"name";s:4:"List";s:11:"description";s:69:"Defines list field types. Use with Options to create selection lists.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:2:{i:0;s:5:"field";i:1;s:7:"options";}s:5:"files";a:1:{i:0;s:15:"tests/list.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/field/modules/list/tests/list_test.module', 'list_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:9:"List test";s:11:"description";s:41:"Support module for the List module tests.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/field/modules/number/number.module', 'number', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:6:"Number";s:11:"description";s:28:"Defines numeric field types.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"field";}s:5:"files";a:1:{i:0;s:11:"number.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/field/modules/options/options.module', 'options', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:7:"Options";s:11:"description";s:82:"Defines selection, check box and radio button widgets for text and numeric fields.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"field";}s:5:"files";a:1:{i:0;s:12:"options.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/field/modules/text/text.module', 'text', 'module', '', '1', '0', 7000, '0', 'a:13:{s:4:"name";s:4:"Text";s:11:"description";s:32:"Defines simple text field types.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"field";}s:5:"files";a:1:{i:0;s:9:"text.test";}s:8:"required";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;s:11:"explanation";s:73:"Field type(s) in use - see <a href="/admin/reports/fields">Field list</a>";}'),
('modules/field/tests/field_test.module', 'field_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:14:"Field API Test";s:11:"description";s:39:"Support module for the Field API tests.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:5:"files";a:1:{i:0;s:21:"field_test.entity.inc";}s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/field_ui/field_ui.module', 'field_ui', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:8:"Field UI";s:11:"description";s:33:"User interface for the Field API.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"field";}s:5:"files";a:1:{i:0;s:13:"field_ui.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/file/file.module', 'file', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:4:"File";s:11:"description";s:26:"Defines a file field type.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"field";}s:5:"files";a:1:{i:0;s:15:"tests/file.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/file/tests/file_module_test.module', 'file_module_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:9:"File test";s:11:"description";s:53:"Provides hooks for testing File module functionality.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/filter/filter.module', 'filter', 'module', '', '1', '0', 7010, '0', 'a:13:{s:4:"name";s:6:"Filter";s:11:"description";s:43:"Filters content in preparation for display.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:11:"filter.test";}s:8:"required";b:1;s:9:"configure";s:28:"admin/config/content/formats";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/forum/forum.module', 'forum', 'module', '', '0', '0', -1, '0', 'a:13:{s:4:"name";s:5:"Forum";s:11:"description";s:27:"Provides discussion forums.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:10:"forum.test";}s:9:"configure";s:21:"admin/structure/forum";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"forum.css";s:23:"modules/forum/forum.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/help/help.module', 'help', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:9:"help.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/image/image.module', 'image', 'module', '', '1', '0', 7004, '0', 'a:12:{s:4:"name";s:5:"Image";s:11:"description";s:34:"Provides image manipulation tools.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:4:"file";}s:5:"files";a:1:{i:0;s:10:"image.test";}s:9:"configure";s:31:"admin/config/media/image-styles";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/image/tests/image_module_test.module', 'image_module_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Image test";s:11:"description";s:69:"Provides hook implementations for testing Image module functionality.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:24:"image_module_test.module";}s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/locale/locale.module', 'locale', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:11:"locale.test";}s:9:"configure";s:30:"admin/config/regional/language";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/locale/tests/locale_test.module', 'locale_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Locale Test";s:11:"description";s:42:"Support module for the locale layer tests.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/menu/menu.module', 'menu', 'module', '', '1', '0', 7003, '0', 'a:12:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:9:"menu.test";}s:9:"configure";s:20:"admin/structure/menu";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/node/node.module', 'node', 'module', '', '1', '0', 7013, '0', 'a:14:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:11:"node.module";i:1;s:9:"node.test";}s:8:"required";b:1;s:9:"configure";s:21:"admin/structure/types";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:8:"node.css";s:21:"modules/node/node.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/node/tests/node_access_test.module', 'node_access_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:24:"Node module access tests";s:11:"description";s:43:"Support module for node permission testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/node/tests/node_test.module', 'node_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:17:"Node module tests";s:11:"description";s:40:"Support module for node related testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/node/tests/node_test_exception.module', 'node_test_exception', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:27:"Node module exception tests";s:11:"description";s:50:"Support module for node related exception testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/openid/openid.module', 'openid', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"7.14";s:7:"package";s:4:"Core";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:11:"openid.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/openid/tests/openid_test.module', 'openid_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:21:"OpenID dummy provider";s:11:"description";s:33:"OpenID provider used for testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:6:"openid";}s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/overlay/overlay.module', 'overlay', 'module', '', '0', '0', 0, '0', 'a:11:{s:4:"name";s:7:"Overlay";s:11:"description";s:59:"Displays the Drupal administration interface in an overlay.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/path/path.module', 'path', 'module', '', '1', '0', 0, '0', 'a:12:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:9:"path.test";}s:9:"configure";s:24:"admin/config/search/path";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/php/php.module', 'php', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:8:"php.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/poll/poll.module', 'poll', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:9:"poll.test";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:8:"poll.css";s:21:"modules/poll/poll.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/profile/profile.module', 'profile', 'module', '', '0', '0', -1, '0', 'a:13:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:12:"profile.test";}s:9:"configure";s:27:"admin/config/people/profile";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/rdf/rdf.module', 'rdf', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:3:"RDF";s:11:"description";s:148:"Enriches your content with metadata to let other applications (e.g. search engines, aggregators) better understand its relationships and attributes.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:8:"rdf.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/rdf/tests/rdf_test.module', 'rdf_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:16:"RDF module tests";s:11:"description";s:38:"Support module for RDF module testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/search/search.module', 'search', 'module', '', '0', '0', 7000, '0', 'a:13:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:19:"search.extender.inc";i:1;s:11:"search.test";}s:9:"configure";s:28:"admin/config/search/settings";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"search.css";s:25:"modules/search/search.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/search/tests/search_embedded_form.module', 'search_embedded_form', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:20:"Search embedded form";s:11:"description";s:59:"Support module for search module testing of embedded forms.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/search/tests/search_extra_type.module', 'search_extra_type', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:16:"Test search type";s:11:"description";s:41:"Support module for search module testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/shortcut/shortcut.module', 'shortcut', 'module', '', '1', '0', 0, '0', 'a:12:{s:4:"name";s:8:"Shortcut";s:11:"description";s:60:"Allows users to manage customizable lists of shortcut links.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:13:"shortcut.test";}s:9:"configure";s:36:"admin/config/user-interface/shortcut";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/simpletest/simpletest.module', 'simpletest', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:7:"Testing";s:11:"description";s:53:"Provides a framework for unit and functional testing.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:47:{i:0;s:15:"simpletest.test";i:1;s:24:"drupal_web_test_case.php";i:2;s:18:"tests/actions.test";i:3;s:15:"tests/ajax.test";i:4;s:16:"tests/batch.test";i:5;s:20:"tests/bootstrap.test";i:6;s:16:"tests/cache.test";i:7;s:17:"tests/common.test";i:8;s:24:"tests/database_test.test";i:9;s:32:"tests/entity_crud_hook_test.test";i:10;s:23:"tests/entity_query.test";i:11;s:16:"tests/error.test";i:12;s:15:"tests/file.test";i:13;s:23:"tests/filetransfer.test";i:14;s:15:"tests/form.test";i:15;s:16:"tests/graph.test";i:16;s:16:"tests/image.test";i:17;s:15:"tests/lock.test";i:18;s:15:"tests/mail.test";i:19;s:15:"tests/menu.test";i:20;s:17:"tests/module.test";i:21;s:16:"tests/pager.test";i:22;s:19:"tests/password.test";i:23;s:15:"tests/path.test";i:24;s:19:"tests/registry.test";i:25;s:17:"tests/schema.test";i:26;s:18:"tests/session.test";i:27;s:20:"tests/tablesort.test";i:28;s:16:"tests/theme.test";i:29;s:18:"tests/unicode.test";i:30;s:17:"tests/update.test";i:31;s:17:"tests/xmlrpc.test";i:32;s:26:"tests/upgrade/upgrade.test";i:33;s:34:"tests/upgrade/upgrade.comment.test";i:34;s:31:"tests/upgrade/update.field.test";i:35;s:33:"tests/upgrade/upgrade.filter.test";i:36;s:32:"tests/upgrade/upgrade.forum.test";i:37;s:33:"tests/upgrade/upgrade.locale.test";i:38;s:31:"tests/upgrade/upgrade.menu.test";i:39;s:31:"tests/upgrade/upgrade.node.test";i:40;s:35:"tests/upgrade/upgrade.taxonomy.test";i:41;s:34:"tests/upgrade/upgrade.trigger.test";i:42;s:39:"tests/upgrade/upgrade.translatable.test";i:43;s:33:"tests/upgrade/update.trigger.test";i:44;s:33:"tests/upgrade/upgrade.upload.test";i:45;s:30:"tests/upgrade/update.user.test";i:46;s:31:"tests/upgrade/upgrade.user.test";}s:9:"configure";s:41:"admin/config/development/testing/settings";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/actions_loop_test.module', 'actions_loop_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:17:"Actions loop test";s:11:"description";s:39:"Support module for action loop testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/ajax_forms_test.module', 'ajax_forms_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:26:"AJAX form test mock module";s:11:"description";s:25:"Test for AJAX form calls.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/ajax_test.module', 'ajax_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:9:"AJAX Test";s:11:"description";s:40:"Support module for AJAX framework tests.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/batch_test.module', 'batch_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:14:"Batch API test";s:11:"description";s:35:"Support module for Batch API tests.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/common_test.module', 'common_test', 'module', '', '0', '0', -1, '0', 'a:13:{s:4:"name";s:11:"Common Test";s:11:"description";s:32:"Support module for Common tests.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:15:"common_test.css";s:40:"modules/simpletest/tests/common_test.css";}s:5:"print";a:1:{s:21:"common_test.print.css";s:46:"modules/simpletest/tests/common_test.print.css";}}s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/common_test_cron_helper.module', 'common_test_cron_helper', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:23:"Common Test Cron Helper";s:11:"description";s:56:"Helper module for CronRunTestCase::testCronExceptions().";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/database_test.module', 'database_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:13:"Database Test";s:11:"description";s:40:"Support module for Database layer tests.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/drupal_system_listing_compatible_test/drupal_system_listing_compatible_test.module', 'drupal_system_listing_compatible_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:37:"Drupal system listing compatible test";s:11:"description";s:62:"Support module for testing the drupal_system_listing function.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/drupal_system_listing_incompatible_test/drupal_system_listing_incompatible_test.module', 'drupal_system_listing_incompatible_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:39:"Drupal system listing incompatible test";s:11:"description";s:62:"Support module for testing the drupal_system_listing function.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/entity_cache_test.module', 'entity_cache_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:17:"Entity cache test";s:11:"description";s:40:"Support module for testing entity cache.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:28:"entity_cache_test_dependency";}s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/entity_cache_test_dependency.module', 'entity_cache_test_dependency', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:28:"Entity cache test dependency";s:11:"description";s:51:"Support dependency module for testing entity cache.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/entity_crud_hook_test.module', 'entity_crud_hook_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:22:"Entity CRUD Hooks Test";s:11:"description";s:35:"Support module for CRUD hook tests.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/error_test.module', 'error_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Error test";s:11:"description";s:47:"Support module for error and exception testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/file_test.module', 'file_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:9:"File test";s:11:"description";s:39:"Support module for file handling tests.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:16:"file_test.module";}s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/filter_test.module', 'filter_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:18:"Filter test module";s:11:"description";s:33:"Tests filter hooks and functions.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/form_test.module', 'form_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:12:"FormAPI Test";s:11:"description";s:34:"Support module for Form API tests.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/image_test.module', 'image_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Image test";s:11:"description";s:39:"Support module for image toolkit tests.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/menu_test.module', 'menu_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:15:"Hook menu tests";s:11:"description";s:37:"Support module for menu hook testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/module_test.module', 'module_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Module test";s:11:"description";s:41:"Support module for module system testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/path_test.module', 'path_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:15:"Hook path tests";s:11:"description";s:37:"Support module for path hook testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/requirements1_test.module', 'requirements1_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:19:"Requirements 1 Test";s:11:"description";s:80:"Tests that a module is not installed when it fails hook_requirements(''install'').";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/requirements2_test.module', 'requirements2_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:19:"Requirements 2 Test";s:11:"description";s:98:"Tests that a module is not installed when the one it depends on fails hook_requirements(''install).";s:12:"dependencies";a:2:{i:0;s:18:"requirements1_test";i:1;s:7:"comment";}s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/session_test.module', 'session_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:12:"Session test";s:11:"description";s:40:"Support module for session data testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/system_dependencies_test.module', 'system_dependencies_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:22:"System dependency test";s:11:"description";s:47:"Support module for testing system dependencies.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:12:"dependencies";a:1:{i:0;s:19:"_missing_dependency";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/system_incompatible_core_version_dependencies_test.module', 'system_incompatible_core_version_dependencies_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:50:"System incompatible core version dependencies test";s:11:"description";s:47:"Support module for testing system dependencies.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:12:"dependencies";a:1:{i:0;s:37:"system_incompatible_core_version_test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/system_incompatible_core_version_test.module', 'system_incompatible_core_version_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:37:"System incompatible core version test";s:11:"description";s:47:"Support module for testing system dependencies.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"5.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/system_incompatible_module_version_dependencies_test.module', 'system_incompatible_module_version_dependencies_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:52:"System incompatible module version dependencies test";s:11:"description";s:47:"Support module for testing system dependencies.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:12:"dependencies";a:1:{i:0;s:46:"system_incompatible_module_version_test (>2.0)";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/system_incompatible_module_version_test.module', 'system_incompatible_module_version_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:39:"System incompatible module version test";s:11:"description";s:47:"Support module for testing system dependencies.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/system_test.module', 'system_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"System test";s:11:"description";s:34:"Support module for system testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:18:"system_test.module";}s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/taxonomy_test.module', 'taxonomy_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:20:"Taxonomy test module";s:11:"description";s:45:""Tests functions and hooks not used in core".";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:12:"dependencies";a:1:{i:0;s:8:"taxonomy";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/theme_test.module', 'theme_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Theme test";s:11:"description";s:40:"Support module for theme system testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/update_script_test.module', 'update_script_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:18:"Update script test";s:11:"description";s:41:"Support module for update script testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/update_test_1.module', 'update_test_1', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Update test";s:11:"description";s:34:"Support module for update testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/update_test_2.module', 'update_test_2', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Update test";s:11:"description";s:34:"Support module for update testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/update_test_3.module', 'update_test_3', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Update test";s:11:"description";s:34:"Support module for update testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/url_alter_test.module', 'url_alter_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:15:"Url_alter tests";s:11:"description";s:45:"A support modules for url_alter hook testing.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/simpletest/tests/xmlrpc_test.module', 'xmlrpc_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:12:"XML-RPC Test";s:11:"description";s:75:"Support module for XML-RPC tests according to the validator1 specification.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/statistics/statistics.module', 'statistics', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:15:"statistics.test";}s:9:"configure";s:30:"admin/config/system/statistics";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/syslog/syslog.module', 'syslog', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:11:"syslog.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/system/system.module', 'system', 'module', '', '1', '0', 7073, '0', 'a:13:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:6:{i:0;s:19:"system.archiver.inc";i:1;s:15:"system.mail.inc";i:2;s:16:"system.queue.inc";i:3;s:14:"system.tar.inc";i:4;s:18:"system.updater.inc";i:5;s:11:"system.test";}s:8:"required";b:1;s:9:"configure";s:19:"admin/config/system";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', '1', '0', 7010, '0', 'a:12:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:7:"options";}s:5:"files";a:2:{i:0;s:15:"taxonomy.module";i:1;s:13:"taxonomy.test";}s:9:"configure";s:24:"admin/structure/taxonomy";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/toolbar/toolbar.module', 'toolbar', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:7:"Toolbar";s:11:"description";s:99:"Provides a toolbar that shows the top-level administration menu items and links from other modules.";s:4:"core";s:3:"7.x";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/tracker/tracker.module', 'tracker', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:7:"Tracker";s:11:"description";s:45:"Enables tracking of recent content for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:12:"tracker.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/translation/tests/translation_test.module', 'translation_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:24:"Content Translation Test";s:11:"description";s:49:"Support module for the content translation tests.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/translation/translation.module', 'translation', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:16:"translation.test";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/trigger/tests/trigger_test.module', 'trigger_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:12:"Trigger Test";s:11:"description";s:33:"Support module for Trigger tests.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/trigger/trigger.module', 'trigger', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:12:"trigger.test";}s:9:"configure";s:23:"admin/structure/trigger";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/update/tests/aaa_update_test.module', 'aaa_update_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:15:"AAA Update test";s:11:"description";s:41:"Support module for update module testing.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/update/tests/bbb_update_test.module', 'bbb_update_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:15:"BBB Update test";s:11:"description";s:41:"Support module for update module testing.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/update/tests/ccc_update_test.module', 'ccc_update_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:15:"CCC Update test";s:11:"description";s:41:"Support module for update module testing.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:4:"7.14";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}');
INSERT INTO `system` VALUES
('modules/update/tests/update_test.module', 'update_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Update test";s:11:"description";s:41:"Support module for update module testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/update/update.module', 'update', 'module', '', '1', '0', 7001, '0', 'a:12:{s:4:"name";s:14:"Update manager";s:11:"description";s:104:"Checks for available updates, and can securely install or update modules and themes via a web interface.";s:7:"version";s:4:"7.14";s:7:"package";s:4:"Core";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:11:"update.test";}s:9:"configure";s:30:"admin/reports/updates/settings";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('modules/user/tests/user_form_test.module', 'user_form_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:22:"User module form tests";s:11:"description";s:37:"Support module for user form testing.";s:7:"package";s:7:"Testing";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('modules/user/user.module', 'user', 'module', '', '1', '0', 7018, '0', 'a:14:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:11:"user.module";i:1;s:9:"user.test";}s:8:"required";b:1;s:9:"configure";s:19:"admin/config/people";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:8:"user.css";s:21:"modules/user/user.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('profiles/demo_profile/demo_profile.profile', 'demo_profile', 'module', '', '0', '0', -1, '1000', 'a:14:{s:4:"name";s:18:"Demonstration site";s:11:"description";s:66:"Create a pre-setup and pre-configured Drupal site from a snapshot.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:4:"demo";}s:5:"files";a:1:{i:0;s:20:"demo_profile.profile";}s:7:"version";s:11:"7.x-1.x-dev";s:7:"project";s:12:"demo_profile";s:9:"datestamp";s:10:"1298619105";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;s:6:"hidden";b:1;s:8:"required";b:1;s:17:"distribution_name";s:6:"Drupal";}'),
('profiles/standard/standard.profile', 'standard', 'module', '', '0', '0', 0, '1000', 'a:14:{s:4:"name";s:8:"Standard";s:11:"description";s:51:"Install with commonly used features pre-configured.";s:7:"version";s:4:"7.12";s:4:"core";s:3:"7.x";s:12:"dependencies";a:21:{i:0;s:5:"block";i:1;s:5:"color";i:2;s:7:"comment";i:3;s:10:"contextual";i:4;s:9:"dashboard";i:5;s:4:"help";i:6;s:5:"image";i:7;s:4:"list";i:8;s:4:"menu";i:9;s:6:"number";i:10;s:7:"options";i:11;s:4:"path";i:12;s:8:"taxonomy";i:13;s:5:"dblog";i:14;s:6:"search";i:15;s:8:"shortcut";i:16;s:7:"toolbar";i:17;s:7:"overlay";i:18;s:8:"field_ui";i:19;s:4:"file";i:20;s:3:"rdf";}s:5:"files";a:1:{i:0;s:16:"standard.profile";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1328134560";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;s:6:"hidden";b:1;s:8:"required";b:1;s:17:"distribution_name";s:6:"Drupal";}'),
('sites/all/modules/contrib/backup_migrate/backup_migrate.module', 'backup_migrate', 'module', '', '1', '0', 7203, '0', 'a:12:{s:4:"name";s:18:"Backup and Migrate";s:11:"description";s:75:"Backup or migrate the Drupal Database quickly and without unnecessary data.";s:4:"core";s:3:"7.x";s:5:"files";a:5:{i:0;s:21:"backup_migrate.module";i:1;s:22:"backup_migrate.install";i:2;s:25:"includes/destinations.inc";i:3;s:21:"includes/profiles.inc";i:4;s:22:"includes/schedules.inc";}s:9:"configure";s:34:"admin/config/system/backup_migrate";s:7:"version";s:7:"7.x-2.3";s:7:"project";s:14:"backup_migrate";s:9:"datestamp";s:10:"1336146650";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/block_class/block_class.module', 'block_class', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:11:"Block Class";s:11:"description";s:39:"Allows assigning CSS classes to blocks.";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:19:"block_class.install";i:1;s:18:"block_class.module";}s:7:"version";s:7:"7.x-1.1";s:7:"project";s:11:"block_class";s:9:"datestamp";s:10:"1331079937";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ckeditor/ckeditor.module', 'ckeditor', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:8:"CKEditor";s:11:"description";s:76:"Enables CKEditor (WYSIWYG HTML editor) for use instead of plain text fields.";s:4:"core";s:3:"7.x";s:7:"package";s:14:"User interface";s:9:"configure";s:29:"admin/config/content/ckeditor";s:5:"files";a:1:{i:0;s:26:"includes/ckeditor.user.inc";}s:7:"version";s:7:"7.x-1.9";s:7:"project";s:8:"ckeditor";s:9:"datestamp";s:10:"1334745697";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/colorbox/colorbox.module', 'colorbox', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:8:"Colorbox";s:11:"description";s:63:"A light-weight, customizable lightbox plugin for jQuery 1.4.3+.";s:4:"core";s:3:"7.x";s:9:"configure";s:27:"admin/config/media/colorbox";s:5:"files";a:1:{i:0;s:41:"views/colorbox_handler_field_colorbox.inc";}s:7:"version";s:7:"7.x-1.3";s:7:"project";s:8:"colorbox";s:9:"datestamp";s:10:"1334080546";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/bulk_export/bulk_export.module', 'bulk_export', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:11:"Bulk Export";s:11:"description";s:67:"Performs bulk exporting of data objects known about by Chaos tools.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/ctools.module', 'ctools', 'module', '', '1', '0', 6007, '0', 'a:11:{s:4:"name";s:11:"Chaos tools";s:11:"description";s:46:"A library of helpful tools by Merlin of Chaos.";s:4:"core";s:3:"7.x";s:7:"package";s:16:"Chaos tool suite";s:5:"files";a:3:{i:0;s:20:"includes/context.inc";i:1;s:22:"includes/math-expr.inc";i:2;s:21:"includes/stylizer.inc";}s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/ctools_access_ruleset/ctools_access_ruleset.module', 'ctools_access_ruleset', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:15:"Custom rulesets";s:11:"description";s:81:"Create custom, exportable, reusable access rulesets for applications like Panels.";s:4:"core";s:3:"7.x";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/ctools_ajax_sample/ctools_ajax_sample.module', 'ctools_ajax_sample', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:33:"Chaos Tools (CTools) AJAX Example";s:11:"description";s:41:"Shows how to use the power of Chaos AJAX.";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/ctools_custom_content/ctools_custom_content.module', 'ctools_custom_content', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:20:"Custom content panes";s:11:"description";s:79:"Create custom, exportable, reusable content panes for applications like Panels.";s:4:"core";s:3:"7.x";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/ctools_plugin_example/ctools_plugin_example.module', 'ctools_plugin_example', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:35:"Chaos Tools (CTools) Plugin Example";s:11:"description";s:75:"Shows how an external module can provide ctools plugins (for Panels, etc.).";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:4:{i:0;s:6:"ctools";i:1;s:6:"panels";i:2;s:12:"page_manager";i:3;s:13:"advanced_help";}s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/page_manager/page_manager.module', 'page_manager', 'module', '', '1', '0', 0, '99', 'a:11:{s:4:"name";s:12:"Page manager";s:11:"description";s:54:"Provides a UI and API to manage pages within the site.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"package";s:16:"Chaos tool suite";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/stylizer/stylizer.module', 'stylizer', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:8:"Stylizer";s:11:"description";s:53:"Create custom styles for applications such as Panels.";s:4:"core";s:3:"7.x";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:2:{i:0;s:6:"ctools";i:1;s:5:"color";}s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/tests/ctools_plugin_test.module', 'ctools_plugin_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:24:"Chaos tools plugins test";s:11:"description";s:42:"Provides hooks for testing ctools plugins.";s:7:"package";s:16:"Chaos tool suite";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:5:"files";a:2:{i:0;s:19:"ctools.plugins.test";i:1;s:17:"object_cache.test";}s:6:"hidden";b:1;s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/ctools/views_content/views_content.module', 'views_content', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:19:"Views content panes";s:11:"description";s:104:"Allows Views content to be used in Panels, Dashboard and other modules which use the CTools Content API.";s:7:"package";s:16:"Chaos tool suite";s:12:"dependencies";a:2:{i:0;s:6:"ctools";i:1;s:5:"views";}s:4:"core";s:3:"7.x";s:5:"files";a:3:{i:0;s:61:"plugins/views/views_content_plugin_display_ctools_context.inc";i:1;s:57:"plugins/views/views_content_plugin_display_panel_pane.inc";i:2;s:59:"plugins/views/views_content_plugin_style_ctools_context.inc";}s:7:"version";s:7:"7.x-1.0";s:7:"project";s:6:"ctools";s:9:"datestamp";s:10:"1332962446";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date.module', 'date', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:4:"Date";s:11:"description";s:33:"Makes date/time fields available.";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:3:"php";s:3:"5.2";s:5:"files";a:5:{i:0;s:19:"tests/date_api.test";i:1;s:15:"tests/date.test";i:2;s:21:"tests/date_field.test";i:3;s:26:"tests/date_validation.test";i:4;s:24:"tests/date_timezone.test";}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_all_day/date_all_day.module', 'date_all_day', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:12:"Date All Day";s:11:"description";s:142:"Adds ''All Day'' functionality to date fields, including an ''All Day'' theme and ''All Day'' checkboxes for the Date select and Date popup widgets.";s:12:"dependencies";a:2:{i:0;s:8:"date_api";i:1;s:4:"date";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_api/date_api.module', 'date_api', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:8:"Date API";s:11:"description";s:45:"A Date API that can be used by other modules.";s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:3:"php";s:3:"5.2";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:8:"date.css";s:48:"sites/all/modules/contrib/date/date_api/date.css";}}s:5:"files";a:2:{i:0;s:15:"date_api.module";i:1;s:16:"date_api_sql.inc";}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:12:"dependencies";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_context/date_context.module', 'date_context', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:12:"Date Context";s:11:"description";s:99:"Adds an option to the Context module to set a context condition based on the value of a date field.";s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:12:"dependencies";a:2:{i:0;s:4:"date";i:1;s:7:"context";}s:5:"files";a:2:{i:0;s:19:"date_context.module";i:1;s:39:"plugins/date_context_date_condition.inc";}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_migrate/date_migrate.module', 'date_migrate', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:14:"Date Migration";s:11:"description";s:72:"Provides support for importing into date fields with the Migrate module.";s:4:"core";s:3:"7.x";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:2:{i:0;s:7:"migrate";i:1;s:4:"date";}s:5:"files";a:2:{i:0;s:16:"date.migrate.inc";i:1;s:17:"date_migrate.test";}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_migrate/date_migrate_example/date_migrate_example.module', 'date_migrate_example', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"core";s:3:"7.x";s:12:"dependencies";a:6:{i:0;s:4:"date";i:1;s:11:"date_repeat";i:2;s:17:"date_repeat_field";i:3;s:12:"date_migrate";i:4;s:8:"features";i:5;s:7:"migrate";}s:11:"description";s:42:"Examples of migrating with the Date module";s:8:"features";a:2:{s:5:"field";a:8:{i:0;s:30:"node-date_migrate_example-body";i:1;s:36:"node-date_migrate_example-field_date";i:2;s:42:"node-date_migrate_example-field_date_range";i:3;s:43:"node-date_migrate_example-field_date_repeat";i:4;s:41:"node-date_migrate_example-field_datestamp";i:5;s:47:"node-date_migrate_example-field_datestamp_range";i:6;s:40:"node-date_migrate_example-field_datetime";i:7;s:46:"node-date_migrate_example-field_datetime_range";}s:4:"node";a:1:{i:0;s:20:"date_migrate_example";}}s:5:"files";a:1:{i:0;s:32:"date_migrate_example.migrate.inc";}s:4:"name";s:22:"Date Migration Example";s:7:"package";s:8:"Features";s:7:"project";s:4:"date";s:7:"version";s:7:"7.x-2.5";s:9:"datestamp";s:10:"1334835098";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_popup/date_popup.module', 'date_popup', 'module', '', '0', '0', -1, '0', 'a:13:{s:4:"name";s:10:"Date Popup";s:11:"description";s:84:"Enables jquery popup calendars and time entry widgets for selecting dates and times.";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:9:"configure";s:28:"admin/config/date/date_popup";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:25:"themes/datepicker.1.7.css";s:67:"sites/all/modules/contrib/date/date_popup/themes/datepicker.1.7.css";}}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_repeat/date_repeat.module', 'date_repeat', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:15:"Date Repeat API";s:11:"description";s:73:"A Date Repeat API to calculate repeating dates and times from iCal rules.";s:12:"dependencies";a:1:{i:0;s:8:"date_api";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:3:"php";s:3:"5.2";s:5:"files";a:2:{i:0;s:22:"tests/date_repeat.test";i:1;s:27:"tests/date_repeat_form.test";}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_repeat_field/date_repeat_field.module', 'date_repeat_field', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:17:"Date Repeat Field";s:11:"description";s:97:"Creates the option of Repeating date fields and manages Date fields that use the Date Repeat API.";s:12:"dependencies";a:3:{i:0;s:8:"date_api";i:1;s:4:"date";i:2;s:11:"date_repeat";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:21:"date_repeat_field.css";s:70:"sites/all/modules/contrib/date/date_repeat_field/date_repeat_field.css";}}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_tools/date_tools.module', 'date_tools', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Date Tools";s:11:"description";s:52:"Tools to import and auto-create dates and calendars.";s:12:"dependencies";a:1:{i:0;s:4:"date";}s:7:"package";s:9:"Date/Time";s:4:"core";s:3:"7.x";s:9:"configure";s:23:"admin/config/date/tools";s:5:"files";a:1:{i:0;s:21:"tests/date_tools.test";}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/date/date_views/date_views.module', 'date_views', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:10:"Date Views";s:11:"description";s:57:"Views integration for date fields and date functionality.";s:7:"package";s:9:"Date/Time";s:12:"dependencies";a:2:{i:0;s:8:"date_api";i:1;s:5:"views";}s:4:"core";s:3:"7.x";s:3:"php";s:3:"5.2";s:5:"files";a:7:{i:0;s:40:"includes/date_views_argument_handler.inc";i:1;s:47:"includes/date_views_argument_handler_simple.inc";i:2;s:38:"includes/date_views_filter_handler.inc";i:3;s:45:"includes/date_views_filter_handler_simple.inc";i:4;s:37:"includes/date_views.views_default.inc";i:5;s:29:"includes/date_views.views.inc";i:6;s:36:"includes/date_views_plugin_pager.inc";}s:7:"version";s:7:"7.x-2.5";s:7:"project";s:4:"date";s:9:"datestamp";s:10:"1334835098";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/demo/demo.module', 'demo', 'module', '', '1', '0', 6100, '0', 'a:12:{s:4:"name";s:18:"Demonstration site";s:11:"description";s:74:"Create snapshots and reset the site for demonstration or testing purposes.";s:7:"package";s:11:"Development";s:4:"core";s:3:"7.x";s:9:"configure";s:20:"admin/structure/demo";s:5:"files";a:3:{i:0;s:11:"demo.module";i:1;s:14:"demo.admin.inc";i:2;s:23:"database_mysql_dump.inc";}s:7:"version";s:13:"7.x-1.0+6-dev";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1338034161";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/demo/demo_reset.module', 'demo_reset', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:24:"Demonstration site reset";s:11:"description";s:176:"Allows to reset the site on cron runs and to <strong>reset the site WITHOUT CONFIRMATION.</strong> Only supposed to be used on public demonstration sites. Use at your own risk.";s:7:"package";s:11:"Development";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:4:"demo";}s:5:"files";a:1:{i:0;s:17:"demo_reset.module";}s:7:"version";s:13:"7.x-1.0+6-dev";s:7:"project";s:4:"demo";s:9:"datestamp";s:10:"1338034161";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/devel/devel.module', 'devel', 'module', '', '1', '1', 7003, '88', 'a:13:{s:4:"name";s:5:"Devel";s:11:"description";s:52:"Various blocks, pages, and functions for developers.";s:7:"package";s:11:"Development";s:4:"core";s:3:"7.x";s:9:"configure";s:30:"admin/config/development/devel";s:4:"tags";a:1:{i:0;s:9:"developer";}s:5:"files";a:2:{i:0;s:10:"devel.test";i:1;s:14:"devel.mail.inc";}s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/devel/devel_generate/devel_generate.module', 'devel_generate', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:14:"Devel generate";s:11:"description";s:48:"Generate dummy users, nodes, and taxonomy terms.";s:7:"package";s:11:"Development";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"devel";}s:4:"tags";a:1:{i:0;s:9:"developer";}s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/devel/devel_node_access.module', 'devel_node_access', 'module', '', '0', '0', -1, '0', 'a:13:{s:4:"name";s:17:"Devel node access";s:11:"description";s:68:"Developer blocks and page illustrating relevant node_access records.";s:7:"package";s:11:"Development";s:12:"dependencies";a:1:{i:0;s:4:"menu";}s:4:"core";s:3:"7.x";s:9:"configure";s:30:"admin/config/development/devel";s:4:"tags";a:1:{i:0;s:9:"developer";}s:7:"version";s:7:"7.x-1.2";s:7:"project";s:5:"devel";s:9:"datestamp";s:10:"1311355316";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/entity/entity.module', 'entity', 'module', '', '1', '0', 7002, '0', 'a:11:{s:4:"name";s:10:"Entity API";s:11:"description";s:69:"Enables modules to work with any entity type and to provide entities.";s:4:"core";s:3:"7.x";s:5:"files";a:24:{i:0;s:19:"entity.features.inc";i:1;s:15:"entity.i18n.inc";i:2;s:15:"entity.info.inc";i:3;s:16:"entity.rules.inc";i:4;s:11:"entity.test";i:5;s:19:"includes/entity.inc";i:6;s:30:"includes/entity.controller.inc";i:7;s:22:"includes/entity.ui.inc";i:8;s:27:"includes/entity.wrapper.inc";i:9;s:22:"views/entity.views.inc";i:10;s:52:"views/handlers/entity_views_field_handler_helper.inc";i:11;s:51:"views/handlers/entity_views_handler_area_entity.inc";i:12;s:53:"views/handlers/entity_views_handler_field_boolean.inc";i:13;s:50:"views/handlers/entity_views_handler_field_date.inc";i:14;s:54:"views/handlers/entity_views_handler_field_duration.inc";i:15;s:52:"views/handlers/entity_views_handler_field_entity.inc";i:16;s:51:"views/handlers/entity_views_handler_field_field.inc";i:17;s:53:"views/handlers/entity_views_handler_field_numeric.inc";i:18;s:53:"views/handlers/entity_views_handler_field_options.inc";i:19;s:50:"views/handlers/entity_views_handler_field_text.inc";i:20;s:49:"views/handlers/entity_views_handler_field_uri.inc";i:21;s:62:"views/handlers/entity_views_handler_relationship_by_bundle.inc";i:22;s:52:"views/handlers/entity_views_handler_relationship.inc";i:23;s:53:"views/plugins/entity_views_plugin_row_entity_view.inc";}s:7:"version";s:11:"7.x-1.0-rc3";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1337981155";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/entity/entity_token.module', 'entity_token', 'module', '', '1', '0', 0, '0', 'a:11:{s:4:"name";s:13:"Entity tokens";s:11:"description";s:99:"Provides token replacements for all properties that have no tokens and are known to the entity API.";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:23:"entity_token.tokens.inc";i:1;s:19:"entity_token.module";}s:12:"dependencies";a:1:{i:0;s:6:"entity";}s:7:"version";s:11:"7.x-1.0-rc3";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1337981155";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/entity/tests/entity_feature.module', 'entity_feature', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:21:"Entity feature module";s:11:"description";s:31:"Provides some entities in code.";s:7:"version";s:11:"7.x-1.0-rc3";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:21:"entity_feature.module";}s:12:"dependencies";a:1:{i:0;s:11:"entity_test";}s:6:"hidden";b:1;s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1337981155";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/entity/tests/entity_test.module', 'entity_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:23:"Entity CRUD test module";s:11:"description";s:46:"Provides entity types based upon the CRUD API.";s:7:"version";s:11:"7.x-1.0-rc3";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:18:"entity_test.module";i:1;s:19:"entity_test.install";}s:12:"dependencies";a:1:{i:0;s:6:"entity";}s:6:"hidden";b:1;s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1337981155";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/entity/tests/entity_test_i18n.module', 'entity_test_i18n', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:28:"Entity-test type translation";s:11:"description";s:37:"Allows translating entity-test types.";s:12:"dependencies";a:2:{i:0;s:11:"entity_test";i:1;s:11:"i18n_string";}s:7:"package";s:35:"Multilingual - Internationalization";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:11:"7.x-1.0-rc3";s:7:"project";s:6:"entity";s:9:"datestamp";s:10:"1337981155";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/features/features.module', 'features', 'module', '', '1', '0', 6101, '20', 'a:11:{s:4:"name";s:8:"Features";s:11:"description";s:39:"Provides feature management for Drupal.";s:4:"core";s:3:"7.x";s:7:"package";s:8:"Features";s:5:"files";a:1:{i:0;s:19:"tests/features.test";}s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1334345807";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/features/tests/features_test.module', 'features_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:14:"Features Tests";s:11:"description";s:33:"Test module for Features testing.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Testing";s:3:"php";s:5:"5.2.0";s:12:"dependencies";a:4:{i:0;s:8:"features";i:1;s:5:"image";i:2;s:9:"strongarm";i:3;s:5:"views";}s:8:"features";a:7:{s:6:"ctools";a:2:{i:0;s:21:"strongarm:strongarm:1";i:1;s:23:"views:views_default:3.0";}s:5:"field";a:1:{i:0;s:38:"node-features_test-field_features_test";}s:6:"filter";a:1:{i:0;s:13:"features_test";}s:5:"image";a:1:{i:0;s:13:"features_test";}s:4:"node";a:1:{i:0;s:13:"features_test";}s:15:"user_permission";a:1:{i:0;s:28:"create features_test content";}s:10:"views_view";a:1:{i:0;s:13:"features_test";}}s:7:"version";s:11:"7.x-1.0-rc2";s:7:"project";s:8:"features";s:9:"datestamp";s:10:"1334345807";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/filefield_sources/filefield_sources.module', 'filefield_sources', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:18:"File Field Sources";s:11:"description";s:91:"Extends File fields to allow referencing of existing files, remote files, and server files.";s:12:"dependencies";a:1:{i:0;s:4:"file";}s:7:"package";s:6:"Fields";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-1.4";s:7:"project";s:17:"filefield_sources";s:9:"datestamp";s:10:"1304045215";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/flood_control/flood_control.module', 'flood_control', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:13:"Flood control";s:11:"description";s:43:"Interface for hidden flood control options.";s:4:"core";s:3:"7.x";s:9:"configure";s:33:"admin/config/system/flood-control";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:13:"flood_control";s:9:"datestamp";s:10:"1295633801";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/globalredirect/globalredirect.module', 'globalredirect', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:15:"Global Redirect";s:11:"description";s:129:"Searches for an alias of the current URL and 301 redirects if found. Stops duplicate content arising when path module is enabled.";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:19:"globalredirect.test";}s:9:"configure";s:34:"admin/config/system/globalredirect";s:7:"version";s:7:"7.x-1.4";s:7:"project";s:14:"globalredirect";s:9:"datestamp";s:10:"1324428083";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/google_analytics/googleanalytics.module', 'googleanalytics', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:16:"Google Analytics";s:11:"description";s:102:"Allows your site to be tracked by Google Analytics by adding a Javascript tracking code to every page.";s:4:"core";s:3:"7.x";s:7:"package";s:10:"Statistics";s:9:"configure";s:35:"admin/config/system/googleanalytics";s:5:"files";a:1:{i:0;s:20:"googleanalytics.test";}s:7:"version";s:7:"7.x-1.2";s:7:"project";s:16:"google_analytics";s:9:"datestamp";s:10:"1301340367";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/imce/imce.module', 'imce', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:4:"IMCE";s:11:"description";s:82:"An image/file uploader and browser supporting personal directories and user quota.";s:4:"core";s:3:"7.x";s:7:"package";s:5:"Media";s:9:"configure";s:23:"admin/config/media/imce";s:7:"version";s:7:"7.x-1.5";s:7:"project";s:4:"imce";s:9:"datestamp";s:10:"1319104232";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/l10n_update/l10n_update.module', 'l10n_update', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:19:"Localization update";s:11:"description";s:58:"Provides automatic downloads and updates for translations.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:4:"core";s:3:"7.x";s:7:"package";s:12:"Multilingual";s:5:"files";a:11:{i:0;s:21:"l10n_update.admin.inc";i:1;s:19:"l10n_update.api.php";i:2;s:21:"l10n_update.batch.inc";i:3;s:21:"l10n_update.check.inc";i:4;s:21:"l10n_update.drush.inc";i:5;s:15:"l10n_update.inc";i:6;s:19:"l10n_update.install";i:7;s:22:"l10n_update.locale.inc";i:8;s:18:"l10n_update.module";i:9;s:22:"l10n_update.parser.inc";i:10;s:23:"l10n_update.project.inc";}s:7:"version";s:13:"7.x-1.0-beta3";s:7:"project";s:11:"l10n_update";s:9:"datestamp";s:10:"1328563848";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/less/less.module', 'less', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:21:"LESS CSS Preprocessor";s:11:"description";s:43:"Allows themes or modules to use LESS files.";s:4:"core";s:3:"7.x";s:9:"configure";s:29:"admin/config/development/less";s:7:"version";s:7:"7.x-2.4";s:7:"project";s:4:"less";s:9:"datestamp";s:10:"1310685419";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/libraries/libraries.module', 'libraries', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:9:"Libraries";s:11:"description";s:64:"Allows version dependent and shared usage of external libraries.";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:9:"libraries";s:9:"datestamp";s:10:"1296096156";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/menu_block/menu_block.module', 'menu_block', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Menu Block";s:11:"description";s:43:"Provides configurable blocks of menu items.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:12:"menu (>7.11)";}s:5:"files";a:7:{i:0;s:17:"menu_block.module";i:1;s:20:"menu_block.admin.inc";i:2;s:21:"menu_block.follow.inc";i:3;s:20:"menu_block.pages.inc";i:4;s:19:"menu_block.sort.inc";i:5;s:18:"menu_block.install";i:6;s:45:"plugins/content_types/menu_tree/menu_tree.inc";}s:9:"configure";s:38:"admin/config/user-interface/menu-block";s:7:"version";s:7:"7.x-2.3";s:7:"project";s:10:"menu_block";s:9:"datestamp";s:10:"1328286646";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/menu_block/menu_block_export.module', 'menu_block_export', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:17:"Menu Block Export";s:11:"description";s:48:"Provides export interface for Menu block module.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:10:"menu_block";}s:5:"files";a:2:{i:0;s:24:"menu_block_export.module";i:1;s:27:"menu_block_export.admin.inc";}s:9:"configure";s:45:"admin/config/user-interface/menu-block/export";s:7:"version";s:7:"7.x-2.3";s:7:"project";s:10:"menu_block";s:9:"datestamp";s:10:"1328286646";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/module_filter/module_filter.module', 'module_filter', 'module', '', '1', '0', 7100, '0', 'a:12:{s:4:"name";s:13:"Module filter";s:11:"description";s:24:"Filter the modules list.";s:4:"core";s:3:"7.x";s:5:"files";a:9:{i:0;s:21:"module_filter.install";i:1;s:16:"module_filter.js";i:2;s:20:"module_filter.module";i:3;s:23:"module_filter.admin.inc";i:4;s:23:"module_filter.theme.inc";i:5;s:21:"css/module_filter.css";i:6;s:25:"css/module_filter_tab.css";i:7;s:19:"js/module_filter.js";i:8;s:23:"js/module_filter_tab.js";}s:9:"configure";s:40:"admin/config/user-interface/modulefilter";s:7:"version";s:7:"7.x-1.6";s:7:"project";s:13:"module_filter";s:9:"datestamp";s:10:"1316105205";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/nocurrent_pass/nocurrent_pass.module', 'nocurrent_pass', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:19:"No Current Password";s:11:"description";s:71:"Make the "current password" requirement on the user edit form optional.";s:7:"package";s:5:"Other";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-1.0";s:7:"project";s:14:"nocurrent_pass";s:9:"datestamp";s:10:"1328692247";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/panels/panels.module', 'panels', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:6:"Panels";s:11:"description";s:107:"Core Panels display functions; provides no external UI, at least one other Panels module should be enabled.";s:4:"core";s:3:"7.x";s:7:"package";s:6:"Panels";s:9:"configure";s:22:"admin/structure/panels";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:5:"files";a:5:{i:0;s:13:"panels.module";i:1;s:19:"includes/common.inc";i:2;s:19:"includes/legacy.inc";i:3;s:20:"includes/plugins.inc";i:4;s:48:"plugins/views/panels_views_plugin_row_fields.inc";}s:7:"version";s:7:"7.x-3.2";s:7:"project";s:6:"panels";s:9:"datestamp";s:10:"1332079243";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/panels/panels_ipe/panels_ipe.module', 'panels_ipe', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:22:"Panels In-Place Editor";s:11:"description";s:101:"Provide a UI for managing some Panels directly on the frontend, instead of having to use the backend.";s:7:"package";s:6:"Panels";s:12:"dependencies";a:1:{i:0;s:6:"panels";}s:4:"core";s:3:"7.x";s:9:"configure";s:22:"admin/structure/panels";s:5:"files";a:1:{i:0;s:17:"panels_ipe.module";}s:7:"version";s:7:"7.x-3.2";s:7:"project";s:6:"panels";s:9:"datestamp";s:10:"1332079243";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/panels/panels_mini/panels_mini.module', 'panels_mini', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:11:"Mini panels";s:11:"description";s:89:"Create mini panels that can be used as blocks by Drupal and panes by other panel modules.";s:7:"package";s:6:"Panels";s:12:"dependencies";a:1:{i:0;s:6:"panels";}s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:42:"plugins/export_ui/panels_mini_ui.class.php";}s:7:"version";s:7:"7.x-3.2";s:7:"project";s:6:"panels";s:9:"datestamp";s:10:"1332079243";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/panels/panels_node/panels_node.module', 'panels_node', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Panel nodes";s:11:"description";s:65:"Create nodes that are divided into areas with selectable content.";s:7:"package";s:6:"Panels";s:12:"dependencies";a:1:{i:0;s:6:"panels";}s:9:"configure";s:22:"admin/structure/panels";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:18:"panels_node.module";}s:7:"version";s:7:"7.x-3.2";s:7:"project";s:6:"panels";s:9:"datestamp";s:10:"1332079243";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/pathauto/pathauto.module', 'pathauto', 'module', '', '1', '0', 7005, '1', 'a:13:{s:4:"name";s:8:"Pathauto";s:11:"description";s:95:"Provides a mechanism for modules to automatically generate aliases for the content they manage.";s:12:"dependencies";a:2:{i:0;s:4:"path";i:1;s:5:"token";}s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:13:"pathauto.test";}s:9:"configure";s:33:"admin/config/search/path/patterns";s:10:"recommends";a:1:{i:0;s:8:"redirect";}s:7:"version";s:7:"7.x-1.1";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1336950382";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/potx/potx.module', 'potx', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:30:"Translation template extractor";s:11:"description";s:106:"Provides a web interface and an API to extract translatable text from the sources of installed components.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:4:"core";s:3:"7.x";s:7:"package";s:13:"Multilanguage";s:5:"files";a:3:{i:0;s:11:"potx.module";i:1;s:8:"potx.inc";i:2;s:15:"tests/potx.test";}s:7:"version";s:7:"7.x-1.0";s:7:"project";s:4:"potx";s:9:"datestamp";s:10:"1296046593";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/potx/tests/potx_test_6.module', 'potx_test_6', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:37:"Translation template extractor tester";s:11:"description";s:16:"Test description";s:7:"package";s:12:"Test package";s:7:"version";s:7:"7.x-1.0";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"project";s:4:"potx";s:9:"datestamp";s:10:"1296046593";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/quicktabs/quicktabs.module', 'quicktabs', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:9:"Quicktabs";s:11:"description";s:49:"Render content with tabs and other display styles";s:4:"core";s:3:"7.x";s:5:"files";a:4:{i:0;s:16:"quicktabs.module";i:1;s:21:"quicktabs.classes.inc";i:2;s:35:"includes/quicktabs_style_plugin.inc";i:3;s:20:"tests/quicktabs.test";}s:9:"configure";s:25:"admin/structure/quicktabs";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:7:"version";s:7:"7.x-3.4";s:7:"project";s:9:"quicktabs";s:9:"datestamp";s:10:"1332980461";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/quicktabs/quicktabs_tabstyles/quicktabs_tabstyles.module', 'quicktabs_tabstyles', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:16:"Quicktabs Styles";s:11:"description";s:65:"Adds predefined tab styles to choose from per Quicktabs instance.";s:4:"core";s:3:"7.x";s:9:"configure";s:32:"admin/structure/quicktabs/styles";s:12:"dependencies";a:1:{i:0;s:9:"quicktabs";}s:7:"version";s:7:"7.x-3.4";s:7:"project";s:9:"quicktabs";s:9:"datestamp";s:10:"1332980461";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/rabbit_hole/rabbit_hole.module', 'rabbit_hole', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:11:"Rabbit Hole";s:11:"description";s:69:"Will redirect the user to a different place when viewing a full node.";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-1.2";s:7:"project";s:11:"rabbit_hole";s:9:"datestamp";s:10:"1332930353";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/references/node_reference/node_reference.module', 'node_reference', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:14:"Node Reference";s:11:"description";s:59:"Defines a field type for referencing one node from another.";s:7:"package";s:6:"Fields";s:4:"core";s:3:"7.x";s:12:"dependencies";a:3:{i:0;s:5:"field";i:1;s:10:"references";i:2;s:7:"options";}s:5:"files";a:1:{i:0;s:19:"node_reference.test";}s:7:"version";s:7:"7.x-2.0";s:7:"project";s:10:"references";s:9:"datestamp";s:10:"1324596643";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/references/references.module', 'references', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:10:"References";s:11:"description";s:67:"Defines common base features for the various reference field types.";s:7:"package";s:6:"Fields";s:4:"core";s:3:"7.x";s:12:"dependencies";a:2:{i:0;s:5:"field";i:1;s:7:"options";}s:5:"files";a:5:{i:0;s:41:"views/references_handler_relationship.inc";i:1;s:37:"views/references_handler_argument.inc";i:2;s:35:"views/references_plugin_display.inc";i:3;s:33:"views/references_plugin_style.inc";i:4;s:38:"views/references_plugin_row_fields.inc";}s:7:"version";s:7:"7.x-2.0";s:7:"project";s:10:"references";s:9:"datestamp";s:10:"1324596643";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/references/user_reference/user_reference.module', 'user_reference', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:14:"User Reference";s:11:"description";s:56:"Defines a field type for referencing a user from a node.";s:7:"package";s:6:"Fields";s:4:"core";s:3:"7.x";s:12:"dependencies";a:3:{i:0;s:5:"field";i:1;s:10:"references";i:2;s:7:"options";}s:7:"version";s:7:"7.x-2.0";s:7:"project";s:10:"references";s:9:"datestamp";s:10:"1324596643";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/rules/rules.module', 'rules', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:5:"Rules";s:11:"description";s:51:"React on events and conditionally evaluate actions.";s:7:"package";s:5:"Rules";s:4:"core";s:3:"7.x";s:5:"files";a:14:{i:0;s:18:"rules.features.inc";i:1;s:16:"tests/rules.test";i:2;s:18:"includes/faces.inc";i:3;s:23:"includes/rules.core.inc";i:4;s:28:"includes/rules.processor.inc";i:5;s:26:"includes/rules.plugins.inc";i:6;s:24:"includes/rules.state.inc";i:7;s:20:"modules/php.eval.inc";i:8;s:27:"modules/rules_core.eval.inc";i:9;s:23:"modules/system.eval.inc";i:10;s:20:"ui/ui.controller.inc";i:11;s:14:"ui/ui.core.inc";i:12;s:14:"ui/ui.data.inc";i:13;s:17:"ui/ui.plugins.inc";}s:12:"dependencies";a:2:{i:0;s:12:"entity_token";i:1;s:6:"entity";}s:7:"version";s:7:"7.x-2.1";s:7:"project";s:5:"rules";s:9:"datestamp";s:10:"1331918148";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/rules/rules_admin/rules_admin.module', 'rules_admin', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:8:"Rules UI";s:11:"description";s:44:"Administrative interface for managing rules.";s:7:"package";s:5:"Rules";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:18:"rules_admin.module";i:1;s:15:"rules_admin.inc";}s:12:"dependencies";a:1:{i:0;s:5:"rules";}s:7:"version";s:7:"7.x-2.1";s:7:"project";s:5:"rules";s:9:"datestamp";s:10:"1331918148";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/rules/rules_i18n/rules_i18n.module', 'rules_i18n', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:17:"Rules translation";s:11:"description";s:25:"Allows translating rules.";s:12:"dependencies";a:2:{i:0;s:5:"rules";i:1;s:11:"i18n_string";}s:7:"package";s:35:"Multilingual - Internationalization";s:4:"core";s:3:"7.x";s:5:"files";a:3:{i:0;s:19:"rules_i18n.i18n.inc";i:1;s:20:"rules_i18n.rules.inc";i:2;s:15:"rules_i18n.test";}s:7:"version";s:7:"7.x-2.1";s:7:"project";s:5:"rules";s:9:"datestamp";s:10:"1331918148";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/rules/rules_scheduler/rules_scheduler.module', 'rules_scheduler', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:15:"Rules Scheduler";s:11:"description";s:57:"Schedule the execution of Rules components using actions.";s:12:"dependencies";a:1:{i:0;s:5:"rules";}s:7:"package";s:5:"Rules";s:4:"core";s:3:"7.x";s:5:"files";a:8:{i:0;s:25:"rules_scheduler.admin.inc";i:1;s:22:"rules_scheduler.module";i:2;s:23:"rules_scheduler.install";i:3;s:25:"rules_scheduler.rules.inc";i:4;s:20:"rules_scheduler.test";i:5;s:42:"includes/rules_scheduler.views_default.inc";i:6;s:34:"includes/rules_scheduler.views.inc";i:7;s:41:"includes/rules_scheduler_views_filter.inc";}s:7:"version";s:7:"7.x-2.1";s:7:"project";s:5:"rules";s:9:"datestamp";s:10:"1331918148";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/rules/tests/rules_test.module', 'rules_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"Rules Tests";s:11:"description";s:35:"Support module for the Rules tests.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"7.x";s:5:"files";a:2:{i:0;s:20:"rules_test.rules.inc";i:1;s:29:"rules_test.rules_defaults.inc";}s:6:"hidden";b:1;s:7:"version";s:7:"7.x-2.1";s:7:"project";s:5:"rules";s:9:"datestamp";s:10:"1331918148";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/strongarm/strongarm.module', 'strongarm', 'module', '', '1', '0', 7201, '-1000', 'a:11:{s:4:"name";s:9:"Strongarm";s:11:"description";s:87:"Enforces variable values defined by modules that need settings set to operate properly.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:5:"files";a:3:{i:0;s:19:"strongarm.admin.inc";i:1;s:17:"strongarm.install";i:2;s:16:"strongarm.module";}s:7:"version";s:11:"7.x-2.0-rc1";s:7:"project";s:9:"strongarm";s:9:"datestamp";s:10:"1332787846";s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/superfish/superfish.module', 'superfish', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:9:"Superfish";s:11:"description";s:46:"jQuery Superfish plugin for your Drupal menus.";s:7:"package";s:14:"User interface";s:12:"dependencies";a:2:{i:0;s:4:"menu";i:1;s:9:"libraries";}s:9:"configure";s:37:"admin/config/user-interface/superfish";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-1.8";s:7:"project";s:9:"superfish";s:9:"datestamp";s:10:"1301247369";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/themekey/themekey.module', 'themekey', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:8:"ThemeKey";s:11:"description";s:48:"Map themes to Drupal paths or object properties.";s:4:"core";s:3:"7.x";s:7:"package";s:8:"ThemeKey";s:9:"configure";s:45:"admin/config/user-interface/themekey/settings";s:5:"files";a:13:{i:0;s:16:"themekey.install";i:1;s:31:"themekey-debug-messages.tpl.php";i:2;s:23:"themekey_validators.inc";i:3;s:18:"themekey_admin.inc";i:4;s:17:"themekey_base.inc";i:5;s:18:"themekey_build.inc";i:6;s:17:"themekey_cron.inc";i:7;s:38:"modules/themekey_browser_detection.php";i:8;s:19:"tests/themekey.test";i:9;s:43:"tests/ThemekeyDrupalPropertiesTestCase.test";i:10;s:41:"tests/ThemekeyNodePropertiesTestCase.test";i:11;s:49:"tests/ThemekeyMultipleNodePropertiesTestCase.test";i:12;s:43:"tests/ThemekeySystemPropertiesTestCase.test";}s:7:"version";s:7:"7.x-2.0";s:7:"project";s:8:"themekey";s:9:"datestamp";s:10:"1326984355";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/themekey/themekey_compat.module', 'themekey_compat', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:22:"ThemeKey Compatibility";s:11:"description";s:99:"Integration of different theme switching modules into ThemeKey and it''s theme switching rule chain.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:8:"themekey";}s:7:"package";s:8:"ThemeKey";s:9:"configure";s:52:"admin/config/user-interface/themekey/settings/compat";s:7:"version";s:7:"7.x-2.0";s:7:"project";s:8:"themekey";s:9:"datestamp";s:10:"1326984355";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/themekey/themekey_debug.module', 'themekey_debug', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:14:"ThemeKey Debug";s:11:"description";s:14:"Debug ThemeKey";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:8:"themekey";}s:7:"package";s:8:"ThemeKey";s:9:"configure";s:51:"admin/config/user-interface/themekey/settings/debug";s:7:"version";s:7:"7.x-2.0";s:7:"project";s:8:"themekey";s:9:"datestamp";s:10:"1326984355";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/themekey/themekey_example/themekey_example.module', 'themekey_example', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:16:"ThemeKey Example";s:11:"description";s:66:"Implements parts of the ThemeKey API as an example for Developers.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:8:"themekey";}s:7:"package";s:11:"Development";s:5:"files";a:3:{i:0;s:23:"themekey_example.module";i:1;s:31:"themekey_example_validators.inc";i:2;s:28:"themekey_example_mappers.inc";}s:7:"version";s:7:"7.x-2.0";s:7:"project";s:8:"themekey";s:9:"datestamp";s:10:"1326984355";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}');
INSERT INTO `system` VALUES
('sites/all/modules/contrib/themekey/themekey_features.module', 'themekey_features', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:33:"ThemeKey Features (Experimental!)";s:11:"description";s:89:"Integrates ThemeKey with Features. Warning! Don''t use in production! Highly Experimental!";s:4:"core";s:3:"7.x";s:12:"dependencies";a:2:{i:0;s:8:"themekey";i:1;s:8:"features";}s:7:"package";s:8:"ThemeKey";s:7:"version";s:7:"7.x-2.0";s:7:"project";s:8:"themekey";s:9:"datestamp";s:10:"1326984355";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/themekey/themekey_ui.module', 'themekey_ui', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:11:"ThemeKey UI";s:11:"description";s:53:"Integrates ThemeKey with Drupal administration forms.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:8:"themekey";}s:7:"package";s:8:"ThemeKey";s:9:"configure";s:48:"admin/config/user-interface/themekey/settings/ui";s:5:"files";a:5:{i:0;s:19:"themekey_ui.install";i:1;s:18:"themekey_ui.module";i:2;s:21:"themekey_ui_admin.inc";i:3;s:20:"themekey_ui_help.inc";i:4;s:22:"themekey_ui_helper.inc";}s:7:"version";s:7:"7.x-2.0";s:7:"project";s:8:"themekey";s:9:"datestamp";s:10:"1326984355";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/themekey/themekey_user_profile.module', 'themekey_user_profile', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:21:"ThemeKey User Profile";s:11:"description";s:179:"Allows users to select their own theme for this site. ThemeKey User Profile replaces the corresponding feature that existed in Drupal 6 Core but has been removed in Drupal 7 Core.";s:4:"core";s:3:"7.x";s:12:"dependencies";a:2:{i:0;s:8:"themekey";i:1;s:11:"themekey_ui";}s:7:"package";s:8:"ThemeKey";s:9:"configure";s:48:"admin/config/user-interface/themekey/settings/ui";s:5:"files";a:3:{i:0;s:29:"themekey_user_profile.install";i:1;s:28:"themekey_user_profile.module";i:2;s:30:"themekey_user_profile_help.inc";}s:7:"version";s:7:"7.x-2.0";s:7:"project";s:8:"themekey";s:9:"datestamp";s:10:"1326984355";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/token/tests/token_test.module', 'token_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Token Test";s:11:"description";s:39:"Testing module for token functionality.";s:7:"package";s:7:"Testing";s:4:"core";s:3:"7.x";s:5:"files";a:1:{i:0;s:17:"token_test.module";}s:6:"hidden";b:1;s:7:"version";s:7:"7.x-1.1";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1337115392";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/token/token.module', 'token', 'module', '', '1', '0', 7001, '0', 'a:11:{s:4:"name";s:5:"Token";s:11:"description";s:73:"Provides a user interface for the Token API and some missing core tokens.";s:4:"core";s:3:"7.x";s:5:"files";a:5:{i:0;s:12:"token.module";i:1;s:13:"token.install";i:2;s:16:"token.tokens.inc";i:3;s:15:"token.pages.inc";i:4;s:10:"token.test";}s:7:"version";s:7:"7.x-1.1";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1337115392";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/transliteration/transliteration.module', 'transliteration', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:15:"Transliteration";s:11:"description";s:61:"Converts non-latin text to US-ASCII and sanitizes file names.";s:4:"core";s:3:"7.x";s:7:"version";s:7:"7.x-3.0";s:7:"project";s:15:"transliteration";s:9:"datestamp";s:10:"1318580199";s:12:"dependencies";a:0:{}s:7:"package";s:5:"Other";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/views/tests/views_test.module', 'views_test', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:10:"Views Test";s:11:"description";s:22:"Test module for Views.";s:7:"package";s:5:"Views";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:6:"hidden";b:1;s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/views/views.module', 'views', 'module', '', '1', '0', 7301, '10', 'a:12:{s:4:"name";s:5:"Views";s:11:"description";s:55:"Create customized lists and queries from your database.";s:7:"package";s:5:"Views";s:4:"core";s:3:"7.x";s:3:"php";s:3:"5.2";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:13:"css/views.css";s:45:"sites/all/modules/contrib/views/css/views.css";}}s:12:"dependencies";a:1:{i:0;s:6:"ctools";}s:5:"files";a:279:{i:0;s:31:"handlers/views_handler_area.inc";i:1;s:38:"handlers/views_handler_area_result.inc";i:2;s:36:"handlers/views_handler_area_text.inc";i:3;s:36:"handlers/views_handler_area_view.inc";i:4;s:35:"handlers/views_handler_argument.inc";i:5;s:40:"handlers/views_handler_argument_date.inc";i:6;s:43:"handlers/views_handler_argument_formula.inc";i:7;s:47:"handlers/views_handler_argument_many_to_one.inc";i:8;s:40:"handlers/views_handler_argument_null.inc";i:9;s:43:"handlers/views_handler_argument_numeric.inc";i:10;s:42:"handlers/views_handler_argument_string.inc";i:11;s:52:"handlers/views_handler_argument_group_by_numeric.inc";i:12;s:32:"handlers/views_handler_field.inc";i:13;s:40:"handlers/views_handler_field_counter.inc";i:14;s:40:"handlers/views_handler_field_boolean.inc";i:15;s:49:"handlers/views_handler_field_contextual_links.inc";i:16;s:39:"handlers/views_handler_field_custom.inc";i:17;s:37:"handlers/views_handler_field_date.inc";i:18;s:39:"handlers/views_handler_field_entity.inc";i:19;s:39:"handlers/views_handler_field_markup.inc";i:20;s:37:"handlers/views_handler_field_math.inc";i:21;s:40:"handlers/views_handler_field_numeric.inc";i:22;s:47:"handlers/views_handler_field_prerender_list.inc";i:23;s:46:"handlers/views_handler_field_time_interval.inc";i:24;s:43:"handlers/views_handler_field_serialized.inc";i:25;s:45:"handlers/views_handler_field_machine_name.inc";i:26;s:36:"handlers/views_handler_field_url.inc";i:27;s:33:"handlers/views_handler_filter.inc";i:28;s:50:"handlers/views_handler_filter_boolean_operator.inc";i:29;s:57:"handlers/views_handler_filter_boolean_operator_string.inc";i:30;s:38:"handlers/views_handler_filter_date.inc";i:31;s:42:"handlers/views_handler_filter_equality.inc";i:32;s:50:"handlers/views_handler_filter_group_by_numeric.inc";i:33;s:45:"handlers/views_handler_filter_in_operator.inc";i:34;s:45:"handlers/views_handler_filter_many_to_one.inc";i:35;s:41:"handlers/views_handler_filter_numeric.inc";i:36;s:40:"handlers/views_handler_filter_string.inc";i:37;s:39:"handlers/views_handler_relationship.inc";i:38;s:53:"handlers/views_handler_relationship_groupwise_max.inc";i:39;s:31:"handlers/views_handler_sort.inc";i:40;s:36:"handlers/views_handler_sort_date.inc";i:41;s:39:"handlers/views_handler_sort_formula.inc";i:42;s:48:"handlers/views_handler_sort_group_by_numeric.inc";i:43;s:46:"handlers/views_handler_sort_menu_hierarchy.inc";i:44;s:38:"handlers/views_handler_sort_random.inc";i:45;s:17:"includes/base.inc";i:46;s:21:"includes/handlers.inc";i:47;s:20:"includes/plugins.inc";i:48;s:17:"includes/view.inc";i:49;s:60:"modules/aggregator/views_handler_argument_aggregator_fid.inc";i:50;s:60:"modules/aggregator/views_handler_argument_aggregator_iid.inc";i:51;s:69:"modules/aggregator/views_handler_argument_aggregator_category_cid.inc";i:52;s:64:"modules/aggregator/views_handler_field_aggregator_title_link.inc";i:53;s:62:"modules/aggregator/views_handler_field_aggregator_category.inc";i:54;s:70:"modules/aggregator/views_handler_field_aggregator_item_description.inc";i:55;s:57:"modules/aggregator/views_handler_field_aggregator_xss.inc";i:56;s:67:"modules/aggregator/views_handler_filter_aggregator_category_cid.inc";i:57;s:54:"modules/aggregator/views_plugin_row_aggregator_rss.inc";i:58;s:59:"modules/comment/views_handler_argument_comment_user_uid.inc";i:59;s:47:"modules/comment/views_handler_field_comment.inc";i:60;s:53:"modules/comment/views_handler_field_comment_depth.inc";i:61;s:52:"modules/comment/views_handler_field_comment_link.inc";i:62;s:60:"modules/comment/views_handler_field_comment_link_approve.inc";i:63;s:59:"modules/comment/views_handler_field_comment_link_delete.inc";i:64;s:57:"modules/comment/views_handler_field_comment_link_edit.inc";i:65;s:58:"modules/comment/views_handler_field_comment_link_reply.inc";i:66;s:57:"modules/comment/views_handler_field_comment_node_link.inc";i:67;s:56:"modules/comment/views_handler_field_comment_username.inc";i:68;s:61:"modules/comment/views_handler_field_ncs_last_comment_name.inc";i:69;s:56:"modules/comment/views_handler_field_ncs_last_updated.inc";i:70;s:52:"modules/comment/views_handler_field_node_comment.inc";i:71;s:57:"modules/comment/views_handler_field_node_new_comments.inc";i:72;s:62:"modules/comment/views_handler_field_last_comment_timestamp.inc";i:73;s:57:"modules/comment/views_handler_filter_comment_user_uid.inc";i:74;s:57:"modules/comment/views_handler_filter_ncs_last_updated.inc";i:75;s:53:"modules/comment/views_handler_filter_node_comment.inc";i:76;s:53:"modules/comment/views_handler_sort_comment_thread.inc";i:77;s:60:"modules/comment/views_handler_sort_ncs_last_comment_name.inc";i:78;s:55:"modules/comment/views_handler_sort_ncs_last_updated.inc";i:79;s:48:"modules/comment/views_plugin_row_comment_rss.inc";i:80;s:49:"modules/comment/views_plugin_row_comment_view.inc";i:81;s:52:"modules/contact/views_handler_field_contact_link.inc";i:82;s:43:"modules/field/views_handler_field_field.inc";i:83;s:59:"modules/field/views_handler_relationship_entity_reverse.inc";i:84;s:51:"modules/field/views_handler_argument_field_list.inc";i:85;s:49:"modules/field/views_handler_filter_field_list.inc";i:86;s:57:"modules/filter/views_handler_field_filter_format_name.inc";i:87;s:54:"modules/locale/views_handler_argument_locale_group.inc";i:88;s:57:"modules/locale/views_handler_argument_locale_language.inc";i:89;s:51:"modules/locale/views_handler_field_locale_group.inc";i:90;s:54:"modules/locale/views_handler_field_locale_language.inc";i:91;s:55:"modules/locale/views_handler_field_locale_link_edit.inc";i:92;s:52:"modules/locale/views_handler_filter_locale_group.inc";i:93;s:55:"modules/locale/views_handler_filter_locale_language.inc";i:94;s:54:"modules/locale/views_handler_filter_locale_version.inc";i:95;s:53:"modules/node/views_handler_argument_dates_various.inc";i:96;s:53:"modules/node/views_handler_argument_node_language.inc";i:97;s:48:"modules/node/views_handler_argument_node_nid.inc";i:98;s:49:"modules/node/views_handler_argument_node_type.inc";i:99;s:48:"modules/node/views_handler_argument_node_vid.inc";i:100;s:57:"modules/node/views_handler_argument_node_uid_revision.inc";i:101;s:59:"modules/node/views_handler_field_history_user_timestamp.inc";i:102;s:41:"modules/node/views_handler_field_node.inc";i:103;s:46:"modules/node/views_handler_field_node_link.inc";i:104;s:53:"modules/node/views_handler_field_node_link_delete.inc";i:105;s:51:"modules/node/views_handler_field_node_link_edit.inc";i:106;s:50:"modules/node/views_handler_field_node_revision.inc";i:107;s:62:"modules/node/views_handler_field_node_revision_link_delete.inc";i:108;s:62:"modules/node/views_handler_field_node_revision_link_revert.inc";i:109;s:46:"modules/node/views_handler_field_node_path.inc";i:110;s:46:"modules/node/views_handler_field_node_type.inc";i:111;s:60:"modules/node/views_handler_filter_history_user_timestamp.inc";i:112;s:49:"modules/node/views_handler_filter_node_access.inc";i:113;s:49:"modules/node/views_handler_filter_node_status.inc";i:114;s:47:"modules/node/views_handler_filter_node_type.inc";i:115;s:55:"modules/node/views_handler_filter_node_uid_revision.inc";i:116;s:51:"modules/node/views_plugin_argument_default_node.inc";i:117;s:52:"modules/node/views_plugin_argument_validate_node.inc";i:118;s:42:"modules/node/views_plugin_row_node_rss.inc";i:119;s:43:"modules/node/views_plugin_row_node_view.inc";i:120;s:52:"modules/profile/views_handler_field_profile_date.inc";i:121;s:52:"modules/profile/views_handler_field_profile_list.inc";i:122;s:58:"modules/profile/views_handler_filter_profile_selection.inc";i:123;s:48:"modules/search/views_handler_argument_search.inc";i:124;s:51:"modules/search/views_handler_field_search_score.inc";i:125;s:46:"modules/search/views_handler_filter_search.inc";i:126;s:50:"modules/search/views_handler_sort_search_score.inc";i:127;s:47:"modules/search/views_plugin_row_search_view.inc";i:128;s:57:"modules/statistics/views_handler_field_accesslog_path.inc";i:129;s:50:"modules/system/views_handler_argument_file_fid.inc";i:130;s:43:"modules/system/views_handler_field_file.inc";i:131;s:53:"modules/system/views_handler_field_file_extension.inc";i:132;s:52:"modules/system/views_handler_field_file_filemime.inc";i:133;s:47:"modules/system/views_handler_field_file_uri.inc";i:134;s:50:"modules/system/views_handler_field_file_status.inc";i:135;s:51:"modules/system/views_handler_filter_file_status.inc";i:136;s:52:"modules/taxonomy/views_handler_argument_taxonomy.inc";i:137;s:57:"modules/taxonomy/views_handler_argument_term_node_tid.inc";i:138;s:63:"modules/taxonomy/views_handler_argument_term_node_tid_depth.inc";i:139;s:72:"modules/taxonomy/views_handler_argument_term_node_tid_depth_modifier.inc";i:140;s:58:"modules/taxonomy/views_handler_argument_vocabulary_vid.inc";i:141;s:67:"modules/taxonomy/views_handler_argument_vocabulary_machine_name.inc";i:142;s:49:"modules/taxonomy/views_handler_field_taxonomy.inc";i:143;s:54:"modules/taxonomy/views_handler_field_term_node_tid.inc";i:144;s:55:"modules/taxonomy/views_handler_field_term_link_edit.inc";i:145;s:55:"modules/taxonomy/views_handler_filter_term_node_tid.inc";i:146;s:61:"modules/taxonomy/views_handler_filter_term_node_tid_depth.inc";i:147;s:56:"modules/taxonomy/views_handler_filter_vocabulary_vid.inc";i:148;s:65:"modules/taxonomy/views_handler_filter_vocabulary_machine_name.inc";i:149;s:62:"modules/taxonomy/views_handler_relationship_node_term_data.inc";i:150;s:65:"modules/taxonomy/views_plugin_argument_validate_taxonomy_term.inc";i:151;s:63:"modules/taxonomy/views_plugin_argument_default_taxonomy_tid.inc";i:152;s:51:"modules/system/views_handler_filter_system_type.inc";i:153;s:56:"modules/translation/views_handler_argument_node_tnid.inc";i:154;s:57:"modules/translation/views_handler_field_node_language.inc";i:155;s:63:"modules/translation/views_handler_field_node_link_translate.inc";i:156;s:65:"modules/translation/views_handler_field_node_translation_link.inc";i:157;s:58:"modules/translation/views_handler_filter_node_language.inc";i:158;s:54:"modules/translation/views_handler_filter_node_tnid.inc";i:159;s:60:"modules/translation/views_handler_filter_node_tnid_child.inc";i:160;s:62:"modules/translation/views_handler_relationship_translation.inc";i:161;s:57:"modules/upload/views_handler_field_upload_description.inc";i:162;s:49:"modules/upload/views_handler_field_upload_fid.inc";i:163;s:50:"modules/upload/views_handler_filter_upload_fid.inc";i:164;s:48:"modules/user/views_handler_argument_user_uid.inc";i:165;s:55:"modules/user/views_handler_argument_users_roles_rid.inc";i:166;s:41:"modules/user/views_handler_field_user.inc";i:167;s:50:"modules/user/views_handler_field_user_language.inc";i:168;s:46:"modules/user/views_handler_field_user_link.inc";i:169;s:53:"modules/user/views_handler_field_user_link_cancel.inc";i:170;s:51:"modules/user/views_handler_field_user_link_edit.inc";i:171;s:46:"modules/user/views_handler_field_user_mail.inc";i:172;s:46:"modules/user/views_handler_field_user_name.inc";i:173;s:53:"modules/user/views_handler_field_user_permissions.inc";i:174;s:49:"modules/user/views_handler_field_user_picture.inc";i:175;s:47:"modules/user/views_handler_field_user_roles.inc";i:176;s:50:"modules/user/views_handler_filter_user_current.inc";i:177;s:47:"modules/user/views_handler_filter_user_name.inc";i:178;s:54:"modules/user/views_handler_filter_user_permissions.inc";i:179;s:48:"modules/user/views_handler_filter_user_roles.inc";i:180;s:59:"modules/user/views_plugin_argument_default_current_user.inc";i:181;s:51:"modules/user/views_plugin_argument_default_user.inc";i:182;s:52:"modules/user/views_plugin_argument_validate_user.inc";i:183;s:43:"modules/user/views_plugin_row_user_view.inc";i:184;s:31:"plugins/views_plugin_access.inc";i:185;s:36:"plugins/views_plugin_access_none.inc";i:186;s:36:"plugins/views_plugin_access_perm.inc";i:187;s:36:"plugins/views_plugin_access_role.inc";i:188;s:41:"plugins/views_plugin_argument_default.inc";i:189;s:45:"plugins/views_plugin_argument_default_php.inc";i:190;s:47:"plugins/views_plugin_argument_default_fixed.inc";i:191;s:45:"plugins/views_plugin_argument_default_raw.inc";i:192;s:42:"plugins/views_plugin_argument_validate.inc";i:193;s:50:"plugins/views_plugin_argument_validate_numeric.inc";i:194;s:46:"plugins/views_plugin_argument_validate_php.inc";i:195;s:30:"plugins/views_plugin_cache.inc";i:196;s:35:"plugins/views_plugin_cache_none.inc";i:197;s:35:"plugins/views_plugin_cache_time.inc";i:198;s:32:"plugins/views_plugin_display.inc";i:199;s:43:"plugins/views_plugin_display_attachment.inc";i:200;s:38:"plugins/views_plugin_display_block.inc";i:201;s:40:"plugins/views_plugin_display_default.inc";i:202;s:38:"plugins/views_plugin_display_embed.inc";i:203;s:41:"plugins/views_plugin_display_extender.inc";i:204;s:37:"plugins/views_plugin_display_feed.inc";i:205;s:37:"plugins/views_plugin_display_page.inc";i:206;s:43:"plugins/views_plugin_exposed_form_basic.inc";i:207;s:37:"plugins/views_plugin_exposed_form.inc";i:208;s:52:"plugins/views_plugin_exposed_form_input_required.inc";i:209;s:42:"plugins/views_plugin_localization_core.inc";i:210;s:37:"plugins/views_plugin_localization.inc";i:211;s:42:"plugins/views_plugin_localization_none.inc";i:212;s:30:"plugins/views_plugin_pager.inc";i:213;s:35:"plugins/views_plugin_pager_full.inc";i:214;s:35:"plugins/views_plugin_pager_mini.inc";i:215;s:35:"plugins/views_plugin_pager_none.inc";i:216;s:35:"plugins/views_plugin_pager_some.inc";i:217;s:30:"plugins/views_plugin_query.inc";i:218;s:38:"plugins/views_plugin_query_default.inc";i:219;s:28:"plugins/views_plugin_row.inc";i:220;s:35:"plugins/views_plugin_row_fields.inc";i:221;s:30:"plugins/views_plugin_style.inc";i:222;s:38:"plugins/views_plugin_style_default.inc";i:223;s:35:"plugins/views_plugin_style_grid.inc";i:224;s:35:"plugins/views_plugin_style_list.inc";i:225;s:40:"plugins/views_plugin_style_jump_menu.inc";i:226;s:34:"plugins/views_plugin_style_rss.inc";i:227;s:38:"plugins/views_plugin_style_summary.inc";i:228;s:48:"plugins/views_plugin_style_summary_jump_menu.inc";i:229;s:50:"plugins/views_plugin_style_summary_unformatted.inc";i:230;s:36:"plugins/views_plugin_style_table.inc";i:231;s:43:"tests/handlers/views_handler_area_text.test";i:232;s:47:"tests/handlers/views_handler_argument_null.test";i:233;s:39:"tests/handlers/views_handler_field.test";i:234;s:47:"tests/handlers/views_handler_field_boolean.test";i:235;s:46:"tests/handlers/views_handler_field_custom.test";i:236;s:47:"tests/handlers/views_handler_field_counter.test";i:237;s:44:"tests/handlers/views_handler_field_date.test";i:238;s:49:"tests/handlers/views_handler_field_file_size.test";i:239;s:44:"tests/handlers/views_handler_field_math.test";i:240;s:43:"tests/handlers/views_handler_field_url.test";i:241;s:43:"tests/handlers/views_handler_field_xss.test";i:242;s:45:"tests/handlers/views_handler_filter_date.test";i:243;s:49:"tests/handlers/views_handler_filter_equality.test";i:244;s:52:"tests/handlers/views_handler_filter_in_operator.test";i:245;s:48:"tests/handlers/views_handler_filter_numeric.test";i:246;s:47:"tests/handlers/views_handler_filter_string.test";i:247;s:45:"tests/handlers/views_handler_sort_random.test";i:248;s:43:"tests/handlers/views_handler_sort_date.test";i:249;s:38:"tests/handlers/views_handler_sort.test";i:250;s:60:"tests/test_plugins/views_test_plugin_access_test_dynamic.inc";i:251;s:59:"tests/test_plugins/views_test_plugin_access_test_static.inc";i:252;s:46:"tests/styles/views_plugin_style_jump_menu.test";i:253;s:36:"tests/styles/views_plugin_style.test";i:254;s:23:"tests/views_access.test";i:255;s:24:"tests/views_analyze.test";i:256;s:22:"tests/views_basic.test";i:257;s:33:"tests/views_argument_default.test";i:258;s:35:"tests/views_argument_validator.test";i:259;s:29:"tests/views_exposed_form.test";i:260;s:25:"tests/views_glossary.test";i:261;s:24:"tests/views_groupby.test";i:262;s:25:"tests/views_handlers.test";i:263;s:23:"tests/views_module.test";i:264;s:22:"tests/views_pager.test";i:265;s:40:"tests/views_plugin_localization_test.inc";i:266;s:29:"tests/views_translatable.test";i:267;s:22:"tests/views_query.test";i:268;s:24:"tests/views_upgrade.test";i:269;s:34:"tests/views_test.views_default.inc";i:270;s:58:"tests/comment/views_handler_argument_comment_user_uid.test";i:271;s:56:"tests/comment/views_handler_filter_comment_user_uid.test";i:272;s:45:"tests/user/views_handler_field_user_name.test";i:273;s:43:"tests/user/views_user_argument_default.test";i:274;s:44:"tests/user/views_user_argument_validate.test";i:275;s:26:"tests/user/views_user.test";i:276;s:22:"tests/views_cache.test";i:277;s:21:"tests/views_view.test";i:278;s:19:"tests/views_ui.test";}s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/views/views_export/views_export.module', 'views_export', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:14:"Views exporter";s:11:"description";s:40:"Allows exporting multiple views at once.";s:7:"package";s:5:"Views";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:4:"core";s:3:"7.x";s:7:"version";s:13:"7.x-3.0-beta3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1301301970";s:3:"php";s:5:"5.2.4";s:5:"files";a:0:{}s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/views/views_ui.module', 'views_ui', 'module', '', '1', '0', 0, '0', 'a:12:{s:4:"name";s:8:"Views UI";s:11:"description";s:93:"Administrative interface to views. Without this module, you cannot create or edit your views.";s:7:"package";s:5:"Views";s:4:"core";s:3:"7.x";s:9:"configure";s:21:"admin/structure/views";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:5:"files";a:2:{i:0;s:15:"views_ui.module";i:1;s:57:"plugins/views_wizard/views_ui_base_views_wizard.class.php";}s:7:"version";s:7:"7.x-3.3";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1329946249";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/views_php/views_php.module', 'views_php', 'module', '', '0', '0', -1, '0', 'a:11:{s:4:"name";s:9:"Views PHP";s:11:"description";s:44:"Allows the usage of PHP to construct a view.";s:7:"package";s:5:"Views";s:4:"core";s:3:"7.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:5:"files";a:9:{i:0;s:40:"plugins/views/views_php_handler_area.inc";i:1;s:41:"plugins/views/views_php_handler_field.inc";i:2;s:42:"plugins/views/views_php_handler_filter.inc";i:3;s:40:"plugins/views/views_php_handler_sort.inc";i:4;s:41:"plugins/views/views_php_plugin_access.inc";i:5;s:40:"plugins/views/views_php_plugin_cache.inc";i:6;s:40:"plugins/views/views_php_plugin_pager.inc";i:7;s:40:"plugins/views/views_php_plugin_query.inc";i:8;s:42:"plugins/views/views_php_plugin_wrapper.inc";}s:7:"version";s:11:"7.x-1.x-dev";s:7:"project";s:9:"views_php";s:9:"datestamp";s:10:"1329828512";s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/modules/contrib/webform/webform.module', 'webform', 'module', '', '0', '0', -1, '0', 'a:12:{s:4:"name";s:7:"Webform";s:11:"description";s:49:"Enables the creation of forms and questionnaires.";s:4:"core";s:3:"7.x";s:7:"package";s:7:"Webform";s:9:"configure";s:28:"admin/config/content/webform";s:5:"files";a:13:{i:0;s:27:"includes/webform.export.inc";i:1;s:41:"views/webform_handler_field_form_body.inc";i:2;s:40:"views/webform_handler_field_is_draft.inc";i:3;s:46:"views/webform_handler_field_node_link_edit.inc";i:4;s:49:"views/webform_handler_field_node_link_results.inc";i:5;s:48:"views/webform_handler_field_submission_count.inc";i:6;s:47:"views/webform_handler_field_submission_link.inc";i:7;s:41:"views/webform_handler_filter_is_draft.inc";i:8;s:23:"views/webform.views.inc";i:9;s:21:"tests/components.test";i:10;s:22:"tests/permissions.test";i:11;s:21:"tests/submission.test";i:12;s:18:"tests/webform.test";}s:7:"version";s:8:"7.x-3.17";s:7:"project";s:7:"webform";s:9:"datestamp";s:10:"1331149848";s:12:"dependencies";a:0:{}s:3:"php";s:5:"5.2.4";s:9:"bootstrap";i:0;}'),
('sites/all/themes/adaptivetheme/adaptivetheme/adaptivetheme.info', 'adaptivetheme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:17:{s:4:"name";s:7:"AT Core";s:11:"description";s:104:"AT Core is the base theme for all Adaptivetheme subthemes. Now with baked in support for mobile devices.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:59:"sites/all/themes/adaptivetheme/adaptivetheme/screenshot.png";s:11:"stylesheets";a:1:{s:3:"all";a:3:{s:15:"css/at.base.css";s:60:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.base.css";s:17:"css/at.layout.css";s:62:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.layout.css";s:19:"css/at.messages.css";s:64:"sites/all/themes/adaptivetheme/adaptivetheme/css/at.messages.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:6:"panels";}}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('sites/all/themes/adaptivetheme/adaptivetheme_admin/adaptivetheme_admin.info', 'adaptivetheme_admin', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:17:{s:4:"name";s:8:"AT Admin";s:11:"description";s:152:"A better admin theme for Drupal 7. Clean, calm, invisible. Includes left and right sidebars, Overlay support and settings for font family and font size.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:65:"sites/all/themes/adaptivetheme/adaptivetheme_admin/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:16:"css/at_admin.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_admin/css/at_admin.css";}}s:7:"regions";a:8:{s:7:"content";s:12:"Main content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:6:"footer";s:6:"Footer";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"settings";a:66:{s:20:"shortcut_module_link";s:1:"1";s:16:"bigscreen_layout";s:15:"three-col-right";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:2:"px";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:3:"200";s:24:"bigscreen_sidebar_second";s:3:"160";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-right";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"15";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:13:"one-col-stack";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:13:"one-col-stack";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"1";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"1";s:21:"extra_article_classes";s:1:"1";s:21:"extra_comment_classes";s:1:"1";s:19:"extra_block_classes";s:1:"1";s:18:"extra_menu_classes";s:1:"1";s:23:"extra_item_list_classes";s:1:"1";s:23:"menu_item_span_elements";s:1:"0";s:11:"font_family";s:4:"ff-l";s:9:"font_size";s:9:"fs-medium";}s:8:"features";a:5:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:7:"favicon";i:3;s:9:"main_menu";i:4;s:14:"secondary_menu";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('sites/all/themes/adaptivetheme/adaptivetheme_subtheme/adaptivetheme_subtheme.info', 'adaptivetheme_subtheme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:17:{s:4:"name";s:11:"AT Subtheme";s:11:"description";s:439:"Starter subtheme for Adaptivetheme. Copy this subtheme to get started building your own Drupal theme. For help see our <b><a href="http://adaptivethemes.com/documentation/adaptivethemes-documentation">documentation</a></b> and <b><a href="http://vimeo.com/channels/61157">video tutorials</a></b>. If you have a problem and need additional help please use the <b><a href="http://drupal.org/project/issues/adaptivetheme">issue queue</a></b>.";s:4:"core";s:3:"7.x";s:6:"engine";s:11:"phptemplate";s:10:"screenshot";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/screenshot.png";s:10:"base theme";s:13:"adaptivetheme";s:11:"stylesheets";a:2:{s:3:"all";a:9:{s:21:"css/html-elements.css";s:75:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/html-elements.css";s:13:"css/forms.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/forms.css";s:14:"css/tables.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/tables.css";s:14:"css/fields.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/fields.css";s:12:"css/page.css";s:66:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/page.css";s:18:"css/navigation.css";s:72:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/navigation.css";s:16:"css/articles.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/articles.css";s:16:"css/comments.css";s:70:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/comments.css";s:14:"css/blocks.css";s:68:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/blocks.css";}s:5:"print";a:1:{s:13:"css/print.css";s:67:"sites/all/themes/adaptivetheme/adaptivetheme_subtheme/css/print.css";}}s:7:"regions";a:14:{s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:7:"content";s:12:"Main Content";s:11:"highlighted";s:11:"Highlighted";s:13:"content_aside";s:5:"Aside";s:17:"secondary_content";s:9:"Secondary";s:16:"tertiary_content";s:8:"Tertiary";s:6:"footer";s:6:"Footer";s:11:"leaderboard";s:11:"Leaderboard";s:6:"header";s:6:"Header";s:8:"menu_bar";s:8:"Menu Bar";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:17:"node_user_picture";i:4;s:20:"comment_user_picture";i:5;s:25:"comment_user_verification";i:6;s:7:"favicon";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:8:"settings";a:64:{s:16:"bigscreen_layout";s:15:"three-col-grail";s:19:"bigscreen_page_unit";s:1:"%";s:22:"bigscreen_sidebar_unit";s:1:"%";s:24:"bigscreen_max_width_unit";s:2:"px";s:20:"bigscreen_page_width";s:3:"100";s:23:"bigscreen_sidebar_first";s:2:"25";s:24:"bigscreen_sidebar_second";s:2:"25";s:23:"bigscreen_set_max_width";s:1:"1";s:19:"bigscreen_max_width";s:4:"1260";s:21:"bigscreen_media_query";s:34:"only screen and (min-width:1025px)";s:23:"tablet_landscape_layout";s:15:"three-col-grail";s:26:"tablet_landscape_page_unit";s:1:"%";s:29:"tablet_landscape_sidebar_unit";s:1:"%";s:31:"tablet_landscape_max_width_unit";s:2:"px";s:27:"tablet_landscape_page_width";s:3:"100";s:30:"tablet_landscape_sidebar_first";s:2:"20";s:31:"tablet_landscape_sidebar_second";s:2:"20";s:30:"tablet_landscape_set_max_width";s:1:"0";s:26:"tablet_landscape_max_width";s:3:"960";s:28:"tablet_landscape_media_query";s:56:"only screen and (min-width:769px) and (max-width:1024px)";s:22:"tablet_portrait_layout";s:12:"one-col-vert";s:25:"tablet_portrait_page_unit";s:1:"%";s:28:"tablet_portrait_sidebar_unit";s:1:"%";s:30:"tablet_portrait_max_width_unit";s:2:"px";s:26:"tablet_portrait_page_width";s:3:"100";s:29:"tablet_portrait_sidebar_first";s:2:"50";s:30:"tablet_portrait_sidebar_second";s:2:"50";s:29:"tablet_portrait_set_max_width";s:1:"0";s:25:"tablet_portrait_max_width";s:3:"780";s:27:"tablet_portrait_media_query";s:55:"only screen and (min-width:481px) and (max-width:768px)";s:27:"smartphone_landscape_layout";s:12:"one-col-vert";s:30:"smartphone_landscape_page_unit";s:1:"%";s:33:"smartphone_landscape_sidebar_unit";s:1:"%";s:35:"smartphone_landscape_max_width_unit";s:2:"px";s:31:"smartphone_landscape_page_width";s:3:"100";s:34:"smartphone_landscape_sidebar_first";s:2:"50";s:35:"smartphone_landscape_sidebar_second";s:2:"50";s:34:"smartphone_landscape_set_max_width";s:1:"0";s:30:"smartphone_landscape_max_width";s:3:"520";s:32:"smartphone_landscape_media_query";s:55:"only screen and (min-width:321px) and (max-width:480px)";s:31:"smartphone_portrait_media_query";s:33:"only screen and (max-width:320px)";s:18:"breadcrumb_display";s:3:"yes";s:20:"breadcrumb_separator";s:8:" &#187; ";s:15:"breadcrumb_home";s:1:"0";s:25:"display_search_form_label";s:1:"1";s:14:"search_snippet";s:1:"1";s:16:"search_info_type";s:1:"1";s:16:"search_info_user";s:1:"1";s:16:"search_info_date";s:1:"1";s:19:"search_info_comment";s:1:"1";s:18:"search_info_upload";s:1:"1";s:21:"search_info_separator";s:3:" - ";s:22:"horizontal_login_block";s:1:"0";s:29:"horizontal_login_block_enable";s:2:"on";s:19:"comments_hide_title";s:1:"0";s:20:"style_enable_schemes";s:3:"off";s:13:"style_schemes";s:17:"style-default.css";s:18:"extra_page_classes";s:1:"0";s:21:"extra_article_classes";s:1:"0";s:21:"extra_comment_classes";s:1:"0";s:19:"extra_block_classes";s:1:"0";s:18:"extra_menu_classes";s:1:"0";s:23:"extra_item_list_classes";s:1:"0";s:23:"menu_item_span_elements";s:1:"0";}s:7:"version";s:7:"7.x-2.2";s:7:"project";s:13:"adaptivetheme";s:9:"datestamp";s:10:"1329397237";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('themes/bartik/bartik.info', 'bartik', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '1', '0', -1, '0', 'a:17:{s:4:"name";s:6:"Bartik";s:11:"description";s:48:"A flexible, recolorable theme with many regions.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:3:{s:14:"css/layout.css";s:28:"themes/bartik/css/layout.css";s:13:"css/style.css";s:27:"themes/bartik/css/style.css";s:14:"css/colors.css";s:28:"themes/bartik/css/colors.css";}s:5:"print";a:1:{s:13:"css/print.css";s:27:"themes/bartik/css/print.css";}}s:7:"regions";a:17:{s:6:"header";s:6:"Header";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:11:"highlighted";s:11:"Highlighted";s:8:"featured";s:8:"Featured";s:7:"content";s:7:"Content";s:13:"sidebar_first";s:13:"Sidebar first";s:14:"sidebar_second";s:14:"Sidebar second";s:14:"triptych_first";s:14:"Triptych first";s:15:"triptych_middle";s:15:"Triptych middle";s:13:"triptych_last";s:13:"Triptych last";s:18:"footer_firstcolumn";s:19:"Footer first column";s:19:"footer_secondcolumn";s:20:"Footer second column";s:18:"footer_thirdcolumn";s:19:"Footer third column";s:19:"footer_fourthcolumn";s:20:"Footer fourth column";s:6:"footer";s:6:"Footer";}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"0";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:28:"themes/bartik/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:17:{s:4:"name";s:7:"Garland";s:11:"description";s:111:"A multi-column theme which can be configured to modify colors and switch between fixed and fluid width layouts.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:8:"settings";a:1:{s:13:"garland_width";s:5:"fluid";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('themes/seven/seven.info', 'seven', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '1', '0', -1, '0', 'a:17:{s:4:"name";s:5:"Seven";s:11:"description";s:65:"A simple one-column, tableless, fluid width administration theme.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:6:"screen";a:2:{s:9:"reset.css";s:22:"themes/seven/reset.css";s:9:"style.css";s:22:"themes/seven/style.css";}}s:8:"settings";a:1:{s:20:"shortcut_module_link";s:1:"1";}s:7:"regions";a:5:{s:7:"content";s:7:"Content";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";s:13:"sidebar_first";s:13:"First sidebar";}s:14:"regions_hidden";a:3:{i:0;s:13:"sidebar_first";i:1;s:8:"page_top";i:2;s:11:"page_bottom";}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/seven/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('themes/stark/stark.info', 'stark', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:16:{s:4:"name";s:5:"Stark";s:11:"description";s:208:"This theme demonstrates Drupal''s default HTML markup and CSS styles. To learn how to build your own theme and override Drupal''s default code, see the <a href="http://drupal.org/theme-guide">Theming Guide</a>.";s:7:"package";s:4:"Core";s:7:"version";s:4:"7.14";s:4:"core";s:3:"7.x";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:10:"layout.css";s:23:"themes/stark/layout.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1335997555";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:27:"themes/stark/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('themes/tests/test_theme/test_theme.info', 'test_theme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:16:{s:4:"name";s:10:"Test theme";s:11:"description";s:34:"Theme for testing the theme system";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:15:"system.base.css";s:39:"themes/tests/test_theme/system.base.css";}}s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:38:"themes/tests/test_theme/screenshot.png";s:3:"php";s:5:"5.2.4";s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('themes/tests/update_test_basetheme/update_test_basetheme.info', 'update_test_basetheme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:16:{s:4:"name";s:22:"Update test base theme";s:11:"description";s:63:"Test theme which acts as a base theme for other test subthemes.";s:4:"core";s:3:"7.x";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:49:"themes/tests/update_test_basetheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}'),
('themes/tests/update_test_subtheme/update_test_subtheme.info', 'update_test_subtheme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', '0', '0', -1, '0', 'a:17:{s:4:"name";s:20:"Update test subtheme";s:11:"description";s:62:"Test theme which uses update_test_basetheme as the base theme.";s:4:"core";s:3:"7.x";s:10:"base theme";s:21:"update_test_basetheme";s:6:"hidden";b:1;s:7:"version";s:3:"7.9";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1319660730";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:9:{s:13:"sidebar_first";s:12:"Left sidebar";s:14:"sidebar_second";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:11:"highlighted";s:11:"Highlighted";s:4:"help";s:4:"Help";s:8:"page_top";s:8:"Page top";s:11:"page_bottom";s:11:"Page bottom";}s:8:"features";a:9:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:25:"comment_user_verification";i:7;s:9:"main_menu";i:8;s:14:"secondary_menu";}s:10:"screenshot";s:48:"themes/tests/update_test_subtheme/screenshot.png";s:3:"php";s:5:"5.2.4";s:11:"stylesheets";a:0:{}s:7:"scripts";a:0:{}s:14:"regions_hidden";a:2:{i:0;s:8:"page_top";i:1;s:11:"page_bottom";}s:28:"overlay_supplemental_regions";a:1:{i:0;s:8:"page_top";}}');
/*!40000 ALTER TABLE system ENABLE KEYS */;

--
-- Table structure for table 'taxonomy_index'
--

CREATE TABLE IF NOT EXISTS `taxonomy_index` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`tid`,`sticky`,`created`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maintains denormalized information about node/term...';

--
-- Dumping data for table 'taxonomy_index'
--

/*!40000 ALTER TABLE taxonomy_index DISABLE KEYS */;
/*!40000 ALTER TABLE taxonomy_index ENABLE KEYS */;

--
-- Table structure for table 'taxonomy_term_data'
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores term information.';

--
-- Dumping data for table 'taxonomy_term_data'
--

/*!40000 ALTER TABLE taxonomy_term_data DISABLE KEYS */;
/*!40000 ALTER TABLE taxonomy_term_data ENABLE KEYS */;

--
-- Table structure for table 'taxonomy_term_hierarchy'
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores the hierarchical relationship between terms.';

--
-- Dumping data for table 'taxonomy_term_hierarchy'
--

/*!40000 ALTER TABLE taxonomy_term_hierarchy DISABLE KEYS */;
/*!40000 ALTER TABLE taxonomy_term_hierarchy ENABLE KEYS */;

--
-- Table structure for table 'taxonomy_vocabulary'
--

CREATE TABLE IF NOT EXISTS `taxonomy_vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module which created the vocabulary.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores vocabulary information.';

--
-- Dumping data for table 'taxonomy_vocabulary'
--

/*!40000 ALTER TABLE taxonomy_vocabulary DISABLE KEYS */;
INSERT INTO `taxonomy_vocabulary` VALUES
('1', 'Tags', 'tags', 'Use tags to group articles on similar topics into categories.', '0', 'taxonomy', '0');
/*!40000 ALTER TABLE taxonomy_vocabulary ENABLE KEYS */;

--
-- Table structure for table 'url_alias'
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY (`pid`),
  KEY `alias_language_pid` (`alias`,`language`,`pid`),
  KEY `source_language_pid` (`source`,`language`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='A list of URL aliases for Drupal paths; a user may visit...';

--
-- Dumping data for table 'url_alias'
--

/*!40000 ALTER TABLE url_alias DISABLE KEYS */;
/*!40000 ALTER TABLE url_alias ENABLE KEYS */;

--
-- Table structure for table 'users'
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique user ID.',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'Unique user name.',
  `pass` varchar(128) NOT NULL DEFAULT '' COMMENT 'User’s password (hashed).',
  `mail` varchar(254) DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s default theme.',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s signature.',
  `signature_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for when user was created.',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for user’s last login.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` varchar(32) DEFAULT NULL COMMENT 'User’s time zone.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'User’s default language.',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` varchar(254) DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores user data.';

--
-- Dumping data for table 'users'
--

/*!40000 ALTER TABLE users DISABLE KEYS */;
INSERT INTO `users` VALUES
('0', '', '', '', '', '', NULL, '0', '0', '0', '0', NULL, '', '0', '', NULL),
('1', 'admin', '$S$D6o3ZJVUJuRSjR.C7TxIHxrotef5Z7mKvqrH7GirjvAyxJQ02dl5', 'b@nqbao.com', '', '', NULL, '1335371989', '1338716408', '1338715423', '1', 'Asia/Ho_Chi_Minh', '', '0', 'b@nqbao.com', 'b:0;');
/*!40000 ALTER TABLE users ENABLE KEYS */;

--
-- Table structure for table 'users_roles'
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: role.rid for role.',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Maps users to roles.';

--
-- Dumping data for table 'users_roles'
--

/*!40000 ALTER TABLE users_roles DISABLE KEYS */;
INSERT INTO `users_roles` VALUES
('1', '3');
/*!40000 ALTER TABLE users_roles ENABLE KEYS */;

--
-- Table structure for table 'variable'
--

CREATE TABLE IF NOT EXISTS `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Named variable/value pairs created by Drupal core or any...';

--
-- Dumping data for table 'variable'
--

/*!40000 ALTER TABLE variable DISABLE KEYS */;
INSERT INTO `variable` VALUES
('admin_theme', 's:5:"seven";'),
('anonymous', 's:9:"Anonymous";'),
('backup_migrate_destination_id', 's:6:"manual";'),
('backup_migrate_profile_id', 's:7:"default";'),
('backup_migrate_source_id', 's:2:"db";'),
('clean_url', 's:1:"1";'),
('comment_page', 'i:0;'),
('configurable_timezones', 'i:0;'),
('cron_key', 's:43:"kf_CFTO7gnhur1PEjYb8R-aCHhDCnHpoVNzLqHm-BWY";'),
('cron_last', 'i:1338715358;'),
('css_js_query_string', 's:6:"m51c2m";'),
('ctools_last_cron', 'i:1338715393;'),
('dashboard_stashed_blocks', 'a:5:{i:0;a:3:{s:6:"module";s:4:"node";s:5:"delta";s:6:"recent";s:6:"region";s:14:"dashboard_main";}i:1;a:3:{s:6:"module";s:4:"user";s:5:"delta";s:3:"new";s:6:"region";s:17:"dashboard_sidebar";}i:2;a:3:{s:6:"module";s:6:"search";s:5:"delta";s:4:"form";s:6:"region";s:17:"dashboard_sidebar";}i:3;a:3:{s:6:"module";s:7:"comment";s:5:"delta";s:6:"recent";s:6:"region";s:18:"dashboard_inactive";}i:4;a:3:{s:6:"module";s:4:"user";s:5:"delta";s:6:"online";s:6:"region";s:18:"dashboard_inactive";}}'),
('date_default_timezone', 's:16:"Asia/Ho_Chi_Minh";'),
('date_first_day', 's:1:"0";'),
('default_nodes_main', 's:2:"10";'),
('dev_query', 'i:0;'),
('drupal_http_request_fails', 'b:0;'),
('drupal_private_key', 's:43:"BoMQKBbeFosU5gOzdR6xYrqW6-ip2mLFDR5zdYCstqM";'),
('email__active_tab', 's:24:"edit-email-admin-created";'),
('empty_timezone_message', 'i:0;'),
('features_ignored_orphans', 'a:0:{}'),
('file_default_scheme', 's:6:"public";'),
('file_private_path', 's:27:"sites/default/private/files";'),
('file_public_path', 's:19:"sites/default/files";'),
('file_temporary_path', 's:3:"tmp";'),
('filter_fallback_format', 's:10:"plain_text";'),
('install_profile', 's:8:"standard";'),
('install_task', 's:4:"done";'),
('install_time', 'i:1335372088;'),
('maintenance_mode', 'b:0;'),
('menu_expanded', 'a:0:{}'),
('menu_masks', 'a:33:{i:0;i:501;i:1;i:250;i:2;i:245;i:3;i:127;i:4;i:125;i:5;i:124;i:6;i:123;i:7;i:122;i:8;i:121;i:9;i:117;i:10;i:63;i:11;i:62;i:12;i:61;i:13;i:60;i:14;i:59;i:15;i:58;i:16;i:44;i:17;i:31;i:18;i:30;i:19;i:29;i:20;i:27;i:21;i:24;i:22;i:21;i:23;i:15;i:24;i:14;i:25;i:13;i:26;i:11;i:27;i:7;i:28;i:6;i:29;i:5;i:30;i:3;i:31;i:2;i:32;i:1;}'),
('node_admin_theme', 's:1:"1";'),
('node_options_page', 'a:1:{i:0;s:6:"status";}'),
('node_submitted_page', 'b:0;'),
('pathauto_blog_pattern', 's:17:"blogs/[user:name]";'),
('pathauto_case', 's:1:"1";'),
('pathauto_forum_pattern', 's:29:"[term:vocabulary]/[term:name]";'),
('pathauto_ignore_words', 's:0:"";'),
('pathauto_max_component_length', 's:3:"100";'),
('pathauto_max_length', 's:3:"100";'),
('pathauto_node_page_pattern', 's:0:"";'),
('pathauto_node_pattern', 's:0:"";'),
('pathauto_punctuation_ampersand', 's:1:"0";'),
('pathauto_punctuation_asterisk', 's:1:"0";'),
('pathauto_punctuation_at', 's:1:"0";'),
('pathauto_punctuation_backtick', 's:1:"0";'),
('pathauto_punctuation_back_slash', 's:1:"0";'),
('pathauto_punctuation_caret', 's:1:"0";'),
('pathauto_punctuation_colon', 's:1:"0";'),
('pathauto_punctuation_comma', 's:1:"0";'),
('pathauto_punctuation_dollar', 's:1:"0";'),
('pathauto_punctuation_double_quotes', 's:1:"0";'),
('pathauto_punctuation_equal', 's:1:"0";'),
('pathauto_punctuation_exclamation', 's:1:"0";'),
('pathauto_punctuation_greater_than', 's:1:"0";'),
('pathauto_punctuation_hash', 's:1:"0";'),
('pathauto_punctuation_hyphen', 's:1:"1";'),
('pathauto_punctuation_left_curly', 's:1:"0";'),
('pathauto_punctuation_left_parenthesis', 's:1:"0";'),
('pathauto_punctuation_left_square', 's:1:"0";'),
('pathauto_punctuation_less_than', 's:1:"0";'),
('pathauto_punctuation_percent', 's:1:"0";'),
('pathauto_punctuation_period', 's:1:"0";'),
('pathauto_punctuation_pipe', 's:1:"0";'),
('pathauto_punctuation_plus', 's:1:"0";'),
('pathauto_punctuation_question_mark', 's:1:"0";'),
('pathauto_punctuation_quotes', 's:1:"0";'),
('pathauto_punctuation_right_curly', 's:1:"0";'),
('pathauto_punctuation_right_parenthesis', 's:1:"0";'),
('pathauto_punctuation_right_square', 's:1:"0";'),
('pathauto_punctuation_semicolon', 's:1:"0";'),
('pathauto_punctuation_slash', 's:1:"0";'),
('pathauto_punctuation_tilde', 's:1:"0";'),
('pathauto_punctuation_underscore', 's:1:"0";'),
('pathauto_reduce_ascii', 'i:0;'),
('pathauto_separator', 's:1:"-";'),
('pathauto_taxonomy_term_pattern', 's:0:"";'),
('pathauto_taxonomy_term_tags_pattern', 's:0:"";'),
('pathauto_transliterate', 'b:0;'),
('pathauto_update_action', 's:1:"2";'),
('pathauto_user_pattern', 's:0:"";'),
('pathauto_verbose', 'i:0;'),
('path_alias_whitelist', 'a:0:{}'),
('site_403', 's:0:"";'),
('site_404', 's:0:"";'),
('site_default_country', 's:2:"VN";'),
('site_frontpage', 's:6:"node/1";'),
('site_mail', 's:11:"b@nqbao.com";'),
('site_name', 's:19:"Quickstart Template";'),
('site_offline', 'i:0;'),
('site_slogan', 's:0:"";'),
('theme_default', 's:6:"bartik";'),
('update_last_check', 'i:1338715814;'),
('update_notify_emails', 'a:1:{i:0;s:11:"b@nqbao.com";}'),
('user_admin_role', 's:1:"3";'),
('user_cancel_method', 's:17:"user_cancel_block";'),
('user_default_timezone', 's:1:"0";'),
('user_email_verification', 'i:1;'),
('user_mail_cancel_confirm_body', 's:381:"[user:name],\r\n\r\nA request to cancel your account has been made at [site:name].\r\n\r\nYou may now cancel your account on [site:url-brief] by clicking this link or copying and pasting it into your browser:\r\n\r\n[user:cancel-url]\r\n\r\nNOTE: The cancellation of your account is not reversible.\r\n\r\nThis link expires in one day and nothing will happen if it is not used.\r\n\r\n--  [site:name] team";'),
('user_mail_cancel_confirm_subject', 's:59:"Account cancellation request for [user:name] at [site:name]";'),
('user_mail_password_reset_body', 's:407:"[user:name],\r\n\r\nA request to reset the password for your account has been made at [site:name].\r\n\r\nYou may now log in by clicking this link or copying and pasting it to your browser:\r\n\r\n[user:one-time-login-url]\r\n\r\nThis link can only be used once to log in and will lead you to a page where you can set your password. It expires after one day and nothing will happen if it''s not used.\r\n\r\n--  [site:name] team";'),
('user_mail_password_reset_subject', 's:60:"Replacement login information for [user:name] at [site:name]";'),
('user_mail_register_admin_created_body', 's:476:"[user:name],\r\n\r\nA site administrator at [site:name] has created an account for you. You may now log in by clicking this link or copying and pasting it to your browser:\r\n\r\n[user:one-time-login-url]\r\n\r\nThis link can only be used once to log in and will lead you to a page where you can set your password.\r\n\r\nAfter setting your password, you will be able to log in at [site:login-url] in the future using:\r\n\r\nusername: [user:name]\r\npassword: Your password\r\n\r\n--  [site:name] team";'),
('user_mail_register_admin_created_subject', 's:58:"An administrator created an account for you at [site:name]";'),
('user_mail_register_no_approval_required_body', 's:450:"[user:name],\r\n\r\nThank you for registering at [site:name]. You may now log in by clicking this link or copying and pasting it to your browser:\r\n\r\n[user:one-time-login-url]\r\n\r\nThis link can only be used once to log in and will lead you to a page where you can set your password.\r\n\r\nAfter setting your password, you will be able to log in at [site:login-url] in the future using:\r\n\r\nusername: [user:name]\r\npassword: Your password\r\n\r\n--  [site:name] team";'),
('user_mail_register_no_approval_required_subject', 's:46:"Account details for [user:name] at [site:name]";'),
('user_mail_register_pending_approval_body', 's:287:"[user:name],\r\n\r\nThank you for registering at [site:name]. Your application for an account is currently pending approval. Once it has been approved, you will receive another e-mail containing information about how to log in, set your password, and other details.\r\n\r\n\r\n--  [site:name] team";'),
('user_mail_register_pending_approval_subject', 's:71:"Account details for [user:name] at [site:name] (pending admin approval)";'),
('user_mail_status_activated_body', 's:461:"[user:name],\r\n\r\nYour account at [site:name] has been activated.\r\n\r\nYou may now log in by clicking this link or copying and pasting it into your browser:\r\n\r\n[user:one-time-login-url]\r\n\r\nThis link can only be used once to log in and will lead you to a page where you can set your password.\r\n\r\nAfter setting your password, you will be able to log in at [site:login-url] in the future using:\r\n\r\nusername: [user:name]\r\npassword: Your password\r\n\r\n--  [site:name] team";'),
('user_mail_status_activated_notify', 'i:1;'),
('user_mail_status_activated_subject', 's:57:"Account details for [user:name] at [site:name] (approved)";'),
('user_mail_status_blocked_body', 's:85:"[user:name],\r\n\r\nYour account on [site:name] has been blocked.\r\n\r\n--  [site:name] team";'),
('user_mail_status_blocked_notify', 'i:0;'),
('user_mail_status_blocked_subject', 's:56:"Account details for [user:name] at [site:name] (blocked)";'),
('user_mail_status_canceled_body', 's:86:"[user:name],\r\n\r\nYour account on [site:name] has been canceled.\r\n\r\n--  [site:name] team";'),
('user_mail_status_canceled_notify', 'i:0;'),
('user_mail_status_canceled_subject', 's:57:"Account details for [user:name] at [site:name] (canceled)";'),
('user_pictures', 'i:0;'),
('user_picture_default', 's:0:"";'),
('user_picture_dimensions', 's:9:"1024x1024";'),
('user_picture_file_size', 's:3:"800";'),
('user_picture_guidelines', 's:0:"";'),
('user_picture_path', 's:8:"pictures";'),
('user_picture_style', 's:9:"thumbnail";'),
('user_register', 's:1:"0";'),
('user_signatures', 'i:0;');
/*!40000 ALTER TABLE variable ENABLE KEYS */;

--
-- Table structure for table 'views_display'
--

CREATE TABLE IF NOT EXISTS `views_display` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The view this display is attached to.',
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT 'An identifier for this display; usually generated from the display_plugin, so should be something like page or page_1 or block_2, etc.',
  `display_title` varchar(64) NOT NULL DEFAULT '' COMMENT 'The title of the display, viewable by the administrator.',
  `display_plugin` varchar(64) NOT NULL DEFAULT '' COMMENT 'The type of the display. Usually page, block or embed, but is pluggable so may be other things.',
  `position` int(11) DEFAULT '0' COMMENT 'The order in which this display is loaded.',
  `display_options` longtext COMMENT 'A serialized array of options for this display; it contains options that are generally only pertinent to that display plugin type.',
  PRIMARY KEY (`vid`,`id`),
  KEY `vid` (`vid`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores information about each display attached to a view.';

--
-- Dumping data for table 'views_display'
--

/*!40000 ALTER TABLE views_display DISABLE KEYS */;
/*!40000 ALTER TABLE views_display ENABLE KEYS */;

--
-- Table structure for table 'views_view'
--

CREATE TABLE IF NOT EXISTS `views_view` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The view ID of the field, defined by the database.',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `description` varchar(255) DEFAULT '' COMMENT 'A description of the view for the admin interface.',
  `tag` varchar(255) DEFAULT '' COMMENT 'A tag used to group/sort views in the admin interface',
  `base_table` varchar(64) NOT NULL DEFAULT '' COMMENT 'What table this view is based on, such as node, user, comment, or term.',
  `human_name` varchar(255) DEFAULT '' COMMENT 'A human readable name used to be displayed in the admin interface',
  `core` int(11) DEFAULT '0' COMMENT 'Stores the drupal core version of the view.',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores the general data for a view.';

--
-- Dumping data for table 'views_view'
--

/*!40000 ALTER TABLE views_view DISABLE KEYS */;
/*!40000 ALTER TABLE views_view ENABLE KEYS */;

--
-- Table structure for table 'watchdog'
--

CREATE TABLE IF NOT EXISTS `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example `user` or `page not found.`',
  `message` longtext NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` varchar(255) DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` text COMMENT 'URL of referring page.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Table that contains logs of all system events.';

SET FOREIGN_KEY_CHECKS = 1;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;

