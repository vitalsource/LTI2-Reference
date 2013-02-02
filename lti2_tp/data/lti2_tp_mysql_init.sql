# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: fabericious
# Generation Time: 2013-01-13 20:21:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table deployment_proposals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deployment_proposals`;

CREATE TABLE `deployment_proposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `reg_key` varchar(255) DEFAULT NULL,
  `reg_password` varchar(255) DEFAULT NULL,
  `tc_profile_url` varchar(255) DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `deployment_proposals` WRITE;
/*!40000 ALTER TABLE `deployment_proposals` DISABLE KEYS */;

INSERT INTO `deployment_proposals` (`id`, `tenant_name`, `user_id`, `reg_key`, `reg_password`, `tc_profile_url`, `launch_presentation_return_url`, `status`, `created_at`, `updated_at`, `message_type`)
VALUES
	(52,'Elan/LuMoS','2','3674d2a0-3a6f-0130-9557-20c9d07c6451','7329b69b19bf027fbdeb802d29b672ea','http://lumos.lti2.org:4000/tool_consumer_profiles/3674d6c0-3a6f-0130-9557-20c9d07c6451','http://lumos.lti2.org:4000/admin/tool_actions','registered','2013-01-06 20:40:26','2013-01-06 20:40:28','registration'),
	(53,'Elan/LuMoS','2','5f9ac4f0-3fe8-0130-955d-20c9d07c6451','9e6fc98d886eb16037d45e26af2ed2ef','http://lumos.lti2.org:4000/tool_consumer_profiles/5f9aca30-3fe8-0130-955d-20c9d07c6451','http://lumos.lti2.org:4000/admin/tool_actions','received','2013-01-13 19:54:53','2013-01-13 19:54:53','registration'),
	(54,'Elan/LuMoS4','2','60181760-3feb-0130-955e-20c9d07c6451','81c250fc51dbce1891d3b38c7770226d','http://localhost:4000/tool_consumer_profiles/60181ec0-3feb-0130-955e-20c9d07c6451','http://localhost:4000/admin/tool_actions','registered','2013-01-13 20:12:04','2013-01-13 20:12:10','registration');

/*!40000 ALTER TABLE `deployment_proposals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table iresources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iresources`;

CREATE TABLE `iresources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `result_uri` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `contextid` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
	(1,'tp_deployment_url','http://localhost:5000','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,'relaxed_oauth_check','false','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(5,'tool_provider_name','Fabericious','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(8,'tool_consumer_path','/Users/johntibbetts/git/lumos','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(9,'tool_provider_path','/Users/johntibbetts/git/fabericious','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `registries` ENABLE KEYS */;
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
	('20121231164847');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tenant_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tenant_users`;

CREATE TABLE `tenant_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tenants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tenants`;

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;

INSERT INTO `tenants` (`id`, `tenant_name`, `created_at`, `updated_at`)
VALUES
	(18,'Elan/LuMoS','2013-01-06 20:40:28','2013-01-06 20:40:28'),
	(19,'Elan/LuMoS4','2013-01-13 20:12:10','2013-01-13 20:12:10');

/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tool_deployments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tool_deployments`;

CREATE TABLE `tool_deployments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `tool_proxy` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tool_deployments_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tool_deployments` WRITE;
/*!40000 ALTER TABLE `tool_deployments` DISABLE KEYS */;

INSERT INTO `tool_deployments` (`id`, `tenant_id`, `tool_id`, `product_name`, `tool_proxy`, `created_at`, `updated_at`, `key`, `secret`)
VALUES
	(17,18,1,'LTI2 BookTools','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolProxy\",\n    \"http://purl.org/blackboard/ctx/v1/iconStyle\"\n  ],\n  \"@type\": \"ToolProxy\",\n  \"@id\": \"http://fabericious.lti2.org:50003ac0cba0-3a6f-0130-9558-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"tool_proxy_guid\": \"3ac3c6c0-3a6f-0130-9557-20c9d07c6451\",\n  \"tool_consumer_profile\": \"http://lumos.lti2.org:4000/tool_consumer_profiles/3674d6c0-3a6f-0130-9557-20c9d07c6451\",\n  \"tool_profile\": {\n    \"product_instance\": {\n      \"product_info\": {\n        \"product_version\": \"10.3\",\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"website\": \"{http://fabericious.lti2.org:5000}\",\n            \"code\": \"fabericious.org\",\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        },\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\"\n      }\n    },\n    \"lti_version\": \"LTI-2p0\",\n    \"message\": [\n      {\n        \"message_type\": [\n          \"ToolProxyRegistrationRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"http://fabericious.lti2.org:5000/reregistrations\",\n        \"parameter\": [\n          {\n            \"variable\": \"$ToolConsumerProfile.url\",\n            \"name\": \"tc_profile_url\"\n          }\n        ]\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"message\": [\n          {\n            \"path\": \"/echoes\",\n            \"parameter\": [\n              {\n                \"fixed\": \"Narcissus\",\n                \"name\": \"referrer\"\n              },\n              {\n                \"fixed\": \"3.14159\",\n                \"name\": \"pi\"\n              },\n              {\n                \"variable\": \"$Person.email.primary\",\n                \"name\": \"user_primary_email\"\n              },\n              {\n                \"variable\": \"$CourseOffering.label\",\n                \"name\": \"discipline\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"echo\",\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/books\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"book\",\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookselections\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookselection\",\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/iresources\",\n            \"enabled_capability\": [\n              \"Result.autocreate\"\n            ],\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"variable\": \"$Result.uri\",\n                \"name\": \"result_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\",\n            \"capability\": [\n              \"Result.autocreate\"\n            ]\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"iresource\",\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookshelves\",\n            \"parameter\": [\n              {\n                \"variable\": \"$CourseOffering.label\",\n                \"name\": \"course_label\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookshelf\",\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        }\n      }\n    ],\n    \"base_url_choice\": [\n      {\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        },\n        \"secure_base_url\": \"http://fabericious.lti2.org:5000\",\n        \"default_base_url\": \"http://fabericious.lti2.org:5000\"\n      }\n    ]\n  },\n  \"security_contract\": {\n    \"shared_secret\": \"dd1fdc27976962f686a95331af974c81\",\n    \"tool_service\": [\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.collection\",\n        \"service\": \"http://lumos.lti2.org:4000/tools\",\n        \"action\": \"POST\",\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.item\",\n        \"service\": \"http://lumos.lti2.org:4000/tools/3ac3c6c0-3a6f-0130-9557-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:Result.item\",\n        \"service\": \"http://lumos.lti2.org:4000/resources/Result/{sourcedId}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lis.v2.Result+json\"\n      }\n    ]\n  }\n}','2013-01-06 20:40:28','2013-01-06 20:40:28','3ac3c6c0-3a6f-0130-9557-20c9d07c6451','dd1fdc27976962f686a95331af974c81'),
	(18,19,1,'LTI2 BookTools','{\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolProxy\",\n    \"http://purl.org/blackboard/ctx/v1/iconStyle\"\n  ],\n  \"@type\": \"ToolProxy\",\n  \"@id\": \"http://localhost:50006f90cd50-3feb-0130-955f-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"tool_proxy_guid\": \"6f944890-3feb-0130-955e-20c9d07c6451\",\n  \"tool_consumer_profile\": \"http://localhost:4000/tool_consumer_profiles/60181ec0-3feb-0130-955e-20c9d07c6451\",\n  \"tool_profile\": {\n    \"product_instance\": {\n      \"product_info\": {\n        \"product_version\": \"10.3\",\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"website\": \"{http://localhost:5000}\",\n            \"code\": \"fabericious.org\",\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        },\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\"\n      }\n    },\n    \"lti_version\": \"LTI-2p0\",\n    \"message\": [\n      {\n        \"message_type\": [\n          \"ToolProxyRegistrationRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"http://localhost:5000/reregistrations\",\n        \"parameter\": [\n          {\n            \"variable\": \"$ToolConsumerProfile.url\",\n            \"name\": \"tc_profile_url\"\n          }\n        ]\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"message\": [\n          {\n            \"path\": \"/echoes\",\n            \"parameter\": [\n              {\n                \"fixed\": \"Narcissus\",\n                \"name\": \"referrer\"\n              },\n              {\n                \"fixed\": \"3.14159\",\n                \"name\": \"pi\"\n              },\n              {\n                \"variable\": \"$Person.email.primary\",\n                \"name\": \"user_primary_email\"\n              },\n              {\n                \"variable\": \"$CourseOffering.label\",\n                \"name\": \"discipline\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"echo\",\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/books\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"book\",\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookselections\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookselection\",\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/iresources\",\n            \"enabled_capability\": [\n              \"Result.autocreate\"\n            ],\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"variable\": \"$Result.uri\",\n                \"name\": \"result_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\",\n            \"capability\": [\n              \"Result.autocreate\"\n            ]\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"iresource\",\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookshelves\",\n            \"parameter\": [\n              {\n                \"variable\": \"$CourseOffering.label\",\n                \"name\": \"course_label\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookshelf\",\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        }\n      }\n    ],\n    \"base_url_choice\": [\n      {\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        },\n        \"secure_base_url\": \"http://localhost:5000\",\n        \"default_base_url\": \"http://localhost:5000\"\n      }\n    ]\n  },\n  \"security_contract\": {\n    \"shared_secret\": \"11045dfa16d52e585f3a5ed181af5f89\",\n    \"tool_service\": [\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.collection\",\n        \"service\": \"http://localhost:4000/tools\",\n        \"action\": \"POST\",\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:ToolProxy.item\",\n        \"service\": \"http://localhost:4000/tools/6f944890-3feb-0130-955e-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\"\n      },\n      {\n        \"@type\": \"RestService\",\n        \"@id\": \"ltitcp:Result.item\",\n        \"service\": \"http://localhost:4000/resources/Result/{sourcedId}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"format\": \"application/vnd.ims.lis.v2.Result+json\"\n      }\n    ]\n  }\n}','2013-01-13 20:12:10','2013-01-13 20:12:10','6f944890-3feb-0130-955e-20c9d07c6451','11045dfa16d52e585f3a5ed181af5f89');

/*!40000 ALTER TABLE `tool_deployments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tools`;

CREATE TABLE `tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) DEFAULT NULL,
  `tool_profile_template` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;

INSERT INTO `tools` (`id`, `tool_name`, `tool_profile_template`, `created_at`, `updated_at`)
VALUES
	(1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"$ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n		{\n			\"message\": [\n				{\n					\"path\": \"/echoes\",\n					\"parameter\": [\n						{\n							\"fixed\": \"Narcissus\",\n							\"name\": \"referrer\"\n						}, {\n							\"fixed\": \"3.14159\",\n							\"name\": \"pi\"\n						}, {\n							\"variable\": \"$Person.email.primary\",\n							\"name\": \"user_primary_email\"\n						}, {\n							\"variable\": \"$CourseOffering.label\",\n							\"name\": \"discipline\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Echo\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": \"echo\",\n			\"description\": {\n				\"default_value\": \"Echo service\",\n				\"key\": \"resource.description\"\n			}\n		}, {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": \"book\",\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		}, {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": \"bookselection\",\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		}, {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"$Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\",\n					\"capability\": [\"Result.autocreate\"]\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": \"iresource\",\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		}, {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"$CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": \"bookshelf\",\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"secure_base_url\": \"{tp_deployment_url}\",\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
