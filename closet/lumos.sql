# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.13)
# Database: Lumos
# Generation Time: 2013-11-19 23:13:20 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table active_admin_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `active_admin_comments`;

CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` varchar(255) NOT NULL,
  `resource_type` varchar(255) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_admin_notes_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `email`, `role`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `user_id`, `first_name`, `last_name`)
VALUES
	(2,'admin@lumos.org','Administrator','$2a$10$1ZWuZtLGqk7jUO7bIQRdHuBLSpwy/VTIwYIL4YW8skDxgknbCVHpC',NULL,'2012-07-31 22:37:10','2013-11-09 17:38:32',127,'2013-11-19 22:58:53','2013-11-19 22:47:29','127.0.0.1','127.0.0.1','2012-07-09 23:37:35','2013-11-19 22:58:53','admin','John','Tibbetts'),
	(6,'jadams@lumos.org','Instructor','$2a$10$fcq0XejjaJ30GSyE34wzxO5pMXh1EV75BfI3t76YQ7IEW4/9qdzYq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:47:32','2012-07-31 22:47:32','john.adams','John','Adams'),
	(7,'tarne@lumos.org','Learner','$2a$10$KrvXKBGBCYH6idjDE3Ctpe1fUmvbkRFISyJBpriHtPCrTHkt.UPV6',NULL,NULL,NULL,6,'2012-10-09 14:49:01','2012-10-09 14:45:45','127.0.0.1','127.0.0.1','2012-07-31 22:48:15','2012-10-09 14:49:01','tom.arne','Tom','Arne'),
	(8,'hbingen@lumos.org','Instructor','$2a$10$IVQh8q/2t38cF2wuVO6Ec.GQF3RVKNy45W1tr.vqX2F4QxT3nzMwG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:48:57','2012-07-31 22:48:57','hildy.bingen','Hildy','Bingen'),
	(9,'wbach@lumos.org','Learner','$2a$10$QcjasSRFSesjvBodh5A0zOd6aux..zHhZ7znkOzDaeIxrIj/Gyu32',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:49:39','2012-07-31 22:49:39','willie.bach','Willie','Bach'),
	(10,'bdev@lumos.org','Learner','$2a$10$Y99OkiogEHrTW8G96Dhty.84RSgCcbFOqevTfEyUgY8qtATbLLQGa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:50:27','2012-07-31 22:50:27','bcdev','BC','Dev'),
	(11,'sian@imscert.org','Instructor','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2013-10-25 00:00:00','2013-10-25 00:00:00','sian.instructor','Siân','Instructor'),
	(12,'john@imscert.org','Student','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2013-10-25 00:00:00','2013-10-25 00:00:00','john.student','John','Student');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_label` varchar(255) DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;

