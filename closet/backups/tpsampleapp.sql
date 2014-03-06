-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_profile_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile_json` text COLLATE utf8_unicode_ci,
  `tool_profile_json` text COLLATE utf8_unicode_ci,
  `tool_proxy_json` text COLLATE utf8_unicode_ci,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_profile_template` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile` text COLLATE utf8_unicode_ci,
  `tool_profile` text COLLATE utf8_unicode_ci,
  `registration_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_proxy` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-22 17:43:35
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `reg_key` varchar(255) DEFAULT NULL,
  `reg_password` varchar(255) DEFAULT NULL,
  `tc_profile_url` varchar(255) DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_consumer_profile_json` text,
  `tool_profile_json` text,
  `tool_proxy_json` text,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://localhost:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) DEFAULT NULL,
  `tool_profile_template` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) DEFAULT NULL,
  `tool_consumer_profile` text,
  `tool_profile` text,
  `registration_return_url` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_proxy` text,
  `state` varchar(255) DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-22 17:51:19
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `reg_key` varchar(255) DEFAULT NULL,
  `reg_password` varchar(255) DEFAULT NULL,
  `tc_profile_url` varchar(255) DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_consumer_profile_json` text,
  `tool_profile_json` text,
  `tool_proxy_json` text,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://localhost:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) DEFAULT NULL,
  `tool_profile_template` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) DEFAULT NULL,
  `tool_consumer_profile` text,
  `tool_profile` text,
  `registration_return_url` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_proxy` text,
  `state` varchar(255) DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-22 17:53:46
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `reg_key` varchar(255) DEFAULT NULL,
  `reg_password` varchar(255) DEFAULT NULL,
  `tc_profile_url` varchar(255) DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_consumer_profile_json` text,
  `tool_profile_json` text,
  `tool_proxy_json` text,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
