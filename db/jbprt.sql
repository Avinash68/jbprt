-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'js'),(1,'rct');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Token',7,'add_token'),(20,'Can change Token',7,'change_token'),(21,'Can delete Token',7,'delete_token'),(22,'Can add jobs',8,'add_jobs'),(23,'Can change jobs',8,'change_jobs'),(24,'Can delete jobs',8,'delete_jobs'),(25,'Can add recruiter',9,'add_recruiter'),(26,'Can change recruiter',9,'change_recruiter'),(27,'Can delete recruiter',9,'delete_recruiter'),(28,'Can add job_ applications',10,'add_job_applications'),(29,'Can change job_ applications',10,'change_job_applications'),(30,'Can delete job_ applications',10,'delete_job_applications'),(31,'Can add job seeker',11,'add_jobseeker'),(32,'Can change job seeker',11,'change_jobseeker'),(33,'Can delete job seeker',11,'delete_jobseeker');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$uIMt8tYAGYO8$LTWIjIQRSFcAK0KWYpjoX2igU6DNOiecOAwllmidgfI=',NULL,0,'rct1','','','',0,1,'2018-07-30 06:51:10.890229'),(2,'pbkdf2_sha256$36000$7nqL3w5A6Lk8$2lI8oHyxxfebb0arM44Xu/5wd3ObaTeHlgxo5NkCICY=',NULL,0,'rct2','','','',0,1,'2018-07-30 06:52:09.497723'),(3,'pbkdf2_sha256$36000$HfNvKoMS1xC2$ENl0+nmMd20RUdGddx/m4QoIUDi3iyvDcJJ/EShDhVg=',NULL,0,'js1','','','',0,1,'2018-07-30 09:50:31.746105'),(4,'pbkdf2_sha256$36000$1BDQ2QlgNZpt$8V/s3+kzYBJgGQFcBShm2D42FTMIEaNNWebpIUi2ZpA=',NULL,0,'js2','','','',0,1,'2018-07-30 09:53:08.816237');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('279b4ba1ca3ffa025e91959a045aeb8272fb02bd','2018-07-30 07:04:44.158894',1),('4571ba879ffe02e0c72a3c9349c68ee2f3134f45','2018-07-30 11:01:28.390456',4),('583941a6c65de5d45a55eb6d59ad7fee1a22dfa1','2018-07-30 07:19:01.005162',2),('e94c666740383a5eb18b981bd4e0fb6f04bdfeec','2018-07-30 09:54:18.173102',3);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(5,'contenttypes','contenttype'),(8,'registration','jobs'),(11,'registration','jobseeker'),(10,'registration','job_applications'),(9,'registration','recruiter'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-07-30 06:42:45.265551'),(2,'auth','0001_initial','2018-07-30 06:43:16.620978'),(3,'admin','0001_initial','2018-07-30 06:43:23.108031'),(4,'admin','0002_logentry_remove_auto_add','2018-07-30 06:43:24.038707'),(5,'contenttypes','0002_remove_content_type_name','2018-07-30 06:43:27.340875'),(6,'auth','0002_alter_permission_name_max_length','2018-07-30 06:43:27.627130'),(7,'auth','0003_alter_user_email_max_length','2018-07-30 06:43:28.249182'),(8,'auth','0004_alter_user_username_opts','2018-07-30 06:43:28.412018'),(9,'auth','0005_alter_user_last_login_null','2018-07-30 06:43:29.512167'),(10,'auth','0006_require_contenttypes_0002','2018-07-30 06:43:29.577077'),(11,'auth','0007_alter_validators_add_error_messages','2018-07-30 06:43:29.690083'),(12,'auth','0008_alter_user_username_max_length','2018-07-30 06:43:30.923514'),(13,'authtoken','0001_initial','2018-07-30 06:43:37.863305'),(14,'authtoken','0002_auto_20160226_1747','2018-07-30 06:43:40.865275'),(15,'sessions','0001_initial','2018-07-30 06:43:47.826048'),(16,'registration','0001_initial','2018-07-30 06:44:55.736667'),(17,'registration','0002_auto_20180730_0655','2018-07-30 06:55:05.310273'),(18,'registration','0003_auto_20180730_0726','2018-07-30 07:26:31.844937'),(19,'registration','0004_auto_20180730_0800','2018-07-30 08:00:13.885114'),(20,'registration','0005_jobs_company_name','2018-07-30 09:05:28.235158'),(21,'registration','0006_auto_20180730_1008','2018-07-30 10:08:57.893690');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_job_applications`
--

DROP TABLE IF EXISTS `registration_job_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_job_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `jobSeeker_id` int(11) NOT NULL,
  `job_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_job_app_job_id_id_9ef719ea_fk_registrat` (`job_id_id`),
  KEY `registration_job_app_jobSeeker_id_33b63602_fk_auth_user` (`jobSeeker_id`),
  CONSTRAINT `registration_job_app_jobSeeker_id_33b63602_fk_auth_user` FOREIGN KEY (`jobSeeker_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `registration_job_app_job_id_id_9ef719ea_fk_registrat` FOREIGN KEY (`job_id_id`) REFERENCES `registration_jobs` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_job_applications`
--

LOCK TABLES `registration_job_applications` WRITE;
/*!40000 ALTER TABLE `registration_job_applications` DISABLE KEYS */;
INSERT INTO `registration_job_applications` VALUES (7,1,'2018-07-30 10:09:13.436569','2018-07-30 10:09:13.436697',3,2),(8,1,'2018-07-30 10:24:56.885721','2018-07-30 10:24:56.885770',4,2),(9,1,'2018-07-30 11:09:30.523878','2018-07-30 11:09:30.523998',4,1);
/*!40000 ALTER TABLE `registration_job_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_jobs`
--

DROP TABLE IF EXISTS `registration_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_description` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `recruiter_id_id` int(11) NOT NULL,
  `jobtitle` varchar(200) NOT NULL,
  `req_exp` varchar(200) NOT NULL,
  `req_skill_set` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `registration_jobs_recruiter_id_id_da25de33_fk_registrat` (`recruiter_id_id`),
  CONSTRAINT `registration_jobs_recruiter_id_id_da25de33_fk_registrat` FOREIGN KEY (`recruiter_id_id`) REFERENCES `registration_recruiter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_jobs`
--

LOCK TABLES `registration_jobs` WRITE;
/*!40000 ALTER TABLE `registration_jobs` DISABLE KEYS */;
INSERT INTO `registration_jobs` VALUES (1,'sample descriprtion',1,'2018-07-30 08:00:50.822990','2018-07-30 10:42:06.277275',2,'python Developer','3','python',''),(2,'sample descriprtion',0,'2018-07-30 08:42:20.464462','2018-07-30 09:33:35.372558',1,'python Developer','3','python',''),(3,'sample descriprtion',1,'2018-07-30 09:36:04.584199','2018-07-30 11:00:18.923385',1,'python Developer','3','python','ABC');
/*!40000 ALTER TABLE `registration_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_jobseeker`
--

DROP TABLE IF EXISTS `registration_jobseeker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_jobseeker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `skill_set` varchar(200) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `other_info` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_jobseeker_user_id_2cec180f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_jobseeker`
--

LOCK TABLES `registration_jobseeker` WRITE;
/*!40000 ALTER TABLE `registration_jobseeker` DISABLE KEYS */;
INSERT INTO `registration_jobseeker` VALUES (1,'js1','python','B.E','other_info',1,'2018-07-30 09:52:50.699707','2018-07-30 09:52:57.313038',3),(2,'js2','python','B.E','other_info',1,'2018-07-30 09:53:25.577373','2018-07-30 09:53:28.994722',4);
/*!40000 ALTER TABLE `registration_jobseeker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_recruiter`
--

DROP TABLE IF EXISTS `registration_recruiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_recruiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `skill_set` varchar(200) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `other_info` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_recruiter_user_id_8f8c1bba_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_recruiter`
--

LOCK TABLES `registration_recruiter` WRITE;
/*!40000 ALTER TABLE `registration_recruiter` DISABLE KEYS */;
INSERT INTO `registration_recruiter` VALUES (1,'rct1','recruiter','MBA','comapny1','',1,'2018-07-30 06:59:06.340475','2018-07-30 06:59:18.503207',1),(2,'rct2','recruiter','MBA','comapny2','',1,'2018-07-30 06:59:45.675608','2018-07-30 06:59:51.506028',2);
/*!40000 ALTER TABLE `registration_recruiter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-30 17:05:24
