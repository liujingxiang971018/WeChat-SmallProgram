-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookrecommender
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add books',7,'add_books'),(26,'Can change books',7,'change_books'),(27,'Can delete books',7,'delete_books'),(28,'Can view books',7,'view_books'),(29,'Can add reviews',8,'add_reviews'),(30,'Can change reviews',8,'change_reviews'),(31,'Can delete reviews',8,'delete_reviews'),(32,'Can view reviews',8,'view_reviews'),(33,'Can add score',9,'add_score'),(34,'Can change score',9,'change_score'),(35,'Can delete score',9,'delete_score'),(36,'Can view score',9,'view_score'),(37,'Can add users',10,'add_users'),(38,'Can change users',10,'change_users'),(39,'Can delete users',10,'delete_users'),(40,'Can view users',10,'view_users');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$OgHHKutUpcJ1$Fc2MDx+x+YUbE/JD5vz0/vUgjLU1Dvs8SmOEtu2nRqc=','2020-05-17 07:55:40.916103',1,'zjp','','','zjp@test.com',1,1,'2020-05-17 07:54:55.954347');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `btitle` varchar(50) DEFAULT NULL,
  `bauthor` varchar(20) DEFAULT NULL,
  `bpages` int(11) DEFAULT NULL,
  `bpubtime` date DEFAULT NULL,
  `breadtimes` int(11) DEFAULT NULL,
  `bisbn` varchar(13) DEFAULT NULL,
  `bavescore` decimal(3,2) DEFAULT NULL,
  `bcontent` longtext,
  `bimageurl` varchar(100) DEFAULT NULL,
  `bsystime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'深入理解计算机系统','[美] 兰德尔 E.布莱恩特',476,'2016-12-01',1,'9787111544937',8.90,'本书是一本将计算机软件和硬件理论结合讲述的经典教程，内容覆盖计算机导论、体系结构和处理器设计等多门课程。本书的最大优点是从程序员的角度描述计算机系统的实现细节，通过描述程序是如何映射到系统上，以及程序是如何执行的，使读者更好地理解程序的行为，以及程序效率。','https://img12.360buyimg.com/n1/jfs/t3310/143/1379472768/437459/d9d8bd99/582435faN7c9dd621.jpg','2020-05-17'),(2,'程序员修炼之道','Thomas',344,'2020-04-11',10,'9787121384356',9.60,'《程序员修炼之道》之所以在全球范围内广泛传播，被一代代开发者奉为圭臬，盖因它可以创造出真正的价值：或编写出更好的软件，或探究出编程的本质，而所有收获均不依赖于特定语言、框架和方法。时隔20年的新版，经过全面的重新选材、组织和编写，覆盖哲学、方法、工具、设计、解耦、并发、重构、需求、团队等务实话题的最佳实践及重大陷阱，以及易于改造、复用的架构技术。本书极具洞察力与趣味性，适合从初学者到架构师的各阶层读者潜心研读或增广见闻。','https://img14.360buyimg.com/n5/jfs/t1/112434/39/2947/421396/5ea4f421Ef5bbd571/2afe56af05a1fdf0.jpg','2020-05-17'),(3,'墨菲定律','李原',49,'2018-08-01',5,'9787547251515',7.20,'本书介绍了多种经典的人生定律、法则、效应，在简单介绍了每个定律或法则的来源和基本理论后，就如何运用其解释人生中的现象并指导我们的工作和生活等进行了重点阐述，是一部可以启迪智慧、改变命运的人生枕边书。书中介绍的这些定律，对于我们认识事物的本质、发现事物发展的规律、解决生活和工作中的遇到的林林总总的问题，具有非常重要的指导意义。你也可以利用这些神奇的定律和法则来驾驭你的一生，改变你的命运。','https://img10.360buyimg.com/n5/jfs/t1/11965/28/8849/279110/5c7251d8E8c158dcb/6b1e9bea3f275ca6.jpg','2020-05-17'),(4,'人性的弱点','戴尔·卡耐基',328,'2014-09-01',25,'9787201088822',9.60,'《人性的弱点》作为一本实用的人际关系著作，从人性本质的角度，挖掘出潜藏在人们体内的弱点，使人们能够充分认识自己，并不断改造自己，从而能有所长进，直至取得最后的成功。在过去的77年里，戴尔·卡耐基的忠告带领着上千万名读者攀登上成功的阶梯，无论在事业方面还是个人生活上，他的箴言不断被一代代人实践与验证。在出版史上，本书创造了全世界图书销售空前的记录。在经济萧条时期之后，本书满足了普遍存在的人性的需要，触动了读者的神经，在当今社会依然有其特有的借鉴价值。','https://img14.360buyimg.com/n1/jfs/t1/117033/39/400/262693/5e8bf49dE64d93b67/be9f033eca8e7f40.jpg','2020-05-17'),(5,'三体','刘慈欣',729,'2008-01-01',142,'11757834',8.30,'作者试图讲述一部在光年尺度上重新演绎的中国现代史，讲述一个文明二百次毁灭与重生的传奇。小说《三体》与三体问题有关，其中描述了一种在半人马座三星生存的三体人及其三体文明。同时《三体》也是小说中的一个模拟三体文明在一个有三颗太阳的星系中挣扎生存并发展的网络游戏，应该是由希望三体文明降临地球介入人类文明的三体组织开发的。','https://img14.360buyimg.com/n1/jfs/t1705/189/702227414/177982/cc8c12f0/55dab54dN5271c377.jpg','2020-05-17'),(6,'活着','余华',154,'2017-10-01',1,'9787506365437',7.80,'《活着（新版）》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。','https://img10.360buyimg.com/n1/jfs/t10162/279/1390942739/246693/50c56f9d/59e02214N37418280.jpg','2020-05-17'),(7,'百年孤独','加西亚·马尔克斯',360,'2017-08-01',10,'9787544291170',8.20,'《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。作品融入神话传说、民间故事、宗教典故等因素，巧妙地糅合了现实与虚幻，展现出一个瑰丽的想象世界，成为20世纪重要的经典文学巨著。1982年加西亚·马尔克斯获得诺贝尔文学奖，奠定文学大师的地位，很大程度上便是凭借《百年孤独》的巨大影响。','https://img10.360buyimg.com/n1/jfs/t1/86551/16/4453/510848/5de74f49E62b4aae0/f0a4ea7981c08841.jpg','2020-05-17'),(8,'现代操作系统','Andrew S',610,'2017-07-01',5,'9787111573692',6.60,'本书是操作系统领域的经典教材，主要内容包括进程与线程、内存管理、文件系统、输入/输出、死锁、虚拟化和云、多处理机系统、安全，以及关于UNIX、Linux、Android和Windows的实例研究等。第4版对知识点进行了全面更新，反映了当代操作系统的发展与动向。本书适合作为高等院校计算机专业的操作系统课程教材，也适合相关技术人员参考。','https://img10.360buyimg.com/n1/jfs/t5767/171/8269246406/248250/13d1cd8e/59796a5fN31af7668.jpg','2020-05-17'),(9,'机器学习','周志华',380,'2016-01-01',14,'9787302423287',9.80,'机器学习是计算机科学与人工智能的重要分支领域. 本书作为该领域的入门教材，在内容上尽可能涵盖机器学习基础知识的各方面. 全书共16 章，大致分为3 个部分：第1 部分（第1～3 章）介绍机器学习的基础知识；第2 部分（第4～10 章）讨论一些经典而常用的机器学习方法（决策树、神经网络、支持向量机、贝叶斯分类器、集成学习、聚类、降维与度量学习）；第3 部分（第11～16 章）为进阶知识，内容涉及特征选择与稀疏学习、计算学习理论、半监督学习、概率图模型、规则学习以及强化学习等. 每章都附有习题并介绍了相关阅读材料，以便有兴趣的读者进一步钻研探索。','https://img13.360buyimg.com/n1/jfs/t5734/69/3225502890/67466/5e3df388/5937d6d1Nef59fd04.jpg','2020-05-17'),(10,'流浪地球','刘慈欣',259,'2019-01-01',43,'9787536493759',8.10,'散落在《三体》之外的“刘慈欣宇宙”\r\n关于未来和宇宙，中国人想象力的代表作\r\n5篇获得银河奖·2篇已被改编为电影·1篇入选人教版语文课本·\r\n雨果奖得主 刘慈欣 作品','https://img10.360buyimg.com/n1/jfs/t1/8832/14/14319/335662/5c60e56dEad56738a/2571042c0f6978c6.jpg','2020-05-17');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-17 08:07:23.589643','1','深入理解计算机系统（原书第3版）',1,'[{\"added\": {}}]',7,1),(2,'2020-05-17 08:27:52.660226','2','程序员修炼之道：通向务实的最高境界（第2版）',1,'[{\"added\": {}}]',7,1),(3,'2020-05-17 08:38:26.667060','3','墨菲定律',1,'[{\"added\": {}}]',7,1),(4,'2020-05-17 08:41:21.945094','4','人性的弱点',1,'[{\"added\": {}}]',7,1),(5,'2020-05-17 08:44:23.075727','5','三体',1,'[{\"added\": {}}]',7,1),(6,'2020-05-17 09:16:32.409785','6','活着',1,'[{\"added\": {}}]',7,1),(7,'2020-05-17 09:17:37.341852','7','百年孤独',1,'[{\"added\": {}}]',7,1),(8,'2020-05-17 09:21:22.429428','8','现代操作系统',1,'[{\"added\": {}}]',7,1),(9,'2020-05-17 09:22:57.685891','9','机器学习',1,'[{\"added\": {}}]',7,1),(10,'2020-05-17 09:25:38.382584','10','流浪地球',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'myApp','books'),(8,'myApp','reviews'),(9,'myApp','score'),(10,'myApp','users'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-05-17 07:48:49.412119'),(2,'auth','0001_initial','2020-05-17 07:48:55.093946'),(3,'admin','0001_initial','2020-05-17 07:49:22.433231'),(4,'admin','0002_logentry_remove_auto_add','2020-05-17 07:49:32.952055'),(5,'admin','0003_logentry_add_action_flag_choices','2020-05-17 07:49:33.202036'),(6,'contenttypes','0002_remove_content_type_name','2020-05-17 07:49:39.259828'),(7,'auth','0002_alter_permission_name_max_length','2020-05-17 07:49:41.624168'),(8,'auth','0003_alter_user_email_max_length','2020-05-17 07:49:41.991377'),(9,'auth','0004_alter_user_username_opts','2020-05-17 07:49:42.161372'),(10,'auth','0005_alter_user_last_login_null','2020-05-17 07:49:44.595538'),(11,'auth','0006_require_contenttypes_0002','2020-05-17 07:49:44.725511'),(12,'auth','0007_alter_validators_add_error_messages','2020-05-17 07:49:44.925497'),(13,'auth','0008_alter_user_username_max_length','2020-05-17 07:49:50.880481'),(14,'auth','0009_alter_user_last_name_max_length','2020-05-17 07:49:53.723809'),(15,'auth','0010_alter_group_name_max_length','2020-05-17 07:49:54.117155'),(16,'auth','0011_update_proxy_permissions','2020-05-17 07:49:54.267143'),(17,'myApp','0001_initial','2020-05-17 07:50:10.206459'),(18,'sessions','0001_initial','2020-05-17 07:50:17.275937');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('n7he50cqypq8yeteq3zgcztc98l9iuxi','OTVmYTcwZmEyNjIwOGNiZTliN2E3OWNlZTBkZDI3ZWM4YjM1NDlkMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOTg5NzIwOGQyNTkxYWI1NDYxYmIzMTRjNTg3NGFhMzk4ZTU4NDQ4In0=','2020-05-31 07:55:41.093014');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rreview` longtext,
  `rusername` varchar(20) DEFAULT NULL,
  `ruserphoto` varchar(300) DEFAULT NULL,
  `rpublishtime` date DEFAULT NULL,
  `rbookid_id` int(11) NOT NULL,
  `ruserid_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_ruserid_id_rbookid_id_be463404_uniq` (`ruserid_id`,`rbookid_id`),
  KEY `review_rbookid_id_434d8585_fk_books_id` (`rbookid_id`),
  CONSTRAINT `review_rbookid_id_434d8585_fk_books_id` FOREIGN KEY (`rbookid_id`) REFERENCES `books` (`id`),
  CONSTRAINT `review_ruserid_id_5bca0ae6_fk_users_uopenid` FOREIGN KEY (`ruserid_id`) REFERENCES `users` (`uopenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stag` tinyint(1) NOT NULL,
  `sbookid_id` int(11) NOT NULL,
  `suserid_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `score_suserid_id_sbookid_id_74353b6c_uniq` (`suserid_id`,`sbookid_id`),
  KEY `score_sbookid_id_8ea365df_fk_books_id` (`sbookid_id`),
  CONSTRAINT `score_sbookid_id_8ea365df_fk_books_id` FOREIGN KEY (`sbookid_id`) REFERENCES `books` (`id`),
  CONSTRAINT `score_suserid_id_572005e7_fk_users_uopenid` FOREIGN KEY (`suserid_id`) REFERENCES `users` (`uopenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uopenid` varchar(30) NOT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `ugender` tinyint(1) NOT NULL,
  `uphoto` varchar(300) DEFAULT NULL,
  `ulocation` varchar(50) DEFAULT NULL,
  `uentrytime` datetime(6) NOT NULL,
  PRIMARY KEY (`uopenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('oVZT70K12U5z9DVZ6Duo2ff9LPQk','洋洋洒洒',1,'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL78mPibOrZlcwRKzYqXU8tAxjpXM8z8jR4s62WhJA8cpXVCibuXQgr2TP51MkHKuII36RCS7OnGZww/132','ChinaSichuanChengdu','2020-05-17 07:59:03.975177');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-09 23:34:42