INSERT INTO `lti2_tp_registrations` VALUES (119,NULL,'Elan University',NULL,'2','79dde1a0-4e0a-0131-7467-20c9d07c6451','8afe03bcb55f4008a6364a1e6a72d412','http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/79dde9d0-4e0a-0131-7467-20c9d07c6451','http://rails.kinexis.com:4000/admin/tool_actions','received','registration','{\"@context\":[\"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",{\"ltitcp\":\"http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/79dde9d0-4e0a-0131-7467-20c9d07c6451#\"}],\"@type\":\"ToolConsumerProfile\",\"@id\":\"http://rails.kinexis.com:4000/tool_consumer_profiles/79dde9d0-4e0a-0131-7467-20c9d07c6451\",\"lti_version\":\"LTI-2p0\",\"guid\":\"79dde9d0-4e0a-0131-7467-20c9d07c6451\",\"product_instance\":{\"guid\":\"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\"product_info\":{\"product_name\":{\"default_value\":\"Elan/LuMoS\",\"key\":\"product.name\"},\"product_version\":\"3.1\",\"description\":{\"default_value\":\"Elan University/LuMoS Learning Platform\",\"key\":\"product.version\"},\"technical_description\":{\"default_value\":\"LTI 1, 1.1 and 2.0 compliant\",\"key\":\"product.technicalDescription\"},\"product_family\":{\"code\":\"LuMoS\",\"vendor\":{\"code\":\"lms.LuMoS.org\",\"vendor_name\":{\"default_value\":\"LuMoS Corporation\",\"key\":\"product.vendor.name\"},\"description\":{\"default_value\":\"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\"key\":\"product.vendor.description\"},\"website\":\"http://lms.LuMoS.org/products/omega\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"contact\":{\"email\":\"support@lms.LuMoS.org\"}}}},\"support\":{\"email\":\"john.tibbetts@kinexis.com\"},\"service_owner\":{\"@id\":\"http://ec2.LuMoS.org/ServiceOwner\",\"timestamp\":\"2012-03-28T09:08:16-04:00\",\"service_owner_name\":{\"default_value\":\"Elan University\",\"key\":\"service_owner.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_owner.description\"},\"support\":{\"email\":\"techsupport@elan.edu\"}},\"service_provider\":{\"@id\":\"http://ec2.LuMoS.org/ServiceProvider\",\"guid\":\"ec2.LuMoS.org\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"service_provider_name\":{\"default_value\":\"Elan University\",\"key\":\"service_provider.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_provider.description\"},\"support\":{\"email\":\"support@yasp.LuMoS.org\"}}},\"capability_offered\":[\"basic-lti-launch-request\",\"Result.autocreate\",\"Result.sourcedId\",\"User.id\",\"User.username\",\"CourseSection.sourcedId\",\"Person.sourcedId\",\"Person.email.primary\",\"Person.name.given\",\"Person.name.family\",\"Person.name.full\",\"Membership.role\",\"ToolProxy.custom.url\",\"ToolProxyBinding.custom.url\",\"LtiLink.custom.url\"],\"service_offered\":[{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.collection\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"POST\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:Result.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/resources/Result/{sourcedId}\",\"format\":[\"application/vnd.ims.lis.v2.result+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:LtiLinkSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxyBindingSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/context/{context_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxySettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]}]}','{\"product_instance\":{\"product_info\":{\"product_version\":\"10.3\",\"technical_description\":{\"default_value\":\"Support provided for all LTI 1 extensions as well as LTI 2\",\"key\":\"tool.technical\"},\"product_name\":{\"default_value\":\"LTI2 BookTools\",\"key\":\"tool.name\"},\"product_family\":{\"code\":\"assessment-tool\",\"vendor\":{\"website\":\"{http://localhost:5000}\",\"code\":\"fabericious.org\",\"name\":{\"default_value\":\"Fab\",\"key\":\"tool.vendor.name\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\",\"contact\":{\"email\":\"info@fabericious.com\"},\"description\":{\"default_value\":\"Fabericious is a leading provider of interactive tools for education\",\"key\":\"tool.vendor.description\"}}},\"description\":{\"default_value\":\"Fabericious reflowable ePub3 Textbook\",\"key\":\"tool.description\"}},\"support\":{\"email\":\"helpdesk@fabericious.com\"},\"guid\":\"fd75124a-140e-470f-944c-114d2d92bb40\",\"service_provider\":{\"support\":{\"email\":\"support@ec2.fabericious.com\"},\"service_provider_name\":{\"default_value\":\"Amazon Cloud\",\"key\":\"service_provider.name\"},\"guid\":\"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\"description\":{\"default_value\":\"Provider of high performance managed hosting environments\",\"key\":\"service_provider.description\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\"}},\"lti_version\":\"LTI-2p0\",\"message\":[{\"message_type\":[\"ToolProxyRegistrationRequest\",\"ToolProxyReregistrationRequest\"],\"path\":\"http://localhost:5000/reregistrations\",\"parameter\":[{\"variable\":\"ToolConsumerProfile.url\",\"name\":\"tc_profile_url\"}]}],\"resource_handler\":[{\"message\":[{\"path\":\"/settings\",\"parameter\":[{\"variable\":\"ToolProxy.custom.url\",\"name\":\"tool_proxy_custom_url\"},{\"variable\":\"ToolProxyBinding.custom.url\",\"name\":\"tool_proxy_binding_custom_url\"},{\"variable\":\"LtiLink.custom.url\",\"name\":\"lti_link_custom_url\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Settings\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"setting\"},\"description\":{\"default_value\":\"Settings service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/echoes\",\"parameter\":[{\"fixed\":\"Narcissus\",\"name\":\"referrer\"},{\"fixed\":\"3.14159\",\"name\":\"pi\"},{\"variable\":\"Person.email.primary\",\"name\":\"user_primary_email\"},{\"variable\":\"CourseOffering.label\",\"name\":\"discipline\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Echo\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"echo\"},\"description\":{\"default_value\":\"Echo service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/books\",\"parameter\":[{\"name\":\"vbid\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Book\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"book\"},\"description\":{\"default_value\":\"VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookselections\",\"parameter\":[{\"name\":\"vbid\"},{\"name\":\"book_location\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"BookSelection\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookselection\"},\"description\":{\"default_value\":\"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/iresources\",\"enabled_capability\":[\"Result.autocreate\"],\"parameter\":[{\"name\":\"vbid\"},{\"variable\":\"Result.uri\",\"name\":\"result_uri\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"InteractiveResource\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"iresource\"},\"description\":{\"default_value\":\"Interactive resource\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookshelves\",\"parameter\":[{\"variable\":\"CourseOffering.label\",\"name\":\"course_label\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Bookshelf\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookshelf\"},\"description\":{\"default_value\":\"VitalSource Bookshelf\",\"key\":\"resource.description\"}}],\"base_url_choice\":[{\"selector\":{\"applies_to\":[\"IconEndpoint\",\"MessageHandler\"]},\"default_base_url\":\"http://localhost:5000\"}]}',NULL,1,'LTI-2p0','2013-12-23 14:14:41','2013-12-23 14:14:41'),(120,NULL,'Elan University',48,'2','73b56d10-4e0b-0131-7468-20c9d07c6451','b5dfac0d1b87f50d771b95c5a772170f','http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451','http://rails.kinexis.com:4000/admin/tool_actions','registered','registration','{\"@context\":[\"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",{\"ltitcp\":\"http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451#\"}],\"@type\":\"ToolConsumerProfile\",\"@id\":\"http://rails.kinexis.com:4000/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451\",\"lti_version\":\"LTI-2p0\",\"guid\":\"73b57170-4e0b-0131-7468-20c9d07c6451\",\"product_instance\":{\"guid\":\"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\"product_info\":{\"product_name\":{\"default_value\":\"Elan/LuMoS\",\"key\":\"product.name\"},\"product_version\":\"3.1\",\"description\":{\"default_value\":\"Elan University/LuMoS Learning Platform\",\"key\":\"product.version\"},\"technical_description\":{\"default_value\":\"LTI 1, 1.1 and 2.0 compliant\",\"key\":\"product.technicalDescription\"},\"product_family\":{\"code\":\"LuMoS\",\"vendor\":{\"code\":\"lms.LuMoS.org\",\"vendor_name\":{\"default_value\":\"LuMoS Corporation\",\"key\":\"product.vendor.name\"},\"description\":{\"default_value\":\"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\"key\":\"product.vendor.description\"},\"website\":\"http://lms.LuMoS.org/products/omega\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"contact\":{\"email\":\"support@lms.LuMoS.org\"}}}},\"support\":{\"email\":\"john.tibbetts@kinexis.com\"},\"service_owner\":{\"@id\":\"http://ec2.LuMoS.org/ServiceOwner\",\"timestamp\":\"2012-03-28T09:08:16-04:00\",\"service_owner_name\":{\"default_value\":\"Elan University\",\"key\":\"service_owner.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_owner.description\"},\"support\":{\"email\":\"techsupport@elan.edu\"}},\"service_provider\":{\"@id\":\"http://ec2.LuMoS.org/ServiceProvider\",\"guid\":\"ec2.LuMoS.org\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"service_provider_name\":{\"default_value\":\"Elan University\",\"key\":\"service_provider.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_provider.description\"},\"support\":{\"email\":\"support@yasp.LuMoS.org\"}}},\"capability_offered\":[\"basic-lti-launch-request\",\"Result.autocreate\",\"Result.sourcedId\",\"User.id\",\"User.username\",\"CourseSection.sourcedId\",\"Person.sourcedId\",\"Person.email.primary\",\"Person.name.given\",\"Person.name.family\",\"Person.name.full\",\"Membership.role\",\"ToolProxy.custom.url\",\"ToolProxyBinding.custom.url\",\"LtiLink.custom.url\"],\"service_offered\":[{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.collection\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"POST\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:Result.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/resources/Result/{sourcedId}\",\"format\":[\"application/vnd.ims.lis.v2.result+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:LtiLinkSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxyBindingSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/context/{context_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxySettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]}]}','{\"product_instance\":{\"product_info\":{\"product_version\":\"10.3\",\"technical_description\":{\"default_value\":\"Support provided for all LTI 1 extensions as well as LTI 2\",\"key\":\"tool.technical\"},\"product_name\":{\"default_value\":\"LTI2 BookTools\",\"key\":\"tool.name\"},\"product_family\":{\"code\":\"assessment-tool\",\"vendor\":{\"website\":\"{http://localhost:5000}\",\"code\":\"fabericious.org\",\"name\":{\"default_value\":\"Fab\",\"key\":\"tool.vendor.name\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\",\"contact\":{\"email\":\"info@fabericious.com\"},\"description\":{\"default_value\":\"Fabericious is a leading provider of interactive tools for education\",\"key\":\"tool.vendor.description\"}}},\"description\":{\"default_value\":\"Fabericious reflowable ePub3 Textbook\",\"key\":\"tool.description\"}},\"support\":{\"email\":\"helpdesk@fabericious.com\"},\"guid\":\"fd75124a-140e-470f-944c-114d2d92bb40\",\"service_provider\":{\"support\":{\"email\":\"support@ec2.fabericious.com\"},\"service_provider_name\":{\"default_value\":\"Amazon Cloud\",\"key\":\"service_provider.name\"},\"guid\":\"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\"description\":{\"default_value\":\"Provider of high performance managed hosting environments\",\"key\":\"service_provider.description\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\"}},\"lti_version\":\"LTI-2p0\",\"message\":[{\"message_type\":[\"ToolProxyRegistrationRequest\",\"ToolProxyReregistrationRequest\"],\"path\":\"http://localhost:5000/reregistrations\",\"parameter\":[{\"variable\":\"ToolConsumerProfile.url\",\"name\":\"tc_profile_url\"}]}],\"resource_handler\":[{\"message\":[{\"path\":\"/settings\",\"parameter\":[{\"variable\":\"ToolProxy.custom.url\",\"name\":\"tool_proxy_custom_url\"},{\"variable\":\"ToolProxyBinding.custom.url\",\"name\":\"tool_proxy_binding_custom_url\"},{\"variable\":\"LtiLink.custom.url\",\"name\":\"lti_link_custom_url\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Settings\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"setting\"},\"description\":{\"default_value\":\"Settings service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/echoes\",\"parameter\":[{\"fixed\":\"Narcissus\",\"name\":\"referrer\"},{\"fixed\":\"3.14159\",\"name\":\"pi\"},{\"variable\":\"Person.email.primary\",\"name\":\"user_primary_email\"},{\"variable\":\"CourseOffering.label\",\"name\":\"discipline\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Echo\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"echo\"},\"description\":{\"default_value\":\"Echo service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/books\",\"parameter\":[{\"name\":\"vbid\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Book\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"book\"},\"description\":{\"default_value\":\"VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookselections\",\"parameter\":[{\"name\":\"vbid\"},{\"name\":\"book_location\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"BookSelection\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookselection\"},\"description\":{\"default_value\":\"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/iresources\",\"enabled_capability\":[\"Result.autocreate\"],\"parameter\":[{\"name\":\"vbid\"},{\"variable\":\"Result.uri\",\"name\":\"result_uri\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"InteractiveResource\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"iresource\"},\"description\":{\"default_value\":\"Interactive resource\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookshelves\",\"parameter\":[{\"variable\":\"CourseOffering.label\",\"name\":\"course_label\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Bookshelf\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookshelf\"},\"description\":{\"default_value\":\"VitalSource Bookshelf\",\"key\":\"resource.description\"}}],\"base_url_choice\":[{\"selector\":{\"applies_to\":[\"IconEndpoint\",\"MessageHandler\"]},\"default_base_url\":\"http://localhost:5000\"}]}','{\"@context\":[\"http://purl.imsglobal.org/ctx/lti/v2/ToolProxy\"],\"@type\":\"ToolProxy\",\"@id\":\"ToolProxyProposal_at_2013-12-23T14:21:45Z\",\"lti_version\":\"LTI-2p0\",\"tool_proxy_guid\":\"7a0f11d0-4e0b-0131-7468-20c9d07c6451\",\"tool_consumer_profile\":\"http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451\",\"tool_profile\":{\"product_instance\":{\"product_info\":{\"product_version\":\"10.3\",\"technical_description\":{\"default_value\":\"Support provided for all LTI 1 extensions as well as LTI 2\",\"key\":\"tool.technical\"},\"product_name\":{\"default_value\":\"LTI2 BookTools\",\"key\":\"tool.name\"},\"product_family\":{\"code\":\"assessment-tool\",\"vendor\":{\"website\":\"{http://localhost:5000}\",\"code\":\"fabericious.org\",\"name\":{\"default_value\":\"Fab\",\"key\":\"tool.vendor.name\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\",\"contact\":{\"email\":\"info@fabericious.com\"},\"description\":{\"default_value\":\"Fabericious is a leading provider of interactive tools for education\",\"key\":\"tool.vendor.description\"}}},\"description\":{\"default_value\":\"Fabericious reflowable ePub3 Textbook\",\"key\":\"tool.description\"}},\"support\":{\"email\":\"helpdesk@fabericious.com\"},\"guid\":\"fd75124a-140e-470f-944c-114d2d92bb40\",\"service_provider\":{\"support\":{\"email\":\"support@ec2.fabericious.com\"},\"service_provider_name\":{\"default_value\":\"Amazon Cloud\",\"key\":\"service_provider.name\"},\"guid\":\"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\"description\":{\"default_value\":\"Provider of high performance managed hosting environments\",\"key\":\"service_provider.description\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\"}},\"lti_version\":\"LTI-2p0\",\"message\":[{\"message_type\":[\"ToolProxyRegistrationRequest\",\"ToolProxyReregistrationRequest\"],\"path\":\"http://localhost:5000/reregistrations\",\"parameter\":[{\"variable\":\"ToolConsumerProfile.url\",\"name\":\"tc_profile_url\"}]}],\"resource_handler\":[{\"message\":[{\"path\":\"/settings\",\"parameter\":[{\"variable\":\"ToolProxy.custom.url\",\"name\":\"tool_proxy_custom_url\"},{\"variable\":\"ToolProxyBinding.custom.url\",\"name\":\"tool_proxy_binding_custom_url\"},{\"variable\":\"LtiLink.custom.url\",\"name\":\"lti_link_custom_url\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Settings\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"setting\"},\"description\":{\"default_value\":\"Settings service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/echoes\",\"parameter\":[{\"fixed\":\"Narcissus\",\"name\":\"referrer\"},{\"fixed\":\"3.14159\",\"name\":\"pi\"},{\"variable\":\"Person.email.primary\",\"name\":\"user_primary_email\"},{\"variable\":\"CourseOffering.label\",\"name\":\"discipline\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Echo\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"echo\"},\"description\":{\"default_value\":\"Echo service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/books\",\"parameter\":[{\"name\":\"vbid\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Book\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"book\"},\"description\":{\"default_value\":\"VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookselections\",\"parameter\":[{\"name\":\"vbid\"},{\"name\":\"book_location\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"BookSelection\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookselection\"},\"description\":{\"default_value\":\"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/iresources\",\"enabled_capability\":[\"Result.autocreate\"],\"parameter\":[{\"name\":\"vbid\"},{\"variable\":\"Result.uri\",\"name\":\"result_uri\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"InteractiveResource\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"iresource\"},\"description\":{\"default_value\":\"Interactive resource\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookshelves\",\"parameter\":[{\"variable\":\"CourseOffering.label\",\"name\":\"course_label\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Bookshelf\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookshelf\"},\"description\":{\"default_value\":\"VitalSource Bookshelf\",\"key\":\"resource.description\"}}],\"base_url_choice\":[{\"selector\":{\"applies_to\":[\"IconEndpoint\",\"MessageHandler\"]},\"default_base_url\":\"http://localhost:5000\"}]},\"security_contract\":{\"shared_secret\":\"e0cf06bb510f5b9a26e1613bc7b4ac69\",\"tool_service\":[{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tools\",\"action\":[\"POST\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tools/7a0f11d0-4e0b-0131-7468-20c9d07c6451\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/resources/Result/{sourcedId}\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/7a0f11d0-4e0b-0131-7468-20c9d07c6451/ltilink/{link_id}\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/7a0f11d0-4e0b-0131-7468-20c9d07c6451/context/{context_id}\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/7a0f11d0-4e0b-0131-7468-20c9d07c6451\",\"action\":[\"GET\",\"PUT\"]}]}}',1,'LTI-2p0','2013-12-23 14:21:39','2013-12-23 14:21:46');
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://localhost:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) DEFAULT NULL,
  `tool_profile_template` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) DEFAULT NULL,
  `tool_consumer_profile` text,
  `tool_profile` text,
  `registration_return_url` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_proxy` text,
  `state` varchar(255) DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
INSERT INTO `lti_registration_wips` VALUES (65,'Elan University',119,NULL,NULL,NULL,'/lti2_tp/registrations',NULL,NULL,NULL,NULL,NULL,'john.tibbetts@kinexis.com','Elan/LuMoS','2013-12-23 14:14:41','2013-12-23 14:14:41'),(66,'Elan University621',120,NULL,NULL,NULL,'/lti2_tp/registrations',NULL,NULL,NULL,NULL,NULL,'john.tibbetts@kinexis.com','Elan/LuMoS','2013-12-23 14:21:39','2013-12-23 14:21:45');
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES (48,'7a0f11d0-4e0b-0131-7468-20c9d07c6451','e0cf06bb510f5b9a26e1613bc7b4ac69','Elan University621','2013-12-23 14:21:45','2013-12-23 14:21:46');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-23  6:23:11
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `reg_key` varchar(255) DEFAULT NULL,
  `reg_password` varchar(255) DEFAULT NULL,
  `tc_profile_url` varchar(255) DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_consumer_profile_json` text,
  `tool_profile_json` text,
  `tool_proxy_json` text,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