INSERT INTO `courses` (`id`, `course_label`, `course_title`, `created_at`, `updated_at`)
VALUES
	(1,'ENG110A','English Masters','2012-07-31 23:09:13','2012-07-31 23:09:13'),
	(2,'SMPL101A','Nursing Compendium','2012-07-31 23:09:54','2012-07-31 23:09:54'),
	(3,'NURS200A','Nursing Operations','2012-07-31 23:10:31','2012-07-31 23:10:31'),
	(4,'DEV400A','Developer Seminar','2012-07-31 23:12:28','2012-07-31 23:12:28'),
	(5,'DPE001','Design of Personal Environments 1','2013-10-25 00:00:00','2013-10-25 00:00:00'),
	(6,'DPE002','Design of Personal Environments 2','2013-10-25 00:00:00','2013-10-25 00:00:00');

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table deployment_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deployment_requests`;

CREATE TABLE `deployment_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_key` varchar(255) DEFAULT NULL,
  `reg_password` varchar(255) DEFAULT NULL,
  `partner_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `tc_profile_guid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_deployment_requests_on_tc_profile_guid` (`tc_profile_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table enrollments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enrollments`;

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;

INSERT INTO `enrollments` (`id`, `admin_user_id`, `course_id`, `role`, `created_at`, `updated_at`)
VALUES
	(1,6,1,'instructor','2012-07-31 23:18:59','2012-07-31 23:18:59'),
	(2,6,3,'instructor','2012-07-31 23:19:45','2012-07-31 23:19:45'),
	(3,6,2,'instructor','2012-07-31 23:20:07','2012-07-31 23:20:07'),
	(4,7,1,'student','2012-07-31 23:20:24','2012-07-31 23:20:24'),
	(5,7,3,'student','2012-07-31 23:20:39','2012-07-31 23:20:39'),
	(6,7,2,'student','2012-07-31 23:21:01','2012-07-31 23:21:01'),
	(7,8,1,'instructor','2012-07-31 23:23:56','2012-07-31 23:23:56'),
	(8,8,3,'instructor','2012-07-31 23:24:15','2012-07-31 23:24:15'),
	(9,8,2,'instructor','2012-07-31 23:24:30','2012-07-31 23:24:30'),
	(10,9,1,'student','2012-07-31 23:24:45','2012-07-31 23:24:45'),
	(11,9,3,'student','2012-07-31 23:24:53','2012-07-31 23:24:53'),
	(12,9,2,'student','2012-07-31 23:25:00','2012-07-31 23:25:00'),
	(13,10,4,'student','2012-07-31 23:25:15','2012-07-31 23:25:15'),
	(14,2,4,'instructor','2012-07-31 23:25:28','2012-07-31 23:25:28'),
	(15,11,5,'instructor','2013-10-25 00:00:00','2013-10-25 00:00:00'),
	(16,12,5,'student','2013-10-25 00:00:00','2013-10-25 00:00:00'),
	(17,11,6,'instructor','2013-10-25 00:00:00','2013-10-25 00:00:00'),
	(18,12,6,'student','2013-10-25 00:00:00','2013-10-25 00:00:00');

/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grade_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grade_items`;

CREATE TABLE `grade_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `grade_items` WRITE;
/*!40000 ALTER TABLE `grade_items` DISABLE KEYS */;

INSERT INTO `grade_items` (`id`, `course_id`, `label`, `created_at`, `updated_at`)
VALUES
	(4,2,'IRTestGrade','2013-11-19 23:10:23','2013-11-19 23:10:23'),
	(5,5,'IRTestGrade','2013-11-19 23:10:23','2013-11-19 23:10:23'),
	(6,6,'IRTestGrade','2013-11-19 23:10:23','2013-11-19 23:10:23');

/*!40000 ALTER TABLE `grade_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grade_results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grade_results`;

CREATE TABLE `grade_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT NULL,
  `result` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `links`;

CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_link_label` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `grade_item_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `link_parameters` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;

INSERT INTO `links` (`id`, `resource_link_label`, `is_enabled`, `grade_item_id`, `created_at`, `updated_at`, `course_id`, `resource_id`, `link_parameters`)
VALUES
	(19,'Settings',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',2,19,'{}'),
	(20,'Settings',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',5,20,'{}'),
	(21,'Settings',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',6,21,'{}'),
	(22,'Echo',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',2,22,'{}'),
	(23,'Echo',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',5,23,'{}'),
	(24,'Echo',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',6,24,'{}'),
	(25,'Book',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',2,25,'{\"vbid\":\"L-999-74180\"}'),
	(26,'Book',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',5,26,'{\"vbid\":\"L-999-74180\"}'),
	(27,'Book',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',6,27,'{\"vbid\":\"L-999-74180\"}'),
	(28,'BookSelection',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',2,28,'{\"vbid\":\"L-999-74180\",\"book_location\":\"outline/3\"}'),
	(29,'BookSelection',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',5,29,'{\"vbid\":\"L-999-74180\",\"book_location\":\"outline/3\"}'),
	(30,'BookSelection',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',6,30,'{\"vbid\":\"L-999-74180\",\"book_location\":\"outline/3\"}'),
	(31,'InteractiveResource',1,4,'2013-11-19 23:10:23','2013-11-19 23:10:23',2,31,'{\"vbid\":\"L-999-74180\"}'),
	(32,'InteractiveResource',1,5,'2013-11-19 23:10:23','2013-11-19 23:10:23',5,32,'{\"vbid\":\"L-999-74180\"}'),
	(33,'InteractiveResource',1,6,'2013-11-19 23:10:23','2013-11-19 23:10:23',6,33,'{\"vbid\":\"L-999-74180\"}'),
	(34,'Bookshelf',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',2,34,'{}'),
	(35,'Bookshelf',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',5,35,'{}'),
	(36,'Bookshelf',1,NULL,'2013-11-19 23:10:23','2013-11-19 23:10:23',6,36,'{}');

/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table registries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `registries`;

CREATE TABLE `registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `registries` WRITE;
/*!40000 ALTER TABLE `registries` DISABLE KEYS */;

INSERT INTO `registries` (`id`, `name`, `content`, `created_at`, `updated_at`)
VALUES
	(1,'tool_consumer_profile_template','{\n  \"@context\" : [\n    \"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",\n    {\n      \"ltitcp\" : \"{tc_deployment_url}/tool_consumer_profiles/{tc_profile_guid}#\"\n    }\n  ],\n  \"@type\" : \"ToolConsumerProfile\",\n  \"@id\" : \"{tc_deployment_url}/tool_consumer_profiles/{tc_profile_guid}\",\n  \"lti_version\" : \"LTI-2p0\",\n  \"guid\" : \"{tc_profile_guid}\",\n  \"product_instance\" : {\n    \"guid\" : \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\" : {\n      \"product_name\" : {\n        \"default_value\" : \"Elan/{tool_consumer_name}\",\n        \"key\" : \"product.name\"\n      },\n      \"product_version\" : \"3.1\",\n      \"description\" : {\n        \"default_value\" : \"Elan University/{tool_consumer_name} Learning Platform\",\n        \"key\" : \"product.version\"\n      },\n      \"technical_description\" : {\n        \"default_value\" : \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\" : \"product.technicalDescription\"\n      },\n      \"product_family\" : {\n        \"code\" : \"{tool_consumer_name}\",\n        \"vendor\" : {\n          \"code\" : \"lms.{tool_consumer_name}.org\",\n          \"vendor_name\" : {\n            \"default_value\" : \"{tool_consumer_name} Corporation\",\n            \"key\" : \"product.vendor.name\"\n          },\n          \"description\" : {\n            \"default_value\" : \"{tool_consumer_name} Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\" : \"product.vendor.description\"\n          },\n          \"website\" : \"http://lms.{tool_consumer_name}.org/products/omega\",\n          \"timestamp\" : \"2012-07-09T012:08:16-04:00\",\n          \"contact\" : {\n            \"email\" : \"support@lms.{tool_consumer_name}.org\"\n          }\n        }\n      }\n    },\n    \"support\" : {\n      \"email\" : \"john.tibbetts@kinexis.com\"\n    },\n	\"service_owner\" : {\n	   \"@id\" : \"http://ec2.{tool_consumer_name}.org/ServiceOwner\",\n	   \"timestamp\" : \"2012-03-28T09:08:16-04:00\",\n	   \"service_owner_name\" : {\n	     \"default_value\" : \"Elan University\",\n	     \"key\" : \"service_owner.name\"\n	   },\n	   \"description\" : {\n	     \"default_value\" : \"Elan University EC2 Cloud\",\n	     \"key\" : \"service_owner.description\"\n	   },\n	   \"support\" : {\n	     \"email\" : \"techsupport@elan.edu\"\n	   }\n	 },\n    \"service_provider\" : {\n      \"@id\" : \"http://ec2.{tool_consumer_name}.org/ServiceProvider\",\n      \"guid\" : \"ec2.{tool_consumer_name}.org\",\n      \"timestamp\" : \"2012-07-09T012:08:16-04:00\",\n      \"service_provider_name\" : {\n        \"default_value\" : \"Elan University\",\n        \"key\" : \"service_provider.name\"\n      },\n      \"description\" : {\n        \"default_value\" : \"Elan University EC2 Cloud\",\n        \"key\" : \"service_provider.description\"\n      },\n      \"support\" : {\n        \"email\" : \"support@yasp.{tool_consumer_name}.org\"\n      }\n    }\n  },\n  \"capability_offered\" : [\n     \"basic-lti-launch-request\",\n     \"Result.autocreate\",\n     \"Result.sourcedId\",\n	 \"User.id\",\n	 \"User.username\",\n	 \"CourseSection.sourcedId\",\n	 \"Person.sourcedId\",\n	 \"Person.email.primary\",\n	 \"Person.name.given\",\n	 \"Person.name.family\",\n	 \"Person.name.full\",\n	 \"Membership.role\",\n	 \"ToolProxy.custom.url\",\n         \"ToolProxyBinding.custom.url\",\n          \"LtiLink.custom.url\"\n  ],\n  \"service_offered\" : [\n    { \n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:ToolProxy.collection\",\n      \"endpoint\" : \"{tc_deployment_url}/tools\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolproxy+json\"],\n      \"action\" : [\"POST\"]\n    },\n    { \n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:ToolProxy.item\",\n      \"endpoint\" : \"{tc_deployment_url}/tools/{tool_proxy_guid}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolproxy+json\"],\n      \"action\" : [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    { \n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:Result.item\",\n      \"endpoint\" : \"{tc_deployment_url}/resources/Result/{sourcedId}\",\n      \"format\" : [\"application/vnd.ims.lis.v2.result+json\"],\n      \"action\" : [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:LtiLinkSettings\",\n      \"endpoint\" : \"{tc_deployment_url}/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolsettings+json\", \"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\n      \"action\" : [\"GET\", \"PUT\"]\n    },\n    {\n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:ToolProxyBindingSettings\",\n      \"endpoint\" : \"{tc_deployment_url}/tool_settings/{tool_proxy_guid}/context/{context_id}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolsettings+json\", \"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\n      \"action\" : [\"GET\", \"PUT\"]\n    },\n    {\n      \"@type\":\"RestService\",\n      \"@id\" : \"ltitcp:ToolProxySettings\",\n      \"endpoint\" : \"{tc_deployment_url}/tool_settings/{tool_proxy_guid}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolsettings+json\", \"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\n      \"action\" : [\"GET\", \"PUT\"]\n	}\n  ]\n}','2012-07-09 23:45:10','2012-07-09 23:45:10'),
	(3,'tc_deployment_url','http://rails.kinexis.com:4000','0000-00-00 00:00:00','2012-07-29 17:58:18'),
	(5,'relaxed_oauth_check','false','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(6,'result_template','{\n  \"@context\" : \"http://purl.imsglobal.org/ctx/lis/v2/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(7,'tool_consumer_name','LuMoS','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `registries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resources`;

CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;

INSERT INTO `resources` (`id`, `tool_id`, `resource_type`, `name`, `description`)
VALUES
	(19,2,'setting','Settings','Settings service'),
	(20,2,'setting','Settings','Settings service'),
	(21,2,'setting','Settings','Settings service'),
	(22,2,'echo','Echo','Echo service'),
	(23,2,'echo','Echo','Echo service'),
	(24,2,'echo','Echo','Echo service'),
	(25,2,'book','Book','VitalSource reader for XML, PDF, and ePub content'),
	(26,2,'book','Book','VitalSource reader for XML, PDF, and ePub content'),
	(27,2,'book','Book','VitalSource reader for XML, PDF, and ePub content'),
	(28,2,'bookselection','BookSelection','Deep-linked VitalSource reader for XML, PDF, and ePub content'),
	(29,2,'bookselection','BookSelection','Deep-linked VitalSource reader for XML, PDF, and ePub content'),
	(30,2,'bookselection','BookSelection','Deep-linked VitalSource reader for XML, PDF, and ePub content'),
	(31,2,'iresource','InteractiveResource','Interactive resource'),
	(32,2,'iresource','InteractiveResource','Interactive resource'),
	(33,2,'iresource','InteractiveResource','Interactive resource'),
	(34,2,'bookshelf','Bookshelf','VitalSource Bookshelf'),
	(35,2,'bookshelf','Bookshelf','VitalSource Bookshelf'),
	(36,2,'bookshelf','Bookshelf','VitalSource Bookshelf');

/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20121231165540'),
	('20130801221129');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tool_consumer_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tool_consumer_profiles`;

CREATE TABLE `tool_consumer_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_profile_guid` varchar(255) DEFAULT NULL,
  `tc_profile` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tool_consumer_profiles_on_tc_profile_guid` (`tc_profile_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tool_consumer_profiles` WRITE;
/*!40000 ALTER TABLE `tool_consumer_profiles` DISABLE KEYS */;

INSERT INTO `tool_consumer_profiles` (`id`, `tc_profile_guid`, `tc_profile`, `created_at`, `updated_at`)
VALUES
	(3,'a94ee280-339d-0131-3ca8-20c9d07c6451','{\n  \"@context\": [\n    \"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://rails.kinexis.com:4000/tool_consumer_profiles/{tc_profile_guid}#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://rails.kinexis.com:4000/tool_consumer_profiles/{tc_profile_guid}\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"a94ee280-339d-0131-3ca8-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"vendor_name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_owner\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceOwner\",\n      \"timestamp\": \"2012-03-28T09:08:16-04:00\",\n      \"service_owner_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_owner.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_owner.description\"\n      },\n      \"support\": {\n        \"email\": \"techsupport@elan.edu\"\n      }\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"service_provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_offered\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedId\",\n    \"User.id\",\n    \"User.username\",\n    \"CourseSection.sourcedId\",\n    \"Person.sourcedId\",\n    \"Person.email.primary\",\n    \"Person.name.given\",\n    \"Person.name.family\",\n    \"Person.name.full\",\n    \"Membership.role\",\n    \"ToolProxy.custom.url\",\n    \"ToolProxyBinding.custom.url\",\n    \"LtiLink.custom.url\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tools\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolproxy+json\"\n      ],\n      \"action\": [\n        \"POST\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tools/{tool_proxy_guid}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolproxy+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/resources/Result/{sourcedId}\",\n      \"format\": [\n        \"application/vnd.ims.lis.v2.result+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:LtiLinkSettings\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolsettings+json\",\n        \"application/vnd.ims.lti.v2.toolsettings.simple+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxyBindingSettings\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tool_settings/{tool_proxy_guid}/context/{context_id}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolsettings+json\",\n        \"application/vnd.ims.lti.v2.toolsettings.simple+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxySettings\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tool_settings/{tool_proxy_guid}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolsettings+json\",\n        \"application/vnd.ims.lti.v2.toolsettings.simple+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-11-19 23:10:14','2013-11-19 23:10:14');

/*!40000 ALTER TABLE `tool_consumer_profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tool_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tool_settings`;

CREATE TABLE `tool_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `scopeable_id` int(11) DEFAULT NULL,
  `scopeable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tools`;

CREATE TABLE `tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_proxy` text,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tools_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;

INSERT INTO `tools` (`id`, `tool_proxy`, `is_enabled`, `created_at`, `updated_at`, `product_name`, `description`, `key`, `secret`)
VALUES
	(2,'{\n  \"@context\": [\n    \"http://purl.imsglobal.org/ctx/lti/v2/ToolProxy\"\n  ],\n  \"@type\": \"ToolProxy\",\n  \"@id\": \"http://rails.kinexis.com:4000/tools/b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"tool_proxy_guid\": \"b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n  \"tool_consumer_profile\": \"http://rails.kinexis.com:4000/tool_consumer_profiles/a94ee280-339d-0131-3ca8-20c9d07c6451\",\n  \"tool_profile\": {\n    \"product_instance\": {\n      \"product_info\": {\n        \"product_version\": \"10.3\",\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"website\": \"{http://localhost:5000}\",\n            \"code\": \"fabericious.org\",\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"service_provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        },\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\"\n      }\n    },\n    \"lti_version\": \"LTI-2p0\",\n    \"message\": [\n      {\n        \"message_type\": [\n          \"ToolProxyRegistrationRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"http://localhost:5000/reregistrations\",\n        \"parameter\": [\n          {\n            \"variable\": \"ToolConsumerProfile.url\",\n            \"name\": \"tc_profile_url\"\n          }\n        ]\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"message\": [\n          {\n            \"path\": \"/settings\",\n            \"parameter\": [\n              {\n                \"variable\": \"ToolProxy.custom.url\",\n                \"name\": \"tool_proxy_custom_url\"\n              },\n              {\n                \"variable\": \"ToolProxyBinding.custom.url\",\n                \"name\": \"tool_proxy_binding_custom_url\"\n              },\n              {\n                \"variable\": \"LtiLink.custom.url\",\n                \"name\": \"lti_link_custom_url\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Settings\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"setting\"\n        },\n        \"description\": {\n          \"default_value\": \"Settings service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/echoes\",\n            \"parameter\": [\n              {\n                \"fixed\": \"Narcissus\",\n                \"name\": \"referrer\"\n              },\n              {\n                \"fixed\": \"3.14159\",\n                \"name\": \"pi\"\n              },\n              {\n                \"variable\": \"Person.email.primary\",\n                \"name\": \"user_primary_email\"\n              },\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"discipline\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"echo\"\n        },\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/books\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"book\"\n        },\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookselections\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"bookselection\"\n        },\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/iresources\",\n            \"enabled_capability\": [\n              \"Result.autocreate\"\n            ],\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"variable\": \"Result.uri\",\n                \"name\": \"result_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"iresource\"\n        },\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookshelves\",\n            \"parameter\": [\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"course_label\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"bookshelf\"\n        },\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        }\n      }\n    ],\n    \"base_url_choice\": [\n      {\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        },\n        \"default_base_url\": \"http://localhost:5000\"\n      }\n    ]\n  },\n  \"security_contract\": {\n    \"shared_secret\": \"872a46be13bae42147e6d629753bea9a\",\n    \"tool_service\": [\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tools\",\n        \"action\": [\n          \"POST\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tools/b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/resources/Result/{sourcedId}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tool_settings/b0f6e9c0-339d-0131-3ca8-20c9d07c6451/ltilink/{link_id}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tool_settings/b0f6e9c0-339d-0131-3ca8-20c9d07c6451/context/{context_id}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tool_settings/b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      }\n    ]\n  }\n}',1,'2013-11-19 23:10:23','2013-11-19 23:10:26','LTI2 BookTools','Fabericious reflowable ePub3 Textbook','b0f6e9c0-339d-0131-3ca8-20c9d07c6451','872a46be13bae42147e6d629753bea9a');

/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
