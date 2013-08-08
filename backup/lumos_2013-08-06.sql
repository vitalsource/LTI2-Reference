# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.28)
# Database: lumos
# Generation Time: 2013-08-06 08:18:48 +0000
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
	(2,'admin@lumos.org','Administrator','$2a$10$1ZWuZtLGqk7jUO7bIQRdHuBLSpwy/VTIwYIL4YW8skDxgknbCVHpC',NULL,'2012-07-31 22:37:10',NULL,98,'2013-08-05 15:51:28','2013-08-03 20:42:51','127.0.0.1','127.0.0.1','2012-07-09 23:37:35','2013-08-05 15:51:28','admin','John','Tibbetts'),
	(6,'jadams@lumos.org','Instructor','$2a$10$fcq0XejjaJ30GSyE34wzxO5pMXh1EV75BfI3t76YQ7IEW4/9qdzYq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:47:32','2012-07-31 22:47:32','john.adams','John','Adams'),
	(7,'tarne@lumos.org','Learner','$2a$10$KrvXKBGBCYH6idjDE3Ctpe1fUmvbkRFISyJBpriHtPCrTHkt.UPV6',NULL,NULL,NULL,6,'2012-10-09 14:49:01','2012-10-09 14:45:45','127.0.0.1','127.0.0.1','2012-07-31 22:48:15','2012-10-09 14:49:01','tom.arne','Tom','Arne'),
	(8,'hbingen@lumos.org','Instructor','$2a$10$IVQh8q/2t38cF2wuVO6Ec.GQF3RVKNy45W1tr.vqX2F4QxT3nzMwG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:48:57','2012-07-31 22:48:57','hildy.bingen','Hildy','Bingen'),
	(9,'wbach@lumos.org','Learner','$2a$10$QcjasSRFSesjvBodh5A0zOd6aux..zHhZ7znkOzDaeIxrIj/Gyu32',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:49:39','2012-07-31 22:49:39','willie.bach','Willie','Bach'),
	(10,'bdev@lumos.org','Learner','$2a$10$Y99OkiogEHrTW8G96Dhty.84RSgCcbFOqevTfEyUgY8qtATbLLQGa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-07-31 22:50:27','2012-07-31 22:50:27','bcdev','BC','Dev');

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
	(4,'DEV400A','Developer Seminar','2012-07-31 23:12:28','2012-07-31 23:12:28');

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

LOCK TABLES `deployment_requests` WRITE;
/*!40000 ALTER TABLE `deployment_requests` DISABLE KEYS */;

INSERT INTO `deployment_requests` (`id`, `reg_key`, `reg_password`, `partner_url`, `created_at`, `updated_at`, `status`, `tool_id`, `tc_profile_guid`)
VALUES
	(32,NULL,NULL,NULL,'2013-08-04 18:00:26','2013-08-04 18:00:26','reregistering',NULL,'aa1ee4f0-df5d-0130-983b-20c9d07c6451'),
	(33,NULL,NULL,NULL,'2013-08-04 18:06:00','2013-08-04 18:06:00','reregistering',NULL,'718e1210-df5e-0130-983b-20c9d07c6451'),
	(34,NULL,NULL,NULL,'2013-08-04 21:10:57','2013-08-04 21:10:57','reregistering',NULL,'47c78520-df78-0130-983c-20c9d07c6451'),
	(35,NULL,NULL,NULL,'2013-08-04 21:11:24','2013-08-04 21:11:24','reregistering',NULL,'57d0a130-df78-0130-983c-20c9d07c6451'),
	(36,NULL,NULL,NULL,'2013-08-05 11:12:32','2013-08-05 11:12:32','reregistering',NULL,'c7ecf570-dfed-0130-983d-20c9d07c6451'),
	(37,NULL,NULL,NULL,'2013-08-05 11:14:41','2013-08-05 11:14:41','reregistering',NULL,'239cf830-dfee-0130-983d-20c9d07c6451');

/*!40000 ALTER TABLE `deployment_requests` ENABLE KEYS */;
UNLOCK TABLES;


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
	(14,2,4,'instructor','2012-07-31 23:25:28','2012-07-31 23:25:28');

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
	(13,2,'IRTestGrade','2013-08-03 22:17:46','2013-08-03 22:17:46'),
	(14,2,'IRTestGrade','2013-08-05 21:43:38','2013-08-05 21:43:38'),
	(15,2,'IRTestGrade','2013-08-05 21:48:12','2013-08-05 21:48:12');

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
	(61,'Echo',1,NULL,'2013-08-03 22:17:46','2013-08-03 22:17:46',2,61,'{}'),
	(62,'Settings',1,NULL,'2013-08-03 22:17:46','2013-08-03 22:17:46',2,62,'{}'),
	(63,'Book',1,NULL,'2013-08-03 22:17:46','2013-08-03 22:17:46',2,63,'{\"vbid\":\"L-999-74180\"}'),
	(64,'BookSelection',1,NULL,'2013-08-03 22:17:46','2013-08-03 22:17:46',2,64,'{\"vbid\":\"L-999-74180\",\"book_location\":\"outline/3\"}'),
	(65,'InteractiveResource',1,13,'2013-08-03 22:17:46','2013-08-03 22:17:46',2,65,'{\"vbid\":\"L-999-74180\"}'),
	(66,'Bookshelf',1,NULL,'2013-08-03 22:17:46','2013-08-03 22:17:46',2,66,'{}'),
	(67,'Echo',1,NULL,'2013-08-05 21:43:38','2013-08-05 21:43:38',2,67,'{}'),
	(68,'Settings',1,NULL,'2013-08-05 21:43:38','2013-08-05 21:43:38',2,68,'{}'),
	(69,'Book',1,NULL,'2013-08-05 21:43:38','2013-08-05 21:43:38',2,69,'{\"vbid\":\"L-999-74180\"}'),
	(70,'BookSelection',1,NULL,'2013-08-05 21:43:38','2013-08-05 21:43:38',2,70,'{\"vbid\":\"L-999-74180\",\"book_location\":\"outline/3\"}'),
	(71,'InteractiveResource',1,14,'2013-08-05 21:43:38','2013-08-05 21:43:38',2,71,'{\"vbid\":\"L-999-74180\"}'),
	(72,'Bookshelf',1,NULL,'2013-08-05 21:43:38','2013-08-05 21:43:38',2,72,'{}'),
	(73,'Echo',1,NULL,'2013-08-05 21:48:12','2013-08-05 21:48:12',2,73,'{}'),
	(74,'Settings',1,NULL,'2013-08-05 21:48:12','2013-08-05 21:48:12',2,74,'{}'),
	(75,'Book',1,NULL,'2013-08-05 21:48:12','2013-08-05 21:48:12',2,75,'{\"vbid\":\"L-999-74180\"}'),
	(76,'BookSelection',1,NULL,'2013-08-05 21:48:12','2013-08-05 21:48:12',2,76,'{\"vbid\":\"L-999-74180\",\"book_location\":\"outline/3\"}'),
	(77,'InteractiveResource',1,15,'2013-08-05 21:48:12','2013-08-05 21:48:12',2,77,'{\"vbid\":\"L-999-74180\"}'),
	(78,'Bookshelf',1,NULL,'2013-08-05 21:48:12','2013-08-05 21:48:12',2,78,'{}');

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
	(1,'tool_consumer_profile_template','{\n    \"@context\" : [\n        \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n        {\n            \"ltitcp\" : \"{tc_deployment_url}/tool_consumer_profiles/{tool_consumer_profile_guid}#\"\n        }\n    ],\n    \"@type\" : \"ToolConsumerProfile\",\n    \"@id\" : \"{tc_deployment_url}/tool_consumer_profiles/{tool_consumer_profile_guid}\",\n    \"lti_version\" : \"LTI-2p0\",\n    \"guid\" : \"{tool_consumer_profiles}\",\n    \"product_instance\" : {\n        \"guid\" : \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n        \"product_info\" : {\n            \"product_name\" : {\n                \"default_value\" : \"Elan/{tool_consumer_name}\",\n                \"key\" : \"product.name\"\n            },\n            \"product_version\" : \"3.1\",\n            \"description\" : {\n                \"default_value\" : \"Elan University/{tool_consumer_name} Learning Platform\",\n                \"key\" : \"product.version\"\n            },\n            \"technical_description\" : {\n                \"default_value\" : \"LTI 1, 1.1 and 2.0 compliant\",\n                \"key\" : \"product.technicalDescription\"\n            },\n            \"product_family\" : {\n                \"code\" : \"{tool_consumer_name}\",\n                \"vendor\" : {\n                    \"code\" : \"lms.{tool_consumer_name}.org\",\n                    \"name\" : {\n                        \"default_value\" : \"{tool_consumer_name} Corporation\",\n                        \"key\" : \"product.vendor.name\"\n                    },\n                    \"description\" : {\n                        \"default_value\" : \"{tool_consumer_name} Corporation is a fictitious vendor of a Learning Management System\",\n                        \"key\" : \"product.vendor.description\"\n                    },\n                    \"website\" : \"http://lms.{tool_consumer_name}.org/products/omega\",\n                    \"timestamp\" : \"2012-07-09T012:08:16-04:00\",\n                    \"contact\" : {\n                        \"email\" : \"support@lms.{tool_consumer_name}.org\"\n                    }\n                }\n            }\n        },\n        \"support\" : {\n            \"email\" : \"john.tibbetts@kinexis.com\"\n        },\n        \"service_provider\" : {\n            \"@id\" : \"http://ec2.{tool_consumer_name}.org/ServiceProvider\",\n            \"guid\" : \"ec2.{tool_consumer_name}.org\",\n            \"timestamp\" : \"2012-07-09T012:08:16-04:00\",\n            \"provider_name\" : {\n                \"default_value\" : \"Elan University\",\n                \"key\" : \"service_provider.name\"\n            },\n            \"description\" : {\n                \"default_value\" : \"Elan University EC2 Cloud\",\n                \"key\" : \"service_provider.description\"\n            },\n            \"support\" : {\n                \"email\" : \"support@yasp.{tool_consumer_name}.org\"\n            }\n        }\n    },\n    \"capability_enabled\" : [\n        \"basic-lti-launch-request\",\n        \"Result.autocreate\",\n        \"Result.sourcedGUID\"\n    ],\n    \"service_offered\" : [\n        {\n            \"@type\" : \"RestService\",\n            \"@id\" : \"ltitcp:ToolProxy.collection\",\n            \"endpoint\" : \"{tc_deployment_url}/tools\",\n            \"format\" : \"application/vnd.ims.lti.v2.ToolProxy+json\",\n            \"action\" : \"POST\"\n        },\n        {\n            \"@type\" : \"RestService\",\n            \"@id\" : \"ltitcp:ToolProxy.item\",\n            \"endpoint\" : \"{tc_deployment_url}/tools/{tool_proxy_guid}\",\n            \"format\" : \"application/vnd.ims.lti.v2.ToolProxy+json\",\n            \"action\" : [\n                \"GET\",\n                \"PUT\"\n            ]\n        },\n        {\n            \"@type\" : \"RestService\",\n            \"@id\" : \"ltitcp:Result.item\",\n            \"endpoint\" : \"{tc_deployment_url}/resources/Result/{sourcedId}\",\n            \"format\" : \"application/vnd.ims.lis.v2.Result+json\",\n            \"action\" : [\n                \"GET\",\n                \"PUT\"\n            ]\n        }\n    ]\n}','2012-07-09 23:45:10','2012-07-09 23:45:10'),
	(3,'tc_deployment_url','http://localhost:4000','2013-01-13 20:12:10','2012-07-29 17:58:18'),
	(5,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(6,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(7,'tool_consumer_name','LuMoS','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(8,'tool_consumer_path','/Users/johntibbetts/git/lumos','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(9,'tool_provider_path','/Users/johntibbetts/git/fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(11,'docs_path','/Users/johntibbetts/git/lumos/lti_docs','2013-01-13 20:12:10','2013-01-13 20:12:10');

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
	(61,14,'echo','Echo','Echo service'),
	(62,14,'setting','Settings','Settings service'),
	(63,14,'book','Book','VitalSource reader for XML, PDF, and ePub content'),
	(64,14,'bookselection','BookSelection','Deep-linked VitalSource reader for XML, PDF, and ePub content'),
	(65,14,'iresource','InteractiveResource','Interactive resource'),
	(66,14,'bookshelf','Bookshelf','VitalSource Bookshelf'),
	(67,15,'echo','Echo','Echo service'),
	(68,15,'setting','Settings','Settings service'),
	(69,15,'book','Book','VitalSource reader for XML, PDF, and ePub content'),
	(70,15,'bookselection','BookSelection','Deep-linked VitalSource reader for XML, PDF, and ePub content'),
	(71,15,'iresource','InteractiveResource','Interactive resource'),
	(72,15,'bookshelf','Bookshelf','VitalSource Bookshelf'),
	(73,16,'echo','Echo','Echo service'),
	(74,16,'setting','Settings','Settings service'),
	(75,16,'book','Book','VitalSource reader for XML, PDF, and ePub content'),
	(76,16,'bookselection','BookSelection','Deep-linked VitalSource reader for XML, PDF, and ePub content'),
	(77,16,'iresource','InteractiveResource','Interactive resource'),
	(78,16,'bookshelf','Bookshelf','VitalSource Bookshelf');

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
	(26,'6ef37200-deb8-0130-9839-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/6ef37200-deb8-0130-9839-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/6ef37200-deb8-0130-9839-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"6ef37200-deb8-0130-9839-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-03 22:17:43','2013-08-03 22:17:43'),
	(27,'aa1ee4f0-df5d-0130-983b-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/aa1ee4f0-df5d-0130-983b-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/aa1ee4f0-df5d-0130-983b-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"aa1ee4f0-df5d-0130-983b-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-04 18:00:26','2013-08-04 18:00:26'),
	(28,'718e1210-df5e-0130-983b-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/aa1ee4f0-df5d-0130-983b-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/aa1ee4f0-df5d-0130-983b-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"718e1210-df5e-0130-983b-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-04 18:06:00','2013-08-04 18:06:00'),
	(29,'47c78520-df78-0130-983c-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/47c78520-df78-0130-983c-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/47c78520-df78-0130-983c-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"47c78520-df78-0130-983c-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-04 21:10:57','2013-08-04 21:10:57'),
	(30,'57d0a130-df78-0130-983c-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/47c78520-df78-0130-983c-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/47c78520-df78-0130-983c-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"57d0a130-df78-0130-983c-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-04 21:11:24','2013-08-04 21:11:24'),
	(31,'c7ecf570-dfed-0130-983d-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/c7ecf570-dfed-0130-983d-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/c7ecf570-dfed-0130-983d-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"c7ecf570-dfed-0130-983d-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-05 11:12:32','2013-08-05 11:12:32'),
	(32,'239cf830-dfee-0130-983d-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/c7ecf570-dfed-0130-983d-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/c7ecf570-dfed-0130-983d-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"239cf830-dfee-0130-983d-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-05 11:14:41','2013-08-05 11:14:41'),
	(33,'7f4ce530-e045-0130-983e-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/7f4ce530-e045-0130-983e-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/7f4ce530-e045-0130-983e-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"7f4ce530-e045-0130-983e-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-05 21:43:32','2013-08-05 21:43:32'),
	(34,'15c5f460-e046-0130-9840-20c9d07c6451','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://localhost:4000/tool_consumer_profiles/15c5f460-e046-0130-9840-20c9d07c6451#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://localhost:4000/tool_consumer_profiles/15c5f460-e046-0130-9840-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"15c5f460-e046-0130-9840-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_enabled\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://localhost:4000/tools\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\"\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://localhost:4000/tools/{tool_proxy_guid}\",\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-08-05 21:44:14','2013-08-05 21:44:14');

/*!40000 ALTER TABLE `tool_consumer_profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tool_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tool_settings`;

CREATE TABLE `tool_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_id` int(11) DEFAULT NULL,
  `scopeable_id` int(11) DEFAULT NULL,
  `scopeable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tool_settings` WRITE;
/*!40000 ALTER TABLE `tool_settings` DISABLE KEYS */;

INSERT INTO `tool_settings` (`id`, `tool_id`, `scopeable_id`, `scopeable_type`, `name`, `value`)
VALUES
	(1,14,2,'Context','course_tag','SMPL'),
	(2,14,14,'Tool','client_id','faber-1'),
	(3,14,14,'Tool','client_name','Fabericious'),
	(4,14,62,'Ltilink','link_label','SMPL-Echo');

/*!40000 ALTER TABLE `tool_settings` ENABLE KEYS */;
UNLOCK TABLES;


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
	(14,'{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolProxy\",\n    \"http://purl.org/blackboard/ctx/v1/iconStyle\"\n  ],\n  \"@type\": \"ToolProxy\",\n  \"@id\": \"http://localhost:4000/tools/72e2df40-deb8-0130-9839-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"tool_proxy_guid\": \"72e2df40-deb8-0130-9839-20c9d07c6451\",\n  \"tool_consumer_profile\": \"http://localhost:4000/tool_consumer_profiles/239cf830-dfee-0130-983d-20c9d07c6451\",\n  \"tool_profile\": {\n    \"product_instance\": {\n      \"product_info\": {\n        \"product_version\": \"10.3\",\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"website\": \"{http://localhost:5000}\",\n            \"code\": \"fabericious.org\",\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        },\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\"\n      }\n    },\n    \"lti_version\": \"LTI-2p0\",\n    \"message\": [\n      {\n        \"message_type\": [\n          \"ToolProxyRegistrationRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"http://localhost:5000/reregistrations\",\n        \"parameter\": [\n          {\n            \"variable\": \"ToolConsumerProfile.url\",\n            \"name\": \"tc_profile_url\"\n          }\n        ]\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"message\": [\n          {\n            \"path\": \"/echoes\",\n            \"parameter\": [\n              {\n                \"fixed\": \"Narcissus\",\n                \"name\": \"referrer\"\n              },\n              {\n                \"fixed\": \"3.14159\",\n                \"name\": \"pi\"\n              },\n              {\n                \"variable\": \"Person.email.primary\",\n                \"name\": \"user_primary_email\"\n              },\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"discipline\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"echo\",\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/settings\",\n            \"parameter\": [\n              {\n                \"variable\": \"ToolProxy.custom.uri\",\n                \"name\": \"tool_proxy_custom_uri\"\n              },\n              {\n                \"variable\": \"ToolProxyBinding.custom.uri\",\n                \"name\": \"tool_proxy_binding_custom_uri\"\n              },\n              {\n                \"variable\": \"LtiLink.custom.uri\",\n                \"name\": \"lti_link_custom_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Settings\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"setting\",\n        \"description\": {\n          \"default_value\": \"Settings service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/books\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"book\",\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookselections\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookselection\",\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/iresources\",\n            \"enabled_capability\": [\n              \"Result.autocreate\"\n            ],\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"variable\": \"Result.uri\",\n                \"name\": \"result_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\",\n            \"capability\": [\n              \"Result.autocreate\"\n            ]\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"iresource\",\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookshelves\",\n            \"parameter\": [\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"course_label\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookshelf\",\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        }\n      }\n    ],\n    \"base_url_choice\": [\n      {\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        },\n        \"secure_base_url\": \"http://localhost:5000\",\n        \"default_base_url\": \"http://localhost:5000\"\n      }\n    ]\n  },\n  \"security_contract\": {\n    \"shared_secret\": \"591bcf7b65b5c92b374829356f96c5c3\",\n    \"tool_service\": [\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.collection\",\n        \"service\": \"http://localhost:4000/tools\",\n        \"action\": \"POST\",\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.item\",\n        \"service\": \"http://localhost:4000/tools/72e2df40-deb8-0130-9839-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:Result.item\",\n        \"service\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lis.v2.Result json\"\n      }\n    ]\n  }\n}',1,'2013-08-03 22:17:46','2013-08-05 11:14:52','LTI2 BookTools','Fabericious reflowable ePub3 Textbook','72e2df40-deb8-0130-9839-20c9d07c6451','591bcf7b65b5c92b374829356f96c5c3'),
	(15,'{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolProxy\",\n    \"http://purl.org/blackboard/ctx/v1/iconStyle\"\n  ],\n  \"@type\": \"ToolProxy\",\n  \"@id\": \"http://localhost:4000/tools/0325b980-e046-0130-983e-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"tool_proxy_guid\": \"0325b980-e046-0130-983e-20c9d07c6451\",\n  \"tool_consumer_profile\": \"http://localhost:4000/tool_consumer_profiles/7f4ce530-e045-0130-983e-20c9d07c6451\",\n  \"tool_profile\": {\n    \"product_instance\": {\n      \"product_info\": {\n        \"product_version\": \"10.3\",\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"website\": \"{http://localhost:5000}\",\n            \"code\": \"fabericious.org\",\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        },\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\"\n      }\n    },\n    \"lti_version\": \"LTI-2p0\",\n    \"message\": [\n      {\n        \"message_type\": [\n          \"ToolProxyRegistrationRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"http://localhost:5000/reregistrations\",\n        \"parameter\": [\n          {\n            \"variable\": \"ToolConsumerProfile.url\",\n            \"name\": \"tc_profile_url\"\n          }\n        ]\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"message\": [\n          {\n            \"path\": \"/echoes\",\n            \"parameter\": [\n              {\n                \"fixed\": \"Narcissus\",\n                \"name\": \"referrer\"\n              },\n              {\n                \"fixed\": \"3.14159\",\n                \"name\": \"pi\"\n              },\n              {\n                \"variable\": \"Person.email.primary\",\n                \"name\": \"user_primary_email\"\n              },\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"discipline\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"echo\",\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/settings\",\n            \"parameter\": [\n              {\n                \"variable\": \"ToolProxy.custom.uri\",\n                \"name\": \"tool_proxy_custom_uri\"\n              },\n              {\n                \"variable\": \"ToolProxyBinding.custom.uri\",\n                \"name\": \"tool_proxy_binding_custom_uri\"\n              },\n              {\n                \"variable\": \"LtiLink.custom.uri\",\n                \"name\": \"lti_link_custom_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Settings\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"setting\",\n        \"description\": {\n          \"default_value\": \"Settings service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/books\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"book\",\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookselections\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookselection\",\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/iresources\",\n            \"enabled_capability\": [\n              \"Result.autocreate\"\n            ],\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"variable\": \"Result.uri\",\n                \"name\": \"result_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\",\n            \"capability\": [\n              \"Result.autocreate\"\n            ]\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"iresource\",\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookshelves\",\n            \"parameter\": [\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"course_label\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookshelf\",\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        }\n      }\n    ],\n    \"base_url_choice\": [\n      {\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        },\n        \"secure_base_url\": \"http://localhost:5000\",\n        \"default_base_url\": \"http://localhost:5000\"\n      }\n    ]\n  },\n  \"security_contract\": {\n    \"shared_secret\": \"575320580d14665587c7431918f64a75\",\n    \"tool_service\": [\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.collection\",\n        \"service\": \"http://localhost:4000/tools\",\n        \"action\": \"POST\",\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.item\",\n        \"service\": \"http://localhost:4000/tools/0325b980-e046-0130-983e-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:Result.item\",\n        \"service\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lis.v2.Result json\"\n      }\n    ]\n  }\n}',1,'2013-08-05 21:43:38','2013-08-05 21:43:38','LTI2 BookTools','Fabericious reflowable ePub3 Textbook','0325b980-e046-0130-983e-20c9d07c6451','575320580d14665587c7431918f64a75'),
	(16,'{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolProxy\",\n    \"http://purl.org/blackboard/ctx/v1/iconStyle\"\n  ],\n  \"@type\": \"ToolProxy\",\n  \"@id\": \"http://localhost:4000/tools/a5fb8550-e046-0130-9840-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"tool_proxy_guid\": \"a5fb8550-e046-0130-9840-20c9d07c6451\",\n  \"tool_consumer_profile\": \"http://localhost:4000/tool_consumer_profiles/15c5f460-e046-0130-9840-20c9d07c6451\",\n  \"tool_profile\": {\n    \"product_instance\": {\n      \"product_info\": {\n        \"product_version\": \"10.3\",\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"website\": \"{http://localhost:5000}\",\n            \"code\": \"fabericious.org\",\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        },\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\"\n      }\n    },\n    \"lti_version\": \"LTI-2p0\",\n    \"message\": [\n      {\n        \"message_type\": [\n          \"ToolProxyRegistrationRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"http://localhost:5000/reregistrations\",\n        \"parameter\": [\n          {\n            \"variable\": \"ToolConsumerProfile.url\",\n            \"name\": \"tc_profile_url\"\n          }\n        ]\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"message\": [\n          {\n            \"path\": \"/echoes\",\n            \"parameter\": [\n              {\n                \"fixed\": \"Narcissus\",\n                \"name\": \"referrer\"\n              },\n              {\n                \"fixed\": \"3.14159\",\n                \"name\": \"pi\"\n              },\n              {\n                \"variable\": \"Person.email.primary\",\n                \"name\": \"user_primary_email\"\n              },\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"discipline\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"echo\",\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/settings\",\n            \"parameter\": [\n              {\n                \"variable\": \"ToolProxy.custom.uri\",\n                \"name\": \"tool_proxy_custom_uri\"\n              },\n              {\n                \"variable\": \"ToolProxyBinding.custom.uri\",\n                \"name\": \"tool_proxy_binding_custom_uri\"\n              },\n              {\n                \"variable\": \"LtiLink.custom.uri\",\n                \"name\": \"lti_link_custom_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Settings\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"setting\",\n        \"description\": {\n          \"default_value\": \"Settings service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/books\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"book\",\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookselections\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookselection\",\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/iresources\",\n            \"enabled_capability\": [\n              \"Result.autocreate\"\n            ],\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"variable\": \"Result.uri\",\n                \"name\": \"result_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\",\n            \"capability\": [\n              \"Result.autocreate\"\n            ]\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"iresource\",\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookshelves\",\n            \"parameter\": [\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"course_label\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookshelf\",\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        }\n      }\n    ],\n    \"base_url_choice\": [\n      {\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        },\n        \"secure_base_url\": \"http://localhost:5000\",\n        \"default_base_url\": \"http://localhost:5000\"\n      }\n    ]\n  },\n  \"security_contract\": {\n    \"shared_secret\": \"ac86b001c6f6c598f07c7512c4f20125\",\n    \"tool_service\": [\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.collection\",\n        \"service\": \"http://localhost:4000/tools\",\n        \"action\": \"POST\",\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.item\",\n        \"service\": \"http://localhost:4000/tools/a5fb8550-e046-0130-9840-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:Result.item\",\n        \"service\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lis.v2.Result json\"\n      }\n    ]\n  }\n}',1,'2013-08-05 21:48:11','2013-08-05 21:48:12','LTI2 BookTools','Fabericious reflowable ePub3 Textbook','a5fb8550-e046-0130-9840-20c9d07c6451','ac86b001c6f6c598f07c7512c4f20125');

/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