INSERT INTO `lti2_tp_registrations` VALUES (119,NULL,'Elan University',NULL,'2','79dde1a0-4e0a-0131-7467-20c9d07c6451','8afe03bcb55f4008a6364a1e6a72d412','http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/79dde9d0-4e0a-0131-7467-20c9d07c6451','http://rails.kinexis.com:4000/admin/tool_actions','received','registration','{\"@context\":[\"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",{\"ltitcp\":\"http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/79dde9d0-4e0a-0131-7467-20c9d07c6451#\"}],\"@type\":\"ToolConsumerProfile\",\"@id\":\"http://rails.kinexis.com:4000/tool_consumer_profiles/79dde9d0-4e0a-0131-7467-20c9d07c6451\",\"lti_version\":\"LTI-2p0\",\"guid\":\"79dde9d0-4e0a-0131-7467-20c9d07c6451\",\"product_instance\":{\"guid\":\"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\"product_info\":{\"product_name\":{\"default_value\":\"Elan/LuMoS\",\"key\":\"product.name\"},\"product_version\":\"3.1\",\"description\":{\"default_value\":\"Elan University/LuMoS Learning Platform\",\"key\":\"product.version\"},\"technical_description\":{\"default_value\":\"LTI 1, 1.1 and 2.0 compliant\",\"key\":\"product.technicalDescription\"},\"product_family\":{\"code\":\"LuMoS\",\"vendor\":{\"code\":\"lms.LuMoS.org\",\"vendor_name\":{\"default_value\":\"LuMoS Corporation\",\"key\":\"product.vendor.name\"},\"description\":{\"default_value\":\"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\"key\":\"product.vendor.description\"},\"website\":\"http://lms.LuMoS.org/products/omega\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"contact\":{\"email\":\"support@lms.LuMoS.org\"}}}},\"support\":{\"email\":\"john.tibbetts@kinexis.com\"},\"service_owner\":{\"@id\":\"http://ec2.LuMoS.org/ServiceOwner\",\"timestamp\":\"2012-03-28T09:08:16-04:00\",\"service_owner_name\":{\"default_value\":\"Elan University\",\"key\":\"service_owner.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_owner.description\"},\"support\":{\"email\":\"techsupport@elan.edu\"}},\"service_provider\":{\"@id\":\"http://ec2.LuMoS.org/ServiceProvider\",\"guid\":\"ec2.LuMoS.org\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"service_provider_name\":{\"default_value\":\"Elan University\",\"key\":\"service_provider.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_provider.description\"},\"support\":{\"email\":\"support@yasp.LuMoS.org\"}}},\"capability_offered\":[\"basic-lti-launch-request\",\"Result.autocreate\",\"Result.sourcedId\",\"User.id\",\"User.username\",\"CourseSection.sourcedId\",\"Person.sourcedId\",\"Person.email.primary\",\"Person.name.given\",\"Person.name.family\",\"Person.name.full\",\"Membership.role\",\"ToolProxy.custom.url\",\"ToolProxyBinding.custom.url\",\"LtiLink.custom.url\"],\"service_offered\":[{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.collection\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"POST\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:Result.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/resources/Result/{sourcedId}\",\"format\":[\"application/vnd.ims.lis.v2.result+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:LtiLinkSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxyBindingSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/context/{context_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxySettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]}]}','{\"product_instance\":{\"product_info\":{\"product_version\":\"10.3\",\"technical_description\":{\"default_value\":\"Support provided for all LTI 1 extensions as well as LTI 2\",\"key\":\"tool.technical\"},\"product_name\":{\"default_value\":\"LTI2 BookTools\",\"key\":\"tool.name\"},\"product_family\":{\"code\":\"assessment-tool\",\"vendor\":{\"website\":\"{http://localhost:5000}\",\"code\":\"fabericious.org\",\"name\":{\"default_value\":\"Fab\",\"key\":\"tool.vendor.name\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\",\"contact\":{\"email\":\"info@fabericious.com\"},\"description\":{\"default_value\":\"Fabericious is a leading provider of interactive tools for education\",\"key\":\"tool.vendor.description\"}}},\"description\":{\"default_value\":\"Fabericious reflowable ePub3 Textbook\",\"key\":\"tool.description\"}},\"support\":{\"email\":\"helpdesk@fabericious.com\"},\"guid\":\"fd75124a-140e-470f-944c-114d2d92bb40\",\"service_provider\":{\"support\":{\"email\":\"support@ec2.fabericious.com\"},\"service_provider_name\":{\"default_value\":\"Amazon Cloud\",\"key\":\"service_provider.name\"},\"guid\":\"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\"description\":{\"default_value\":\"Provider of high performance managed hosting environments\",\"key\":\"service_provider.description\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\"}},\"lti_version\":\"LTI-2p0\",\"message\":[{\"message_type\":[\"ToolProxyRegistrationRequest\",\"ToolProxyReregistrationRequest\"],\"path\":\"http://localhost:5000/reregistrations\",\"parameter\":[{\"variable\":\"ToolConsumerProfile.url\",\"name\":\"tc_profile_url\"}]}],\"resource_handler\":[{\"message\":[{\"path\":\"/settings\",\"parameter\":[{\"variable\":\"ToolProxy.custom.url\",\"name\":\"tool_proxy_custom_url\"},{\"variable\":\"ToolProxyBinding.custom.url\",\"name\":\"tool_proxy_binding_custom_url\"},{\"variable\":\"LtiLink.custom.url\",\"name\":\"lti_link_custom_url\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Settings\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"setting\"},\"description\":{\"default_value\":\"Settings service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/echoes\",\"parameter\":[{\"fixed\":\"Narcissus\",\"name\":\"referrer\"},{\"fixed\":\"3.14159\",\"name\":\"pi\"},{\"variable\":\"Person.email.primary\",\"name\":\"user_primary_email\"},{\"variable\":\"CourseOffering.label\",\"name\":\"discipline\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Echo\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"echo\"},\"description\":{\"default_value\":\"Echo service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/books\",\"parameter\":[{\"name\":\"vbid\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Book\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"book\"},\"description\":{\"default_value\":\"VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookselections\",\"parameter\":[{\"name\":\"vbid\"},{\"name\":\"book_location\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"BookSelection\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookselection\"},\"description\":{\"default_value\":\"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/iresources\",\"enabled_capability\":[\"Result.autocreate\"],\"parameter\":[{\"name\":\"vbid\"},{\"variable\":\"Result.uri\",\"name\":\"result_uri\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"InteractiveResource\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"iresource\"},\"description\":{\"default_value\":\"Interactive resource\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookshelves\",\"parameter\":[{\"variable\":\"CourseOffering.label\",\"name\":\"course_label\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Bookshelf\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookshelf\"},\"description\":{\"default_value\":\"VitalSource Bookshelf\",\"key\":\"resource.description\"}}],\"base_url_choice\":[{\"selector\":{\"applies_to\":[\"IconEndpoint\",\"MessageHandler\"]},\"default_base_url\":\"http://localhost:5000\"}]}',NULL,1,'LTI-2p0','2013-12-23 14:14:41','2013-12-23 14:14:41'),(120,NULL,'Elan University',48,'2','73b56d10-4e0b-0131-7468-20c9d07c6451','b5dfac0d1b87f50d771b95c5a772170f','http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451','http://rails.kinexis.com:4000/admin/tool_actions','registered','registration','{\"@context\":[\"http://purl.imsglobal.org/ctx/lti/v2/ToolConsumerProfile\",{\"ltitcp\":\"http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451#\"}],\"@type\":\"ToolConsumerProfile\",\"@id\":\"http://rails.kinexis.com:4000/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451\",\"lti_version\":\"LTI-2p0\",\"guid\":\"73b57170-4e0b-0131-7468-20c9d07c6451\",\"product_instance\":{\"guid\":\"dcddf9808107-81ea-eaa4-1edf-5d24568c\",\"product_info\":{\"product_name\":{\"default_value\":\"Elan/LuMoS\",\"key\":\"product.name\"},\"product_version\":\"3.1\",\"description\":{\"default_value\":\"Elan University/LuMoS Learning Platform\",\"key\":\"product.version\"},\"technical_description\":{\"default_value\":\"LTI 1, 1.1 and 2.0 compliant\",\"key\":\"product.technicalDescription\"},\"product_family\":{\"code\":\"LuMoS\",\"vendor\":{\"code\":\"lms.LuMoS.org\",\"vendor_name\":{\"default_value\":\"LuMoS Corporation\",\"key\":\"product.vendor.name\"},\"description\":{\"default_value\":\"LuMoS Corporation is a fictitious vendor of a Learning Management System\",\"key\":\"product.vendor.description\"},\"website\":\"http://lms.LuMoS.org/products/omega\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"contact\":{\"email\":\"support@lms.LuMoS.org\"}}}},\"support\":{\"email\":\"john.tibbetts@kinexis.com\"},\"service_owner\":{\"@id\":\"http://ec2.LuMoS.org/ServiceOwner\",\"timestamp\":\"2012-03-28T09:08:16-04:00\",\"service_owner_name\":{\"default_value\":\"Elan University\",\"key\":\"service_owner.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_owner.description\"},\"support\":{\"email\":\"techsupport@elan.edu\"}},\"service_provider\":{\"@id\":\"http://ec2.LuMoS.org/ServiceProvider\",\"guid\":\"ec2.LuMoS.org\",\"timestamp\":\"2012-07-09T012:08:16-04:00\",\"service_provider_name\":{\"default_value\":\"Elan University\",\"key\":\"service_provider.name\"},\"description\":{\"default_value\":\"Elan University EC2 Cloud\",\"key\":\"service_provider.description\"},\"support\":{\"email\":\"support@yasp.LuMoS.org\"}}},\"capability_offered\":[\"basic-lti-launch-request\",\"Result.autocreate\",\"Result.sourcedId\",\"User.id\",\"User.username\",\"CourseSection.sourcedId\",\"Person.sourcedId\",\"Person.email.primary\",\"Person.name.given\",\"Person.name.family\",\"Person.name.full\",\"Membership.role\",\"ToolProxy.custom.url\",\"ToolProxyBinding.custom.url\",\"LtiLink.custom.url\"],\"service_offered\":[{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.collection\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"POST\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxy.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tools/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolproxy+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:Result.item\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/resources/Result/{sourcedId}\",\"format\":[\"application/vnd.ims.lis.v2.result+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:LtiLinkSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/ltilink/{link_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxyBindingSettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}/context/{context_id}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestService\",\"@id\":\"ltitcp:ToolProxySettings\",\"endpoint\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/{tool_proxy_guid}\",\"format\":[\"application/vnd.ims.lti.v2.toolsettings+json\",\"application/vnd.ims.lti.v2.toolsettings.simple+json\"],\"action\":[\"GET\",\"PUT\"]}]}','{\"product_instance\":{\"product_info\":{\"product_version\":\"10.3\",\"technical_description\":{\"default_value\":\"Support provided for all LTI 1 extensions as well as LTI 2\",\"key\":\"tool.technical\"},\"product_name\":{\"default_value\":\"LTI2 BookTools\",\"key\":\"tool.name\"},\"product_family\":{\"code\":\"assessment-tool\",\"vendor\":{\"website\":\"{http://localhost:5000}\",\"code\":\"fabericious.org\",\"name\":{\"default_value\":\"Fab\",\"key\":\"tool.vendor.name\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\",\"contact\":{\"email\":\"info@fabericious.com\"},\"description\":{\"default_value\":\"Fabericious is a leading provider of interactive tools for education\",\"key\":\"tool.vendor.description\"}}},\"description\":{\"default_value\":\"Fabericious reflowable ePub3 Textbook\",\"key\":\"tool.description\"}},\"support\":{\"email\":\"helpdesk@fabericious.com\"},\"guid\":\"fd75124a-140e-470f-944c-114d2d92bb40\",\"service_provider\":{\"support\":{\"email\":\"support@ec2.fabericious.com\"},\"service_provider_name\":{\"default_value\":\"Amazon Cloud\",\"key\":\"service_provider.name\"},\"guid\":\"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\"description\":{\"default_value\":\"Provider of high performance managed hosting environments\",\"key\":\"service_provider.description\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\"}},\"lti_version\":\"LTI-2p0\",\"message\":[{\"message_type\":[\"ToolProxyRegistrationRequest\",\"ToolProxyReregistrationRequest\"],\"path\":\"http://localhost:5000/reregistrations\",\"parameter\":[{\"variable\":\"ToolConsumerProfile.url\",\"name\":\"tc_profile_url\"}]}],\"resource_handler\":[{\"message\":[{\"path\":\"/settings\",\"parameter\":[{\"variable\":\"ToolProxy.custom.url\",\"name\":\"tool_proxy_custom_url\"},{\"variable\":\"ToolProxyBinding.custom.url\",\"name\":\"tool_proxy_binding_custom_url\"},{\"variable\":\"LtiLink.custom.url\",\"name\":\"lti_link_custom_url\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Settings\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"setting\"},\"description\":{\"default_value\":\"Settings service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/echoes\",\"parameter\":[{\"fixed\":\"Narcissus\",\"name\":\"referrer\"},{\"fixed\":\"3.14159\",\"name\":\"pi\"},{\"variable\":\"Person.email.primary\",\"name\":\"user_primary_email\"},{\"variable\":\"CourseOffering.label\",\"name\":\"discipline\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Echo\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"echo\"},\"description\":{\"default_value\":\"Echo service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/books\",\"parameter\":[{\"name\":\"vbid\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Book\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"book\"},\"description\":{\"default_value\":\"VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookselections\",\"parameter\":[{\"name\":\"vbid\"},{\"name\":\"book_location\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"BookSelection\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookselection\"},\"description\":{\"default_value\":\"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/iresources\",\"enabled_capability\":[\"Result.autocreate\"],\"parameter\":[{\"name\":\"vbid\"},{\"variable\":\"Result.uri\",\"name\":\"result_uri\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"InteractiveResource\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"iresource\"},\"description\":{\"default_value\":\"Interactive resource\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookshelves\",\"parameter\":[{\"variable\":\"CourseOffering.label\",\"name\":\"course_label\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Bookshelf\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookshelf\"},\"description\":{\"default_value\":\"VitalSource Bookshelf\",\"key\":\"resource.description\"}}],\"base_url_choice\":[{\"selector\":{\"applies_to\":[\"IconEndpoint\",\"MessageHandler\"]},\"default_base_url\":\"http://localhost:5000\"}]}','{\"@context\":[\"http://purl.imsglobal.org/ctx/lti/v2/ToolProxy\"],\"@type\":\"ToolProxy\",\"@id\":\"ToolProxyProposal_at_2013-12-23T14:21:45Z\",\"lti_version\":\"LTI-2p0\",\"tool_proxy_guid\":\"7a0f11d0-4e0b-0131-7468-20c9d07c6451\",\"tool_consumer_profile\":\"http://rails.kinexis.com:4000/lti2_tc/tool_consumer_profiles/73b57170-4e0b-0131-7468-20c9d07c6451\",\"tool_profile\":{\"product_instance\":{\"product_info\":{\"product_version\":\"10.3\",\"technical_description\":{\"default_value\":\"Support provided for all LTI 1 extensions as well as LTI 2\",\"key\":\"tool.technical\"},\"product_name\":{\"default_value\":\"LTI2 BookTools\",\"key\":\"tool.name\"},\"product_family\":{\"code\":\"assessment-tool\",\"vendor\":{\"website\":\"{http://localhost:5000}\",\"code\":\"fabericious.org\",\"name\":{\"default_value\":\"Fab\",\"key\":\"tool.vendor.name\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\",\"contact\":{\"email\":\"info@fabericious.com\"},\"description\":{\"default_value\":\"Fabericious is a leading provider of interactive tools for education\",\"key\":\"tool.vendor.description\"}}},\"description\":{\"default_value\":\"Fabericious reflowable ePub3 Textbook\",\"key\":\"tool.description\"}},\"support\":{\"email\":\"helpdesk@fabericious.com\"},\"guid\":\"fd75124a-140e-470f-944c-114d2d92bb40\",\"service_provider\":{\"support\":{\"email\":\"support@ec2.fabericious.com\"},\"service_provider_name\":{\"default_value\":\"Amazon Cloud\",\"key\":\"service_provider.name\"},\"guid\":\"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\"description\":{\"default_value\":\"Provider of high performance managed hosting environments\",\"key\":\"service_provider.description\"},\"timestamp\":\"2012-04-05T09:08:16-04:00\"}},\"lti_version\":\"LTI-2p0\",\"message\":[{\"message_type\":[\"ToolProxyRegistrationRequest\",\"ToolProxyReregistrationRequest\"],\"path\":\"http://localhost:5000/reregistrations\",\"parameter\":[{\"variable\":\"ToolConsumerProfile.url\",\"name\":\"tc_profile_url\"}]}],\"resource_handler\":[{\"message\":[{\"path\":\"/settings\",\"parameter\":[{\"variable\":\"ToolProxy.custom.url\",\"name\":\"tool_proxy_custom_url\"},{\"variable\":\"ToolProxyBinding.custom.url\",\"name\":\"tool_proxy_binding_custom_url\"},{\"variable\":\"LtiLink.custom.url\",\"name\":\"lti_link_custom_url\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Settings\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"setting\"},\"description\":{\"default_value\":\"Settings service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/echoes\",\"parameter\":[{\"fixed\":\"Narcissus\",\"name\":\"referrer\"},{\"fixed\":\"3.14159\",\"name\":\"pi\"},{\"variable\":\"Person.email.primary\",\"name\":\"user_primary_email\"},{\"variable\":\"CourseOffering.label\",\"name\":\"discipline\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Echo\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"echo\"},\"description\":{\"default_value\":\"Echo service\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/books\",\"parameter\":[{\"name\":\"vbid\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Book\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"book\"},\"description\":{\"default_value\":\"VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookselections\",\"parameter\":[{\"name\":\"vbid\"},{\"name\":\"book_location\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"BookSelection\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookselection\"},\"description\":{\"default_value\":\"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/iresources\",\"enabled_capability\":[\"Result.autocreate\"],\"parameter\":[{\"name\":\"vbid\"},{\"variable\":\"Result.uri\",\"name\":\"result_uri\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"InteractiveResource\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"iresource\"},\"description\":{\"default_value\":\"Interactive resource\",\"key\":\"resource.description\"}},{\"message\":[{\"path\":\"/bookshelves\",\"parameter\":[{\"variable\":\"CourseOffering.label\",\"name\":\"course_label\"}],\"message_type\":\"basic-lti-launch-request\"}],\"name\":{\"default_value\":\"Bookshelf\",\"key\":\"resource.name\"},\"resource_type\":{\"code\":\"bookshelf\"},\"description\":{\"default_value\":\"VitalSource Bookshelf\",\"key\":\"resource.description\"}}],\"base_url_choice\":[{\"selector\":{\"applies_to\":[\"IconEndpoint\",\"MessageHandler\"]},\"default_base_url\":\"http://localhost:5000\"}]},\"security_contract\":{\"shared_secret\":\"e0cf06bb510f5b9a26e1613bc7b4ac69\",\"tool_service\":[{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tools\",\"action\":[\"POST\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tools/7a0f11d0-4e0b-0131-7468-20c9d07c6451\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/resources/Result/{sourcedId}\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/7a0f11d0-4e0b-0131-7468-20c9d07c6451/ltilink/{link_id}\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/7a0f11d0-4e0b-0131-7468-20c9d07c6451/context/{context_id}\",\"action\":[\"GET\",\"PUT\"]},{\"@type\":\"RestServiceProfile\",\"service\":\"http://rails.kinexis.com:4000/lti2_tc/tool_settings/7a0f11d0-4e0b-0131-7468-20c9d07c6451\",\"action\":[\"GET\",\"PUT\"]}]}}',1,'LTI-2p0','2013-12-23 14:21:39','2013-12-23 14:21:46');
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://localhost:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) DEFAULT NULL,
  `tool_profile_template` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) DEFAULT NULL,
  `tool_consumer_profile` text,
  `tool_profile` text,
  `registration_return_url` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `tool_proxy` text,
  `state` varchar(255) DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
