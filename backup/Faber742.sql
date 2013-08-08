# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.28)
# Database: Fabericious
# Generation Time: 2013-08-06 11:42:57 +0000
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
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_profile_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table iresources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `iresources`;

CREATE TABLE `iresources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `result_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table registries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `registries`;

CREATE TABLE `registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `registries` WRITE;
/*!40000 ALTER TABLE `registries` DISABLE KEYS */;

INSERT INTO `registries` (`id`, `name`, `content`, `created_at`, `updated_at`)
VALUES
	(1,'tp_deployment_url','http://localhost:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),
	(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');

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
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tenants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tenants`;

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tool_deployments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tool_deployments`;

CREATE TABLE `tool_deployments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_proxy` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tool_deployments_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table tools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tools`;

CREATE TABLE `tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_profile_template` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;

INSERT INTO `tools` (`id`, `tool_name`, `tool_profile_template`, `created_at`, `updated_at`)
VALUES
	(1,'LTI2 BookTools','{\n  \"guid\": \"4d469a076541-fcc9-9454-d1ec-106aff6b\",\n  \"capability\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedGUID\"\n  ],\n  \"@id\": \"http://lumos.lti.org:4000/profile/4d469a076541-fcc9-9454-d1ec-106aff6b\",\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolConsumerProfile\",\n    {\n      \"\": \"http://http://lumos.lti.org:4000/profile/4d469a076541-fcc9-9454-d1ec-106aff6b#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"lti_version\": \"LTI-2p0\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"service_provider\": {\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"product_info\": {\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"code\": \"lms.LuMoS.org\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          }\n        }\n      },\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_version\": \"3.1\"\n    }\n  },\n  \"service_offered\": [\n    {\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": \"POST\",\n      \"@id\": \":ToolProxy.collection\",\n      \"@type\": \"RestService\",\n      \"endpoint\": \"http://lumos.lti.org:4000/tools\"\n    },\n    {\n      \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ],\n      \"@id\": \":ToolProxy.item\",\n      \"@type\": \"RestService\",\n      \"endpoint\": \"http://lumos.lti.org:4000/tools/{tool_proxy_guid}\"\n    },\n    {\n      \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ],\n      \"@id\": \":Result.item\",\n      \"@type\": \"RestService\",\n      \"endpoint\": \"http://lumos.lti.org:4000/resources/Result/{sourcedGUID}\"\n    }\n  ]\n}\n\n\nThu Sep 20 08:12:13 -0700 2012\nLtiService: Register ToolProxy with ToolConsumer\nPOST http://lumos.lti.org:4000/tools\nHeaders:\nAuthorization: OAuth oauth_nonce=\"5463957792462\", oauth_body_hash=\"AZ18PtPCPzrMsUidYV6JBg7GXtA%3D\", oauth_timestamp=\"1348153933\", oauth_signature_method=\"HMAC-SHA1\", oauth_consumer_key=\"74db2f90-e563-012f-df59-60c54704cdf8\", oauth_signature=\"zhROrP0OqSbyqaFy9yI8VrqWgDo%3D\", oauth_version=\"1.0\"\nContent-Type: application/json\nContent-Length: 7338\nAccept: application/json\nBody:\n{\n  \"tool_consumer_profile\": \"http://lumos.lti.org:4000/tool_consumer_profiles/74db3250-e563-012f-df59-60c54704cdf8\",\n  \"tool_profile\": {\n    \"base_url_choice\": [\n      {\n        \"secure_base_url\": \"http://fabericious.lti.org:5000\",\n        \"default_base_url\": \"http://fabericious.lti.org:5000\",\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        }\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"echo\",\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        },\n        \"message\": [\n          {\n            \"message_type\": \"basic-lti-launch-request\",\n            \"parameter\": [\n              {\n                \"name\": \"referrer\",\n                \"fixed\": \"Narcissus\"\n              },\n              {\n                \"name\": \"pi\",\n                \"fixed\": \"3.14159\"\n              },\n              {\n                \"name\": \"user_primary_email\",\n                \"variable\": \"$Person.email.primary\"\n              },\n              {\n                \"name\": \"discipline\",\n                \"variable\": \"$CourseOffering.label\"\n              }\n            ],\n            \"path\": \"/echoes\"\n          }\n        ]\n      },\n      {\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"book\",\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        },\n        \"message\": [\n          {\n            \"message_type\": \"basic-lti-launch-request\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"path\": \"/books\"\n          }\n        ]\n      },\n      {\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookselection\",\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        },\n        \"message\": [\n          {\n            \"message_type\": \"basic-lti-launch-request\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"path\": \"/bookselections\"\n          }\n        ]\n      },\n      {\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"iresource\",\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        },\n        \"message\": [\n          {\n            \"message_type\": \"basic-lti-launch-request\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"result_uri\",\n                \"variable\": \"$Result.uri\"\n              }\n            ],\n            \"capability\": [\n              \"Result.autocreate\"\n            ],\n            \"path\": \"/iresources\"\n          }\n        ]\n      },\n      {\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": \"bookshelf\",\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        },\n        \"message\": [\n          {\n            \"message_type\": \"basic-lti-launch-request\",\n            \"parameter\": [\n              {\n                \"name\": \"course_label\",\n                \"variable\": \"$CourseOffering.label\"\n              }\n            ],\n            \"path\": \"/bookshelves\"\n          }\n        ]\n      }\n    ],\n    \"lti_version\": \"LTI-2p0\",\n    \"product_instance\": {\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"product_info\": {\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"code\": \"fabericious.org\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"website\": \"{http://fabericious.lti.org:5000}\",\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        },\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_version\": \"10.3\"\n      }\n    },\n    \"message\": [\n      {\n        \"parameter\": [\n          {\n            \"name\": \"tc_profile_url\",\n            \"variable\": \"$Lti.tc_profile_url\"\n          }\n        ],\n        \"message_type\": [\n          \"ToolProxyDeploymentRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"/reregistrations\"\n      }\n    ]\n  },\n  \"tool_proxy_guid\": \"7af32020-e563-012f-df5a-60c54704cdf8\",\n  \"@id\": \"http://fabericious.lti.org:50007af31dd0-e563-012f-df5a-60c54704cdf8\",\n  \"lti_version\": \"LTI-2p0\",\n  \"@type\": \"ToolProxy\",\n  \"@context\": [\n    \"http://www.imsglobal.org/imspurl/lti/v2/ctx/ToolProxy\",\n    \"http://purl.org/blackboard/ctx/v1/iconStyle\"\n  ],\n  \"security_contract\": {\n    \"shared_secret\": \"e3301b4b571d21fcb85b3dd4a45f5398\",\n    \"tool_service\": [\n      {\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n        \"service\": \"http://lumos.lti.org:4000/tools\",\n        \"action\": \"POST\",\n        \"@id\": \":ToolProxy.collection\",\n        \"@type\": \"RestService\"\n      },\n      {\n        \"format\": \"application/vnd.ims.lti.v2.ToolProxy+json\",\n        \"service\": \"http://lumos.lti.org:4000/tools/{tool_proxy_guid}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"@id\": \":ToolProxy.item\",\n        \"@type\": \"RestService\"\n      },\n      {\n        \"format\": \"application/vnd.ims.lis.v2.Result+json\",\n        \"service\": \"http://lumos.lti.org:4000/resources/Result/{sourcedGUID}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ],\n        \"@id\": \":Result.item\",\n        \"@type\": \"RestService\"\n      }\n    ]\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');

/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
