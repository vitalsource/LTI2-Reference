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

# Dump of table deployment_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lti2_tc_deployment_requests`;

CREATE TABLE `lti2_tc_deployment_requests` (
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



# Dump of table registries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lti2_tc_registries`;

CREATE TABLE `lti2_tc_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `lti2_tc_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tc_registries` DISABLE KEYS */;

INSERT INTO `lti2_tc_registries` (`id`, `name`, `content`, `created_at`, `updated_at`)
VALUES
	(1,'tool_consumer_profile_template','{\n  \"@context\" : [\n    \"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",\n    {\n      \"ltitcp\" : \"{tc_deployment_url}/tool_consumer_profiles/{tc_profile_guid}#\"\n    }\n  ],\n  \"@type\" : \"ToolConsumerProfile\",\n  \"@id\" : \"{tc_deployment_url}/tool_consumer_profiles/{tc_profile_guid}\",\n  \"lti_version\" : \"LTI-2p0\",\n  \"guid\" : \"{tc_profile_guid}\",\n  \"product_instance\" : {\n    \"guid\" : \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\" : {\n      \"product_name\" : {\n        \"default_value\" : \"Elan/{tool_consumer_name}\",\n        \"key\" : \"product.name\"\n      },\n      \"product_version\" : \"3.1\",\n      \"description\" : {\n        \"default_value\" : \"Elan University/{tool_consumer_name} Learning Platform\",\n        \"key\" : \"product.version\"\n      },\n      \"technical_description\" : {\n        \"default_value\" : \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\" : \"product.technicalDescription\"\n      },\n      \"product_family\" : {\n        \"code\" : \"{tool_consumer_name}\",\n        \"vendor\" : {\n          \"code\" : \"lms.{tool_consumer_name}.org\",\n          \"vendor_name\" : {\n            \"default_value\" : \"{tool_consumer_name} Corporation\",\n            \"key\" : \"product.vendor.name\"\n          },\n          \"description\" : {\n            \"default_value\" : \"{tool_consumer_name} Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\" : \"product.vendor.description\"\n          },\n          \"website\" : \"http://lms.{tool_consumer_name}.org/products/omega\",\n          \"timestamp\" : \"2012-07-09T012:08:16-04:00\",\n          \"contact\" : {\n            \"email\" : \"support@lms.{tool_consumer_name}.org\"\n          }\n        }\n      }\n    },\n    \"support\" : {\n      \"email\" : \"john.tibbetts@kinexis.com\"\n    },\n	\"service_owner\" : {\n	   \"@id\" : \"http://ec2.{tool_consumer_name}.org/ServiceOwner\",\n	   \"timestamp\" : \"2012-03-28T09:08:16-04:00\",\n	   \"service_owner_name\" : {\n	     \"default_value\" : \"Elan University\",\n	     \"key\" : \"service_owner.name\"\n	   },\n	   \"description\" : {\n	     \"default_value\" : \"Elan University EC2 Cloud\",\n	     \"key\" : \"service_owner.description\"\n	   },\n	   \"support\" : {\n	     \"email\" : \"techsupport@elan.edu\"\n	   }\n	 },\n    \"service_provider\" : {\n      \"@id\" : \"http://ec2.{tool_consumer_name}.org/ServiceProvider\",\n      \"guid\" : \"ec2.{tool_consumer_name}.org\",\n      \"timestamp\" : \"2012-07-09T012:08:16-04:00\",\n      \"service_provider_name\" : {\n        \"default_value\" : \"Elan University\",\n        \"key\" : \"service_provider.name\"\n      },\n      \"description\" : {\n        \"default_value\" : \"Elan University EC2 Cloud\",\n        \"key\" : \"service_provider.description\"\n      },\n      \"support\" : {\n        \"email\" : \"support@yasp.{tool_consumer_name}.org\"\n      }\n    }\n  },\n  \"capability_offered\" : [\n     \"basic-lti-launch-request\",\n     \"Result.autocreate\",\n     \"Result.sourcedId\",\n	 \"User.id\",\n	 \"User.username\",\n	 \"CourseSection.sourcedId\",\n	 \"Person.sourcedId\",\n	 \"Person.email.primary\",\n	 \"Person.name.given\",\n	 \"Person.name.family\",\n	 \"Person.name.full\",\n	 \"Membership.role\",\n	 \"ToolProxy.custom.url\",\n         \"ToolProxyBinding.custom.url\",\n          \"LtiLink.custom.url\"\n  ],\n  \"service_offered\" : [\n    { \n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:ToolProxy.collection\",\n      \"endpoint\" : \"{tc_deployment_url}/tools\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolproxy+json\"],\n      \"action\" : [\"POST\"]\n    },\n    { \n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:ToolProxy.item\",\n      \"endpoint\" : \"{tc_deployment_url}/tools/{tool_proxy_guid}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolproxy+json\"],\n      \"action\" : [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    { \n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:Result.item\",\n      \"endpoint\" : \"{tc_deployment_url}/resources/Result/{sourcedId}\",\n      \"format\" : [\"application/vnd.ims.lis.v2.result+json\"],\n      \"action\" : [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:LtiLinkSettings\",\n      \"endpoint\" : \"{tc_deployment_url}/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolsettings+json\", \"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\n      \"action\" : [\"GET\", \"PUT\"]\n    },\n    {\n      \"@type\" : \"RestService\",\n      \"@id\" : \"ltitcp:ToolProxyBindingSettings\",\n      \"endpoint\" : \"{tc_deployment_url}/tool_settings/{tool_proxy_guid}/context/{context_id}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolsettings+json\", \"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\n      \"action\" : [\"GET\", \"PUT\"]\n    },\n    {\n      \"@type\":\"RestService\",\n      \"@id\" : \"ltitcp:ToolProxySettings\",\n      \"endpoint\" : \"{tc_deployment_url}/tool_settings/{tool_proxy_guid}\",\n      \"format\" : [\"application/vnd.ims.lti.v2.toolsettings+json\", \"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\n      \"action\" : [\"GET\", \"PUT\"]\n	}\n  ]\n}','2012-07-09 23:45:10','2012-07-09 23:45:10'),
	(3,'tc_deployment_url','http://rails.kinexis.com:4000','0000-00-00 00:00:00','2012-07-29 17:58:18'),
	(5,'relaxed_oauth_check','false','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(6,'result_template','{\n  \"@context\" : \"http://purl.imsglobal.org/ctx/lis/v2/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(7,'tool_consumer_name','LuMoS','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `lti2_tc_registries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tool_consumer_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lti2_tc_tool_consumer_profiles`;

CREATE TABLE `lti2_tc_tool_consumer_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_profile_guid` varchar(255) DEFAULT NULL,
  `tc_profile` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tool_consumer_profiles_on_tc_profile_guid` (`tc_profile_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `lti2_tc_tool_consumer_profiles` WRITE;
/*!40000 ALTER TABLE `lti2_tc_tool_consumer_profiles` DISABLE KEYS */;

INSERT INTO `lti2_tc_tool_consumer_profiles` (`id`, `tc_profile_guid`, `tc_profile`, `created_at`, `updated_at`)
VALUES
	(3,'a94ee280-339d-0131-3ca8-20c9d07c6451','{\n  \"@context\": [\n    \"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",\n    {\n      \"ltitcp\": \"http://rails.kinexis.com:4000/tool_consumer_profiles/{tc_profile_guid}#\"\n    }\n  ],\n  \"@type\": \"ToolConsumerProfile\",\n  \"@id\": \"http://rails.kinexis.com:4000/tool_consumer_profiles/{tc_profile_guid}\",\n  \"lti_version\": \"LTI-2p0\",\n  \"guid\": \"a94ee280-339d-0131-3ca8-20c9d07c6451\",\n  \"product_instance\": {\n    \"guid\": \"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\n    \"product_info\": {\n      \"product_name\": {\n        \"default_value\": \"Elan/LuMoS\",\n        \"key\": \"product.name\"\n      },\n      \"product_version\": \"3.1\",\n      \"description\": {\n        \"default_value\": \"Elan University/LuMoS Learning Platform\",\n        \"key\": \"product.version\"\n      },\n      \"technical_description\": {\n        \"default_value\": \"LTI 1, 1.1 and 2.0 compliant\",\n        \"key\": \"product.technicalDescription\"\n      },\n      \"product_family\": {\n        \"code\": \"LuMoS\",\n        \"vendor\": {\n          \"code\": \"lms.LuMoS.org\",\n          \"vendor_name\": {\n            \"default_value\": \"LuMoS Corporation\",\n            \"key\": \"product.vendor.name\"\n          },\n          \"description\": {\n            \"default_value\": \"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\n            \"key\": \"product.vendor.description\"\n          },\n          \"website\": \"http://lms.LuMoS.org/products/omega\",\n          \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n          \"contact\": {\n            \"email\": \"support@lms.LuMoS.org\"\n          }\n        }\n      }\n    },\n    \"support\": {\n      \"email\": \"john.tibbetts@kinexis.com\"\n    },\n    \"service_owner\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceOwner\",\n      \"timestamp\": \"2012-03-28T09:08:16-04:00\",\n      \"service_owner_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_owner.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_owner.description\"\n      },\n      \"support\": {\n        \"email\": \"techsupport@elan.edu\"\n      }\n    },\n    \"service_provider\": {\n      \"@id\": \"http://ec2.LuMoS.org/ServiceProvider\",\n      \"guid\": \"ec2.LuMoS.org\",\n      \"timestamp\": \"2012-07-09T012:08:16-04:00\",\n      \"service_provider_name\": {\n        \"default_value\": \"Elan University\",\n        \"key\": \"service_provider.name\"\n      },\n      \"description\": {\n        \"default_value\": \"Elan University EC2 Cloud\",\n        \"key\": \"service_provider.description\"\n      },\n      \"support\": {\n        \"email\": \"support@yasp.LuMoS.org\"\n      }\n    }\n  },\n  \"capability_offered\": [\n    \"basic-lti-launch-request\",\n    \"Result.autocreate\",\n    \"Result.sourcedId\",\n    \"User.id\",\n    \"User.username\",\n    \"CourseSection.sourcedId\",\n    \"Person.sourcedId\",\n    \"Person.email.primary\",\n    \"Person.name.given\",\n    \"Person.name.family\",\n    \"Person.name.full\",\n    \"Membership.role\",\n    \"ToolProxy.custom.url\",\n    \"ToolProxyBinding.custom.url\",\n    \"LtiLink.custom.url\"\n  ],\n  \"service_offered\": [\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.collection\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tools\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolproxy+json\"\n      ],\n      \"action\": [\n        \"POST\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxy.item\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tools/{tool_proxy_guid}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolproxy+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:Result.item\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/resources/Result/{sourcedId}\",\n      \"format\": [\n        \"application/vnd.ims.lis.v2.result+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:LtiLinkSettings\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolsettings+json\",\n        \"application/vnd.ims.lti.v2.toolsettings.simple+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxyBindingSettings\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tool_settings/{tool_proxy_guid}/context/{context_id}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolsettings+json\",\n        \"application/vnd.ims.lti.v2.toolsettings.simple+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    },\n    {\n      \"@type\": \"RestService\",\n      \"@id\": \"ltitcp:ToolProxySettings\",\n      \"endpoint\": \"http://rails.kinexis.com:4000/tool_settings/{tool_proxy_guid}\",\n      \"format\": [\n        \"application/vnd.ims.lti.v2.toolsettings+json\",\n        \"application/vnd.ims.lti.v2.toolsettings.simple+json\"\n      ],\n      \"action\": [\n        \"GET\",\n        \"PUT\"\n      ]\n    }\n  ]\n}','2013-11-19 23:10:14','2013-11-19 23:10:14');

/*!40000 ALTER TABLE `lti2_tc_tool_consumer_profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tool_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lti2_tc_tool_settings`;

CREATE TABLE `lti2_tc_tool_settings` (
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

DROP TABLE IF EXISTS `lti2_tc_tools`;

CREATE TABLE `lti2_tc_tools` (
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

LOCK TABLES `lti2_tc_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tc_tools` DISABLE KEYS */;

INSERT INTO `lti2_tc_tools` (`id`, `tool_proxy`, `is_enabled`, `created_at`, `updated_at`, `product_name`, `description`, `key`, `secret`)
VALUES
	(2,'{\n  \"@context\": [\n    \"http://purl.imsglobal.org/ctx/lti/v2/ToolProxy\"\n  ],\n  \"@type\": \"ToolProxy\",\n  \"@id\": \"http://rails.kinexis.com:4000/tools/b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n  \"lti_version\": \"LTI-2p0\",\n  \"tool_proxy_guid\": \"b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n  \"tool_consumer_profile\": \"http://rails.kinexis.com:4000/tool_consumer_profiles/a94ee280-339d-0131-3ca8-20c9d07c6451\",\n  \"tool_profile\": {\n    \"product_instance\": {\n      \"product_info\": {\n        \"product_version\": \"10.3\",\n        \"technical_description\": {\n          \"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n          \"key\": \"tool.technical\"\n        },\n        \"product_name\": {\n          \"default_value\": \"LTI2 BookTools\",\n          \"key\": \"tool.name\"\n        },\n        \"product_family\": {\n          \"code\": \"assessment-tool\",\n          \"vendor\": {\n            \"website\": \"{http://localhost:5000}\",\n            \"code\": \"fabericious.org\",\n            \"name\": {\n              \"default_value\": \"Fab\",\n              \"key\": \"tool.vendor.name\"\n            },\n            \"timestamp\": \"2012-04-05T09:08:16-04:00\",\n            \"contact\": {\n              \"email\": \"info@fabericious.com\"\n            },\n            \"description\": {\n              \"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n              \"key\": \"tool.vendor.description\"\n            }\n          }\n        },\n        \"description\": {\n          \"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n          \"key\": \"tool.description\"\n        }\n      },\n      \"support\": {\n        \"email\": \"helpdesk@fabericious.com\"\n      },\n      \"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n      \"service_provider\": {\n        \"support\": {\n          \"email\": \"support@ec2.fabericious.com\"\n        },\n        \"service_provider_name\": {\n          \"default_value\": \"Amazon Cloud\",\n          \"key\": \"service_provider.name\"\n        },\n        \"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n        \"description\": {\n          \"default_value\": \"Provider of high performance managed hosting environments\",\n          \"key\": \"service_provider.description\"\n        },\n        \"timestamp\": \"2012-04-05T09:08:16-04:00\"\n      }\n    },\n    \"lti_version\": \"LTI-2p0\",\n    \"message\": [\n      {\n        \"message_type\": [\n          \"ToolProxyRegistrationRequest\",\n          \"ToolProxyReregistrationRequest\"\n        ],\n        \"path\": \"http://localhost:5000/reregistrations\",\n        \"parameter\": [\n          {\n            \"variable\": \"ToolConsumerProfile.url\",\n            \"name\": \"tc_profile_url\"\n          }\n        ]\n      }\n    ],\n    \"resource_handler\": [\n      {\n        \"message\": [\n          {\n            \"path\": \"/settings\",\n            \"parameter\": [\n              {\n                \"variable\": \"ToolProxy.custom.url\",\n                \"name\": \"tool_proxy_custom_url\"\n              },\n              {\n                \"variable\": \"ToolProxyBinding.custom.url\",\n                \"name\": \"tool_proxy_binding_custom_url\"\n              },\n              {\n                \"variable\": \"LtiLink.custom.url\",\n                \"name\": \"lti_link_custom_url\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Settings\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"setting\"\n        },\n        \"description\": {\n          \"default_value\": \"Settings service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/echoes\",\n            \"parameter\": [\n              {\n                \"fixed\": \"Narcissus\",\n                \"name\": \"referrer\"\n              },\n              {\n                \"fixed\": \"3.14159\",\n                \"name\": \"pi\"\n              },\n              {\n                \"variable\": \"Person.email.primary\",\n                \"name\": \"user_primary_email\"\n              },\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"discipline\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Echo\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"echo\"\n        },\n        \"description\": {\n          \"default_value\": \"Echo service\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/books\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Book\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"book\"\n        },\n        \"description\": {\n          \"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookselections\",\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"name\": \"book_location\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"BookSelection\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"bookselection\"\n        },\n        \"description\": {\n          \"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/iresources\",\n            \"enabled_capability\": [\n              \"Result.autocreate\"\n            ],\n            \"parameter\": [\n              {\n                \"name\": \"vbid\"\n              },\n              {\n                \"variable\": \"Result.uri\",\n                \"name\": \"result_uri\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"InteractiveResource\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"iresource\"\n        },\n        \"description\": {\n          \"default_value\": \"Interactive resource\",\n          \"key\": \"resource.description\"\n        }\n      },\n      {\n        \"message\": [\n          {\n            \"path\": \"/bookshelves\",\n            \"parameter\": [\n              {\n                \"variable\": \"CourseOffering.label\",\n                \"name\": \"course_label\"\n              }\n            ],\n            \"message_type\": \"basic-lti-launch-request\"\n          }\n        ],\n        \"name\": {\n          \"default_value\": \"Bookshelf\",\n          \"key\": \"resource.name\"\n        },\n        \"resource_type\": {\n          \"code\": \"bookshelf\"\n        },\n        \"description\": {\n          \"default_value\": \"VitalSource Bookshelf\",\n          \"key\": \"resource.description\"\n        }\n      }\n    ],\n    \"base_url_choice\": [\n      {\n        \"selector\": {\n          \"applies_to\": [\n            \"IconEndpoint\",\n            \"MessageHandler\"\n          ]\n        },\n        \"default_base_url\": \"http://localhost:5000\"\n      }\n    ]\n  },\n  \"security_contract\": {\n    \"shared_secret\": \"872a46be13bae42147e6d629753bea9a\",\n    \"tool_service\": [\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tools\",\n        \"action\": [\n          \"POST\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tools/b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/resources/Result/{sourcedId}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tool_settings/b0f6e9c0-339d-0131-3ca8-20c9d07c6451/ltilink/{link_id}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tool_settings/b0f6e9c0-339d-0131-3ca8-20c9d07c6451/context/{context_id}\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      },\n      {\n        \"@type\": \"RestServiceProfile\",\n        \"service\": \"http://rails.kinexis.com:4000/tool_settings/b0f6e9c0-339d-0131-3ca8-20c9d07c6451\",\n        \"action\": [\n          \"GET\",\n          \"PUT\"\n        ]\n      }\n    ]\n  }\n}',1,'2013-11-19 23:10:23','2013-11-19 23:10:26','LTI2 BookTools','Fabericious reflowable ePub3 Textbook','b0f6e9c0-339d-0131-3ca8-20c9d07c6451','872a46be13bae42147e6d629753bea9a');

/*!40000 ALTER TABLE `lti2_tc_tools` ENABLE KEYS */;
UNLOCK TABLES;


