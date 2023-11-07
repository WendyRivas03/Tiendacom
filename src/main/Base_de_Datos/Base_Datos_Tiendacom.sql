-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tiendacom_wendy
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL,
  `tipo_doc` varchar(60) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `sexo_cli` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `sexo_cli_idx` (`sexo_cli`),
  CONSTRAINT `sexo_cli` FOREIGN KEY (`sexo_cli`) REFERENCES `genero` (`idgenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1098,'CC','Maria','27363','marialamejor','caraÃ±o',1,'2023-10-16',1),(1297,'CÃ©dula de extranjerÃ­a','Jhon','4444','jhonelsexy','cabi',2,'2023-10-16',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura_compra`
--

DROP TABLE IF EXISTS `detalle_factura_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura_compra` (
  `iddetalle_factura_compra` int NOT NULL AUTO_INCREMENT,
  `id_factcompra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_comprada` int NOT NULL,
  `precio_unitario_compra` float NOT NULL,
  `precio_total_compra` float NOT NULL,
  PRIMARY KEY (`iddetalle_factura_compra`),
  KEY `id_factcompra_idx` (`id_factcompra`),
  KEY `id_producto_idx` (`id_producto`),
  CONSTRAINT `id_factcompra` FOREIGN KEY (`id_factcompra`) REFERENCES `factura_compra` (`idfactura_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura_compra`
--

LOCK TABLES `detalle_factura_compra` WRITE;
/*!40000 ALTER TABLE `detalle_factura_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura_compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizar_precio_total_compra` BEFORE INSERT ON `detalle_factura_compra` FOR EACH ROW begin
set new.precio_total_compra = new.cantidad_comprada * new.precio_unitario_compra;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizar_cantidad_precio` AFTER INSERT ON `detalle_factura_compra` FOR EACH ROW begin
update producto as p set cantidad = p.cantidad + new.cantidad_comprada, p.precio = new.precio_unitario_compra + (new.precio_unitario_compra*0.20)
where NEW.id_producto=p.idProducto;

set @suma := (select sum(precio_total_compra) from detalle_factura_compra where id_factcompra=new.id_factcompra);

update factura_compra f set f.total_compra = @suma+(@suma*f.descuento) where f.idfactura_compra=new.id_factcompra;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cliente` int NOT NULL,
  `usuario` int NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `impuesto` float NOT NULL,
  `total_factura` float NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `cliente_idx` (`cliente`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_compra`
--

DROP TABLE IF EXISTS `factura_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_compra` (
  `idfactura_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_usuario` int NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `descuento` float NOT NULL,
  `total_compra` float NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`idfactura_compra`),
  KEY `id_proveedor_idx` (`id_proveedor`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compra`
--

LOCK TABLES `factura_compra` WRITE;
/*!40000 ALTER TABLE `factura_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Femenino',1),(2,'Masculino',1),(3,'Otro',1);
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrar_cliente`
--

DROP TABLE IF EXISTS `mostrar_cliente`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cliente` AS SELECT 
 1 AS `idcliente`,
 1 AS `tipo_doc`,
 1 AS `nombre`,
 1 AS `telefono`,
 1 AS `correo`,
 1 AS `direccion`,
 1 AS `genero`,
 1 AS `fecha_nacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_factura`
--

DROP TABLE IF EXISTS `mostrar_factura`;
/*!50001 DROP VIEW IF EXISTS `mostrar_factura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_factura` AS SELECT 
 1 AS `Factura`,
 1 AS `Empleado`,
 1 AS `Cliente`,
 1 AS `Fecha compra`,
 1 AS `Tipo de pago`,
 1 AS `Impuesto`,
 1 AS `Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_producto`
--

DROP TABLE IF EXISTS `mostrar_producto`;
/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_producto` AS SELECT 
 1 AS `idproducto`,
 1 AS `imagen`,
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `cantidad`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_proveedor`
--

DROP TABLE IF EXISTS `mostrar_proveedor`;
/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_proveedor` AS SELECT 
 1 AS `idproveedor`,
 1 AS `tipo_docu_pro`,
 1 AS `nombre_pro`,
 1 AS `telefono_pro`,
 1 AS `correo`,
 1 AS `direccion_pro`,
 1 AS `tipo_persona`,
 1 AS `genero`,
 1 AS `fecha_nacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_rol`
--

DROP TABLE IF EXISTS `mostrar_rol`;
/*!50001 DROP VIEW IF EXISTS `mostrar_rol`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_rol` AS SELECT 
 1 AS `id`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_sexo`
--

DROP TABLE IF EXISTS `mostrar_sexo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_sexo` AS SELECT 
 1 AS `id`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_usuario`
--

DROP TABLE IF EXISTS `mostrar_usuario`;
/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_usuario` AS SELECT 
 1 AS `idusuario`,
 1 AS `tipo_docusu`,
 1 AS `nombre`,
 1 AS `rango`,
 1 AS `telefono`,
 1 AS `correo`,
 1 AS `genero`,
 1 AS `direccion`,
 1 AS `fecha_nacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` longblob,
  `ruta` varchar(450) DEFAULT NULL,
  `precio` float NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Portatil lenovo','5 de ram, disco duro ssd de 500G',50,NULL,NULL,2500000,1),(2,'Mause Inalambricos','Mause inalambrico, falcil manejo',49,NULL,NULL,60000,1),(3,'Teclado','teclado flexible, de facil portabilidad',33,NULL,NULL,72000,1),(4,'Portatil Dell','9 de ram, disco duro ssd de 500G',15,'',NULL,4000000,1),(5,'Teclado Inalambrico','teclado inalambrico y portable',15,NULL,NULL,48000,1),(6,'Porta celular','porta celular de aluminio',30,NULL,NULL,15000,1),(7,'Memoria USB','Capacidad 32GB',14,'',NULL,60000,1),(8,'portatil','dell',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0	\0\0\0\0\0\0!1	\"A2Qaq‘¡¢ƒ#Br‚$R£±ğÿ\Ú\0\0\0?\0Úš\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\".2+”D]µ´ö\êIjªçšš—\É4\Ïc\Z:’O >%c«öó[$\Ó!ß©\í+JÒ¹½Xnğ9\ãüZ\âT\ë\Ú°kc]Á®\â¸\È9p[¨jgÏ›c\Ç\İD.¦[,Œ9¶\ëf¥º¿úK(c…§\ÎIû+GiE-Omz©ùö_]sdP\Æ;ş\Õ·ñÖ·,Š==b i\èe|\Õ~L\n•û\Ô\í\"\çÅ‹\Í>–ø\Æ<\Ş\\­•›g\Ö÷MF¯»õ\Î!ñ†©Á¶·_aÚ¹—[½e]\Ôú„Ş¹TùZ×¸ÿ\0-ı÷aø÷8¯o\Ê\"‚\í\Óf\Ğ\í{c\Ú\ËFN/V¹\é#q8\r”´ú7y<4ù/\Ïm4¶ùå¦¨‡Õª ‘\Ğ\Í	d%¯iùG’“Z\ä\Éo2T\Ê\Í\'²§6Yz)Å¢ \09©=n\ÕU¾\æ\Z\Ã\ŞVš\ëÁo6HXñÍ¯›H\èGš\ÙNÂ¶Ô¶_c¿ñµ\ÕrE\èk\Z³P\Î\ìƒÌ/“‚Ÿ\".<7õÙ‡ğ§z\ÍeK&+u\îF_¨ğ\Ü7†£&P>S6QôXn\Ù/E/´Ts\ngh«\Æ9©\í‚#SL\é\ß;`„<D	c\Ş^üg­ò$üG‰WJŠ‰-²ú)H\Îš\æNi\èGş\ÏPy…K=\ì\0yı’¾÷\È÷—¨û;¶¾\Ú=e{\Ğusb¤¨PµÇ¤ñŒH\Ñı\Ñ\áß¶W¿\Ñk³¶eş»¤´F\Ñ)¡Ì¶º·\Ù\ëd}\ã\"~H\ÈıÅ­;}F1\ÍIí•˜\Ç5*¶\ÜxGU=\ÒC­\Ó1TEMSSU/u$ŞŠV‘\â\×`õˆ#Ÿ’ú½\ëI/\È÷JDqˆ\Ú\é\åô’8d’\\\ì’Iğ\0r¢²\Ï}\ä{\Ê\ÍY|\È=\ïºú\ÑN®\ÙÎº±j‹sÿ\0\ÖZk#ªcsí†óÁ\Í\âiù­\åiMA¬ô½¦ÿ\0k”On¹\Ò\ÅWO =Xö‡7\Ï]‘`½½o¡7x¿RYu=5\î{…]8©¶ûy|on\\1\é\\\æ³9o1œK\Ë{\Äo™§·‹\Ø\îªĞ´Z>²\î´\Ü0V\×U\Æ\Ìp’\'†0;˜s[ıAkŠ \Ş.ño¸ø…}¢­\áš¾R]8GUs†õ\í.\Ã|\ä{\Ã\ê©f¾dò¶T\ŞryZ*n¹\Î\nÚŸeN\ÛÛ­öMtĞ•µ÷--8}3\\\în£˜—7\Ù xù9«\Üh°\Öò{¾Zv\í¤o¯iõ˜ŸM0tO÷·%ª}s /\Û\ÕU\Zz\ì÷P\Õ4—\ÒT¹€²¡€õòóÁ\á=Bó¾³£­Wp‰¼A’?Ó´<\0{ü\È rö³\ÑPA[\Â:ªØ®|>8]ß­µd\æSõ§=¤°=\Ã\Ş/ª©µR]õ\âeõò¸\à2–7\Ì\ï£YKInƒµ\İhXiôÂš\'ô’´2•¿™\âüVw\Ù\çen³º\ÕE>¨»P\Ğ\Ò\äSQ5ó\Êá…\î\áhò{ÿ\0v=×´¾\îVzØ¬v\æGq¸p\n\ÊùH|Ò†g…¹À\áh$\ãÏš\Î¸#!a½\á÷s°m\ÇJTP\\ 1U´\Ó\ÖAİšÿ\0¹ğ÷\ÑÃ‘Zk\Şwİ lóS2\Õr±\Õ\Ü\ê)œ!†²\İK,°\ÕF\â\â\×F\0q\á9i\æ\Ò\ìx‚czgv\r¯jª†\ÃC o\â\ÂJŠa0zw¤p\Ç\Ó+6\è¾\Ì-®\êWµ\×:›M‚\ÔI$•Rñ`k\"½	 »!mt\Ü\êMWu¸»—tŒ’?°s¿%\èm\ÙÓ²\r Y!\Ó•ó·Î¸—U??¸Hû,é§¶G¥ô\Í;a·Ú©©¢hÀd15@(¦µ\ÒREOÁª¤\0:|—(ˆ¸ ª\Óp\Òv›¤Ş–ªŠ9d÷œ®\ÊM5l¡\0AG`{‚¸G\"c\Z\Ñğ\íÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\dell.jpg',0,1),(9,'memoria usb','memoria de 64Gb, todo terreno',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0%\0%\0\0ÿ\Û\0C\0	\n\n			\n\n		\r\r\nÿ\Û\0C	ÿÀ\0\0h\0`\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0<\0\0\0\0\0\0!1AQV•\Ô	\"a2BRq#3br’S‘¡²ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AQa\"q±Á2‘\Ñ\áğ¡Bÿ\Ú\0\0\0?\0Šz5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ğ\Ğ…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4¡STş>Ê¯5¸ú\ZĞ©ªeWš\Ü}\r\0\èT\Õ?²«\Ín>†€t*jŸ\Ç\ÙU\æ·C@:5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ğ\Ğ…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4\Ô\Ğ\n@(\0 €P\n@(\È/1mª\Ål$\Âf\Ú[i\×Š\Ù+B\Ò~‰$İ¸\ï <¼M›Xo[#\â<Uˆ¢Aµ=!\Û„­µ¸²BR\nºö<ú¹U´¨T¯\'\Zqm¥º\"ª\Õ\éPŠ•Y$›\Êı^ˆy·\ÚC\Í()I ò\"ª-?thÏ{eGb™˜\èw+ş\"€„™1a¥¶ B\ÜQ\Ø+b	\0·«£J9)T–]µ¿\ÙDªÏ‹†œsÿ\0Y1W´»:qcˆ‡–ø\Z\ÑcnS¥†~%\Õ/m\ÂAYJ8¾›T¸\è\Ç\å‹~o\Ù}\ÌpV—\Í$¼—»ûf†µU‹³F\í|\Êü\àŸÇ‹ ­ra­\Ö\Â\Üm<d¥ $}[\ìOuS9q¼ò\ËÈº\àYgŸ™qª$…\0 €µA\nÉ„-(\Íûƒ±‰mGÁ^[’ –\æBw\äSj\ï$ºùƒøj\Ê1œ¦¸5WòÈª´  øôvó+4{\ä¾\Ã\Ñğ®På¬©–\È|F+rŒ‚TU¸‰G\æ$öu×ª¤\á9ºµª9I\ë’÷yzZPœ)Æ•\Zj1Zfı–~§v×§±T‡Á\Ğ!Y˜Š!q¡A;\î\É\äO¼\İD]C´w\Õ.­%hC\ê\Ûû\"\åJ¬sŸ\Ñ%÷eÿ\0Ó–v\Ú3\ç,-\Ø\Î\ÛEÁ)®±Ry±) q\r¿*¾ò~‡\èk\ÎzL\ÇöŒe5\Û.5pÆ§\Ş=m\Å\ç\í6#ñ’\ëd÷¥CıTš“½\È\ÅebÁóÛÇ‘-\ây+Iù\ã>9\Ç}\'ü÷õŞ¢H\Û\ÅX‹b{\áQğ·‹,\Ğ\İ\å„7·º”—\åÂÀ\àWO\Ş\áû\Û\ï¹`ò»0\ìy­€l¸ÿ\0:\ï/po¹iÎ¥¶¯ªT?¥\ÕP\n@(\n‰\í:Áx\Ã\é\Û\âğ\Ù.\Û\ìw&\îˆ\è­q\ÂT\àÛ±\nPQ\Üû*\È?¢µeS^(\ÉèŒÃ—%¶¥\Û$™\äß¶«-&\Ü7ˆ¦a\ÄÁº|B]¹ÂŒC\ì•|t’P\ë\\C˜RAW_>[ur &½=\çZvÍ›mş<´¯/ñ\ÃL&[h üCd¾¶’\0eAÄºB?(X€\rsõ©’±3\ç!\ç¦\Ğ\Ër\îöf\â\Ğ\ã{(º7[i=¡m\ï·y¬«ØŒ­s¢-øn½muJJ›<$o·w\í¬;7³4C‰(H·B[\×+o\ÙòÜ–®0¥‚_Byl\à@ ¸\Ü\ï¶\àlºöc\êJŸ\Ê\É\İİµ\Û\ï‹÷ö¢§930m\ìzƒ‰\ì‘\ßM§”€P\n\å¹\Û`^m²­H­É‡5•ÇËƒt¸\Ú\ÒR¤‘\Ú$Q<h\ÃI¬™…Z»\È[–3šå†šm\ÕZœW\ÇY¤(Z\É\áö©tªw\í©M/™h\ÈÁÿ\0\Ë\Õ¾Å“\Øj\È/€¨O\Û#t¨€7\ëØ\ÌTI’ø\Ûµd½aı¦Ì¶\Üã‰°!´\â\ÚDŠ”7\ã\â$))«p\n‰;€¥P\Ï\ÙÛ©ğ¹ÉœY;Šõag\Ö\ãªù¤\Âmó\ëSüŸ\í )§´\"•’ù\İ.\ïg†Z°\â2«¤\ì„q«ù­ğY;Ê¤\Ö]\îEZÇ¥“w‚?… \â6­ñ\çNšß¼vK\ÉRU¿\Üı\Ğ:¶\Õ7gf\à–ˆ\ÅJRÕ¾O§ôrı\ä\Ú8\ß\æ\Ï)8\Åh—N§\ë7²õi·±pDTB\Äøq\ÔÏ„üdğ8\ç»<E½\Ç^\àrúVoÄ¥Âº´b•H\İeÏ±\r\Ş\ÛU0x•N´³„­~]\Í+Ò®|Zõ“V\\y\ä}¢nÌE©h‹—`W%\×n\Ê\ä\ÇU%ú@(Yõ\í§4g\ÎNH›d„\ÅXU.\\-œ)ù\ä7·ó£ıx’7ó%=õ8_\Âù•\Î\Ş5\Ë\ĞÅ«L¥\Ún\n„ğ)mgm•\ËcP\ÓR\Âw\ÊÌ¥gYÿ\0‰ñ©†\ë\Î5$up¥\n\á+q}|\È;%;r“Î·m\ßİšXú‰m§¢VÓ©¥\íıä«®ğ¸d³Z·ß¡\"Z°$¼¹¿\Ûñ\æVÉ“l\ÄG\Ó**W!n3 §­¥…’@P\İ;ƒ·>`Šú\ÛGtp\Õ)7„\\3Z]´û\\ù{;{1ª–-ñA\ëlš\ïb\à\çÅŸ\ëcI	\Ç8N Uö\Î\Ò\î\Å\Ûw£\Êi;J†¡\Ö	\0\ì;JPk›8¸·	YûII)\Æ\ë\Ø\Ï]9\ã\ã‡\î30\áş\İQvY\Û\ç\íHıEn[µ´°u_†W^•\èjİ³\"”qt×Š6~_‚\Íû¨¼2¼$lw<«¤\İ\Ø\ç6GÉ§,gK\Ù\ì\Ãh˜¶pc\ÉøI¬¸¿\åÛ®$•!c¹• +úW.ŞŠ¶}U‰¥òMıÙ7v6\Ë\Ç\Òxz¿<?\Õ÷FÁ­H\Ú\Ï\í\0 €\Æ\ïi›Pfª±\Æ\Z\î°\Î1qÉŒ{´ìˆ³w\İö~€“Æ‘Ü¢;*\Éx—Ô®>Áôı\ìr:f\Ìèª‚\æ½8\Z%\Æı`şü\ë{\İ\r®¡ªû¯thûÙ²ä±´\×g\ì\Ë\ä«GRf´½úƒj\â\'ô·ï\áI~œ3\Ö~œµ/bÇ‹X2\ä…/úpg\ìg¼(÷W\'Şœğ¸\éVk\Ã7Ÿ÷\Ì\ê{±†\'\Z9ø¡g\åÈ‰µ\å’OdvxÈ¼\á\ÖK[\ÚşÙµ8\ß\İBV­\Ö\ÚHüo·ö”Ö½Êœ•H<šõ>û„gNwO\Ğ÷ğ^ua,Qb&uş\r¾\â\Óa2\ã\Ét4BÀ\æ¤\ïÖ“×½uÍ›¼8\\f2œ\Ôd•\Óy\\\å;Gwñ8:\î0ƒ”^\\‰uVİª6\Â3\Ó9\æf·1ùo\î\Û-\ïÂ„\ÄI<\È\å°Û¶µ\éÛ˜|e%„Ã¾+\æ\ß+rFÉ»¾«\ÅW\\6\É.w\æ\Íc\ĞşnL\Î\r>\Ø\î\×w‹·[Fö™«Q\İKSIIBÔ¶¤n{Á­\İ\Éö€P\n@Eú’\É+F 2õ——¡Ÿo\â-’T71¦ \Òÿ\0MşSıª5(IE\ßFBqm[S	o\åa½\å\rp\î6Y«23ƒn¢• ı9\Zºj˜:\ê¤\âóıó*«Jº.œô’È³N\ê&lv\æe\Ü/¡‰N0‡Œ6c8·G\ßnI\Øş»\í]R–ôlµB5\\ò“WY<\Ó\ès\n›³´\åZT”sŠvy¬š\êU\Ü÷\Ï\ÙÙ¥{„›<m¶[S…\È\ÈYù\×?\ì^Ü†Ã©#}·<\Íh»Á·Ùœc”#¦z¾\ì\İö\Ã[\"\r\Í\ç9k\ÑvE\ãË¼Sÿ\09´‹#/®J\ÌÜ±dK·nwv\á$%H¤”l6ü\Éo\ëZú\è}\éZ\åºZŸ‡-\Ëtö–…4¢”•\'˜\ç\ÔA¨´I>hû0şr\å5–bFz[\ËX\r¶”¹\ì\ä:\ë)7da´®Í±Ğ†L\ßrk#c\Ã\Å-.=\Úı)WW\â¬l¨\èR–Ğ¡Ø®‚Ggİ•ƒ%Œ €P\n2}ªZjgF\Ô´y\åqO$>\Ì\È;~`8{\Â{\êÏ×§\à«\ä—g\ëù3¢^b}Ÿ8ğK‡¿Ãºy\î“Öƒôß˜\î\ç\ßU–C¸X-İ¤>\Ø<\Â3ûöP\î1\å\Ï)ó\ç\â›c‹n\"d5Zy8ÃŠR\ÊUÿ\0ªUów@\Ù›ø‰\ì[6\İ:\És–ç½–\å­\Ä!¹=kSkJ’{Jvß¬\îjY\ç©´:¼¢\Ò.Fä»Œ\Î\Â\ØQnlóE\Â\à û\É=\é\ä“õ\0\ZŸÅ’mûÔ‡Â‹—®L\ÕQh €P\nÁ\Çx*Á˜¸>\ïñD4ÊµŞ¢9Kd~\r¸‡rØƒ\Ø@©FN4FQ\âY7¨\Í?\ã-?\æ\\üŠ\á¬»ošCs¢“ò:ƒß·%\Å+3\rÖŒ\Ä%\Ågª8ksfq	z!Rúº?üT	–ÿ\0E\ZV\Äù§m˜\çkv²In\\¹+l¥/©\n\nK-\ï÷”¢\ç°n{«..96µ\"¥<“5ò°HP\n@(\0 €\â3[%ò\×;,#\æFvŒ\Ù+a\Ån‡\ã¬ş&\ÜN\ÊAıÇ·z”f\ãnD%+ó\"\\\ìü\Óv\rº&\ê\ŞŸuR\èf\å5N´“ş /\ßz”j8>(¤¿{‘•%5\Ã&\Úı\èX{]ª\Ùd€Í®\Ïo\nt„4\Äv\Ãm¡=Á#¨JNo9]–F*+(«U`È €\Ånš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TşÊ¯*¸ú\ê\ÓWª\0\åW•\\}u\0\é«\Õ?€r«Ê®>º€t\Õ\êŸÀ9U\åW]@:jõO\àªò«® 5z§ğUyU\Ç\×Pš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TşÊ¯*¸ú\ê\ÓWª\0\åW•\\}uÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\momoria64.jpg',0,1),(10,'Memoria ok','32Gb',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0%\0%\0\0ÿ\Û\0C\0	\n\n			\n\n		\r\r\nÿ\Û\0C	ÿÀ\0\0h\0`\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0<\0\0\0\0\0\0!1AQV•\Ô	\"a2BRq#3br’S‘¡²ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AQa\"q±Á2‘\Ñ\áğ¡Bÿ\Ú\0\0\0?\0Šz5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ğ\Ğ…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4¡STş>Ê¯5¸ú\ZĞ©ªeWš\Ü}\r\0\èT\Õ?²«\Ín>†€t*jŸ\Ç\ÙU\æ·C@:5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ğ\Ğ…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4\Ô\Ğ\n@(\0 €P\n@(\È/1mª\Ål$\Âf\Ú[i\×Š\Ù+B\Ò~‰$İ¸\ï <¼M›Xo[#\â<Uˆ¢Aµ=!\Û„­µ¸²BR\nºö<ú¹U´¨T¯\'\Zqm¥º\"ª\Õ\éPŠ•Y$›\Êı^ˆy·\ÚC\Í()I ò\"ª-?thÏ{eGb™˜\èw+ş\"€„™1a¥¶ B\ÜQ\Ø+b	\0·«£J9)T–]µ¿\ÙDªÏ‹†œsÿ\0Y1W´»:qcˆ‡–ø\Z\ÑcnS¥†~%\Õ/m\ÂAYJ8¾›T¸\è\Ç\å‹~o\Ù}\ÌpV—\Í$¼—»ûf†µU‹³F\í|\Êü\àŸÇ‹ ­ra­\Ö\Â\Üm<d¥ $}[\ìOuS9q¼ò\ËÈº\àYgŸ™qª$…\0 €µA\nÉ„-(\Íûƒ±‰mGÁ^[’ –\æBw\äSj\ï$ºùƒøj\Ê1œ¦¸5WòÈª´  øôvó+4{\ä¾\Ã\Ñğ®På¬©–\È|F+rŒ‚TU¸‰G\æ$öu×ª¤\á9ºµª9I\ë’÷yzZPœ)Æ•\Zj1Zfı–~§v×§±T‡Á\Ğ!Y˜Š!q¡A;\î\É\äO¼\İD]C´w\Õ.­%hC\ê\Ûû\"\åJ¬sŸ\Ñ%÷eÿ\0Ó–v\Ú3\ç,-\Ø\Î\ÛEÁ)®±Ry±) q\r¿*¾ò~‡\èk\ÎzL\ÇöŒe5\Û.5pÆ§\Ş=m\Å\ç\í6#ñ’\ëd÷¥CıTš“½\È\ÅebÁóÛÇ‘-\ây+Iù\ã>9\Ç}\'ü÷õŞ¢H\Û\ÅX‹b{\áQğ·‹,\Ğ\İ\å„7·º”—\åÂÀ\àWO\Ş\áû\Û\ï¹`ò»0\ìy­€l¸ÿ\0:\ï/po¹iÎ¥¶¯ªT?¥\ÕP\n@(\n‰\í:Áx\Ã\é\Û\âğ\Ù.\Û\ìw&\îˆ\è­q\ÂT\àÛ±\nPQ\Üû*\È?¢µeS^(\ÉèŒÃ—%¶¥\Û$™\äß¶«-&\Ü7ˆ¦a\ÄÁº|B]¹ÂŒC\ì•|t’P\ë\\C˜RAW_>[ur &½=\çZvÍ›mş<´¯/ñ\ÃL&[h üCd¾¶’\0eAÄºB?(X€\rsõ©’±3\ç!\ç¦\Ğ\Ër\îöf\â\Ğ\ã{(º7[i=¡m\ï·y¬«ØŒ­s¢-øn½muJJ›<$o·w\í¬;7³4C‰(H·B[\×+o\ÙòÜ–®0¥‚_Byl\à@ ¸\Ü\ï¶\àlºöc\êJŸ\Ê\É\İİµ\Û\ï‹÷ö¢§930m\ìzƒ‰\ì‘\ßM§”€P\n\å¹\Û`^m²­H­É‡5•ÇËƒt¸\Ú\ÒR¤‘\Ú$Q<h\ÃI¬™…Z»\È[–3šå†šm\ÕZœW\ÇY¤(Z\É\áö©tªw\í©M/™h\ÈÁÿ\0\Ë\Õ¾Å“\Øj\È/€¨O\Û#t¨€7\ëØ\ÌTI’ø\Ûµd½aı¦Ì¶\Üã‰°!´\â\ÚDŠ”7\ã\â$))«p\n‰;€¥P\Ï\ÙÛ©ğ¹ÉœY;Šõag\Ö\ãªù¤\Âmó\ëSüŸ\í )§´\"•’ù\İ.\ïg†Z°\â2«¤\ì„q«ù­ğY;Ê¤\Ö]\îEZÇ¥“w‚?… \â6­ñ\çNšß¼vK\ÉRU¿\Üı\Ğ:¶\Õ7gf\à–ˆ\ÅJRÕ¾O§ôrı\ä\Ú8\ß\æ\Ï)8\Åh—N§\ë7²õi·±pDTB\Äøq\ÔÏ„üdğ8\ç»<E½\Ç^\àrúVoÄ¥Âº´b•H\İeÏ±\r\Ş\ÛU0x•N´³„­~]\Í+Ò®|Zõ“V\\y\ä}¢nÌE©h‹—`W%\×n\Ê\ä\ÇU%ú@(Yõ\í§4g\ÎNH›d„\ÅXU.\\-œ)ù\ä7·ó£ıx’7ó%=õ8_\Âù•\Î\Ş5\Ë\ĞÅ«L¥\Ún\n„ğ)mgm•\ËcP\ÓR\Âw\ÊÌ¥gYÿ\0‰ñ©†\ë\Î5$up¥\n\á+q}|\È;%;r“Î·m\ßİšXú‰m§¢VÓ©¥\íıä«®ğ¸d³Z·ß¡\"Z°$¼¹¿\Ûñ\æVÉ“l\ÄG\Ó**W!n3 §­¥…’@P\İ;ƒ·>`Šú\ÛGtp\Õ)7„\\3Z]´û\\ù{;{1ª–-ñA\ëlš\ïb\à\çÅŸ\ëcI	\Ç8N Uö\Î\Ò\î\Å\Ûw£\Êi;J†¡\Ö	\0\ì;JPk›8¸·	YûII)\Æ\ë\Ø\Ï]9\ã\ã‡\î30\áş\İQvY\Û\ç\íHıEn[µ´°u_†W^•\èjİ³\"”qt×Š6~_‚\Íû¨¼2¼$lw<«¤\İ\Ø\ç6GÉ§,gK\Ù\ì\Ãh˜¶pc\ÉøI¬¸¿\åÛ®$•!c¹• +úW.ŞŠ¶}U‰¥òMıÙ7v6\Ë\Ç\Òxz¿<?\Õ÷FÁ­H\Ú\Ï\í\0 €\Æ\ïi›Pfª±\Æ\Z\î°\Î1qÉŒ{´ìˆ³w\İö~€“Æ‘Ü¢;*\Éx—Ô®>Áôı\ìr:f\Ìèª‚\æ½8\Z%\Æı`şü\ë{\İ\r®¡ªû¯thûÙ²ä±´\×g\ì\Ë\ä«GRf´½úƒj\â\'ô·ï\áI~œ3\Ö~œµ/bÇ‹X2\ä…/úpg\ìg¼(÷W\'Şœğ¸\éVk\Ã7Ÿ÷\Ì\ê{±†\'\Z9ø¡g\åÈ‰µ\å’OdvxÈ¼\á\ÖK[\ÚşÙµ8\ß\İBV­\Ö\ÚHüo·ö”Ö½Êœ•H<šõ>û„gNwO\Ğ÷ğ^ua,Qb&uş\r¾\â\Óa2\ã\Ét4BÀ\æ¤\ïÖ“×½uÍ›¼8\\f2œ\Ôd•\Óy\\\å;Gwñ8:\î0ƒ”^\\‰uVİª6\Â3\Ó9\æf·1ùo\î\Û-\ïÂ„\ÄI<\È\å°Û¶µ\éÛ˜|e%„Ã¾+\æ\ß+rFÉ»¾«\ÅW\\6\É.w\æ\Íc\ĞşnL\Î\r>\Ø\î\×w‹·[Fö™«Q\İKSIIBÔ¶¤n{Á­\İ\Éö€P\n@Eú’\É+F 2õ——¡Ÿo\â-’T71¦ \Òÿ\0MşSıª5(IE\ßFBqm[S	o\åa½\å\rp\î6Y«23ƒn¢• ı9\Zºj˜:\ê¤\âóıó*«Jº.œô’È³N\ê&lv\æe\Ü/¡‰N0‡Œ6c8·G\ßnI\Øş»\í]R–ôlµB5\\ò“WY<\Ó\ès\n›³´\åZT”sŠvy¬š\êU\Ü÷\Ï\ÙÙ¥{„›<m¶[S…\È\ÈYù\×?\ì^Ü†Ã©#}·<\Íh»Á·Ùœc”#¦z¾\ì\İö\Ã[\"\r\Í\ç9k\ÑvE\ãË¼Sÿ\09´‹#/®J\ÌÜ±dK·nwv\á$%H¤”l6ü\Éo\ëZú\è}\éZ\åºZŸ‡-\Ëtö–…4¢”•\'˜\ç\ÔA¨´I>hû0şr\å5–bFz[\ËX\r¶”¹\ì\ä:\ë)7da´®Í±Ğ†L\ßrk#c\Ã\Å-.=\Úı)WW\â¬l¨\èR–Ğ¡Ø®‚Ggİ•ƒ%Œ €P\n2}ªZjgF\Ô´y\åqO$>\Ì\È;~`8{\Â{\êÏ×§\à«\ä—g\ëù3¢^b}Ÿ8ğK‡¿Ãºy\î“Öƒôß˜\î\ç\ßU–C¸X-İ¤>\Ø<\Â3ûöP\î1\å\Ï)ó\ç\â›c‹n\"d5Zy8ÃŠR\ÊUÿ\0ªUów@\Ù›ø‰\ì[6\İ:\És–ç½–\å­\Ä!¹=kSkJ’{Jvß¬\îjY\ç©´:¼¢\Ò.Fä»Œ\Î\Â\ØQnlóE\Â\à û\É=\é\ä“õ\0\ZŸÅ’mûÔ‡Â‹—®L\ÕQh €P\nÁ\Çx*Á˜¸>\ïñD4ÊµŞ¢9Kd~\r¸‡rØƒ\Ø@©FN4FQ\âY7¨\Í?\ã-?\æ\\üŠ\á¬»ošCs¢“ò:ƒß·%\Å+3\rÖŒ\Ä%\Ågª8ksfq	z!Rúº?üT	–ÿ\0E\ZV\Äù§m˜\çkv²In\\¹+l¥/©\n\nK-\ï÷”¢\ç°n{«..96µ\"¥<“5ò°HP\n@(\0 €\â3[%ò\×;,#\æFvŒ\Ù+a\Ån‡\ã¬ş&\ÜN\ÊAıÇ·z”f\ãnD%+ó\"\\\ìü\Óv\rº&\ê\ŞŸuR\èf\å5N´“ş /\ßz”j8>(¤¿{‘•%5\Ã&\Úı\èX{]ª\Ùd€Í®\Ïo\nt„4\Äv\Ãm¡=Á#¨JNo9]–F*+(«U`È €\Ånš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TşÊ¯*¸ú\ê\ÓWª\0\åW•\\}u\0\é«\Õ?€r«Ê®>º€t\Õ\êŸÀ9U\åW]@:jõO\àªò«® 5z§ğUyU\Ç\×Pš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TşÊ¯*¸ú\ê\ÓWª\0\åW•\\}uÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\momoria64.jpg',0,1),(11,'prueba','hola',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0A\0\r\0\0\0\0\0!\"1AQ	a2Bqbr‘$‚ğ%3CRcsƒ’“¡±Á\Ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\00\0\0\0\0\0\0\0!1AQ\"aq‘¡ğ#2R\áB±Áÿ\Ú\0\0\0?\0\ê\0P\0PJ\0 +@@@@@@A¯‹~÷^6›b4ô\r9w›e½\ß/m„É%l:a\nq\Ì)+‹ \àú\ĞgN\Òİ§\Z\ÒQn)\Õv½T„¡.V­ˆ¥-iRB’)¼/%$k@\Ô=ee¦\İ{¢\Ü\Éağğò¶\îzÔ´Úµ©õ\Å\ï\àö‰:ô\Ì&\İm¬¿\é8§	U\îÊ´\Ü\íù\Î2H\â´¡\ÖÁa¯éš”½»Zñrÿ\0%ø{ş2bU´¯EuN/{¾\ÙöÁÙ½\ÜZ\Ó;ƒf•1x	ƒ)ï”’O°i\î*?`k\ß1ˆ(#@V€(€(€(€(4|i7ööûi= Ë¥l\Ø,\ß0\â3\Ñ/\Ép“‘ş\í¦Ş€RöX\Ü\ë%\ÃI[m\Èi33jq\ÒrI=\0Ç¹ÀOZùƒ\Ö:=\Í;©\×\Ï\Ã&ğ\ßO¯MGº/v±¼]cih\êb2’\İÁ+h)i\æ\ÓO©S\ë\Ëğ{g­Yô]\Z¹’r\Ş~|ü¹+¿sŒ6\ïÿ\0d&\Ü\Ô\ÚM\rI6sRĞ·°úJzŸ§CôŞ´\ßPZ\ß\\~’’i¥¶{£T­k:P\ël\Ù\ím-\ß\ÙB†ôÆµ¹Å„’?\Éòù¨§şÜ’Ÿ\îñ­³2¶«\ãS~†¯´L\Â\0	T\Û#\ê†÷\êZp­şŠM@&\×üK¶rƒ-/U«JNp„ˆº‘ƒdÿ\0¶Mù\è	/e¿[u\çZnnpœD˜o¥\æ\×ú)$ƒü\èú\0 \n\0 (|\ç;¶\î\âYİª·3P!\Òücxveúc\á„ô!¬ı\èN6È£\ìÍ®¥i‹`‡û/½D™¨‰Àñ!)\n\nH\'\ËyıEs¯S\éĞ¼—¸\êc¦-tıZÁ¼\èzF£uEU£E\Ê2{?8\Ù\ã\èK=U®\ç\Ç\Ğ.Ê¸°©””J†’\n€¡$ô\È¸Í™JWı%†²Ÿƒj\Õôk­6\ÒUk4ñ\Ê[\à‹¹¹\Òun“¦ˆ\ìE\Ìp-.\àğQ\Îq¤\ç¡ô5\Út?NÔµ¯Ø¬¬mşK©\\T·—·SºOœ>Ş«R\â¾\ër2…6\çvBzø\ë]\'K[Òz^öv|;R	ö¬ú´¤\×R\à\ÆœYH®­â²\á>ufŒc/\îD>›|¶ö}\ËVk}ló\Ò\Z¶[¢·la„8¤2\ë\îkQ@<TR„\'©;\ÊÅ­Ò§ˆ,¾gXj\È\n\0 \n½\Zñ­°\ÚMe«XBl¶‰S\ÒU\ê¶\ÚR>\ê	z\Ì\ê\å=)\ç^|©\Ç\İY[‹Rº©D\ä“÷&©Ø¿\r¶%Ü¢Ø¹¶°W\ÆC‘ÀPo\Ó \ã\Ó\Ôı\ë—j.jö¤\ßf}\×\èúªzvÒ”q‡Mq\Î^s÷{\å›QªF’¸0›Še\ÂTF¢>|E%=xÿ\0,`ı+X·\Òk_j4\é[\ÒøÜº²¶_s[õ}œ§c(\Û\Ç~~¸\Z+¾™\äÆ¹ñ9”!†`8!\0d|g©ÿ\0\Å}¥\é\Í&\Ş\Ê0•Y/rx\Ê\å/¡ñ½Bµ=F£¥ıH¬.9X\å.W\ĞjwNÁ\Ón$ÁZK‰/ŠÂ¸(\ç¡ö>¸ú\Ö/ª´»[J®­Ÿ\İüŸş&uÒ¨¸µÓ¶\ëŒò»dmÜ˜§\İQV=°¢Q¸øzY\ç×›«Q\ÌøN\çpz“\íT7\Ñ.˜\ì‹q\Ç,\ï\çÃ“iª~\Ê:E™.w\Ä*ù0)8W\'ğ[ôh6?`6\Ûm\Ş^I5P@PB@M\n¾\'›·o=—µ^—°Ü›u¸¿,¦\âe\Â\Ì~ı+t•Ÿ$Œ\ç\Äh=o~3JË­ƒœ¤\ê£q{\î/6ÿ\0V\Êe\æ\á®km\ÇI\0w\Ùğ§=@úõ¯şÎH¹ôå—\Ñ~¥»·«9\×Q¦±ıİ–wK\ç¿q\à¶>\ëI~+\å°\Ò0• ‚‘\ëö¬¯GÓ„/s]r±¿œ\ì\Ù\êRòÖ¬­%…\Zî±–ş\ëeù4÷×™=†Z\ê¯\n	_‡\Èÿ\0Îµ\Ú\èW•\n\î¤\ÒP‹Ï\×c\ä9UJ\åÖ­.©Ic\Òòûp4úŸQ·9R\à§@ZòF˜ò­sW\Ö:\êÿ\0MbO—Ø·8Â¤*(=¹BY˜\åÕ¶œŒ(\äŸjÕ”±³\îbÂ‹œ’O‘\Ç\Øm¤‘»\ÛÍ£4{yWí‹«1\â3Á\\WÙ´¬\Ö5IõÍ£\"µ›¡KÜ›\å\á‘mğ˜¶\Âb$V’\ÄfKM6€„$a }\0¨<\Ó\"€³.dxœ‘%ö\ã\Çhr[®¬%	ä‚€a·#¶N\Ò\"Tk\"\\\Ôó\ØH.*1\áIKpş_\áÖ˜\È\"\Ş\èö’Öºõ+2ğ-ñJ”‹}­]\Ô~]\\\Î_I8\å*\' Z’23z\nºYf\Û\Ş}\Ã\Ì4\ë.„¨øR•øV\n¸(\'\0K5=(’*k=½—h}ÀXù¸\É¥\Æÿ\0\Z0	ú¤!”“\äjŒ07r¬¥S‘\ÔIóğôPûz\Õ-&\\…ISy‹–\rz\"\Ìa2ò\èK\\^}@óÿ\0µ]·«ú;yBœs,¶¾\ç\\\Òı]Nµ\İ%tı¸(ô\É\ç\Â\íõ\ç¡‹®#³JùE(	\0º…ƒ\ç\åšõ´½N­\İJ¬°óŒ?s\Íõ–—kg_İ´Y\ë]I\ç·|vùı\Ä®\0(c¦=\ê\åZ\ßD—¹\Ì\é\ìú™\Ê\ÒT\Û}\Ş2 œ¤û×›)¬\ã¤ö(¤Ú†;¥ù:)ğ†\ÚA}\Ş\ÍI­Ÿkœ--mâ¹‚T¯<}R\Òÿ\0R°\"–\ì\É\×\Z…x\ÛÇˆ/\İÿ\0¬uª\ÍphûB\îŞ£Ú‹S¬ºoöœw\\\Ş^X†s\Í	ñú„ú@B=gºú›p\ä—u\áù\È(7ü-ızŸ­\0ºrkJ$6y2\ë]A÷Iÿ\0œC\Ş\İ\â\âÛŒƒ‚©(c’VR<\Îpµd’\\$\àã ªÔ¼”–\æ4¸iiD¨6Q\Æ^\Ï$œ¯\ÂO.i\Æ:UvZ’\n“!A¶Ò·\ÙQ\Âo€08g)m\ÉX8$yP\Òı¥!\\P_	-­AjD”¨°œ‰è“•?\ÅP\Ò%;î•-nµóQÀ*²RSœ)\'ªAúŸz£\r&Ş‹!ği\âó)\êNxı@ôûTC\àŸZ\äÌ\İx\Óö\\›‡º_OcV\ÌT.B\é\àd’}+×¶©JµT®~Å¥„£\äPD±µ\Ş2ù\Ú¬øˆ<°U^§m\ZT•ZK	~ş´\èöĞ«V3¨öO?…—ø;oğ\Æ\ÚÃ·]–,—,÷WMVû—\é“…9„°“ô\r!ûÆµd°°kW5\İ\ÍiÖ—ü›d±©1‹o°Ü–\\i\Ö\Ò\ëN$¡hX\ÊTB>`ûPS};\Z·pnU\çoøÂ”|nYJ‚[Yõ,(ôAı\Ã\áö) !m\Ş\ß6Áq“\ã\èSXYm\æ$ ¡\Ä(z( ş´¹r~´	&\ŞT5£‚ó\Ş0\êy2\ç¿$ûıF¾jSÁ4N¼\Å\é-ÀBV$€–‘Ã’¬’¥\ê\ÑïœŸ­iä§7pµ©\Ç\ß!µ¼µ©	m=Nx¡]BT|\Ê}GŞªpk\Ñm\\4³1ô%\è\İ\éR’‡:>\àÇ…$G„d}\Í@M‰E¡bJ ¥¤­M¨§%`…®~E«\n\Æ\Z\ëÓ¨OIR~Fúû¤¦ÁJŒ˜ı\ãx\Úü¹\'ÿ\0\Õ=E`\Õ$¿µ;gy\Ü\ÍÁÓºJ\Öt^n1\í\ËZHi.¸¥@yı*\ç¹>Œ\í\à¿N½JI¨KM~y=!\Øl±4\å’\ßi€\Ğb\íÅ\ĞòChHJG\ØV\Ë}\0P\0\Ù\ï\'gı/¼\Öâ››\'vmcİ£$›óÀW¢ÑŸÊ¯±­\ÏM\á\Ø}M²\×^\ê÷¿muX‹tŒ	÷|Ğ¯\ÜW_l´Uq“\à y\nz\â\éZT’}\rWHa´Çœ“=„$!•©D.0ò*HIGızµR~H6òW\Z\ä$Í‰!sĞ¦\Õ\ßLJ¸¼”œ$	\à\0ü)\0¾~u_$#S~}>—\á\Ü\Ç!ax¤Aa£Õœ\àuõ§€şF\çd;3\î7j;\Ò#iû{–&‡Bf]¥«ƒhGº•Œº¯d«¯ \ëV›\É+c­½›;+\è\Î\Í\Z`[ôüa*\ìóiL\ë\Ë\í€ü•aù’|#\îTz\Ô<”@@\î\ÅnÔ–©6Ë¬&.ù(\îŞ%°´->\Ä\Zv\ì)r°¢]ÿ\0nPõ\Ö\Ú2·lJ%rX½\É?\çSû§\Ä=9PVğÓ®¶\êÛˆQBĞ´¤pAÈƒ\èhÌ¥\àš\é6\ëÕºE¹Ö \Îa\é¼Wüºÿ\0´‚p\0Œ9“\åŒÔ­8û4ü8.š\Æ\\]_¼k~4c‡Ó¥dHp£¿?\è“ûƒ\Å\ïÆ™ÁÑ=§mšR\Ï\Õg\ÙnŠ€\Û1b¶m\0{ş\r@64@@@@GnÒ½‹ô¦üG‘t‡\ÃM\ë$¦\è\ÃynIIøÇ§1\â\äPIö0\İHÛ¼t¼ı\ä•29‹«\ËÅ­	Ï…\îø¤¥c÷0WŸÉ‘@t{g;5Y¶\áqn÷y\Ò]T\ÒDù\Ã0¹c’b´I\îò\0d—U`€O*\0 \n\0 \n\0 \n\0 \n\0 \n˜ +@@@ÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\portatillnovo.jpg',0,1),(12,'prueba222','dfkshjdfdfksdfd',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\Z \"\"\Zÿ\Û\0C\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0A\0\0\0\0\0\0!1Q\"Aaq2‘¡	$B’#3±²\Â%RSTdr¢³Á\áñÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\0\0!1AQaq‘\"2¡±ğ#\Ñ3BS\áÁÿ\Ú\0\0\0?\0\ß\ê\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 +Ş®õ‚\Í\Ñ\ËK¥\æ,¹)˜ùŒ\Ãq”\ÒJœ\ØW‚§V„~9\ãµ	Q´\ßqDZÿ\0hL\æa2¬ºª\"ı}•—Sù¥\Üş” p·x\İ\èô\à’õ\ê\å?\ï6™Š¡@4[üUôr\äp\ÏP,\è?ñ*[÷š¶\Û\ÖŸ]\ÂL\rq¦¥v\r]XQü·\æ€i‡s…qN\è’\ã\ÈO«.¥cô4V~¿•û@@@©ş\Ğ{`\Ğf¤mÉyŠñ>Iq¿óŠG¡Û¬’­ö÷QlŠ\Ú\ĞÀJÔ¦AóÏ¼HP=ˆl\Õ\'“•\ÒFñ\á/i\Ìõ$½Š\Ş¶<x,\Ç+\'rüÄ«¼1úüjeuGŸ9N\n\Ù\âÍ\Ùi\Ø\ÊB¶ùÈ%\ã´‘´¥_\Ô\İ$\Îú¬#ó\'\êŸğG#¡\Ó\ï\åõY\\mjg\Æ\å4YRrx<÷\ì/tO±¥Í¥Xø\ìsV¶µ7Ku^…Ë—A‡\r‰\ÖT”¨#\Ï\Ã=\ë\'ˆfŒôE½\á\Ò\é~‘\×=k{»¦*\î¹z\Zg\É	-6×˜w!\\ñ\ÎI\ïƒ\ÇzÅ¥v¬\ê\à\ì*JŸ´@@\ã\È/\ŞµŒ}\éB\ÚDy	R»‰\rŸ\î\ÍCt¬´ \ç%»9¯k¹\"$£yñ’„\íRRš\É\nÁ·Ê¡\ãS\Ö\Í,Qx¥\r‰6$¸³—m²™\ãûV€uÌŒŸÒ³–	­µ83O™:3\íÄ¸\İ\Ğ\Ê\ä¡\n[#zÀÜS“Âx\È\ãæ§‡K]É¦O…s\'õ\Ó\Ã_;Ğ™v›dw\"\\\ßS\Ê(,—RBAU\ê~\áÚ¾“†”rE\ãœ6=>\nR]\Ä?QõE\Í}<¿B™.K\È}\èm\'\Ï@9kZ°­ ÿ\0>•\çñ±ŒeQTzù±B#\É\Z\Ò\ÉOvß´:ÿ\0\nBƒ‹û>—Ç¢r™?\Ìÿ\0+Ï½JI¾h£ª\Õ&@@@xL…\áØ²\ØjDg’P\ãO -I\î\nO}h\nOYøA\é6³.¸­6›D·L‹3†)şA–\Ï\âšŠ\Ô^\ï6…-ı­P\êFJc]Y-+\éæ·\n›\"ŠcXt‹¬\Z·x\Ñò\î\Û2a¶&µ·Ô–ò >©*Tg,0–\èB¶j9‹„ó\É\Ó\×;\Øyp‰>ZÀ\nA\ä`\Ücš\è‡’\n“1\\3Œ¹ õ0µ··]lò-M6\ãÈ–\ãO<©b›-‚@¹\É?*\Ï6g‘\Û7Jr—>MêŠıöhÃ¨š¢\á¢–Úµ†ŠŠ‰÷”\êp~I5ˆz\Ï\Ğ\è}\r€(€(€(€(•©(B–¢”Œ’N0>´\ZwMõN\È.w­/\Èó·*:\ß@/;ğ…©@\'zp­¹8gœ€©u·‚}©\\¹I¶\Ü\'Û¥\Ü§]ó\Âf6V¡‚¡¼oJ¸\î@JødğÖ¾‚JüËº.“.®4\Û+m*J[a°H\â*R‰\ïÀO=\è\rƒ \n\0 \n\0 \n\"\ïª\ì6\0M\Úõm·\ÜË”\Û_\â\"€[·u§@]\î\ÍZ j\Ë\\©\Ï­¡‡·…@¡\îş´2\\uUÎ¥¦}\âU£º^„¨~æ€¯µ÷Vt“ú?PB‰|isdÀ\Ë\nm—J	\Âvƒ\Ü\ĞNuG\é\Ëdˆ¨}\×´!¶—\r¶\Â\\Û€@YHX}\Ò*bLÿ\0ñT-\ÚV\á#\ÑO¼–\Ç\èAc.ñ`\Ô\ËbõL\Ø/2-Ç)ñ\å\Éù6³{6œF3Ae¿BB€À»\ß-š~¶]®1-ñ7y\Ò\ŞKH\Ü{\r\Ê gŠ¥¼ø¨\éÅ•\Ù,¹r’ó‘Ò¢ \Ôec)I^2q\İ Ÿ¥´W÷\ïzn3²Zµ\ÅCŠfJ#m’¥!y_\ÜR†@?ó1\È\ng_ø¬WQWjS¶™rlğ™ö·\íf8\Ç\ÚÜ¦ö)M’ Â±“€9ÁW–lqù¤½Î¼<Ÿ\\X¥.º\'·y“q\êö\Ã2\åLôSNGŸ\r”\ëvu\ÌX|+At\ã;~\'¹=ªqdf\ãmrı„yå“\\É¶•®õ¯\ÓqX\ê^¬k\ë¬_´­Ñ­\é%-Á}\æ£\Åj<w6”´•e_w±\ìšô#ÁI\Ûr7ö<Ü˜eÓ¯ME‹ü_~¹^nª\Ô\Ö\Ö#IdG&m\Ü!\ä8	J\\)O¾R€®\Üw­WŠ\é\åZ«TŸ\ç©Í’n+>­M¨Ü—r\ÔP.·qÛŠ\ä8fCÄ¸\â’Tó¥i	\'b\\\ÆNw(qŞ°Ë‹`¥Šm¾ºW±”rds\å”iyŒõK5\n<¶—%q\Şw\ÉB‘	ó9\Ây \ç ƒ\Æ>µ\Èjœ¹š­\Çz±wmDI\Û)u\â\â‚Q·i=\Æ~<c=‘Ú™ú\îÿ\0¥-VH\åWk‚¿¨`¬p\â”I=€\n³\è3F¨¬d¤\Ú]¤\ÄKÉŠÈ¤©ğ„‡\ÅXä–sPj{P\Ze\ã›]\ÆlXôsö_´\ã)&\è\ê\Ğû‰(R7aµ„({ªHQ9\Çj\Å\'ª£Rf^\Ñ2\í2l\İ,\Ü\É%)\×W)8/\ì).„uIH\îH\ìš\Å\áO«÷9ğ`X´Ro\ÌùcZ]\ã1Z-q£°\ãoùQØŒ\ÚJü\Â\Ò\È’¬%	\'8	$w\ÍWúLOu~¬\ï†y\Ã\åtuY{B#~\ìúJÙš[Âšw*XJNB>¦¯tQFË\Ïş\Çùù\êCN\Õ•*Bİ¾G\ÜÜ¦¤ù>Ğµ‚·F<¾W‚”ı\åS\Ík[\Ë,\åóI¾ƒVŒÄ«õ\Å\é·XsaÀ¶\Èp{3 ¼¬6\Ñ\'q\ä)A\\ú|\ë\Õ\à#>\Ë+‚»¥]]³\ÚN„”\Ây\æ\Ú.wr©)CiB§\0}Ï¥`¸<\ê¯\îõ2”\ÔV¬mtÄ´h9\ÒfÍº¡\Ë\Í\Õ\ç[|\îº˜\í£%)O+\'·Ò¶\â1¼<4 ÷vß†¿ğ\ä\Ç5“ˆml—\ç\ÜEŒÅµ\r\Ør\r\Å\Å3—n\r3jG9(·{\Éõ\ä\×*Œ”ŸÃ²ö\Ó3IN.\ãù:\íù\æJX\íV»„‹©U¯÷ \îXö”¨9À	\ç$ù\ã\çTzbJ·e\ã®f\ïd—»³b<:Z“\â#K°\Û[cÚ¢(€\Â|¸¤}r¡Q—t¼NU\'\âÎdv.8–›[‹PJ	$ü\0 9G\×\Íd\ÏQºy¾7\ìo\ÂyE˜‹T\Ùq„©-¶JDsÜœPÌ¦\ÊÑ¶c.K_\ÔZW¹\Äp©«Ú¬¾¿‰\ì;ü’{ªªLQ\ÓQ\ÃM(G³9„0¬y‡.e\åcÿ\0Òó§¡¬|\ë\Ğú\r£b“ho-\ÊGš”ñÂ²§1\è>\êG\ãQO¸\Ş2ŠZ\Íû\ÒjÑ»+”WjlICE-¸?²	Oùœ\äš\×-ôò\"sNş6ÿ\0<\ËS§ñn\Ì\ë\î*M\ÆkL©,3´:\Û@½¸+\Ğ+\Ê\ã\çšôó®Ï…\Ç\ï+•õ\îF3U\â0Z/±o—		&Z#\Â@Rœöµœ¬$\'¾A%i\ã\ë\\ñ\áòK\â/D\ë\ég,²EMc{Õ•·\\f*(TxòR\Û%”3+~]u[Õ”„e^™\'\á\Ís¦›JLºM_*\ÔFm»‡ôºF2\íğˆ €[Kg\İ ’®U·?ñÍ®\'¯‡¿Rµ;†Šºût=ôÍ¦t›{S\áOÚ‰¯n§bd-e\Â=Ó»Œ\ê¦j)E.\í}YHJw‘´´zz.¦\Ùøg»G·u‡½\Él\Ü/3\àYRIŠ\áa¢ÊœNr¤2ø¶Aô5\\\Ë\ãcƒ³\ŞoOz\È\ë µ­šF¢\Ò7»TI\ÏÀ“6#Œ·)„\î[JRH3ô\Èúô-n2œYq¶¦\Â[ª!E\È\ŞYË‹Ü²qx\Ú=V¼X©¹üQU\ßzı¿ôøwD\Ü\ÆO‘l#\ç\Ç÷¢¢¼\râ¨¸\è{³\Ñ\Ëh‰lJFHq)÷B#;~ \Zšğ4‹kiN\èK¼–§8Z´0©RZ@Q*m´„ç”¤„ƒ\È\ïüqU¤ÿ\0\Ä\éÇ“\"Iöµ^,ô:6\à\İ\Îl¥Á³8\Ë\ÈJgwº€3\éù\ÈVÑ´©:3\È\æ\Õ9§\êN\ÜM\î˜\Óv«\"cÇ•\rl©1K>[®=—’pv6\ß8 gó]œfeši\ÃD’_\Ï\Ô\ÆnØº\Ì]A\Ûóm\í\ÃU\Å\æ‹F3\í$7´\çy\\œ’y\Èô¨Å’R”c•ü7®ßŒ\ç$\ÚÜ›\×\â\İõ™_a½11\×\äGšR•‡›o	\nNH8*\nVqüU”\åû\ã\Ñ^cı´²oZˆ­\é\Ç\Ğ\Õ\ã~šw\Ø\Ü)1ˆÀ’´ ı\â@\ç\éDòv|µ§‘Fñv¼\îZ¥\Ş\ë¸Ã¥\"Ì·›L9¶\ÙQŸmhq\ï\İT†\Ğ³08\Íe,Š\×qN\ÓpË–W¿]z›\áI\Ş\ïú¦Ï¨]\Ó\Í\"\ËhzSé½¨\ÖòiHòû`­Á_Á\ïûØ¬¤\í¶u\â,WC}*†¡@)\\:]£n¸\ì­3k[®(©kÒ•(“’Iæ€•\Ğ\Êı\0–«2G÷*–E:¢\ZN¦RZ²1/\ÚÉŸûÁH\ï\Î\Ñô©±H÷•\Ñ}3>n”µóş£[?ÃŠ‹ˆi¾ºs-µ¥6J±)Ô”üÇ¼G\éSb‘F\Üü\êt¼÷\Ù÷ûK\ì/\Ú\ãk)\Ï\ÂT3Š›#”VŸ\áO¨\Ì\å1i”o*n3ü\Ér±n\á\áÏ©ğòU¥x‹Ysüõ:\nb´\îkø!E\í}\0wR!)cóH4\ĞQ!Ó‡j®¡j†­[\'Z ·…Ì™6*\ÛK\r\ç\à\åÁ#\ã\ÉÀ¦\èD÷GH\à\Âb\İˆ‘šCQ\ØB[m´$%)H\0Àü*¥‘“PX(€(€(€(€0( P\0Pÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\teclado-gamer-esca-gxt-853.jpg',0,1),(13,'producto333','kshdjsgfjfsf',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿş\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0=\0\0\0\0\0\0\0!1	Q\n\"Aaq‘2¡±Á\Ñğ\á#RrB’¢£ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0\01Q‘!qÁğñÿ\Ú\0\0\0?\0‘‘)Œ&Èˆrúü¿MK\ê\åø}ö×£ùüú\êQ\ä>\ì.\ïøü9\ê\í\îú™:(w(d@Ÿ†m@SH\éÿ\0\Ä?}U0\ä:\ä3òü:ò\åÏ—Ÿ]I¦\Ş\ï\ïòx¹:I\İ#ş\Ğÿ\0´?}C¹K?p¸ÿ\0ˆgóı\ÅMU)J \Ä\Çó\ë¦\Ş\ïµ2u<7r—¸…÷õ(y{ÿ\0Ÿº°ª\Úö\×\ÑØ´®kš{,“…\ãZ\Õu<<\âIª$“•¥.ı‘¦\İU‘Mc\"\ngT…6ÁœŠp)Ja\à>ğô/‰‡\"\ÂPö‘\0\0z\æÃ¿\Íÿ\0^½\Ä\ïfûW–\Æ÷ÜºB®\ä({`Ú•®jhH&6\îŞ¨zF˜•k\á\äbfªŸ´=Fõt\â$ºsX\â\ŞAB·@\Ëm\æ\Ûõ2N$ŸgFZª\İÔ€Q§ªº>w#P\ÂJ³Œpúƒ÷Y\Èp\ã\åÏ\ê\è<S€”[s\×	\çŒc¦0=@|C\\À£«\ÎÕ˜7	#º½¬\\W\á‹\ÅG\Æ*\éu\ÈR%¸7K<1–9€„õ—§P«’\Ôö¥\ï.¯Û•5\Z\Ö}yG1D«D\Â3E²ì¦–‡Uõz!W*£EªtLg \åQŠ\éš4¬\"‡ƒq0ˆ¦\0ox‡Pñ\êÆ­¤­-\nŠÊ®”y¯\nñŸŒÀ\Ï s\ÇNœ´\Ş\ïF»p{¨\Üu İ•c~.Mot-´EúŒ§l¤\Íw(¼\ìŒB\ãM8¨n1,ôªH+œõHx•Ş¼mº¯˜³P…* .\\Õ¿¹-¶N6Û›\Î|\î~RI7$–óm¼¶Ê-º©„!Y‚9S\0‚$\êQ)\ËÔ¾\ã”3\Ğyû´k ^@Í¼©ƒ\Æ1À¦>ŸL\è\ÔVQ\0©‰Š#\Ó\Ï\è=1sş51ú\ÏôR\ĞM!\0\0õø\0túø\ê<\â\í G\åú†ª\è)pˆ~?¶ª\0`\0İ¨\è\Ğ&wk\Ş\ç\ÇiİŸ÷ö\âE\È>·©i¿\í%³?x¢n¯n˜©JF¾bdÄ¦T\ÜK¹\Ê\Ã >\Â4\êªp”u\Ë\ê\áT\nÒ”\í8\í€Uyq¨8¶¨€\åCÁR3QU=C‘\Ï¦«¤é†‹¡‹Ò˜pC\é\Ú”v\é	P]»´\Ø9ú*\ÖS\ïu\Äh\ÑuM\Ş\Ö5\Êo)\Ê1\ã|÷bö‹Œ©¥L\n\'\ëVJ\äEBa6_·†÷\æO~—.u\ä(Mv}\î:ºp¨\"Ç¯~*›iYS´\Ù ‘õ˜©Ù«<Û‹)\èÓ”»H@-\×U\ë\æ4Ñ¤£Ÿ®Øˆ6ZE‹¦\\ \íg/K\ÔeJ\àJb¢\à\ÍÁº@B•3ûF\âó\×	O± §¦*ªæ‡†X¥T\Æ:\\\Ì\Î\ÌzK”\Ü\ÔY\á˜¤’Èˆªw$IA\âPùZ«\Ï9DAD•Nğ\ZªE?ŒİšEû8ƒş\à:\Ë&¡@Dy5\ÈôÎ”³“m¡»}òmo\ï}¡J\Ô·¶\ë pWş\ÕZÀş¦t\É\ê‚S6óñô\Ë84B‰TZ\à\"@\ÊSü»!¶¶;=\ìò\ÛU¢“Ml\æ†B\ä\Ü\à*\'EÉ®M\Ö\\õ\åV\Õğ(¸€^iµ*™°\0V\r’¦¥*\ãü?}S\ÆzˆqdGa\ÈóÀgğ\0\0\0Z†ƒ]\á[ú”<c‡ş³||>½:h\Õ+¼`-¿¨ó\ïq\Ï\Ü\é›9@ñZ4Dı\çú©j©úyşƒ¨ !\Ì?\çü\éå >ğü‡ó\rU\Ô\0 À?\Ôt¼2rbcŸJI»A„tsG/¤9T¨7dÅš*9x\íu D‘j\Ù%WUC‰¦c\à^\í#ov\ì[\í7³^ö\Ë6˜j®ò$\ÆÀ\ÒOP\ná‘®Q\\³¬¦ŠY4\à­\ËJµ\ï®\nV¯E†T*‹\"Cƒ÷›¹•÷9»=\Æ\îª`\ë=…¨«z\Î\äÂ´v Ÿº·t\ZhDZšt\Â~@›¨xŠÈ@¬«‘\åCœ9\Ù]µG¶oÑ¤\ß\İñ«\Zn.ôö\å»+\Õ*ıÁT+õ\è8«WZ\Òv\Í5À\å\nm£\ê:\í¡² t«T¼”3T-Í¼{¹Ñ·ö\ÓH3“«wAy\íõˆ¦T]%\Æ&%\Ô\ìJR²\ÎH™…Vl>™m4ªH‰B»\\2\İ1>ºjïª—µ{p\ì•\ÜÕ²l\ÓVª\Ûì–»³t»P*g*\ÈZµ­}‘H	‘GRoBÅ Y\ë\àÉŒ9Z¶>Ej*‹0ŠRõ9c\"†\ËP–9jªœ€@Œ«\ë\ËôlpQ\è³Z\nf¬¹û\Ï\İ9…%ŸR\é\Ğ[t·\Í\"œğô\Ã\æI\×5²œ\åDò‘ğ¶ú0‚»\Ñ,D€*$#€´šä§¡j)\ã-/M„Dp\nROU(8g\Ü\0\0d\ì`\Õ/\Ò\0\0™§—/(ôIQU½ƒ\ŞJk\å\\/\íu\È`Áˆº¶–=US\nf8@q\Â%\å¹\Ô>_¨\êMLn¾_O~:ó K ±®!Hje\éT)NC\0\ÈrˆrRœ¦)Š!\È@À !\È@CF©\\µŠŞ’’\\\â D’1\Ì \"\0ò\0\0ü´h2úyşƒ <şŸÎ¾z\Ó\Ï\ë\Èu}\ß?®‚m\Z4h5ût[™µ›A²5ş¼²R1\ÔœAd	ö\ÍC)#PNGSP”ô)\\6R^fZbQ£V¬\ÓY \n\î\Ü,ƒF®M…ş‘/iM’\í	—°VŠ\Å\ÎNT–êˆ„Ÿ¬ª9\Èiº*jJ½—~\Õf\âz£I9ˆ\è(8¸“•\Ûpwºòi¶YS5T\ä~v\èö¿e÷‹d«;)+wZµnWmAu#\æaf#\\õ?UÒ“ğö«)™DÑ”šfnñ³´»§	:`\á\ã7ë·\Ø3\Úy·+—p\"lå‹¸œ²ğ•\ä\í}J\Ê\Ñ\Õ,QG\Ôd”Õ¼iQ¦©š¢\áhÙ¨D)¯Qu,Ág°ªı˜õªB\ÓÑ“Û½™\Şü®\à«f4•º¤¶\ËD¹JŸûn]H˜Ù›\íxZ\Í\Òôsh\Ö\Ó\Îxª\Ëws§\Ër*ˆ) ”zbp‡ôƒwKhl/g•UE\\z=…\Ê\r\ĞL#f)\Ù#C¿ZN´¨\Æ5û\Æ,%Õ¶)ØŠ!Ê±Hõ\Z´ù”\\è›®\Ö\è\Ã.\ÚG˜¢\íõ¦oSºş\é\ÃN\ÜjZ®cj©zUŒYŠ¦¥a\"a\ëĞ¦\ÒŒ¥jµ^S ‚\Ğ\Ò,\á\×<‚fLš¯uu%iihˆï¹¥Ó¶µ¶Ïªª\â\ŞXji\Ìe»¦\Û\ÛI[•Q\Ã2¨(«\Û_SO\ê§4\å*\á“Gpµ4L\ÛiH\ÊMšG}«\æ.L«h’·t=?gÒ§•rÊ™p\â=Fn\×i+ \Ê—,£A‘œ+’	Š\n¦\n\Ê;jCT\É÷j\ÖÊ†ºz6mmjv&½ÿ\0N®w4¾ñky;²­,¼3hô-ú|¥CkXB6•Mû¥j1“mLP/$³8’·V@#›±Q6¸ãŸ¬\âM.Y[Í¶˜i„‹Z~tœ\Êm\ÜÁÁ‹B\Ä7M\Üc\íN5”d\nb\Ù\è¤C,‘S1\ïŞŠ]Ø¹U\Ö7m*ú\Öz¦¢¬mß¦iS2»WHQ4\íEF)X\ÎCD¹M²n\Ôdş¨”‘—1^º{\İ.\è\ähf\í\n“rªM\×\È<_¾|ù\çR\êcõ\ëŸ\çO.œ¿<\ê]3»ÃŠ¡\ä!\äsœtH\Şÿ\0w\ÏF§»E\Ğs\à8‹À\Æ”X¥(¦9$Ÿ¶p\0÷\ÚğÎN?O?\Ğu}\ß?¦ ~^C¨“\îùıthÔ¼e÷p8dp?€|s€\0\æ8\rj\Õ\é\Ş\æ\Òöğ\Í\Ã\ËÉ¸+[B‹Rª+°’«#\\ÌR\ìXÅŸI”\â!\ÂPQ²a\Å\Ô@\0GA´ú¤ry˜œ‡´`—À€O,0Æ›E¸OJ7av\ÄG\Ú‹‰~\æÛ•d\ÑVŸ‰$\r4w\È\ßl\É\ÄQ‰\Ô\â\0;rŞ•ø«ò\È\Æ\ØKwl,tJÀt‘•’3ŠÆ¦E\Èaª“FË€`\Æ:R\âBŸŸ\0†A\Ğ\îbnš’3\ÒÑ±\É}.ı¤c\0\äDUtùf\è1œ\åO\Ç!I]\æLvIn*€¹\Ô\Ö\ç&¬;\ØÚ¶š¦\ç¯;ª*\İCL°E²±LR7²B‚ŸŒˆ¨©“#\İÄ»m6ğñ\Ú$\Ô«\ëœEMº~\Öü\Ô\ê³-y¸-\Æ>’X\é«H[v•€B¬”Z.z\r¢$f\ÜDxD%¦Ã…{¾16\Ç/\ÙñÛ\Æ\Ş\Ô(\Ô\Ö\ï;€¸±ó-*šmSB¹¨d\ÙO,²\Ò	IS°õltŠ‚\ì\â4{\Ô]\Â\ØñÀ™† W”ü\ÕP\Õô}#UHÛˆJ¶¨eJN£ ù¤­2\Î~E´ò®\á[;ŠM\Ì\Ì\"dÜ˜{€!\Ü2•‹\İ&òDP³6{r%\æAM\Å\Ğ\É »GGvŠÈ¡j”ªŠ‡l\Ô\É,a›÷gL!Â²\Å1L,z¸6r\í\í\Âj>˜¼\Ö\ë\Ø\ê\İØºxƒ:\ÂN”|ù’\"’B£\ì\ÔMe’AÁ\È*»TL\â¡SLGŒD7kûŸ½»n¦\ê[3½[¢´e[\"\ÎBj\"•¨%*J®a…šUIœƒ\naÃ¸\Øõ‰;\è¦+•©M\ÑWA™p\ëŠ\"<„0?¨õ\ëùóÎ¡®xÏ·wµR\Ô0§ZÜ«\ïg^3‰M”-õ¢©ªº¶ªH™HP\ï©\ë\\ZNb%eS…¬¢Še¢ªd\nR»[²C´ú3´\Æ\Ò\ÜJ\Å4eyf\êøŠ2¹\Â;J¨œTPF©!\'©“OTñ-V`U›?…¨Ã–.Û•F’’l\İ&ª@§5\â2.)id¢”*oŒ\ÕP@\æPR\08”xCŒ|dq\ÌJb‡¼F¾¼ù$S³:W¸l	ˆ®·Kİ¤\0<g\â7²!\Ï\"\×´h0ö\ç÷#n¶ej\Ë\åtU-)J-O°3H’±<œ¬\åYQFRt\Ì+É½ŒŠl¬¬ü\Ë‡‘—“ˆ‹n¢òRÚ°jº\ÄCû\Ç\Úq\Ú_°U\Î\Ò,–\ÙW§48¥&\ŞøE^\nñš¦ ÷*¢\Ê!¼=G)„\ë60Í´:€ õT°\è\ëA¼\r´[}\İ\íş»°—^!\ä\ÅY¥²äŒ”{\r-/NÌ±¨i\ÉÈ©6\"Í¤!&£™H7•vµ~\Ñ\Ó5–@\ík¯=yh\îd\ìÿ\0®©u’P\ê²,\ËR*¤%0™08%)i<”xG½\ï”8µ\Ìt	‰¼;»\ÛotM,İº›€\\W:\Ô\Í\'G¯J\Ò €ˆ§\Åj\Ü\Ì\"¢\0LV(\Â\×1\Ò%’À^úú»oOT\ÕE¼§%$U0­VŞ›š­+\Ğ\â¡J\'‘’®£(\Ùs˜\Âb „2Ê¨ §	C\Ztk\í‰ö\Ïm\è\Îÿ\0¹¸\ìø»¨©\n®Y\Ê+&@\ÉRû\áDTQ@\0™2\Ê‚\" \06Kˆj½\Çv[¤c¹]ŠÑ·‚\r¸˜¯d\İY\ß^‘ \à\êšn\Ø:”hQ‡–q^F\àûÀ!‡v‡\è\å3¿da5r·\Ûe\æ\â\ÎTÜ¼§¶\ëSRu›\â ª’•%E0Šm€…\â\ã]*-R¦\0\'\0\éI\Ãh~—gK\Ùr-M×¹E\ï…©ªwû“®\ÂA°óHhjH²t#³*Q\0BJ&,ˆ#œ \ZLúwtİwvb\n\âvsC\ÓU±`zô‘•\á\éX¤\Ã\×\Ê\Ù\Ê%dz~\"y¬‚‡—\ÖPP°>!8ˆ\é-­\æ\Ş/\åØ–Gm\Û@’Jj– B¨ª\áŸH2F8“²	F	:°´\İ2)!V\Ä+¢%1ß\ÉJbª\Ğ9\Z»ô¬\íµ\Ù\ã°Z³f\Å?VŒª®Y\"­MºfTƒ…7E¢(D9;B\à¦\àsPÄŸ»\ä~ôG\Í\ÉvÀöŠn)(k³¼˜›I=Rqg¶……9$-T\Ït¥]Lp¿°\"‰Áõm‘¹°\rl] ô÷Á|Áƒ‹\ÛtXQpN15;“\êÈ¤le£š–”¢›¥	r”yª[Mºz0\ÛZ£	\Zú\ë«=pHRY\Ê\\²Š±PC1¥iòA@$ <$‘BH¥Ï·\Şc˜1ú$\rKR.\Ö\ÙYú\Òò\×\ÒnEW3‹Š†º©$¨qw!M\Zje\Ò\ÇP\Âc)=Q¹1»\Ñ(qiTldj.\èÅ“D) ²4Kó&SX©\Ò-Qj¨†L­-A¦\îiÀ¦\êJ’8\ÆK˜¹ƒVOc[U\Û\Ô[H‹]fhª}i‰™(8ÿ\0h\Äw¦jİ«xğPq\Å\Ç\ê‚p|B<\ÇlPA¨‘»dRn‚e¦‚	‘HP\Æ\nD’)(\0R€¥»kôV,\r$Œ|ö\é¯5ut\ä\ÄRZB“£D¶ş—Uq\0:œ/»ªúg 9•©*D\ÅÓ”6Ëµ¾\íÛ·µ[pµtÍ©¡\Ó|´«¨ºv5&‹\ÍL®ŠM\ÜOT2*\n²\ÕÓ„·n¤¬\Û\×\ïÁ²µ\"\ÄjŠH“aù{ÀŸAóşQüº\ã3\Ïù\ÓAn¶†È=I|†3\à0c \Ë\ÄCŸAº5® 4\è\àWk¦@ƒ\×å¼ôh21\Ô d†Àˆ`<—<t\Æ<3\î\ë¯9Š\Ğs\ÄTùûÍüÃ®\Z¼lB\à\"³v\æ\Ï!)D—Ë§ÿ\0:j\Ù{BÑ’õ˜ö\n	ƒ\'IğÀ˜¿w=\Z4ºkkVJ¢wö„¥JI»\é\ënb8uYQ+Ãœ\à;\Ìg8\çWD‹¶tÀ¦xúb—t\0T\Ä\Z£’¡€˜\àa(\0`\nRC\0-\Z4-±!#Jn›tA0\äb&€\0÷\Ü\08Ç—-xV¬ ‘È™\Ğ<—ñ\0\Îz|<4h\Ğ|…®…\Üp\â]\rœaa~#\Ç\Ç:¢[³A\î\Ô1\æÿ\0‹„Œ?†>?¦\Z\n\é\İ*\rAÀ\Ôq\Éô\æ¢Àò\È€:ó}5\ìV\â\ÑI .B¢ˆUñq„W‡„2 n€°  \r\Z4ª\ç\İ\ÊhÉ Jn=\ÉıMa\"ep@)\ÄHl\äxy‡0\ãf\Zÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',0,1),(14,'h','jdhdjd',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0%\0%\0\0ÿ\Û\0C\0	\n\n			\n\n		\r\r\nÿ\Û\0C	ÿÀ\0\0h\0`\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0<\0\0\0\0\0\0!1AQV•\Ô	\"a2BRq#3br’S‘¡²ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AQa\"q±Á2‘\Ñ\áğ¡Bÿ\Ú\0\0\0?\0Šz5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ğ\Ğ…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4¡STş>Ê¯5¸ú\ZĞ©ªeWš\Ü}\r\0\èT\Õ?²«\Ín>†€t*jŸ\Ç\ÙU\æ·C@:5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ğ\Ğ…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4\Ô\Ğ\n@(\0 €P\n@(\È/1mª\Ål$\Âf\Ú[i\×Š\Ù+B\Ò~‰$İ¸\ï <¼M›Xo[#\â<Uˆ¢Aµ=!\Û„­µ¸²BR\nºö<ú¹U´¨T¯\'\Zqm¥º\"ª\Õ\éPŠ•Y$›\Êı^ˆy·\ÚC\Í()I ò\"ª-?thÏ{eGb™˜\èw+ş\"€„™1a¥¶ B\ÜQ\Ø+b	\0·«£J9)T–]µ¿\ÙDªÏ‹†œsÿ\0Y1W´»:qcˆ‡–ø\Z\ÑcnS¥†~%\Õ/m\ÂAYJ8¾›T¸\è\Ç\å‹~o\Ù}\ÌpV—\Í$¼—»ûf†µU‹³F\í|\Êü\àŸÇ‹ ­ra­\Ö\Â\Üm<d¥ $}[\ìOuS9q¼ò\ËÈº\àYgŸ™qª$…\0 €µA\nÉ„-(\Íûƒ±‰mGÁ^[’ –\æBw\äSj\ï$ºùƒøj\Ê1œ¦¸5WòÈª´  øôvó+4{\ä¾\Ã\Ñğ®På¬©–\È|F+rŒ‚TU¸‰G\æ$öu×ª¤\á9ºµª9I\ë’÷yzZPœ)Æ•\Zj1Zfı–~§v×§±T‡Á\Ğ!Y˜Š!q¡A;\î\É\äO¼\İD]C´w\Õ.­%hC\ê\Ûû\"\åJ¬sŸ\Ñ%÷eÿ\0Ó–v\Ú3\ç,-\Ø\Î\ÛEÁ)®±Ry±) q\r¿*¾ò~‡\èk\ÎzL\ÇöŒe5\Û.5pÆ§\Ş=m\Å\ç\í6#ñ’\ëd÷¥CıTš“½\È\ÅebÁóÛÇ‘-\ây+Iù\ã>9\Ç}\'ü÷õŞ¢H\Û\ÅX‹b{\áQğ·‹,\Ğ\İ\å„7·º”—\åÂÀ\àWO\Ş\áû\Û\ï¹`ò»0\ìy­€l¸ÿ\0:\ï/po¹iÎ¥¶¯ªT?¥\ÕP\n@(\n‰\í:Áx\Ã\é\Û\âğ\Ù.\Û\ìw&\îˆ\è­q\ÂT\àÛ±\nPQ\Üû*\È?¢µeS^(\ÉèŒÃ—%¶¥\Û$™\äß¶«-&\Ü7ˆ¦a\ÄÁº|B]¹ÂŒC\ì•|t’P\ë\\C˜RAW_>[ur &½=\çZvÍ›mş<´¯/ñ\ÃL&[h üCd¾¶’\0eAÄºB?(X€\rsõ©’±3\ç!\ç¦\Ğ\Ër\îöf\â\Ğ\ã{(º7[i=¡m\ï·y¬«ØŒ­s¢-øn½muJJ›<$o·w\í¬;7³4C‰(H·B[\×+o\ÙòÜ–®0¥‚_Byl\à@ ¸\Ü\ï¶\àlºöc\êJŸ\Ê\É\İİµ\Û\ï‹÷ö¢§930m\ìzƒ‰\ì‘\ßM§”€P\n\å¹\Û`^m²­H­É‡5•ÇËƒt¸\Ú\ÒR¤‘\Ú$Q<h\ÃI¬™…Z»\È[–3šå†šm\ÕZœW\ÇY¤(Z\É\áö©tªw\í©M/™h\ÈÁÿ\0\Ë\Õ¾Å“\Øj\È/€¨O\Û#t¨€7\ëØ\ÌTI’ø\Ûµd½aı¦Ì¶\Üã‰°!´\â\ÚDŠ”7\ã\â$))«p\n‰;€¥P\Ï\ÙÛ©ğ¹ÉœY;Šõag\Ö\ãªù¤\Âmó\ëSüŸ\í )§´\"•’ù\İ.\ïg†Z°\â2«¤\ì„q«ù­ğY;Ê¤\Ö]\îEZÇ¥“w‚?… \â6­ñ\çNšß¼vK\ÉRU¿\Üı\Ğ:¶\Õ7gf\à–ˆ\ÅJRÕ¾O§ôrı\ä\Ú8\ß\æ\Ï)8\Åh—N§\ë7²õi·±pDTB\Äøq\ÔÏ„üdğ8\ç»<E½\Ç^\àrúVoÄ¥Âº´b•H\İeÏ±\r\Ş\ÛU0x•N´³„­~]\Í+Ò®|Zõ“V\\y\ä}¢nÌE©h‹—`W%\×n\Ê\ä\ÇU%ú@(Yõ\í§4g\ÎNH›d„\ÅXU.\\-œ)ù\ä7·ó£ıx’7ó%=õ8_\Âù•\Î\Ş5\Ë\ĞÅ«L¥\Ún\n„ğ)mgm•\ËcP\ÓR\Âw\ÊÌ¥gYÿ\0‰ñ©†\ë\Î5$up¥\n\á+q}|\È;%;r“Î·m\ßİšXú‰m§¢VÓ©¥\íıä«®ğ¸d³Z·ß¡\"Z°$¼¹¿\Ûñ\æVÉ“l\ÄG\Ó**W!n3 §­¥…’@P\İ;ƒ·>`Šú\ÛGtp\Õ)7„\\3Z]´û\\ù{;{1ª–-ñA\ëlš\ïb\à\çÅŸ\ëcI	\Ç8N Uö\Î\Ò\î\Å\Ûw£\Êi;J†¡\Ö	\0\ì;JPk›8¸·	YûII)\Æ\ë\Ø\Ï]9\ã\ã‡\î30\áş\İQvY\Û\ç\íHıEn[µ´°u_†W^•\èjİ³\"”qt×Š6~_‚\Íû¨¼2¼$lw<«¤\İ\Ø\ç6GÉ§,gK\Ù\ì\Ãh˜¶pc\ÉøI¬¸¿\åÛ®$•!c¹• +úW.ŞŠ¶}U‰¥òMıÙ7v6\Ë\Ç\Òxz¿<?\Õ÷FÁ­H\Ú\Ï\í\0 €\Æ\ïi›Pfª±\Æ\Z\î°\Î1qÉŒ{´ìˆ³w\İö~€“Æ‘Ü¢;*\Éx—Ô®>Áôı\ìr:f\Ìèª‚\æ½8\Z%\Æı`şü\ë{\İ\r®¡ªû¯thûÙ²ä±´\×g\ì\Ë\ä«GRf´½úƒj\â\'ô·ï\áI~œ3\Ö~œµ/bÇ‹X2\ä…/úpg\ìg¼(÷W\'Şœğ¸\éVk\Ã7Ÿ÷\Ì\ê{±†\'\Z9ø¡g\åÈ‰µ\å’OdvxÈ¼\á\ÖK[\ÚşÙµ8\ß\İBV­\Ö\ÚHüo·ö”Ö½Êœ•H<šõ>û„gNwO\Ğ÷ğ^ua,Qb&uş\r¾\â\Óa2\ã\Ét4BÀ\æ¤\ïÖ“×½uÍ›¼8\\f2œ\Ôd•\Óy\\\å;Gwñ8:\î0ƒ”^\\‰uVİª6\Â3\Ó9\æf·1ùo\î\Û-\ïÂ„\ÄI<\È\å°Û¶µ\éÛ˜|e%„Ã¾+\æ\ß+rFÉ»¾«\ÅW\\6\É.w\æ\Íc\ĞşnL\Î\r>\Ø\î\×w‹·[Fö™«Q\İKSIIBÔ¶¤n{Á­\İ\Éö€P\n@Eú’\É+F 2õ——¡Ÿo\â-’T71¦ \Òÿ\0MşSıª5(IE\ßFBqm[S	o\åa½\å\rp\î6Y«23ƒn¢• ı9\Zºj˜:\ê¤\âóıó*«Jº.œô’È³N\ê&lv\æe\Ü/¡‰N0‡Œ6c8·G\ßnI\Øş»\í]R–ôlµB5\\ò“WY<\Ó\ès\n›³´\åZT”sŠvy¬š\êU\Ü÷\Ï\ÙÙ¥{„›<m¶[S…\È\ÈYù\×?\ì^Ü†Ã©#}·<\Íh»Á·Ùœc”#¦z¾\ì\İö\Ã[\"\r\Í\ç9k\ÑvE\ãË¼Sÿ\09´‹#/®J\ÌÜ±dK·nwv\á$%H¤”l6ü\Éo\ëZú\è}\éZ\åºZŸ‡-\Ëtö–…4¢”•\'˜\ç\ÔA¨´I>hû0şr\å5–bFz[\ËX\r¶”¹\ì\ä:\ë)7da´®Í±Ğ†L\ßrk#c\Ã\Å-.=\Úı)WW\â¬l¨\èR–Ğ¡Ø®‚Ggİ•ƒ%Œ €P\n2}ªZjgF\Ô´y\åqO$>\Ì\È;~`8{\Â{\êÏ×§\à«\ä—g\ëù3¢^b}Ÿ8ğK‡¿Ãºy\î“Öƒôß˜\î\ç\ßU–C¸X-İ¤>\Ø<\Â3ûöP\î1\å\Ï)ó\ç\â›c‹n\"d5Zy8ÃŠR\ÊUÿ\0ªUów@\Ù›ø‰\ì[6\İ:\És–ç½–\å­\Ä!¹=kSkJ’{Jvß¬\îjY\ç©´:¼¢\Ò.Fä»Œ\Î\Â\ØQnlóE\Â\à û\É=\é\ä“õ\0\ZŸÅ’mûÔ‡Â‹—®L\ÕQh €P\nÁ\Çx*Á˜¸>\ïñD4ÊµŞ¢9Kd~\r¸‡rØƒ\Ø@©FN4FQ\âY7¨\Í?\ã-?\æ\\üŠ\á¬»ošCs¢“ò:ƒß·%\Å+3\rÖŒ\Ä%\Ågª8ksfq	z!Rúº?üT	–ÿ\0E\ZV\Äù§m˜\çkv²In\\¹+l¥/©\n\nK-\ï÷”¢\ç°n{«..96µ\"¥<“5ò°HP\n@(\0 €\â3[%ò\×;,#\æFvŒ\Ù+a\Ån‡\ã¬ş&\ÜN\ÊAıÇ·z”f\ãnD%+ó\"\\\ìü\Óv\rº&\ê\ŞŸuR\èf\å5N´“ş /\ßz”j8>(¤¿{‘•%5\Ã&\Úı\èX{]ª\Ùd€Í®\Ïo\nt„4\Äv\Ãm¡=Á#¨JNo9]–F*+(«U`È €\Ånš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TşÊ¯*¸ú\ê\ÓWª\0\åW•\\}u\0\é«\Õ?€r«Ê®>º€t\Õ\êŸÀ9U\åW]@:jõO\àªò«® 5z§ğUyU\Ç\×Pš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TşÊ¯*¸ú\ê\ÓWª\0\åW•\\}uÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\momoria64.jpg',0,1),(15,'ghh','sdsds',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿş\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0=\0\0\0\0\0\0\0!1	Q\n\"Aaq‘2¡±Á\Ñğ\á#RrB’¢£ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0\01Q‘!qÁğñÿ\Ú\0\0\0?\0‘‘)Œ&Èˆrúü¿MK\ê\åø}ö×£ùüú\êQ\ä>\ì.\ïøü9\ê\í\îú™:(w(d@Ÿ†m@SH\éÿ\0\Ä?}U0\ä:\ä3òü:ò\åÏ—Ÿ]I¦\Ş\ï\ïòx¹:I\İ#ş\Ğÿ\0´?}C¹K?p¸ÿ\0ˆgóı\ÅMU)J \Ä\Çó\ë¦\Ş\ïµ2u<7r—¸…÷õ(y{ÿ\0Ÿº°ª\Úö\×\ÑØ´®kš{,“…\ãZ\Õu<<\âIª$“•¥.ı‘¦\İU‘Mc\"\ngT…6ÁœŠp)Ja\à>ğô/‰‡\"\ÂPö‘\0\0z\æÃ¿\Íÿ\0^½\Ä\ïfûW–\Æ÷ÜºB®\ä({`Ú•®jhH&6\îŞ¨zF˜•k\á\äbfªŸ´=Fõt\â$ºsX\â\ŞAB·@\Ëm\æ\Ûõ2N$ŸgFZª\İÔ€Q§ªº>w#P\ÂJ³Œpúƒ÷Y\Èp\ã\åÏ\ê\è<S€”[s\×	\çŒc¦0=@|C\\À£«\ÎÕ˜7	#º½¬\\W\á‹\ÅG\Æ*\éu\ÈR%¸7K<1–9€„õ—§P«’\Ôö¥\ï.¯Û•5\Z\Ö}yG1D«D\Â3E²ì¦–‡Uõz!W*£EªtLg \åQŠ\éš4¬\"‡ƒq0ˆ¦\0ox‡Pñ\êÆ­¤­-\nŠÊ®”y¯\nñŸŒÀ\Ï s\ÇNœ´\Ş\ïF»p{¨\Üu İ•c~.Mot-´EúŒ§l¤\Íw(¼\ìŒB\ãM8¨n1,ôªH+œõHx•Ş¼mº¯˜³P…* .\\Õ¿¹-¶N6Û›\Î|\î~RI7$–óm¼¶Ê-º©„!Y‚9S\0‚$\êQ)\ËÔ¾\ã”3\Ğyû´k ^@Í¼©ƒ\Æ1À¦>ŸL\è\ÔVQ\0©‰Š#\Ó\Ï\è=1sş51ú\ÏôR\ĞM!\0\0õø\0túø\ê<\â\í G\åú†ª\è)pˆ~?¶ª\0`\0İ¨\è\Ğ&wk\Ş\ç\ÇiİŸ÷ö\âE\È>·©i¿\í%³?x¢n¯n˜©JF¾bdÄ¦T\ÜK¹\Ê\Ã >\Â4\êªp”u\Ë\ê\áT\nÒ”\í8\í€Uyq¨8¶¨€\åCÁR3QU=C‘\Ï¦«¤é†‹¡‹Ò˜pC\é\Ú”v\é	P]»´\Ø9ú*\ÖS\ïu\Äh\ÑuM\Ş\Ö5\Êo)\Ê1\ã|÷bö‹Œ©¥L\n\'\ëVJ\äEBa6_·†÷\æO~—.u\ä(Mv}\î:ºp¨\"Ç¯~*›iYS´\Ù ‘õ˜©Ù«<Û‹)\èÓ”»H@-\×U\ë\æ4Ñ¤£Ÿ®Øˆ6ZE‹¦\\ \íg/K\ÔeJ\àJb¢\à\ÍÁº@B•3ûF\âó\×	O± §¦*ªæ‡†X¥T\Æ:\\\Ì\Î\ÌzK”\Ü\ÔY\á˜¤’Èˆªw$IA\âPùZ«\Ï9DAD•Nğ\ZªE?ŒİšEû8ƒş\à:\Ë&¡@Dy5\ÈôÎ”³“m¡»}òmo\ï}¡J\Ô·¶\ë pWş\ÕZÀş¦t\É\ê‚S6óñô\Ë84B‰TZ\à\"@\ÊSü»!¶¶;=\ìò\ÛU¢“Ml\æ†B\ä\Ü\à*\'EÉ®M\Ö\\õ\åV\Õğ(¸€^iµ*™°\0V\r’¦¥*\ãü?}S\ÆzˆqdGa\ÈóÀgğ\0\0\0Z†ƒ]\á[ú”<c‡ş³||>½:h\Õ+¼`-¿¨ó\ïq\Ï\Ü\é›9@ñZ4Dı\çú©j©úyşƒ¨ !\Ì?\çü\éå >ğü‡ó\rU\Ô\0 À?\Ôt¼2rbcŸJI»A„tsG/¤9T¨7dÅš*9x\íu D‘j\Ù%WUC‰¦c\à^\í#ov\ì[\í7³^ö\Ë6˜j®ò$\ÆÀ\ÒOP\ná‘®Q\\³¬¦ŠY4\à­\ËJµ\ï®\nV¯E†T*‹\"Cƒ÷›¹•÷9»=\Æ\îª`\ë=…¨«z\Î\äÂ´v Ÿº·t\ZhDZšt\Â~@›¨xŠÈ@¬«‘\åCœ9\Ù]µG¶oÑ¤\ß\İñ«\Zn.ôö\å»+\Õ*ıÁT+õ\è8«WZ\Òv\Í5À\å\nm£\ê:\í¡² t«T¼”3T-Í¼{¹Ñ·ö\ÓH3“«wAy\íõˆ¦T]%\Æ&%\Ô\ìJR²\ÎH™…Vl>™m4ªH‰B»\\2\İ1>ºjïª—µ{p\ì•\ÜÕ²l\ÓVª\Ûì–»³t»P*g*\ÈZµ­}‘H	‘GRoBÅ Y\ë\àÉŒ9Z¶>Ej*‹0ŠRõ9c\"†\ËP–9jªœ€@Œ«\ë\ËôlpQ\è³Z\nf¬¹û\Ï\İ9…%ŸR\é\Ğ[t·\Í\"œğô\Ã\æI\×5²œ\åDò‘ğ¶ú0‚»\Ñ,D€*$#€´šä§¡j)\ã-/M„Dp\nROU(8g\Ü\0\0d\ì`\Õ/\Ò\0\0™§—/(ôIQU½ƒ\ŞJk\å\\/\íu\È`Áˆº¶–=US\nf8@q\Â%\å¹\Ô>_¨\êMLn¾_O~:ó K ±®!Hje\éT)NC\0\ÈrˆrRœ¦)Š!\È@À !\È@CF©\\µŠŞ’’\\\â D’1\Ì \"\0ò\0\0ü´h2úyşƒ <şŸÎ¾z\Ó\Ï\ë\Èu}\ß?®‚m\Z4h5ût[™µ›A²5ş¼²R1\ÔœAd	ö\ÍC)#PNGSP”ô)\\6R^fZbQ£V¬\ÓY \n\î\Ü,ƒF®M…ş‘/iM’\í	—°VŠ\Å\ÎNT–êˆ„Ÿ¬ª9\Èiº*jJ½—~\Õf\âz£I9ˆ\è(8¸“•\Ûpwºòi¶YS5T\ä~v\èö¿e÷‹d«;)+wZµnWmAu#\æaf#\\õ?UÒ“ğö«)™DÑ”šfnñ³´»§	:`\á\ã7ë·\Ø3\Úy·+—p\"lå‹¸œ²ğ•\ä\í}J\Ê\Ñ\Õ,QG\Ôd”Õ¼iQ¦©š¢\áhÙ¨D)¯Qu,Ág°ªı˜õªB\ÓÑ“Û½™\Şü®\à«f4•º¤¶\ËD¹JŸûn]H˜Ù›\íxZ\Í\Òôsh\Ö\Ó\Îxª\Ëws§\Ër*ˆ) ”zbp‡ôƒwKhl/g•UE\\z=…\Ê\r\ĞL#f)\Ù#C¿ZN´¨\Æ5û\Æ,%Õ¶)ØŠ!Ê±Hõ\Z´ù”\\è›®\Ö\è\Ã.\ÚG˜¢\íõ¦oSºş\é\ÃN\ÜjZ®cj©zUŒYŠ¦¥a\"a\ëĞ¦\ÒŒ¥jµ^S ‚\Ğ\Ò,\á\×<‚fLš¯uu%iihˆï¹¥Ó¶µ¶Ïªª\â\ŞXji\Ìe»¦\Û\ÛI[•Q\Ã2¨(«\Û_SO\ê§4\å*\á“Gpµ4L\ÛiH\ÊMšG}«\æ.L«h’·t=?gÒ§•rÊ™p\â=Fn\×i+ \Ê—,£A‘œ+’	Š\n¦\n\Ê;jCT\É÷j\ÖÊ†ºz6mmjv&½ÿ\0N®w4¾ñky;²­,¼3hô-ú|¥CkXB6•Mû¥j1“mLP/$³8’·V@#›±Q6¸ãŸ¬\âM.Y[Í¶˜i„‹Z~tœ\Êm\ÜÁÁ‹B\Ä7M\Üc\íN5”d\nb\Ù\è¤C,‘S1\ïŞŠ]Ø¹U\Ö7m*ú\Öz¦¢¬mß¦iS2»WHQ4\íEF)X\ÎCD¹M²n\Ôdş¨”‘—1^º{\İ.\è\ähf\í\n“rªM\×\È<_¾|ù\çR\êcõ\ëŸ\çO.œ¿<\ê]3»ÃŠ¡\ä!\äsœtH\Şÿ\0w\ÏF§»E\Ğs\à8‹À\Æ”X¥(¦9$Ÿ¶p\0÷\ÚğÎN?O?\Ğu}\ß?¦ ~^C¨“\îùıthÔ¼e÷p8dp?€|s€\0\æ8\rj\Õ\é\Ş\æ\Òöğ\Í\Ã\ËÉ¸+[B‹Rª+°’«#\\ÌR\ìXÅŸI”\â!\ÂPQ²a\Å\Ô@\0GA´ú¤ry˜œ‡´`—À€O,0Æ›E¸OJ7av\ÄG\Ú‹‰~\æÛ•d\ÑVŸ‰$\r4w\È\ßl\É\ÄQ‰\Ô\â\0;rŞ•ø«ò\È\Æ\ØKwl,tJÀt‘•’3ŠÆ¦E\Èaª“FË€`\Æ:R\âBŸŸ\0†A\Ğ\îbnš’3\ÒÑ±\É}.ı¤c\0\äDUtùf\è1œ\åO\Ç!I]\æLvIn*€¹\Ô\Ö\ç&¬;\ØÚ¶š¦\ç¯;ª*\İCL°E²±LR7²B‚ŸŒˆ¨©“#\İÄ»m6ğñ\Ú$\Ô«\ëœEMº~\Öü\Ô\ê³-y¸-\Æ>’X\é«H[v•€B¬”Z.z\r¢$f\ÜDxD%¦Ã…{¾16\Ç/\ÙñÛ\Æ\Ş\Ô(\Ô\Ö\ï;€¸±ó-*šmSB¹¨d\ÙO,²\Ò	IS°õltŠ‚\ì\â4{\Ô]\Â\ØñÀ™† W”ü\ÕP\Õô}#UHÛˆJ¶¨eJN£ ù¤­2\Î~E´ò®\á[;ŠM\Ì\Ì\"dÜ˜{€!\Ü2•‹\İ&òDP³6{r%\æAM\Å\Ğ\É »GGvŠÈ¡j”ªŠ‡l\Ô\É,a›÷gL!Â²\Å1L,z¸6r\í\í\Âj>˜¼\Ö\ë\Ø\ê\İØºxƒ:\ÂN”|ù’\"’B£\ì\ÔMe’AÁ\È*»TL\â¡SLGŒD7kûŸ½»n¦\ê[3½[¢´e[\"\ÎBj\"•¨%*J®a…šUIœƒ\naÃ¸\Øõ‰;\è¦+•©M\ÑWA™p\ëŠ\"<„0?¨õ\ëùóÎ¡®xÏ·wµR\Ô0§ZÜ«\ïg^3‰M”-õ¢©ªº¶ªH™HP\ï©\ë\\ZNb%eS…¬¢Še¢ªd\nR»[²C´ú3´\Æ\Ò\ÜJ\Å4eyf\êøŠ2¹\Â;J¨œTPF©!\'©“OTñ-V`U›?…¨Ã–.Û•F’’l\İ&ª@§5\â2.)id¢”*oŒ\ÕP@\æPR\08”xCŒ|dq\ÌJb‡¼F¾¼ù$S³:W¸l	ˆ®·Kİ¤\0<g\â7²!\Ï\"\×´h0ö\ç÷#n¶ej\Ë\åtU-)J-O°3H’±<œ¬\åYQFRt\Ì+É½ŒŠl¬¬ü\Ë‡‘—“ˆ‹n¢òRÚ°jº\ÄCû\Ç\Úq\Ú_°U\Î\Ò,–\ÙW§48¥&\ŞøE^\nñš¦ ÷*¢\Ê!¼=G)„\ë60Í´:€ õT°\è\ëA¼\r´[}\İ\íş»°—^!\ä\ÅY¥²äŒ”{\r-/NÌ±¨i\ÉÈ©6\"Í¤!&£™H7•vµ~\Ñ\Ó5–@\ík¯=yh\îd\ìÿ\0®©u’P\ê²,\ËR*¤%0™08%)i<”xG½\ï”8µ\Ìt	‰¼;»\ÛotM,İº›€\\W:\Ô\Í\'G¯J\Ò €ˆ§\Åj\Ü\Ì\"¢\0LV(\Â\×1\Ò%’À^úú»oOT\ÕE¼§%$U0­VŞ›š­+\Ğ\â¡J\'‘’®£(\Ùs˜\Âb „2Ê¨ §	C\Ztk\í‰ö\Ïm\è\Îÿ\0¹¸\ìø»¨©\n®Y\Ê+&@\ÉRû\áDTQ@\0™2\Ê‚\" \06Kˆj½\Çv[¤c¹]ŠÑ·‚\r¸˜¯d\İY\ß^‘ \à\êšn\Ø:”hQ‡–q^F\àûÀ!‡v‡\è\å3¿da5r·\Ûe\æ\â\ÎTÜ¼§¶\ëSRu›\â ª’•%E0Šm€…\â\ã]*-R¦\0\'\0\éI\Ãh~—gK\Ùr-M×¹E\ï…©ªwû“®\ÂA°óHhjH²t#³*Q\0BJ&,ˆ#œ \ZLúwtİwvb\n\âvsC\ÓU±`zô‘•\á\éX¤\Ã\×\Ê\Ù\Ê%dz~\"y¬‚‡—\ÖPP°>!8ˆ\é-­\æ\Ş/\åØ–Gm\Û@’Jj– B¨ª\áŸH2F8“²	F	:°´\İ2)!V\Ä+¢%1ß\ÉJbª\Ğ9\Z»ô¬\íµ\Ù\ã°Z³f\Å?VŒª®Y\"­MºfTƒ…7E¢(D9;B\à¦\àsPÄŸ»\ä~ôG\Í\ÉvÀöŠn)(k³¼˜›I=Rqg¶……9$-T\Ït¥]Lp¿°\"‰Áõm‘¹°\rl] ô÷Á|Áƒ‹\ÛtXQpN15;“\êÈ¤le£š–”¢›¥	r”yª[Mºz0\ÛZ£	\Zú\ë«=pHRY\Ê\\²Š±PC1¥iòA@$ <$‘BH¥Ï·\Şc˜1ú$\rKR.\Ö\ÙYú\Òò\×\ÒnEW3‹Š†º©$¨qw!M\Zje\Ò\ÇP\Âc)=Q¹1»\Ñ(qiTldj.\èÅ“D) ²4Kó&SX©\Ò-Qj¨†L­-A¦\îiÀ¦\êJ’8\ÆK˜¹ƒVOc[U\Û\Ô[H‹]fhª}i‰™(8ÿ\0h\Äw¦jİ«xğPq\Å\Ç\ê‚p|B<\ÇlPA¨‘»dRn‚e¦‚	‘HP\Æ\nD’)(\0R€¥»kôV,\r$Œ|ö\é¯5ut\ä\ÄRZB“£D¶ş—Uq\0:œ/»ªúg 9•©*D\ÅÓ”6Ëµ¾\íÛ·µ[pµtÍ©¡\Ó|´«¨ºv5&‹\ÍL®ŠM\ÜOT2*\n²\ÕÓ„·n¤¬\Û\×\ïÁ²µ\"\ÄjŠH“aù{ÀŸAóşQüº\ã3\Ïù\ÓAn¶†È=I|†3\à0c \Ë\ÄCŸAº5® 4\è\àWk¦@ƒ\×å¼ôh21\Ô d†Àˆ`<—<t\Æ<3\î\ë¯9Š\Ğs\ÄTùûÍüÃ®\Z¼lB\à\"³v\æ\Ï!)D—Ë§ÿ\0:j\Ù{BÑ’õ˜ö\n	ƒ\'IğÀ˜¿w=\Z4ºkkVJ¢wö„¥JI»\é\ënb8uYQ+Ãœ\à;\Ìg8\çWD‹¶tÀ¦xúb—t\0T\Ä\Z£’¡€˜\àa(\0`\nRC\0-\Z4-±!#Jn›tA0\äb&€\0÷\Ü\08Ç—-xV¬ ‘È™\Ğ<—ñ\0\Îz|<4h\Ğ|…®…\Üp\â]\rœaa~#\Ç\Ç:¢[³A\î\Ô1\æÿ\0‹„Œ?†>?¦\Z\n\é\İ*\rAÀ\Ôq\Éô\æ¢Àò\È€:ó}5\ìV\â\ÑI .B¢ˆUñq„W‡„2 n€°  \r\Z4ª\ç\İ\ÊhÉ Jn=\ÉıMa\"ep@)\ÄHl\äxy‡0\ãf\Zÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',0,1),(16,'fgf','asasas',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0A\0\r\0\0\0\0\0!\"1AQ	a2Bqbr‘$‚ğ%3CRcsƒ’“¡±Á\Ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\00\0\0\0\0\0\0\0!1AQ\"aq‘¡ğ#2R\áB±Áÿ\Ú\0\0\0?\0\ê\0P\0PJ\0 +@@@@@@A¯‹~÷^6›b4ô\r9w›e½\ß/m„É%l:a\nq\Ì)+‹ \àú\ĞgN\Òİ§\Z\ÒQn)\Õv½T„¡.V­ˆ¥-iRB’)¼/%$k@\Ô=ee¦\İ{¢\Ü\Éağğò¶\îzÔ´Úµ©õ\Å\ï\àö‰:ô\Ì&\İm¬¿\é8§	U\îÊ´\Ü\íù\Î2H\â´¡\ÖÁa¯éš”½»Zñrÿ\0%ø{ş2bU´¯EuN/{¾\ÙöÁÙ½\ÜZ\Ó;ƒf•1x	ƒ)ï”’O°i\î*?`k\ß1ˆ(#@V€(€(€(€(4|i7ööûi= Ë¥l\Ø,\ß0\â3\Ñ/\Ép“‘ş\í¦Ş€RöX\Ü\ë%\ÃI[m\Èi33jq\ÒrI=\0Ç¹ÀOZùƒ\Ö:=\Í;©\×\Ï\Ã&ğ\ßO¯MGº/v±¼]cih\êb2’\İÁ+h)i\æ\ÓO©S\ë\Ëğ{g­Yô]\Z¹’r\Ş~|ü¹+¿sŒ6\ïÿ\0d&\Ü\Ô\ÚM\rI6sRĞ·°úJzŸ§CôŞ´\ßPZ\ß\\~’’i¥¶{£T­k:P\ël\Ù\ím-\ß\ÙB†ôÆµ¹Å„’?\Éòù¨§şÜ’Ÿ\îñ­³2¶«\ãS~†¯´L\Â\0	T\Û#\ê†÷\êZp­şŠM@&\×üK¶rƒ-/U«JNp„ˆº‘ƒdÿ\0¶Mù\è	/e¿[u\çZnnpœD˜o¥\æ\×ú)$ƒü\èú\0 \n\0 (|\ç;¶\î\âYİª·3P!\Òücxveúc\á„ô!¬ı\èN6È£\ìÍ®¥i‹`‡û/½D™¨‰Àñ!)\n\nH\'\ËyıEs¯S\éĞ¼—¸\êc¦-tıZÁ¼\èzF£uEU£E\Ê2{?8\Ù\ã\èK=U®\ç\Ç\Ğ.Ê¸°©””J†’\n€¡$ô\È¸Í™JWı%†²Ÿƒj\Õôk­6\ÒUk4ñ\Ê[\à‹¹¹\Òun“¦ˆ\ìE\Ìp-.\àğQ\Îq¤\ç¡ô5\Út?NÔµ¯Ø¬¬mşK©\\T·—·SºOœ>Ş«R\â¾\ër2…6\çvBzø\ë]\'K[Òz^öv|;R	ö¬ú´¤\×R\à\ÆœYH®­â²\á>ufŒc/\îD>›|¶ö}\ËVk}ló\Ò\Z¶[¢·la„8¤2\ë\îkQ@<TR„\'©;\ÊÅ­Ò§ˆ,¾gXj\È\n\0 \n½\Zñ­°\ÚMe«XBl¶‰S\ÒU\ê¶\ÚR>\ê	z\Ì\ê\å=)\ç^|©\Ç\İY[‹Rº©D\ä“÷&©Ø¿\r¶%Ü¢Ø¹¶°W\ÆC‘ÀPo\Ó \ã\Ó\Ôı\ë—j.jö¤\ßf}\×\èúªzvÒ”q‡Mq\Î^s÷{\å›QªF’¸0›Še\ÂTF¢>|E%=xÿ\0,`ı+X·\Òk_j4\é[\ÒøÜº²¶_s[õ}œ§c(\Û\Ç~~¸\Z+¾™\äÆ¹ñ9”!†`8!\0d|g©ÿ\0\Å}¥\é\Í&\Ş\Ê0•Y/rx\Ê\å/¡ñ½Bµ=F£¥ıH¬.9X\å.W\ĞjwNÁ\Ón$ÁZK‰/ŠÂ¸(\ç¡ö>¸ú\Ö/ª´»[J®­Ÿ\İüŸş&uÒ¨¸µÓ¶\ëŒò»dmÜ˜§\İQV=°¢Q¸øzY\ç×›«Q\ÌøN\çpz“\íT7\Ñ.˜\ì‹q\Ç,\ï\çÃ“iª~\Ê:E™.w\Ä*ù0)8W\'ğ[ôh6?`6\Ûm\Ş^I5P@PB@M\n¾\'›·o=—µ^—°Ü›u¸¿,¦\âe\Â\Ì~ı+t•Ÿ$Œ\ç\Äh=o~3JË­ƒœ¤\ê£q{\î/6ÿ\0V\Êe\æ\á®km\ÇI\0w\Ùğ§=@úõ¯şÎH¹ôå—\Ñ~¥»·«9\×Q¦±ıİ–wK\ç¿q\à¶>\ëI~+\å°\Ò0• ‚‘\ëö¬¯GÓ„/s]r±¿œ\ì\Ù\êRòÖ¬­%…\Zî±–ş\ëeù4÷×™=†Z\ê¯\n	_‡\Èÿ\0Îµ\Ú\èW•\n\î¤\ÒP‹Ï\×c\ä9UJ\åÖ­.©Ic\Òòûp4úŸQ·9R\à§@ZòF˜ò­sW\Ö:\êÿ\0MbO—Ø·8Â¤*(=¹BY˜\åÕ¶œŒ(\äŸjÕ”±³\îbÂ‹œ’O‘\Ç\Øm¤‘»\ÛÍ£4{yWí‹«1\â3Á\\WÙ´¬\Ö5IõÍ£\"µ›¡KÜ›\å\á‘mğ˜¶\Âb$V’\ÄfKM6€„$a }\0¨<\Ó\"€³.dxœ‘%ö\ã\Çhr[®¬%	ä‚€a·#¶N\Ò\"Tk\"\\\Ôó\ØH.*1\áIKpş_\áÖ˜\È\"\Ş\èö’Öºõ+2ğ-ñJ”‹}­]\Ô~]\\\Î_I8\å*\' Z’23z\nºYf\Û\Ş}\Ã\Ì4\ë.„¨øR•øV\n¸(\'\0K5=(’*k=½—h}ÀXù¸\É¥\Æÿ\0\Z0	ú¤!”“\äjŒ07r¬¥S‘\ÔIóğôPûz\Õ-&\\…ISy‹–\rz\"\Ìa2ò\èK\\^}@óÿ\0µ]·«ú;yBœs,¶¾\ç\\\Òı]Nµ\İ%tı¸(ô\É\ç\Â\íõ\ç¡‹®#³JùE(	\0º…ƒ\ç\åšõ´½N­\İJ¬°óŒ?s\Íõ–—kg_İ´Y\ë]I\ç·|vùı\Ä®\0(c¦=\ê\åZ\ßD—¹\Ì\é\ìú™\Ê\ÒT\Û}\Ş2 œ¤û×›)¬\ã¤ö(¤Ú†;¥ù:)ğ†\ÚA}\Ş\ÍI­Ÿkœ--mâ¹‚T¯<}R\Òÿ\0R°\"–\ì\É\×\Z…x\ÛÇˆ/\İÿ\0¬uª\ÍphûB\îŞ£Ú‹S¬ºoöœw\\\Ş^X†s\Í	ñú„ú@B=gºú›p\ä—u\áù\È(7ü-ızŸ­\0ºrkJ$6y2\ë]A÷Iÿ\0œC\Ş\İ\â\âÛŒƒ‚©(c’VR<\Îpµd’\\$\àã ªÔ¼”–\æ4¸iiD¨6Q\Æ^\Ï$œ¯\ÂO.i\Æ:UvZ’\n“!A¶Ò·\ÙQ\Âo€08g)m\ÉX8$yP\Òı¥!\\P_	-­AjD”¨°œ‰è“•?\ÅP\Ò%;î•-nµóQÀ*²RSœ)\'ªAúŸz£\r&Ş‹!ği\âó)\êNxı@ôûTC\àŸZ\äÌ\İx\Óö\\›‡º_OcV\ÌT.B\é\àd’}+×¶©JµT®~Å¥„£\äPD±µ\Ş2ù\Ú¬øˆ<°U^§m\ZT•ZK	~ş´\èöĞ«V3¨öO?…—ø;oğ\Æ\ÚÃ·]–,—,÷WMVû—\é“…9„°“ô\r!ûÆµd°°kW5\İ\ÍiÖ—ü›d±©1‹o°Ü–\\i\Ö\Ò\ëN$¡hX\ÊTB>`ûPS};\Z·pnU\çoøÂ”|nYJ‚[Yõ,(ôAı\Ã\áö) !m\Ş\ß6Áq“\ã\èSXYm\æ$ ¡\Ä(z( ş´¹r~´	&\ŞT5£‚ó\Ş0\êy2\ç¿$ûıF¾jSÁ4N¼\Å\é-ÀBV$€–‘Ã’¬’¥\ê\ÑïœŸ­iä§7pµ©\Ç\ß!µ¼µ©	m=Nx¡]BT|\Ê}GŞªpk\Ñm\\4³1ô%\è\İ\éR’‡:>\àÇ…$G„d}\Í@M‰E¡bJ ¥¤­M¨§%`…®~E«\n\Æ\Z\ëÓ¨OIR~Fúû¤¦ÁJŒ˜ı\ãx\Úü¹\'ÿ\0\Õ=E`\Õ$¿µ;gy\Ü\ÍÁÓºJ\Öt^n1\í\ËZHi.¸¥@yı*\ç¹>Œ\í\à¿N½JI¨KM~y=!\Øl±4\å’\ßi€\Ğb\íÅ\ĞòChHJG\ØV\Ë}\0P\0\Ù\ï\'gı/¼\Öâ››\'vmcİ£$›óÀW¢ÑŸÊ¯±­\ÏM\á\Ø}M²\×^\ê÷¿muX‹tŒ	÷|Ğ¯\ÜW_l´Uq“\à y\nz\â\éZT’}\rWHa´Çœ“=„$!•©D.0ò*HIGızµR~H6òW\Z\ä$Í‰!sĞ¦\Õ\ßLJ¸¼”œ$	\à\0ü)\0¾~u_$#S~}>—\á\Ü\Ç!ax¤Aa£Õœ\àuõ§€şF\çd;3\î7j;\Ò#iû{–&‡Bf]¥«ƒhGº•Œº¯d«¯ \ëV›\É+c­½›;+\è\Î\Í\Z`[ôüa*\ìóiL\ë\Ë\í€ü•aù’|#\îTz\Ô<”@@\î\ÅnÔ–©6Ë¬&.ù(\îŞ%°´->\Ä\Zv\ì)r°¢]ÿ\0nPõ\Ö\Ú2·lJ%rX½\É?\çSû§\Ä=9PVğÓ®¶\êÛˆQBĞ´¤pAÈƒ\èhÌ¥\àš\é6\ëÕºE¹Ö \Îa\é¼Wüºÿ\0´‚p\0Œ9“\åŒÔ­8û4ü8.š\Æ\\]_¼k~4c‡Ó¥dHp£¿?\è“ûƒ\Å\ïÆ™ÁÑ=§mšR\Ï\Õg\ÙnŠ€\Û1b¶m\0{ş\r@64@@@@GnÒ½‹ô¦üG‘t‡\ÃM\ë$¦\è\ÃynIIøÇ§1\â\äPIö0\İHÛ¼t¼ı\ä•29‹«\ËÅ­	Ï…\îø¤¥c÷0WŸÉ‘@t{g;5Y¶\áqn÷y\Ò]T\ÒDù\Ã0¹c’b´I\îò\0d—U`€O*\0 \n\0 \n\0 \n\0 \n\0 \n˜ +@@@ÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\portatillnovo.jpg',0,1),(17,'dgfgf','dfdfdfd',0,NULL,NULL,0,1),(18,'asa','sdsdsd',0,NULL,NULL,0,1),(19,'aassd','aasas',0,NULL,NULL,0,1),(20,'asdsf','sdsfsff',0,NULL,NULL,0,1),(21,'portacelular','jshdjsd',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿş\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0=\0\0\0\0\0\0\0!1	Q\n\"Aaq‘2¡±Á\Ñğ\á#RrB’¢£ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0\01Q‘!qÁğñÿ\Ú\0\0\0?\0‘‘)Œ&Èˆrúü¿MK\ê\åø}ö×£ùüú\êQ\ä>\ì.\ïøü9\ê\í\îú™:(w(d@Ÿ†m@SH\éÿ\0\Ä?}U0\ä:\ä3òü:ò\åÏ—Ÿ]I¦\Ş\ï\ïòx¹:I\İ#ş\Ğÿ\0´?}C¹K?p¸ÿ\0ˆgóı\ÅMU)J \Ä\Çó\ë¦\Ş\ïµ2u<7r—¸…÷õ(y{ÿ\0Ÿº°ª\Úö\×\ÑØ´®kš{,“…\ãZ\Õu<<\âIª$“•¥.ı‘¦\İU‘Mc\"\ngT…6ÁœŠp)Ja\à>ğô/‰‡\"\ÂPö‘\0\0z\æÃ¿\Íÿ\0^½\Ä\ïfûW–\Æ÷ÜºB®\ä({`Ú•®jhH&6\îŞ¨zF˜•k\á\äbfªŸ´=Fõt\â$ºsX\â\ŞAB·@\Ëm\æ\Ûõ2N$ŸgFZª\İÔ€Q§ªº>w#P\ÂJ³Œpúƒ÷Y\Èp\ã\åÏ\ê\è<S€”[s\×	\çŒc¦0=@|C\\À£«\ÎÕ˜7	#º½¬\\W\á‹\ÅG\Æ*\éu\ÈR%¸7K<1–9€„õ—§P«’\Ôö¥\ï.¯Û•5\Z\Ö}yG1D«D\Â3E²ì¦–‡Uõz!W*£EªtLg \åQŠ\éš4¬\"‡ƒq0ˆ¦\0ox‡Pñ\êÆ­¤­-\nŠÊ®”y¯\nñŸŒÀ\Ï s\ÇNœ´\Ş\ïF»p{¨\Üu İ•c~.Mot-´EúŒ§l¤\Íw(¼\ìŒB\ãM8¨n1,ôªH+œõHx•Ş¼mº¯˜³P…* .\\Õ¿¹-¶N6Û›\Î|\î~RI7$–óm¼¶Ê-º©„!Y‚9S\0‚$\êQ)\ËÔ¾\ã”3\Ğyû´k ^@Í¼©ƒ\Æ1À¦>ŸL\è\ÔVQ\0©‰Š#\Ó\Ï\è=1sş51ú\ÏôR\ĞM!\0\0õø\0túø\ê<\â\í G\åú†ª\è)pˆ~?¶ª\0`\0İ¨\è\Ğ&wk\Ş\ç\ÇiİŸ÷ö\âE\È>·©i¿\í%³?x¢n¯n˜©JF¾bdÄ¦T\ÜK¹\Ê\Ã >\Â4\êªp”u\Ë\ê\áT\nÒ”\í8\í€Uyq¨8¶¨€\åCÁR3QU=C‘\Ï¦«¤é†‹¡‹Ò˜pC\é\Ú”v\é	P]»´\Ø9ú*\ÖS\ïu\Äh\ÑuM\Ş\Ö5\Êo)\Ê1\ã|÷bö‹Œ©¥L\n\'\ëVJ\äEBa6_·†÷\æO~—.u\ä(Mv}\î:ºp¨\"Ç¯~*›iYS´\Ù ‘õ˜©Ù«<Û‹)\èÓ”»H@-\×U\ë\æ4Ñ¤£Ÿ®Øˆ6ZE‹¦\\ \íg/K\ÔeJ\àJb¢\à\ÍÁº@B•3ûF\âó\×	O± §¦*ªæ‡†X¥T\Æ:\\\Ì\Î\ÌzK”\Ü\ÔY\á˜¤’Èˆªw$IA\âPùZ«\Ï9DAD•Nğ\ZªE?ŒİšEû8ƒş\à:\Ë&¡@Dy5\ÈôÎ”³“m¡»}òmo\ï}¡J\Ô·¶\ë pWş\ÕZÀş¦t\É\ê‚S6óñô\Ë84B‰TZ\à\"@\ÊSü»!¶¶;=\ìò\ÛU¢“Ml\æ†B\ä\Ü\à*\'EÉ®M\Ö\\õ\åV\Õğ(¸€^iµ*™°\0V\r’¦¥*\ãü?}S\ÆzˆqdGa\ÈóÀgğ\0\0\0Z†ƒ]\á[ú”<c‡ş³||>½:h\Õ+¼`-¿¨ó\ïq\Ï\Ü\é›9@ñZ4Dı\çú©j©úyşƒ¨ !\Ì?\çü\éå >ğü‡ó\rU\Ô\0 À?\Ôt¼2rbcŸJI»A„tsG/¤9T¨7dÅš*9x\íu D‘j\Ù%WUC‰¦c\à^\í#ov\ì[\í7³^ö\Ë6˜j®ò$\ÆÀ\ÒOP\ná‘®Q\\³¬¦ŠY4\à­\ËJµ\ï®\nV¯E†T*‹\"Cƒ÷›¹•÷9»=\Æ\îª`\ë=…¨«z\Î\äÂ´v Ÿº·t\ZhDZšt\Â~@›¨xŠÈ@¬«‘\åCœ9\Ù]µG¶oÑ¤\ß\İñ«\Zn.ôö\å»+\Õ*ıÁT+õ\è8«WZ\Òv\Í5À\å\nm£\ê:\í¡² t«T¼”3T-Í¼{¹Ñ·ö\ÓH3“«wAy\íõˆ¦T]%\Æ&%\Ô\ìJR²\ÎH™…Vl>™m4ªH‰B»\\2\İ1>ºjïª—µ{p\ì•\ÜÕ²l\ÓVª\Ûì–»³t»P*g*\ÈZµ­}‘H	‘GRoBÅ Y\ë\àÉŒ9Z¶>Ej*‹0ŠRõ9c\"†\ËP–9jªœ€@Œ«\ë\ËôlpQ\è³Z\nf¬¹û\Ï\İ9…%ŸR\é\Ğ[t·\Í\"œğô\Ã\æI\×5²œ\åDò‘ğ¶ú0‚»\Ñ,D€*$#€´šä§¡j)\ã-/M„Dp\nROU(8g\Ü\0\0d\ì`\Õ/\Ò\0\0™§—/(ôIQU½ƒ\ŞJk\å\\/\íu\È`Áˆº¶–=US\nf8@q\Â%\å¹\Ô>_¨\êMLn¾_O~:ó K ±®!Hje\éT)NC\0\ÈrˆrRœ¦)Š!\È@À !\È@CF©\\µŠŞ’’\\\â D’1\Ì \"\0ò\0\0ü´h2úyşƒ <şŸÎ¾z\Ó\Ï\ë\Èu}\ß?®‚m\Z4h5ût[™µ›A²5ş¼²R1\ÔœAd	ö\ÍC)#PNGSP”ô)\\6R^fZbQ£V¬\ÓY \n\î\Ü,ƒF®M…ş‘/iM’\í	—°VŠ\Å\ÎNT–êˆ„Ÿ¬ª9\Èiº*jJ½—~\Õf\âz£I9ˆ\è(8¸“•\Ûpwºòi¶YS5T\ä~v\èö¿e÷‹d«;)+wZµnWmAu#\æaf#\\õ?UÒ“ğö«)™DÑ”šfnñ³´»§	:`\á\ã7ë·\Ø3\Úy·+—p\"lå‹¸œ²ğ•\ä\í}J\Ê\Ñ\Õ,QG\Ôd”Õ¼iQ¦©š¢\áhÙ¨D)¯Qu,Ág°ªı˜õªB\ÓÑ“Û½™\Şü®\à«f4•º¤¶\ËD¹JŸûn]H˜Ù›\íxZ\Í\Òôsh\Ö\Ó\Îxª\Ëws§\Ër*ˆ) ”zbp‡ôƒwKhl/g•UE\\z=…\Ê\r\ĞL#f)\Ù#C¿ZN´¨\Æ5û\Æ,%Õ¶)ØŠ!Ê±Hõ\Z´ù”\\è›®\Ö\è\Ã.\ÚG˜¢\íõ¦oSºş\é\ÃN\ÜjZ®cj©zUŒYŠ¦¥a\"a\ëĞ¦\ÒŒ¥jµ^S ‚\Ğ\Ò,\á\×<‚fLš¯uu%iihˆï¹¥Ó¶µ¶Ïªª\â\ŞXji\Ìe»¦\Û\ÛI[•Q\Ã2¨(«\Û_SO\ê§4\å*\á“Gpµ4L\ÛiH\ÊMšG}«\æ.L«h’·t=?gÒ§•rÊ™p\â=Fn\×i+ \Ê—,£A‘œ+’	Š\n¦\n\Ê;jCT\É÷j\ÖÊ†ºz6mmjv&½ÿ\0N®w4¾ñky;²­,¼3hô-ú|¥CkXB6•Mû¥j1“mLP/$³8’·V@#›±Q6¸ãŸ¬\âM.Y[Í¶˜i„‹Z~tœ\Êm\ÜÁÁ‹B\Ä7M\Üc\íN5”d\nb\Ù\è¤C,‘S1\ïŞŠ]Ø¹U\Ö7m*ú\Öz¦¢¬mß¦iS2»WHQ4\íEF)X\ÎCD¹M²n\Ôdş¨”‘—1^º{\İ.\è\ähf\í\n“rªM\×\È<_¾|ù\çR\êcõ\ëŸ\çO.œ¿<\ê]3»ÃŠ¡\ä!\äsœtH\Şÿ\0w\ÏF§»E\Ğs\à8‹À\Æ”X¥(¦9$Ÿ¶p\0÷\ÚğÎN?O?\Ğu}\ß?¦ ~^C¨“\îùıthÔ¼e÷p8dp?€|s€\0\æ8\rj\Õ\é\Ş\æ\Òöğ\Í\Ã\ËÉ¸+[B‹Rª+°’«#\\ÌR\ìXÅŸI”\â!\ÂPQ²a\Å\Ô@\0GA´ú¤ry˜œ‡´`—À€O,0Æ›E¸OJ7av\ÄG\Ú‹‰~\æÛ•d\ÑVŸ‰$\r4w\È\ßl\É\ÄQ‰\Ô\â\0;rŞ•ø«ò\È\Æ\ØKwl,tJÀt‘•’3ŠÆ¦E\Èaª“FË€`\Æ:R\âBŸŸ\0†A\Ğ\îbnš’3\ÒÑ±\É}.ı¤c\0\äDUtùf\è1œ\åO\Ç!I]\æLvIn*€¹\Ô\Ö\ç&¬;\ØÚ¶š¦\ç¯;ª*\İCL°E²±LR7²B‚ŸŒˆ¨©“#\İÄ»m6ğñ\Ú$\Ô«\ëœEMº~\Öü\Ô\ê³-y¸-\Æ>’X\é«H[v•€B¬”Z.z\r¢$f\ÜDxD%¦Ã…{¾16\Ç/\ÙñÛ\Æ\Ş\Ô(\Ô\Ö\ï;€¸±ó-*šmSB¹¨d\ÙO,²\Ò	IS°õltŠ‚\ì\â4{\Ô]\Â\ØñÀ™† W”ü\ÕP\Õô}#UHÛˆJ¶¨eJN£ ù¤­2\Î~E´ò®\á[;ŠM\Ì\Ì\"dÜ˜{€!\Ü2•‹\İ&òDP³6{r%\æAM\Å\Ğ\É »GGvŠÈ¡j”ªŠ‡l\Ô\É,a›÷gL!Â²\Å1L,z¸6r\í\í\Âj>˜¼\Ö\ë\Ø\ê\İØºxƒ:\ÂN”|ù’\"’B£\ì\ÔMe’AÁ\È*»TL\â¡SLGŒD7kûŸ½»n¦\ê[3½[¢´e[\"\ÎBj\"•¨%*J®a…šUIœƒ\naÃ¸\Øõ‰;\è¦+•©M\ÑWA™p\ëŠ\"<„0?¨õ\ëùóÎ¡®xÏ·wµR\Ô0§ZÜ«\ïg^3‰M”-õ¢©ªº¶ªH™HP\ï©\ë\\ZNb%eS…¬¢Še¢ªd\nR»[²C´ú3´\Æ\Ò\ÜJ\Å4eyf\êøŠ2¹\Â;J¨œTPF©!\'©“OTñ-V`U›?…¨Ã–.Û•F’’l\İ&ª@§5\â2.)id¢”*oŒ\ÕP@\æPR\08”xCŒ|dq\ÌJb‡¼F¾¼ù$S³:W¸l	ˆ®·Kİ¤\0<g\â7²!\Ï\"\×´h0ö\ç÷#n¶ej\Ë\åtU-)J-O°3H’±<œ¬\åYQFRt\Ì+É½ŒŠl¬¬ü\Ë‡‘—“ˆ‹n¢òRÚ°jº\ÄCû\Ç\Úq\Ú_°U\Î\Ò,–\ÙW§48¥&\ŞøE^\nñš¦ ÷*¢\Ê!¼=G)„\ë60Í´:€ õT°\è\ëA¼\r´[}\İ\íş»°—^!\ä\ÅY¥²äŒ”{\r-/NÌ±¨i\ÉÈ©6\"Í¤!&£™H7•vµ~\Ñ\Ó5–@\ík¯=yh\îd\ìÿ\0®©u’P\ê²,\ËR*¤%0™08%)i<”xG½\ï”8µ\Ìt	‰¼;»\ÛotM,İº›€\\W:\Ô\Í\'G¯J\Ò €ˆ§\Åj\Ü\Ì\"¢\0LV(\Â\×1\Ò%’À^úú»oOT\ÕE¼§%$U0­VŞ›š­+\Ğ\â¡J\'‘’®£(\Ùs˜\Âb „2Ê¨ §	C\Ztk\í‰ö\Ïm\è\Îÿ\0¹¸\ìø»¨©\n®Y\Ê+&@\ÉRû\áDTQ@\0™2\Ê‚\" \06Kˆj½\Çv[¤c¹]ŠÑ·‚\r¸˜¯d\İY\ß^‘ \à\êšn\Ø:”hQ‡–q^F\àûÀ!‡v‡\è\å3¿da5r·\Ûe\æ\â\ÎTÜ¼§¶\ëSRu›\â ª’•%E0Šm€…\â\ã]*-R¦\0\'\0\éI\Ãh~—gK\Ùr-M×¹E\ï…©ªwû“®\ÂA°óHhjH²t#³*Q\0BJ&,ˆ#œ \ZLúwtİwvb\n\âvsC\ÓU±`zô‘•\á\éX¤\Ã\×\Ê\Ù\Ê%dz~\"y¬‚‡—\ÖPP°>!8ˆ\é-­\æ\Ş/\åØ–Gm\Û@’Jj– B¨ª\áŸH2F8“²	F	:°´\İ2)!V\Ä+¢%1ß\ÉJbª\Ğ9\Z»ô¬\íµ\Ù\ã°Z³f\Å?VŒª®Y\"­MºfTƒ…7E¢(D9;B\à¦\àsPÄŸ»\ä~ôG\Í\ÉvÀöŠn)(k³¼˜›I=Rqg¶……9$-T\Ït¥]Lp¿°\"‰Áõm‘¹°\rl] ô÷Á|Áƒ‹\ÛtXQpN15;“\êÈ¤le£š–”¢›¥	r”yª[Mºz0\ÛZ£	\Zú\ë«=pHRY\Ê\\²Š±PC1¥iòA@$ <$‘BH¥Ï·\Şc˜1ú$\rKR.\Ö\ÙYú\Òò\×\ÒnEW3‹Š†º©$¨qw!M\Zje\Ò\ÇP\Âc)=Q¹1»\Ñ(qiTldj.\èÅ“D) ²4Kó&SX©\Ò-Qj¨†L­-A¦\îiÀ¦\êJ’8\ÆK˜¹ƒVOc[U\Û\Ô[H‹]fhª}i‰™(8ÿ\0h\Äw¦jİ«xğPq\Å\Ç\ê‚p|B<\ÇlPA¨‘»dRn‚e¦‚	‘HP\Æ\nD’)(\0R€¥»kôV,\r$Œ|ö\é¯5ut\ä\ÄRZB“£D¶ş—Uq\0:œ/»ªúg 9•©*D\ÅÓ”6Ëµ¾\íÛ·µ[pµtÍ©¡\Ó|´«¨ºv5&‹\ÍL®ŠM\ÜOT2*\n²\ÕÓ„·n¤¬\Û\×\ïÁ²µ\"\ÄjŠH“aù{ÀŸAóşQüº\ã3\Ïù\ÓAn¶†È=I|†3\à0c \Ë\ÄCŸAº5® 4\è\àWk¦@ƒ\×å¼ôh21\Ô d†Àˆ`<—<t\Æ<3\î\ë¯9Š\Ğs\ÄTùûÍüÃ®\Z¼lB\à\"³v\æ\Ï!)D—Ë§ÿ\0:j\Ù{BÑ’õ˜ö\n	ƒ\'IğÀ˜¿w=\Z4ºkkVJ¢wö„¥JI»\é\ënb8uYQ+Ãœ\à;\Ìg8\çWD‹¶tÀ¦xúb—t\0T\Ä\Z£’¡€˜\àa(\0`\nRC\0-\Z4-±!#Jn›tA0\äb&€\0÷\Ü\08Ç—-xV¬ ‘È™\Ğ<—ñ\0\Îz|<4h\Ğ|…®…\Üp\â]\rœaa~#\Ç\Ç:¢[³A\î\Ô1\æÿ\0‹„Œ?†>?¦\Z\n\é\İ*\rAÀ\Ôq\Éô\æ¢Àò\È€:ó}5\ìV\â\ÑI .B¢ˆUñq„W‡„2 n€°  \r\Z4ª\ç\İ\ÊhÉ Jn=\ÉıMa\"ep@)\ÄHl\äxy‡0\ãf\Zÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',0,1),(22,'teclado','teclado inalambrico negro oscuro',0,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\Z \"\"\Zÿ\Û\0C\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0A\0\0\0\0\0\0!1Q\"Aaq2‘¡	$B’#3±²\Â%RSTdr¢³Á\áñÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\0\0!1AQaq‘\"2¡±ğ#\Ñ3BS\áÁÿ\Ú\0\0\0?\0\ß\ê\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 +Ş®õ‚\Í\Ñ\ËK¥\æ,¹)˜ùŒ\Ãq”\ÒJœ\ØW‚§V„~9\ãµ	Q´\ßqDZÿ\0hL\æa2¬ºª\"ı}•—Sù¥\Üş” p·x\İ\èô\à’õ\ê\å?\ï6™Š¡@4[üUôr\äp\ÏP,\è?ñ*[÷š¶\Û\ÖŸ]\ÂL\rq¦¥v\r]XQü·\æ€i‡s…qN\è’\ã\ÈO«.¥cô4V~¿•û@@@©ş\Ğ{`\Ğf¤mÉyŠñ>Iq¿óŠG¡Û¬’­ö÷QlŠ\Ú\ĞÀJÔ¦AóÏ¼HP=ˆl\Õ\'“•\ÒFñ\á/i\Ìõ$½Š\Ş¶<x,\Ç+\'rüÄ«¼1úüjeuGŸ9N\n\Ù\âÍ\Ùi\Ø\ÊB¶ùÈ%\ã´‘´¥_\Ô\İ$\Îú¬#ó\'\êŸğG#¡\Ó\ï\åõY\\mjg\Æ\å4YRrx<÷\ì/tO±¥Í¥Xø\ìsV¶µ7Ku^…Ë—A‡\r‰\ÖT”¨#\Ï\Ã=\ë\'ˆfŒôE½\á\Ò\é~‘\×=k{»¦*\î¹z\Zg\É	-6×˜w!\\ñ\ÎI\ïƒ\ÇzÅ¥v¬\ê\à\ì*JŸ´@@\ã\È/\ŞµŒ}\éB\ÚDy	R»‰\rŸ\î\ÍCt¬´ \ç%»9¯k¹\"$£yñ’„\íRRš\É\nÁ·Ê¡\ãS\Ö\Í,Qx¥\r‰6$¸³—m²™\ãûV€uÌŒŸÒ³–	­µ83O™:3\íÄ¸\İ\Ğ\Ê\ä¡\n[#zÀÜS“Âx\È\ãæ§‡K]É¦O…s\'õ\Ó\Ã_;Ğ™v›dw\"\\\ßS\Ê(,—RBAU\ê~\áÚ¾“†”rE\ãœ6=>\nR]\Ä?QõE\Í}<¿B™.K\È}\èm\'\Ï@9kZ°­ ÿ\0>•\çñ±ŒeQTzù±B#\É\Z\Ò\ÉOvß´:ÿ\0\nBƒ‹û>—Ç¢r™?\Ìÿ\0+Ï½JI¾h£ª\Õ&@@@xL…\áØ²\ØjDg’P\ãO -I\î\nO}h\nOYøA\é6³.¸­6›D·L‹3†)şA–\Ï\âšŠ\Ô^\ï6…-ı­P\êFJc]Y-+\éæ·\n›\"ŠcXt‹¬\Z·x\Ñò\î\Û2a¶&µ·Ô–ò >©*Tg,0–\èB¶j9‹„ó\É\Ó\×;\Øyp‰>ZÀ\nA\ä`\Ücš\è‡’\n“1\\3Œ¹ õ0µ··]lò-M6\ãÈ–\ãO<©b›-‚@¹\É?*\Ï6g‘\Û7Jr—>MêŠıöhÃ¨š¢\á¢–Úµ†ŠŠ‰÷”\êp~I5ˆz\Ï\Ğ\è}\r€(€(€(€(•©(B–¢”Œ’N0>´\ZwMõN\È.w­/\Èó·*:\ß@/;ğ…©@\'zp­¹8gœ€©u·‚}©\\¹I¶\Ü\'Û¥\Ü§]ó\Âf6V¡‚¡¼oJ¸\î@JødğÖ¾‚JüËº.“.®4\Û+m*J[a°H\â*R‰\ïÀO=\è\rƒ \n\0 \n\0 \n\"\ïª\ì6\0M\Úõm·\ÜË”\Û_\â\"€[·u§@]\î\ÍZ j\Ë\\©\Ï­¡‡·…@¡\îş´2\\uUÎ¥¦}\âU£º^„¨~æ€¯µ÷Vt“ú?PB‰|isdÀ\Ë\nm—J	\Âvƒ\Ü\ĞNuG\é\Ëdˆ¨}\×´!¶—\r¶\Â\\Û€@YHX}\Ò*bLÿ\0ñT-\ÚV\á#\ÑO¼–\Ç\èAc.ñ`\Ô\ËbõL\Ø/2-Ç)ñ\å\Éù6³{6œF3Ae¿BB€À»\ß-š~¶]®1-ñ7y\Ò\ŞKH\Ü{\r\Ê gŠ¥¼ø¨\éÅ•\Ù,¹r’ó‘Ò¢ \Ôec)I^2q\İ Ÿ¥´W÷\ïzn3²Zµ\ÅCŠfJ#m’¥!y_\ÜR†@?ó1\È\ng_ø¬WQWjS¶™rlğ™ö·\íf8\Ç\ÚÜ¦ö)M’ Â±“€9ÁW–lqù¤½Î¼<Ÿ\\X¥.º\'·y“q\êö\Ã2\åLôSNGŸ\r”\ëvu\ÌX|+At\ã;~\'¹=ªqdf\ãmrı„yå“\\É¶•®õ¯\ÓqX\ê^¬k\ë¬_´­Ñ­\é%-Á}\æ£\Åj<w6”´•e_w±\ìšô#ÁI\Ûr7ö<Ü˜eÓ¯ME‹ü_~¹^nª\Ô\Ö\Ö#IdG&m\Ü!\ä8	J\\)O¾R€®\Üw­WŠ\é\åZ«TŸ\ç©Í’n+>­M¨Ü—r\ÔP.·qÛŠ\ä8fCÄ¸\â’Tó¥i	\'b\\\ÆNw(qŞ°Ë‹`¥Šm¾ºW±”rds\å”iyŒõK5\n<¶—%q\Şw\ÉB‘	ó9\Ây \ç ƒ\Æ>µ\Èjœ¹š­\Çz±wmDI\Û)u\â\â‚Q·i=\Æ~<c=‘Ú™ú\îÿ\0¥-VH\åWk‚¿¨`¬p\â”I=€\n³\è3F¨¬d¤\Ú]¤\ÄKÉŠÈ¤©ğ„‡\ÅXä–sPj{P\Ze\ã›]\ÆlXôsö_´\ã)&\è\ê\Ğû‰(R7aµ„({ªHQ9\Çj\Å\'ª£Rf^\Ñ2\í2l\İ,\Ü\É%)\×W)8/\ì).„uIH\îH\ìš\Å\áO«÷9ğ`X´Ro\ÌùcZ]\ã1Z-q£°\ãoùQØŒ\ÚJü\Â\Ò\È’¬%	\'8	$w\ÍWúLOu~¬\ï†y\Ã\åtuY{B#~\ìúJÙš[Âšw*XJNB>¦¯tQFË\Ïş\Çùù\êCN\Õ•*Bİ¾G\ÜÜ¦¤ù>Ğµ‚·F<¾W‚”ı\åS\Ík[\Ë,\åóI¾ƒVŒÄ«õ\Å\é·XsaÀ¶\Èp{3 ¼¬6\Ñ\'q\ä)A\\ú|\ë\Õ\à#>\Ë+‚»¥]]³\ÚN„”\Ây\æ\Ú.wr©)CiB§\0}Ï¥`¸<\ê¯\îõ2”\ÔV¬mtÄ´h9\ÒfÍº¡\Ë\Í\Õ\ç[|\îº˜\í£%)O+\'·Ò¶\â1¼<4 ÷vß†¿ğ\ä\Ç5“ˆml—\ç\ÜEŒÅµ\r\Ør\r\Å\Å3—n\r3jG9(·{\Éõ\ä\×*Œ”ŸÃ²ö\Ó3IN.\ãù:\íù\æJX\íV»„‹©U¯÷ \îXö”¨9À	\ç$ù\ã\çTzbJ·e\ã®f\ïd—»³b<:Z“\â#K°\Û[cÚ¢(€\Â|¸¤}r¡Q—t¼NU\'\âÎdv.8–›[‹PJ	$ü\0 9G\×\Íd\ÏQºy¾7\ìo\ÂyE˜‹T\Ùq„©-¶JDsÜœPÌ¦\ÊÑ¶c.K_\ÔZW¹\Äp©«Ú¬¾¿‰\ì;ü’{ªªLQ\ÓQ\ÃM(G³9„0¬y‡.e\åcÿ\0Òó§¡¬|\ë\Ğú\r£b“ho-\ÊGš”ñÂ²§1\è>\êG\ãQO¸\Ş2ŠZ\Íû\ÒjÑ»+”WjlICE-¸?²	Oùœ\äš\×-ôò\"sNş6ÿ\0<\ËS§ñn\Ì\ë\î*M\ÆkL©,3´:\Û@½¸+\Ğ+\Ê\ã\çšôó®Ï…\Ç\ï+•õ\îF3U\â0Z/±o—		&Z#\Â@Rœöµœ¬$\'¾A%i\ã\ë\\ñ\áòK\â/D\ë\ég,²EMc{Õ•·\\f*(TxòR\Û%”3+~]u[Õ”„e^™\'\á\Ís¦›JLºM_*\ÔFm»‡ôºF2\íğˆ €[Kg\İ ’®U·?ñÍ®\'¯‡¿Rµ;†Šºût=ôÍ¦t›{S\áOÚ‰¯n§bd-e\Â=Ó»Œ\ê¦j)E.\í}YHJw‘´´zz.¦\Ùøg»G·u‡½\Él\Ü/3\àYRIŠ\áa¢ÊœNr¤2ø¶Aô5\\\Ë\ãcƒ³\ŞoOz\È\ë µ­šF¢\Ò7»TI\ÏÀ“6#Œ·)„\î[JRH3ô\Èúô-n2œYq¶¦\Â[ª!E\È\ŞYË‹Ü²qx\Ú=V¼X©¹üQU\ßzı¿ôøwD\Ü\ÆO‘l#\ç\Ç÷¢¢¼\râ¨¸\è{³\Ñ\Ëh‰lJFHq)÷B#;~ \Zšğ4‹kiN\èK¼–§8Z´0©RZ@Q*m´„ç”¤„ƒ\È\ïüqU¤ÿ\0\Ä\éÇ“\"Iöµ^,ô:6\à\İ\Îl¥Á³8\Ë\ÈJgwº€3\éù\ÈVÑ´©:3\È\æ\Õ9§\êN\ÜM\î˜\Óv«\"cÇ•\rl©1K>[®=—’pv6\ß8 gó]œfeši\ÃD’_\Ï\Ô\ÆnØº\Ì]A\Ûóm\í\ÃU\Å\æ‹F3\í$7´\çy\\œ’y\Èô¨Å’R”c•ü7®ßŒ\ç$\ÚÜ›\×\â\İõ™_a½11\×\äGšR•‡›o	\nNH8*\nVqüU”\åû\ã\Ñ^cı´²oZˆ­\é\Ç\Ğ\Õ\ã~šw\Ø\Ü)1ˆÀ’´ ı\â@\ç\éDòv|µ§‘Fñv¼\îZ¥\Ş\ë¸Ã¥\"Ì·›L9¶\ÙQŸmhq\ï\İT†\Ğ³08\Íe,Š\×qN\ÓpË–W¿]z›\áI\Ş\ïú¦Ï¨]\Ó\Í\"\ËhzSé½¨\ÖòiHòû`­Á_Á\ïûØ¬¤\í¶u\â,WC}*†¡@)\\:]£n¸\ì­3k[®(©kÒ•(“’Iæ€•\Ğ\Êı\0–«2G÷*–E:¢\ZN¦RZ²1/\ÚÉŸûÁH\ï\Î\Ñô©±H÷•\Ñ}3>n”µóş£[?ÃŠ‹ˆi¾ºs-µ¥6J±)Ô”üÇ¼G\éSb‘F\Üü\êt¼÷\Ù÷ûK\ì/\Ú\ãk)\Ï\ÂT3Š›#”VŸ\áO¨\Ì\å1i”o*n3ü\Ér±n\á\áÏ©ğòU¥x‹Ysüõ:\nb´\îkø!E\í}\0wR!)cóH4\ĞQ!Ó‡j®¡j†­[\'Z ·…Ì™6*\ÛK\r\ç\à\åÁ#\ã\ÉÀ¦\èD÷GH\à\Âb\İˆ‘šCQ\ØB[m´$%)H\0Àü*¥‘“PX(€(€(€(€0( P\0Pÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\teclado-gamer-esca-gxt-853.jpg',0,1),(23,'teclado inalabrico','hola,teclado',0,NULL,NULL,0,1),(24,'jolsjsh','hdhdjdjd',0,NULL,NULL,0,1),(25,'akdjskfjasf','ksdispdjfidfk			',0,NULL,NULL,0,1),(26,'teclado','gfghjj',0,NULL,NULL,0,1),(27,'ksksjdj','jdhddd',0,NULL,NULL,0,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_factura`
--

DROP TABLE IF EXISTS `producto_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_factura` (
  `idproducto_factura` int NOT NULL AUTO_INCREMENT,
  `producto` int NOT NULL,
  `factura` int NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` float NOT NULL,
  `total_venta` float NOT NULL,
  PRIMARY KEY (`idproducto_factura`),
  KEY `producto_idx` (`producto`),
  KEY `factura_idx` (`factura`),
  CONSTRAINT `factura` FOREIGN KEY (`factura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_factura`
--

LOCK TABLES `producto_factura` WRITE;
/*!40000 ALTER TABLE `producto_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL,
  `tipo_docu_pro` varchar(45) NOT NULL,
  `nombre_pro` varchar(45) NOT NULL,
  `telefono_pro` varchar(13) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion_pro` varchar(250) NOT NULL,
  `tipo_persona` varchar(100) NOT NULL,
  `sexo_pro` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `condicion_pro` tinyint NOT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `sexo_idx` (`sexo_pro`),
  CONSTRAINT `sexo_pro` FOREIGN KEY (`sexo_pro`) REFERENCES `genero` (`idgenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1077473,'nit','Hibi','2134','hibi.com','porvenir','Juridica',1,'2023-10-16',1),(1627363,'nit','arnol','2345','sfdf','medrano','juridica',2,'2023-10-16',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador',1),(2,'usuario',1),(3,'invitado',1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `tipo_docusu` varchar(60) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `rango` int NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `sexo` int NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `login` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `sexo_idx` (`sexo`),
  KEY `rango_idx` (`rango`),
  CONSTRAINT `rango` FOREIGN KEY (`rango`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sexo` FOREIGN KEY (`sexo`) REFERENCES `genero` (`idgenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2222,'CÃ©dula de ciudadanÃ­a','ana',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','123',1),(107780,'CÃ©dula de ciudadanÃ­a','Eliza',1,'31456','hsjshdd',2,'medranosur','2023-10-17','admin','12345',1),(134560,'CÃ©dula de ciudadanÃ­a','Camila',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','1111',1),(1077345,'CÃ©dula de ciudadanÃ­a','marcelaaaaa',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','1010',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tiendacom_wendy'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cliente`(in idcli int, in nom varchar(45), in tele varchar(250), in correo varchar(100),
in dire varchar(250), in sexocli int, in fecha_naci date)
BEGIN
update cliente set nombre= nom, telefono= tele, correo= correo, direccion= dire, sexo_cli= sexcli, fecha_nacimiento= fecha_naci where idcliente= idcli;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_producto`(in idproduc int, in nom varchar(45), in descrip varchar(250), in img LONGBLOB, in ru varchar(450))
BEGIN
update producto set nombre= nom, descripcion= descrip, imagen= img, ruta= ru where idproducto= idproduc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_proveedor`(in idprovee int, in nom varchar(45), in tele varchar(13), in correo varchar(100), 
in dire varchar(250), in tipo_per varchar(100), in sexo_pro int, in fecha_nacimi date)
BEGIN
update proveedor set nombre_pro= nom, telefono_pro= tele, correo= correo, direccion_pro= dire, tipo_persona= tipo=per, sexo_pro= sex_pro, fecha_nacimiento= fecha_nacimi where idproveedor= idprovee;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_usuario`(in idusua int, in nom varchar(45), in rang int, in tele VARCHAR(13), in correo varchar(100),
in sex int, in dire varchar(250), in fecha_nacimien date, in contra varchar(45))
BEGIN
update usuario set nombre= nom, rango= rang, telefono= tele, correo= correo, sexo= sex, direccion= dire, fecha_nacimiento= fecha_nacimien, contrasena= contra where idusuario= idusua;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_cliente`(in valor int)
BEGIN
select * from cliente where idcliente = valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_producto`(in valor int)
BEGIN
select * from producto where idproducto = valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_proveedor`(in valor int)
BEGIN
select * from proveedor where idproveedor = valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_usuario`(in valor int)
BEGIN
select * from usuario where idusuario = valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_cliente`(in valor varchar(45))
BEGIN
select * from mostrar_cliente where idcliente like concat('%',valor,'%') || tipo_doc like concat('%',valor,'%') || nombre like concat('%',valor,'%') || telefono like concat('%',valor,'%') || correo like concat('%',valor,'%') || direccion like concat('%',valor,'%') || genero like concat('%',valor,'%') || fecha_nacimiento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_producto`(in valor varchar(45))
BEGIN
select * from mostrar_producto where idproducto like concat('%',valor,'%') || nombre like concat('%',valor,'%') || descripcion like concat('%',valor,'%') || cantidad like concat('%',valor,'%') || precio like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_proveedor`(in valor varchar (45))
BEGIN
select * from mostrar_proveedor where idproveedor like concat('%',valor,'%') || tipo_docu_pro like concat('%',valor,'%') || nombre_pro like concat('%',valor,'%') || telefono_pro like concat('%',valor,'%') || correo like concat('%',valor,'%') || direccion_pro like concat('%',valor,'%') || tipo_persona like concat('%',valor,'%') || genero like concat('%',valor,'%') || fecha_nacimiento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_usuario`(in valor varchar(45))
BEGIN
select * from mostrar_usuario where idusuario like concat('%',valor,'%') || tipo_docusu like concat('%',valor,'%') || nombre like concat('%',valor,'%') || rango like concat('%',valor,'%') || telefono like concat('%',valor,'%') || correo like concat('%',valor,'%') || genero like concat('%',valor,'%') || direccion like concat('%',valor,'%') || fecha_nacimiento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cliente`(in idclien int)
BEGIN
update cliente set condicion= '0' where idcliente= idcli;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_producto`(in idproduc int)
BEGIN
update producto set condicion= '0' where idproducto= idproduc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_proveedor`(in idprovee int)
BEGIN
update proveedor set condicion= '0' where idproveedor= idprovee;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_usuario`(in idusu int)
BEGIN
update usuario set condicion= '0' where idusuario= idusu ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso`(in usua varchar(100), in contra varchar(45) )
BEGIN
select login, contrasena from usuario where login=usua && contrasena=contra && condicion = '1' ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_cliente`(in idcliente int, in tipo_doc varchar(60), in nom varchar(45), in tele varchar(250), in correo varchar(100),
in dire varchar(250), in sexocli int, in fecha_naci date)
BEGIN
insert into cliente values (idcliente, tipo_doc, nom, tele, correo, dire, sexocli, fecha_naci, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_detalle_factura_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_detalle_factura_compra`(in id_factcomp int, in id_produ int, in cant_compra int, in pre_unita_compr float)
BEGIN
insert into detalle_factura_compra (id_factcompra, id_producto, cantidad_comprada, precio_unitario_compra, precio_total_compra) values (id_factcomp, id_produ, cant_compra, pre_unita_compr, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_factura`(in id_cli int, in id_usu int, in tip_pago varchar (100))
BEGIN
insert into factura(fecha, cliente, usuario, tipo_pago, impuesto, total_factura) values (current_date(), id_cli, id_usu, tip_pago, '0.19', '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_factura_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_factura_compra`(in id_provee int, in id_usua int, in tip_pago varchar(100), in descue float)
BEGIN
insert into factura_compra (id_proveedor, id_usuario, tipo_pago, descuento, total_compra, fecha_compra) values (id_provee, id_usua, tip_pago, descue, '0', current_date());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_producto`(in nom varchar(45), in descrip varchar(250), in img LONGBLOB, in ru varchar(450))
BEGIN
insert into producto (nombre, descripcion, cantidad, imagen, ruta, precio, condicion) values (nom, descrip, '0', img, ru, '0', '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_producto_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_producto_factura`(in id_produc int, in id_fact int, in cant int, in descu float)
BEGIN
insert into producto_factura (producto, factura, cantidad, descuento,total_venta) values (id_produc, id_fact, cant, descu, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_proveedor`(in idproveedor int, in tipo_docu varchar(45), in nom varchar(45), in tele varchar(13), in correo varchar(100), 
in dire varchar(250), in tipo_per varchar(100), in sexo_pro int, in fecha_nacimi date)
BEGIN
insert into proveedor values (idproveedor, tipo_docu, nom, tele, correo, dire, tipo_per, sexo_pro, fecha_nacimi, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_usuario`(in idusuario int, in tipo_doc varchar(60), in nom varchar(45), in rang int, in tele VARCHAR(13), in correo varchar(100),
in sex int, in dire varchar(250), in fecha_nacimien date, in log varchar(45), in contra varchar(45))
BEGIN
insert into usuario (idusuario, tipo_docusu, nombre, rango, telefono, correo, sexo, direccion, fecha_nacimiento, login, contrasena, condicion) values (idusuario, tipo_doc, nom, rang, tele, correo, sex, dire,fecha_nacimien, log, contra, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mostrar_cliente`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cliente` AS select `cliente`.`idcliente` AS `idcliente`,`cliente`.`tipo_doc` AS `tipo_doc`,`cliente`.`nombre` AS `nombre`,`cliente`.`telefono` AS `telefono`,`cliente`.`correo` AS `correo`,`cliente`.`direccion` AS `direccion`,`genero`.`nombre` AS `genero`,`cliente`.`fecha_nacimiento` AS `fecha_nacimiento` from (`cliente` join `genero` on((`genero`.`idgenero` = `cliente`.`sexo_cli`))) where (`cliente`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_factura`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_factura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_factura` AS select `factura`.`idfactura` AS `Factura`,`usuario`.`nombre` AS `Empleado`,`cliente`.`nombre` AS `Cliente`,`factura`.`fecha` AS `Fecha compra`,`factura`.`tipo_pago` AS `Tipo de pago`,`factura`.`impuesto` AS `Impuesto`,`factura`.`total_factura` AS `Total` from ((`cliente` join `factura` on((`cliente`.`idcliente` = `factura`.`idfactura`))) join `usuario` on((`factura`.`usuario` = `usuario`.`idusuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_producto`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_producto` AS select `producto`.`idproducto` AS `idproducto`,`producto`.`imagen` AS `imagen`,`producto`.`nombre` AS `nombre`,`producto`.`descripcion` AS `descripcion`,`producto`.`cantidad` AS `cantidad`,`producto`.`precio` AS `precio` from `producto` where (`producto`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_proveedor` AS select `proveedor`.`idproveedor` AS `idproveedor`,`proveedor`.`tipo_docu_pro` AS `tipo_docu_pro`,`proveedor`.`nombre_pro` AS `nombre_pro`,`proveedor`.`telefono_pro` AS `telefono_pro`,`proveedor`.`correo` AS `correo`,`proveedor`.`direccion_pro` AS `direccion_pro`,`proveedor`.`tipo_persona` AS `tipo_persona`,`genero`.`nombre` AS `genero`,`proveedor`.`fecha_nacimiento` AS `fecha_nacimiento` from (`proveedor` join `genero` on((`genero`.`idgenero` = `proveedor`.`sexo_pro`))) where (`proveedor`.`condicion_pro` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_rol`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_rol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_rol` AS select `rol`.`idrol` AS `id`,`rol`.`nombre` AS `nombre` from `rol` where (`rol`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_sexo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_sexo` AS select `genero`.`idgenero` AS `id`,`genero`.`nombre` AS `nombre` from `genero` where (`genero`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_usuario`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_usuario` AS select `usuario`.`idusuario` AS `idusuario`,`usuario`.`tipo_docusu` AS `tipo_docusu`,`usuario`.`nombre` AS `nombre`,`rol`.`nombre` AS `rango`,`usuario`.`telefono` AS `telefono`,`usuario`.`correo` AS `correo`,`genero`.`nombre` AS `genero`,`usuario`.`direccion` AS `direccion`,`usuario`.`fecha_nacimiento` AS `fecha_nacimiento` from ((`usuario` join `rol` on((`rol`.`idrol` = `usuario`.`rango`))) join `genero` on((`genero`.`idgenero` = `usuario`.`sexo`))) where (`usuario`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-07 12:01:54