INSERT INTO `lti_registration_wips` VALUES (65,'Elan University',119,NULL,NULL,NULL,'/lti2_tp/registrations',NULL,NULL,NULL,NULL,NULL,'john.tibbetts@kinexis.com','Elan/LuMoS','2013-12-23 14:14:41','2013-12-23 14:14:41'),(66,'Elan University621',120,NULL,NULL,NULL,'/lti2_tp/registrations',NULL,NULL,NULL,NULL,NULL,'john.tibbetts@kinexis.com','Elan/LuMoS','2013-12-23 14:21:39','2013-12-23 14:21:45');
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES (48,'7a0f11d0-4e0b-0131-7468-20c9d07c6451','e0cf06bb510f5b9a26e1613bc7b4ac69','Elan University621','2013-12-23 14:21:45','2013-12-23 14:21:46');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-23  6:23:28
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_profile_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile_json` text COLLATE utf8_unicode_ci,
  `tool_profile_json` text COLLATE utf8_unicode_ci,
  `tool_proxy_json` text COLLATE utf8_unicode_ci,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://localhost:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_profile_template` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile` text COLLATE utf8_unicode_ci,
  `tool_profile` text COLLATE utf8_unicode_ci,
  `registration_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_proxy` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-23  6:49:19
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_profile_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile_json` text COLLATE utf8_unicode_ci,
  `tool_profile_json` text COLLATE utf8_unicode_ci,
  `tool_proxy_json` text COLLATE utf8_unicode_ci,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://rails.kinexis.com:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_profile_template` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile` text COLLATE utf8_unicode_ci,
  `tool_profile` text COLLATE utf8_unicode_ci,
  `registration_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_proxy` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-17 16:17:15
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_profile_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile_json` text COLLATE utf8_unicode_ci,
  `tool_profile_json` text COLLATE utf8_unicode_ci,
  `tool_proxy_json` text COLLATE utf8_unicode_ci,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://rails.kinexis.com:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_profile_template` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile` text COLLATE utf8_unicode_ci,
  `tool_profile` text COLLATE utf8_unicode_ci,
  `registration_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_proxy` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-25 10:10:14
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.8 (x86_64)
--
-- Host: localhost    Database: tpsampleapp
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `iresources`
--

DROP TABLE IF EXISTS `iresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iresources`
--

LOCK TABLES `iresources` WRITE;
/*!40000 ALTER TABLE `iresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `iresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registrations`
--

DROP TABLE IF EXISTS `lti2_tp_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tc_profile_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `launch_presentation_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile_json` text COLLATE utf8_unicode_ci,
  `tool_profile_json` text COLLATE utf8_unicode_ci,
  `tool_proxy_json` text COLLATE utf8_unicode_ci,
  `tool_id` int(11) DEFAULT NULL,
  `lti_version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registrations`
--

LOCK TABLES `lti2_tp_registrations` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti2_tp_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_registries`
--

DROP TABLE IF EXISTS `lti2_tp_registries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_registries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_registries`
--

LOCK TABLES `lti2_tp_registries` WRITE;
/*!40000 ALTER TABLE `lti2_tp_registries` DISABLE KEYS */;
INSERT INTO `lti2_tp_registries` VALUES (1,'tp_deployment_url','http://rails.kinexis.com:5000','2013-01-13 20:12:10','2013-01-13 20:12:10'),(2,'security_contract_template','{ \"shared_secret\" : \"{aSecret}\",\n  \"tool_service\" : [ { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : \"POST\",\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.collection\"\n      },\n      { \n	\"@id\": \":ToolProxy.item\",\n	\"@type\" : \"RestServiceProfile\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#ToolProxy.item\"\n      },\n      { \n	\"@id\": \":ToolProxy.collection\",\n	\"@type\" : \"RestService\",\n        \"action\" : [ \"GET\",\n            \"PUT\"\n          ],\n        \"service\" : \"http://lms.example.com/profile/b6ffa601-ce1d-4549-9ccf-145670a964d4#Result.item\"\n      }\n    ]\n}','2013-01-13 20:12:10','2013-01-13 20:12:10'),(3,'relaxed_oauth_check','false','2013-01-13 20:12:10','2013-01-13 20:12:10'),(4,'result_template','{\n  \"@context\" : \"http://www.imsglobal.org/imspurl/lis/v2/ctx/Result\",\n  \"@type\" : \"Result\",\n  \"resultScore\" : {\n    \"@type\" : \"decimal\",\n    \"@value\"  : {value}\n  }\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10'),(5,'tool_provider_name','Fabericious','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_registries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti2_tp_tools`
--

DROP TABLE IF EXISTS `lti2_tp_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti2_tp_tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tool_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_profile_template` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti2_tp_tools`
--

LOCK TABLES `lti2_tp_tools` WRITE;
/*!40000 ALTER TABLE `lti2_tp_tools` DISABLE KEYS */;
INSERT INTO `lti2_tp_tools` VALUES (1,'LTI2 BookTools','{\n	\"product_instance\": {\n		\"product_info\": {\n			\"product_version\": \"10.3\",\n			\"technical_description\": {\n				\"default_value\": \"Support provided for all LTI 1 extensions as well as LTI 2\",\n				\"key\": \"tool.technical\"\n			},\n			\"product_name\": {\n				\"default_value\": \"LTI2 BookTools\",\n				\"key\": \"tool.name\"\n			},\n			\"product_family\": {\n				\"code\": \"assessment-tool\",\n				\"vendor\": {\n					\"website\": \"{{tp_deployment_url}}\",\n					\"code\": \"fabericious.org\",\n					\"name\": {\n						\"default_value\": \"Fab\",\n						\"key\": \"tool.vendor.name\"\n					},\n					\"timestamp\": \"2012-04-05T09:08:16-04:00\",\n					\"contact\": {\n						\"email\": \"info@fabericious.com\"\n					},\n					\"description\": {\n						\"default_value\": \"Fabericious is a leading provider of interactive tools for education\",\n						\"key\": \"tool.vendor.description\"\n					}\n				}\n			},\n			\"description\": {\n				\"default_value\": \"Fabericious reflowable ePub3 Textbook\",\n				\"key\": \"tool.description\"\n			}\n		},\n		\"support\": {\n			\"email\": \"helpdesk@fabericious.com\"\n		},\n		\"guid\": \"fd75124a-140e-470f-944c-114d2d92bb40\",\n		\"service_provider\": {\n			\"support\": {\n				\"email\": \"support@ec2.fabericious.com\"\n			},\n			\"service_provider_name\": {\n				\"default_value\": \"Amazon Cloud\",\n				\"key\": \"service_provider.name\"\n			},\n			\"guid\": \"18e7ea50-3d6d-4f6b-aff2-ed3ab577716c\",\n			\"description\": {\n				\"default_value\": \"Provider of high performance managed hosting environments\",\n				\"key\": \"service_provider.description\"\n			},\n			\"timestamp\": \"2012-04-05T09:08:16-04:00\"\n		}\n	},\n	\"lti_version\": \"LTI-2p0\",\n	\"message\": [\n		{\n			\"message_type\": [\"ToolProxyRegistrationRequest\", \"ToolProxyReregistrationRequest\"],\n			\"path\": \"{tp_deployment_url}/reregistrations\",\n			\"parameter\": [\n				{\n					\"variable\": \"ToolConsumerProfile.url\",\n					\"name\": \"tc_profile_url\"\n				}\n			]\n		}\n	],\n	\"resource_handler\": [\n        {\n            \"message\": [\n                {\n                    \"path\": \"/settings\",\n                    \"parameter\": [\n                        {\n                            \"variable\": \"ToolProxy.custom.url\",\n                            \"name\": \"tool_proxy_custom_url\"\n                        }, {\n                            \"variable\": \"ToolProxyBinding.custom.url\",\n                            \"name\": \"tool_proxy_binding_custom_url\"\n                        }, {\n                            \"variable\": \"LtiLink.custom.url\",\n                            \"name\": \"lti_link_custom_url\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Settings\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"setting\"},\n            \"description\": {\n                \"default_value\": \"Settings service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n            \"message\": [\n                {\n                    \"path\": \"/echoes\",\n                    \"parameter\": [\n                        {\n                            \"fixed\": \"Narcissus\",\n                            \"name\": \"referrer\"\n                        }, {\n                            \"fixed\": \"3.14159\",\n                            \"name\": \"pi\"\n                        }, {\n                            \"variable\": \"Person.email.primary\",\n                            \"name\": \"user_primary_email\"\n                        }, {\n                            \"variable\": \"CourseOffering.label\",\n                            \"name\": \"discipline\"\n                        }\n                    ],\n                    \"message_type\": \"basic-lti-launch-request\"\n                }\n            ],\n            \"name\": {\n                \"default_value\": \"Echo\",\n                \"key\": \"resource.name\"\n            },\n            \"resource_type\": {\"code\": \"echo\"},\n            \"description\": {\n                \"default_value\": \"Echo service\",\n                \"key\": \"resource.description\"\n            }\n        },\n        {\n			\"message\": [\n				{\n					\"path\": \"/books\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Book\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"book\"},\n			\"description\": {\n				\"default_value\": \"VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookselections\",\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"name\": \"book_location\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"BookSelection\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookselection\"},\n			\"description\": {\n				\"default_value\": \"Deep-linked VitalSource reader for XML, PDF, and ePub content\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/iresources\",\n					\"enabled_capability\": [\n						\"Result.autocreate\"\n					],\n					\"parameter\": [\n						{\n							\"name\": \"vbid\"\n						}, {\n							\"variable\": \"Result.uri\",\n							\"name\": \"result_uri\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"InteractiveResource\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"iresource\"},\n			\"description\": {\n				\"default_value\": \"Interactive resource\",\n				\"key\": \"resource.description\"\n			}\n		},\n        {\n			\"message\": [\n				{\n					\"path\": \"/bookshelves\",\n					\"parameter\": [\n						{\n							\"variable\": \"CourseOffering.label\",\n							\"name\": \"course_label\"\n						}\n					],\n					\"message_type\": \"basic-lti-launch-request\"\n				}\n			],\n			\"name\": {\n				\"default_value\": \"Bookshelf\",\n				\"key\": \"resource.name\"\n			},\n			\"resource_type\": {\"code\": \"bookshelf\"},\n			\"description\": {\n				\"default_value\": \"VitalSource Bookshelf\",\n				\"key\": \"resource.description\"\n			}\n		}\n	],\n	\"base_url_choice\": [\n		{\n			\"selector\": {\n				\"applies_to\": [\"IconEndpoint\", \"MessageHandler\"]\n			},\n			\"default_base_url\": \"{tp_deployment_url}\"\n		}\n	]\n}\n','2013-01-13 20:12:10','2013-01-13 20:12:10');
/*!40000 ALTER TABLE `lti2_tp_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_registration_wips`
--

DROP TABLE IF EXISTS `lti_registration_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_registration_wips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `lti_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_consumer_profile` text COLLATE utf8_unicode_ci,
  `tool_profile` text COLLATE utf8_unicode_ci,
  `registration_return_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_proxy` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_status` int(11) DEFAULT NULL,
  `result_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_registration_wips`
--

LOCK TABLES `lti_registration_wips` WRITE;
/*!40000 ALTER TABLE `lti_registration_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_registration_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121231164847'),('20131011162458'),('20131011193733'),('20131012140551'),('20131212163915'),('20131217192847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_users`
--

DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_users`
--

LOCK TABLES `tenant_users` WRITE;
/*!40000 ALTER TABLE `tenant_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-06  9:02:34
