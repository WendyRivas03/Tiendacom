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
INSERT INTO `cliente` VALUES (1098,'CÃ©dula de ciudadanÃ­a','Maria Camila','67187','marialamejor@hotmail.com','caraÃ±o',2,'2023-10-16',1),(1099,'CÃ©dula de extranjerÃ­a','fernando','303009','fernandj@hoshdd','centro',2,'2023-11-05',1),(1111,'CÃ©dula de ciudadanÃ­a','Samuel','345','dfghh@hot.com','Porvenir',1,'2023-11-06',1),(1297,'CÃ©dula de extranjerÃ­a','Jhon mario','4444567','jhonelsexy','cabi',2,'2023-10-16',1),(2345,'CÃ©dula de ciudadanÃ­a','Maria','36474','maria@','porvenir',1,'2023-11-13',1),(7338,'CÃ©dula de ciudadanÃ­a','camilo Copete','2839','CAMILA@HOTMHD','cabi',1,'2023-10-10',1),(34567,'CÃ©dula de ciudadanÃ­a','marcelo','7273','hhsgd8373','cabi',2,'2023-11-05',1),(108893,'Pasaporte','marcelino Copete','176334','marcelino@paspi','porvenir',2,'2023-11-12',1),(112233,'CÃ©dula de ciudadanÃ­a','carol Camila','6273','carolokhsh','medrano',1,'2023-11-07',1),(10773849,'CÃ©dula de ciudadanÃ­a','Yari Eliza','3637474','yarieliza@hotma','medrano',1,'2023-11-07',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `iddetalle_factura` int NOT NULL AUTO_INCREMENT,
  `producto` int NOT NULL,
  `factura` int NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` float NOT NULL,
  `total_venta` float NOT NULL,
  PRIMARY KEY (`iddetalle_factura`),
  KEY `producto_idx` (`producto`),
  KEY `factura_idx` (`factura`),
  CONSTRAINT `factura` FOREIGN KEY (`factura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto` FOREIGN KEY (`producto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (27,7,7,2,0.19,1944000),(28,7,7,5,0.19,4860000);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizar_total_venta` BEFORE INSERT ON `detalle_factura` FOR EACH ROW BEGIN
set @precio :=(select precio from producto where New.producto=idproducto), NEW.total_venta= New.cantidad*@precio-New.cantidad*@precio*NEW.descuento;
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actualizar_existencia` AFTER INSERT ON `detalle_factura` FOR EACH ROW BEGIN
update producto as p set cantidad = cantidad - NEW.cantidad where NEW.producto=p.idproducto;
set @suma :=(select sum(total_venta) from detalle_factura where iddetalle_factura = new.factura);
update factura set total_factura=@suma+(@suma*impuesto) where idfactura = new.factura;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura_compra`
--

LOCK TABLES `detalle_factura_compra` WRITE;
/*!40000 ALTER TABLE `detalle_factura_compra` DISABLE KEYS */;
INSERT INTO `detalle_factura_compra` VALUES (35,9,1,5,2000000,10000000),(39,12,1,4,10000,40000),(40,12,1,4,10000,40000),(41,10,2,3,10000,30000),(47,10,2,3,20000,60000),(48,11,1,12,1980000,23760000),(49,12,2,4,40000,160000),(50,11,8,5,10000,50000),(51,10,6,3,30000,90000),(52,11,3,8,10000,80000),(53,9,4,2,50000,100000),(54,9,5,2,10000,20000),(55,9,7,1,1000000,1000000),(56,12,7,1,1000000,1000000),(57,12,5,1,10000,10000),(58,12,6,1,10000,10000),(59,12,5,1,10000,10000),(60,12,7,1,1000000,1000000);
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
update producto p set cantidad = p.cantidad + new.cantidad_comprada, p.precio = new.precio_unitario_compra + (new.precio_unitario_compra*0.20 ) where NEW.id_producto=p.idProducto;

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
  `cliente` int NOT NULL,
  `usuario` int NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `comprobante` int NOT NULL,
  `impuesto` float NOT NULL,
  `total_factura` float DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `cliente_idx` (`cliente`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (7,1099,18374,'PSE','2023-11-29',3,0.19,NULL);
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
  `comprobante` int NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`idfactura_compra`),
  KEY `id_proveedor_idx` (`id_proveedor`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compra`
--

LOCK TABLES `factura_compra` WRITE;
/*!40000 ALTER TABLE `factura_compra` DISABLE KEYS */;
INSERT INTO `factura_compra` VALUES (9,109387,107780,'Tarjeta de CrÃ©dito',19,222400000,2222,'2023-10-23'),(10,1627363,2222,'Efectivo',0.19,214200,3333,'2023-11-23'),(11,19293,134560,'Tarjeta de DÃ©bito',0.19,28429100,4444,'2023-11-23'),(12,1077473,18374,'PSE',0.19,2701300,5555,'2023-11-23');
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
-- Temporary view structure for view `mostrar_detalle_factura_compra`
--

DROP TABLE IF EXISTS `mostrar_detalle_factura_compra`;
/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_detalle_factura_compra` AS SELECT 
 1 AS `NÂ°_Detalle_Factura_Compra`,
 1 AS `NÂ°_Factura_Compra`,
 1 AS `Producto`,
 1 AS `Cantidad`,
 1 AS `Precio_Unitario`,
 1 AS `Precio_Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_factura`
--

DROP TABLE IF EXISTS `mostrar_factura`;
/*!50001 DROP VIEW IF EXISTS `mostrar_factura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_factura` AS SELECT 
 1 AS `NÂ°Factura`,
 1 AS `Cliente`,
 1 AS `Empleado`,
 1 AS `Fecha_Compra`,
 1 AS `Tipo_Pago`,
 1 AS `comprobante`,
 1 AS `Impuesto`,
 1 AS `Total_Venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_factura_compra`
--

DROP TABLE IF EXISTS `mostrar_factura_compra`;
/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_factura_compra` AS SELECT 
 1 AS `NÂ°Factura`,
 1 AS `Proveedor`,
 1 AS `Usuario`,
 1 AS `Tipo_Pago`,
 1 AS `Descuento`,
 1 AS `Total_Compra`,
 1 AS `NÂ°_Comprobante`,
 1 AS `Fecha_Compra`*/;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'portatil','dell',25,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿþ\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0A\0\r\0\0\0\0\0!\"1AQ	a2Bqbr‘$‚ð%3CRcsƒ’“¡±Á\Ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\00\0\0\0\0\0\0\0!1AQ\"aq‘¡ð#2R\áB±Áÿ\Ú\0\0\0?\0\ê\0P\0PJ\0 +@@@@@@A¯‹~÷^6›b4ô\r9w›e½\ß/m„É%l:a\nq\Ì)+‹ \àú\ÐgN\ÒÝ§\Z\ÒQn)\Õv½T„¡.V­ˆ¥-iRB’)¼/%$k@\Ô=ee¦\Ý{¢\Ü\Éaððò¶\îzÔ´Úµ©õ\Å\ï\àö‰:ô\Ì&\Ým¬¿\é8§	U\îÊ´\Ü\íù\Î2H\â´¡\ÖÁa¯éš”½»Zñrÿ\0%ø{þ2bU´¯EuN/{¾\ÙöÁÙ½\ÜZ\Ó;ƒf•1x	ƒ)ï”’O°i\î*?`k\ß1ˆ(#@V€(€(€(€(4|i7ööûi= Ë¥l\Ø,\ß0\â3\Ñ/\Ép“‘þ\í¦Þ€RöX\Ü\ë%\ÃI[m\Èi33jq\ÒrI=\0Ç¹ÀOZùƒ\Ö:=\Í;©\×\Ï\Ã&ð\ßO¯MGº/v±¼]cih\êb2’\ÝÁ+h)i\æ\ÓO©S\ë\Ëð{g­Yô]\Z¹’r\Þ~Ž|ü¹+¿sŒ6\ïÿ\0d&\Ü\Ô\ÚM\rI6sRÐ·°úJzŸ§CôÞ´\ßPZ\ß\\~’’i¥¶{£T­k:P\ël\Ù\ím-\ß\ÙB†ôÆµ¹Å„’?\Éòù¨§þÜ’Ÿ\îñ­³2¶«\ãS~†¯´L\Â\0	T\Û#\ê†÷\êZp­þŠM@&\×üK¶rƒ-/U«JNp„ˆº‘ƒdÿ\0¶Mù\è	/e¿[u\çZnnpœD˜o¥\æ\×ú)$ƒü\èú\0 \n\0 (|\ç;¶\î\âYÝª·3P!\Òücxveúc\á„ô!¬ý\èN6È£\ìÍ®¥i‹`‡û/½D™¨‰Àñ!)\n\nH\'\ËyýEs¯S\éÐ¼—¸\êc¦-týZÁ¼\èzF£uEU£E\Ê2{?8\Ù\ã\èK=U®\ç\Ç\Ð.Ê¸°©””JŽ†’\n€¡$ô\È¸Íž™JWý%†²žŸƒj\Õôk­6\ÒUk4ñ\Ê[\à‹¹¹\Òunž“¦ˆ\ìE\Ìp-.\àðQ\Îqž¤\ç¡ô5\Út?NÔµ¯Ø¬¬mþŽK©\\T·—·SºOœ>Þ«R\â¾\ër2…6\çvBzø\ë]\'K[Òz^öv|;R	ö¬ú´¤\×R\à\ÆœYH®­â²\á>ufŒc/\îD>›|¶ö}\ËVk}ló\Ò\Z¶[¢·la„8¤2\ë\îžkQ@<TR„\'©;\ÊÅ­Ò§ˆ,¾gXj\È\n\0 \n½\Zñ­°\ÚMe«XBl¶‰S\ÒU\ê¶\ÚR>\ê	z\Ì\ê\å=)\ç^|©\Ç\ÝY[‹Rº©D\ä“÷&©Ø¿\r¶%Ü¢Ø¹¶°W\ÆC‘ÀPo\Ó \ã\Ó\Ôý\ë—j.jö¤\ßf}\×\èúªzvÒ”q‡Mq\Î^s÷{Ž\å›QªF’¸0›Še\ÂTF¢>|E%=xÿ\0,`ý+X·\Òk_j4\é[\ÒøÜº²¶_s[õ}œ§c(\Û\Ç~~¸\Z+¾™ž\äÆ¹ñ9”!†`8!\0d|g©ÿ\0\Å}¥\é\Í&\Þ\Ê0•Y/rx\Ê\å/¡ñ½Bµ=F£¥ýH¬.9X\å.W\ÐjwNÁ\Ón$ÁZK‰/ŠÂ¸(\ç¡ö>¸ú\Ö/ª´»[J®­Ÿ\ÝüŸþ&uÒ¨¸µÓ¶\ëŒò»dmÜ˜§\ÝQV=°¢Q¸øzY\ç×›«Q\ÌøN\çpz“\íT7\Ñ.˜\ì‹q\Ç,\ï\çÃ“iª~\Ê:E™.w\Ä*ù0)8W\'ð[ôh6?`6\Ûm\Þ^I5P@PB@M\n¾\'›·o=—µ^—°Ü›u¸¿,¦\âe\Â\Ì~ý+t•Ÿ$Œ\ç\Äh=o~3JË­ƒœ¤\ê£q{\î/6ÿ\0V\Êe\æ\á®km\ÇI\0w\Ùð§=@úõ¯þÎH¹ôå—\Ñ~¥»·«9\×Q¦±ýÝ–wK\ç¿q\à¶>\ëI~+\å°\Ò0• ‚‘\ëö¬¯GÓ„/s]r±¿œ\ìŽ\Ù\êRòÖ¬­%…\Zî±–þ\ëeù4÷×™=†Z\ê¯\n	_‡\Èÿ\0Îµ\Ú\èW•\n\î¤\ÒP‹Ï\×c\ä9UJ\åÖ­.©Ic\Òòûp4úŸQ·9R\à§@ZòF˜ò­sW\Ö:\êÿ\0MbO—Ø·8Â¤*(=¹BY˜\åÕ¶œŒ(\äŸjÕ”±³\îbÂ‹œ’O‘\Ç\Øm¤‘»\ÛÍ£4{yWí‹«1\â3Áž\\WÙ´¬\Ö5IõÍ£\"µ›¡KÜ›\å\á‘mð˜¶\Âb$V’\ÄfKM6€„$a }\0¨<\Ó\"€³.dxœ‘%ö\ã\Çhr[®¬%	äž‚€a·#¶N\Ò\"Tk\"\\\Ôó\ØH.*1\áIKpþ_\áÖ˜\È\"\Þ\èö’Öºõ+2ð-ñJ”‹}­]\Ô~]\\\Î_I8\å*\' Z’23z\nºYf\Û\Þ}\Ã\Ì4\ë.„¨øR•øV\n¸(\'\0ŽK5=(’*k=½—h}ÀXù¸\É¥\Æÿ\0\Z0	ú¤!”“\äjŒ07r¬¥S‘\ÔIóðôPûz\Õ-&\\…ISy‹–\rz\"\Ìa2ò\èK\\^}@óÿ\0µ]·«ú;yBœs,¶¾\ç\\\Òý]Nµ\Ý%tý¸(ô\É\ç\Â\íõ\ç¡‹®#³JùE(	\0º…ƒ\ç\åšõ´½N­\ÝJ¬°óŒ?s\Íõ–—kg_Ý´Y\ë]I\ç·|vùý\Ä®\0(c¦=\ê\åZ\ßD—¹\Ì\é\ìú™\Ê\ÒT\Û}\Þ2 œ¤û×›)¬\ã¤ö(¤Ú†;¥ù:)ð†\ÚA}\Þ\ÍI­Ÿkœ--mâ¹Ž‚T¯<}R\Òÿ\0R°\"–\ì\É\×\Z…x\ÛÇˆ/\Ýÿ\0¬uª\ÍphûB\îÞ£Ú‹S¬ºoöœw\\\Þ^X†s\Í	ñú„ú@B=gºú›p\ä—u\áù\È(ž7ü-ýzŸ­\0ºrkJ$6y2\ë]A÷Iÿ\0œC\Þ\Ý\â\âÛŒƒ‚©(c’VR<\Îpµd’\\$\àã ªÔ¼”–\æ4¸iiD¨6Q\Æ^\Ï$œ¯\ÂO.i\Æ:UžvZ’\n“!A¶Ò·\ÙQ\ÂoŽ€08g)m\ÉX8$yPž\Òý¥!\\P_	-­AjD”¨°žœ‰è“•?\ÅP\Ò%;î•-nµóQÀ*²RSœ)\'ªAúŸz£\r&Þ‹!ði\âó)\êNxý@ôûTC\àŸZ\äÌ\Ýx\Óö\\›‡º_OcV\ÌT.B\é\àžd’}+×¶©JµT®~ÅŽ¥„£\äPD±µ\Þ2ù\Ú¬øˆ<°U^Ž§m\ZT•ZK	~þ´\èöÐ«V3¨öO?…—ø;oð\Æ\ÚÃ·]–,—,÷WMVû—\é“…9„°“ô\r!ûÆµd°°kW5\Ý\ÍiÖ—ü›d±©1‹o°Ü–\\i\Ö\Ò\ëN$¡hX\ÊTB>`ûPS};\Z·pnU\çoøÂ”|nYJ‚[Yõ,(ôAý\Ã\áö) !m\Þ\ß6Áq“\ã\èSXYm\æ$ ¡\Ä(z( þ´¹r~´	&\ÞT5£‚ó\Þ0\êy2\ç¿$ûýF¾jSÁ4N¼\Å\é-ÀBV$€–‘Ã’¬’¥\ê\ÑïœŸ­iä§7pµ©\Ç\ß!µ¼µ©	m=Nx¡]BT|\Ê}GÞªpk\Ñm\\4³1ô%\è\Ý\éR’‡:>\àÇ…$G„d}\Í@M‰E¡bJ ¥¤­M¨§%`…®~E«\n\Æ\Z\ëÓ¨OIR~Fúû¤¦ÁJŒ˜ý\ãx\Úü¹\'ÿ\0\Õ=E`\Õ$¿µ;gy\Ü\ÍÁÓºJ\Öt^n1\í\ËZHi.¸¥@yý*\ç¹>ŽŒ\í\à¿N½JI¨KM~y=!\Øl±4\å’\ßi€\Ðb\íÅŽ\ÐòChHJG\ØV\Ë}\0P\0\Ù\ï\'gý/¼\Öâ››\'vmcÝ£$›óÀW¢ÑŸÊ¯±­\ÏM\á\Ø}M²\×^\ê÷¿muX‹tŒ	Ž÷ž|Ð¯\ÜW_lŽ´Uq“\à y\nz\â\éZT’}\rWHa´Çœ“=„$!•©D.0ò*HIGýzµR~H6òW\Z\ä$Í‰!sÐ¦\Õ\ßLJ¸¼”œ$	\à\0ü)\0ž¾~u_$#S~}>—\á\Ü\Ç!ax¤Aa£Õœ\àuõ§€þF\çd;3\î7j;\Ò#iû{–&‡Bf]¥«ƒhGº•Œº¯d«¯ \ëV›\É+c­½›;+\è\Î\Í\Z`[ôüa*\ìóiL\ë\Ë\í€ü•aù’|#\îTz\Ô<”@@\î\ÅnÔ–©6Ë¬&.ù(\îÞ%°´->\Ä\Zv\ì)r°¢]ÿ\0nPõ\Ö\Ú2·lJ%rX½\É?\çSû§\Ä=9PVðÓ®¶\êÛˆQBÐ´¤pAÈƒ\èhÌ¥\àš\é6\ëÕºE¹Ö \Îa\é¼Wüºÿ\0´‚pž\0Œ9“\åŒÔ­8û4ü8.š\Æ\\]_¼k~4c‡Ó¥dHp£¿?\è“ûƒ\Å\ïÆ™ÁÑ=§mšR\Ï\Õg\ÙnŠ€\Û1b¶m\0{þ\r@64@@@@GnÒ½‹ô¦üG‘t‡\ÃM\ë$¦\è\ÃynIIøÇ§1\â\äPIö0\ÝHÛ¼t¼ý\ä•29‹«\ËÅ­	Ï…\îø¤¥c÷0WŸÉ‘@t{g;5Y¶\áqn÷y\Ò]T\ÒDù\Ã0¹c’b´I\îò\0d—U`€O*\0 \n\0 \n\0 \n\0 \n\0 \n˜ +@@@ÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\portatillnovo.jpg',2376000,1),(2,'Porta Celular ','Porta Celular Negro',10,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿþ\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0=\0\0\0\0\0\0\0!1	Q\n\"Aaq‘2¡±Á\Ñð\á#RrB’¢£ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0\01Q‘!qÁðñÿ\Ú\0\0\0?\0‘‘)Œ&Èˆrúü¿MK\ê\åø}ö×£ùüú\êQ\ä>\ì.\ïøü9\ê\í\îú™:ž(w(d@Ÿ†m@SH\éÿ\0\Ä?}U0\ä:\ä3òü:ò\åÏ—Ÿ]I¦\Þ\ï\ïòx¹:I\Ý#þ\Ðÿ\0´?}C¹K?p¸ÿ\0ˆgóý\ÅMU)J \Ä\Çó\ë¦\Þ\ïµ2u<7r—¸…÷õ(y{ÿ\0Ÿº°ª\Úö\×\ÑØ´®kš{,“…\ãZ\Õu<<\âIª$“•¥.ý‘¦\ÝU‘Mc\"\ngT…6ÁœŠp)Ja\à>ðô/‰‡\"\ÂPö‘\0\0z\æÃ¿\Íÿ\0^½\Ä\ïfûW–\Æ÷ÜºB®\ä({`Ú•®jhH&6\îÞ¨zF˜•k\á\äbfªŸ´=Fõt\â$ºsX\â\ÞAB·@\Ëm\æ\Ûõ2N$ŸgFZª\ÝÔ€Q§ªº>w#P\ÂJ³Œpúƒ÷Y\Èp\ã\åÏ\ê\è<S€”[s\×	\çŒc¦0=@|C\\À£«\ÎÕ˜7	#º½¬\\W\á‹\ÅG\Æ*\éu\ÈR%¸7K<1–9€„õ—§P«’\Ôö¥\ïž.¯Û•5\Z\Ö}yG1D«D\Â3E²ì¦–‡Uõz!W*£EªtLŽg \åQŠ\éš4¬\"‡ƒq0ˆ¦\0ox‡Pñ\êÆ­¤­-\nŠÊ®”y¯\nñŸŒÀ\Ï s\ÇNœ´\Þ\ïF»p{¨\Üu Ý•c~.Mot-´EúŒ§l¤\Íw(¼\ìŒB\ãM8¨n1,ôªH+œõHx•Þ¼mº¯˜³P…* .\\Õ¿¹-¶N6Û›\Î|\î~RI7$–óm¼¶ÊŽ-º©„!Y‚9S\0‚$\êQ)\ËÔ¾\ã”3\Ðyû´k ^@Í¼©ƒ\Æ1À¦>ŸL\è\ÔVQ\0Ž©‰Š#\Ó\Ï\è=1žsþ51ú\ÏôR\ÐMŽ!\0\0õø\0túø\ê<\â\í G\åú†ª\è)pˆ~?¶ª\0`\0Ý¨\è\Ð&wk\Þ\ç\ÇiÝŸ÷ö\âE\È>·©i¿\í%³?x¢n¯n˜©JF¾bdÄ¦T\ÜK¹\Ê\Ã >\Â4\êªp”u\Ë\ê\áT\nÒ”\í8\í€Uyq¨8¶¨€\åCÁR3QU=C‘\Ï¦«¤é†‹¡‹Ò˜pC\é\Ú”v\é	P]»´\Ø9ú*\ÖS\ïu\Äh\ÑuM\Þ\Ö5\Êo)\Ê1\ã|÷bö‹Œ©¥L\n\'\ëVJ\äEBa6_·†÷\æO~—.u\ä(Mv}\î:ºp¨\"Ç¯~*›iYS´\Ù ‘õ˜©Ù«<Û‹)\èÓ”»H@-\×U\ë\æ4Ñ¤£Ÿ®Øˆ6ZE‹¦Ž\\ \íg/K\ÔeJ\àJb¢\à\ÍÁº@B•3ûF\âó\×	O± §¦*ªæ‡†X¥T\Æ:Ž\\\Ì\Î\ÌzK”\Ü\ÔY\á˜¤’Èˆªw$IA\âPùZ«\Ï9DAD•Nð\ZªE?ŒÝšEû8ƒþ\à:\Ë&¡@Dy5\ÈôÎ”³“m¡»}òmo\ï}¡J\Ô·¶\ë pWþ\ÕZÀþ¦t\É\ê‚S6óñô\Ë84B‰TZ\à\"@\ÊSü»!¶¶;=\ìò\ÛU¢“Ml\æ†B\ä\Ü\à*\'EÉ®M\Ö\\õ\åV\Õð(¸€^iµ*™°\0V\r’¦¥*\ãü?}S\ÆzˆqdGa\ÈóÀgð\0\0\0Z†ƒ]\á[ú”<c‡þ³||>½:h\Õ+¼`-¿¨ó\ïq\Ï\Ü\é›9@ñZ4Dý\çú©j©úyþƒ¨ !\Ì?\çü\éå >ðü‡ó\rU\Ô\0 À?\Ôt¼2rbcŸJI»A„tsG/¤9T¨7dÅš*9x\íuŽ D‘j\Ù%WUC‰¦c\à^\í#ov\ì[\í7³^ö\Ë6˜j®ò$\ÆÀ\ÒOP\ná‘®Q\\³¬¦ŠY4\à­\ËJµ\ï®\nV¯E†T*‹\"Cƒ÷›¹•÷9»=\Æ\îª`\ë=…¨«z\Î\äÂ´v Ÿº·t\ZhDZšt\Â~@›¨xŠÈ@¬«‘\åCŽœ9\Ù]µG¶oÑ¤\ß\Ýñ«\Zn.ôö\å»+\Õ*ýÁT+õ\è8«WZ\Òv\Í5À\å\nm£\ê:\í¡² t«T¼”3T-Í¼{¹Ñ·ö\ÓH3“«wAy\íõˆ¦T]%\Æ&%\Ô\ìJR²\ÎH™…Vl>™m4ªŽH‰B»\\2\Ý1>ºjïª—µ{p\ì•\ÜÕ²l\ÓVª\Ûì–»³t»P*g*\ÈZµ­}‘H	‘GRoBÅ Y\ë\àÉŒ9Z¶>Ej*‹0ŠRõ9c\"†\ËP–9jªœ€@Œ«\ë\ËôŽlpŽžQ\è³Z\nf¬¹û\Ï\Ý9…%ŸR\é\Ð[t·\Í\"œðô\Ã\æI\×5²œ\åDò‘ð¶ú0‚»\Ñ,D€*$#€´šä§¡j)\ã-/M„Dp\nROU(8g\Ü\0\0d\ì`\Õ/\Ò\0\0™§—/(ôIQU½ƒ\ÞJk\å\\/\íu\È`Áˆº¶–=US\nf8@q\Â%\å¹\Ô>_¨\êMLn¾_O~:ó K ±®!Hje\éT)NC\0\ÈrˆrRœ¦)Š!\È@À !\È@CF©\\µŠÞ’’\\\â D’1\Ì \"\0ò\0\0ü´h2úyþƒ <þŸÎ¾z\Ó\Ï\ë\Èu}\ß?®‚m\Z4h5ût[™µ›A²5þ¼²R1\ÔœAd	ö\ÍC)#PNGSP”ô)\\6R^fZbQ£V¬\ÓY \n\î\Ü,ƒF®M…þ‘/iM’\í	—°VŠ\Å\ÎNT–êˆ„Ÿ¬ª9\Èiº*jJ½—~\Õf\âžz£I9ˆ\è(8¸“•\Ûpwºòi¶YS5T\ä~v\èö¿e÷‹d«;)+wZµnWmAu#\æaf#\\õ?UÒ“ðöž«)™DÑ”šfnñ³´»§	:`\á\ã7ë·\Ø3\Úy·+—p\"lå‹¸œ²ð•\ä\í}J\Ê\Ñ\Õ,QG\Ôd”Õ¼iQž¦©š¢\áhÙ¨D)¯Qu,Ág°ªý˜õªB\ÓÑ“Û½™\Þü®\à«f4•º¤¶\ËD¹JŸûn]H˜Ù›\íxZ\Í\Òôsh\Ö\Ó\Îxª\Ëws§\Ër*ˆ) ”zbp‡ôƒwKhl/g•UE\\z=…\Ê\r\ÐL#f)\Ù#C¿ZN´¨\Æ5û\Æ,%Õ¶)ØŠŽ!Ê±Hõ\Z´ù”\\è›®\Ö\èž\Ã.\ÚG˜¢\íõ¦oSºþ\é\ÃN\ÜjZ®cj©zUŒYŠž¦¥a\"a\ëÐ¦\ÒŒ¥jµ^S ‚\Ð\Ò,\á\×<‚fLš¯uu%iihˆï¹¥Ó¶µ¶Ïªª\â\ÞXji\Ìe»¦\Û\ÛI[•Q\Ã2¨(«\Û_SO\ê§4\å*\á“Gpµ4L\ÛiH\ÊMšG}«\æ.L«h’Ž·t=?gÒ§•rÊ™p\â=Fn\×i+ \Ê—,£A‘œ+’	Š\n¦\n\Ê;jCT\É÷j\ÖÊ†ºz6mmjv&½ÿ\0N®w4¾ñky;²­,¼3hô-ú|¥CkXB6•Mû¥j1“mLP/$³8’·V@#›±Q6ž¸ãŸ¬\âM.Y[Í¶˜i„‹Z~tœ\Êm\ÜÁÁ‹B\Ä7M\Üc\íN5”d\nb\Ù\è¤C,‘S1\ïÞŠ]Ø¹Už\Ö7m*ú\Öz¦¢¬mß¦iS2»WHQ4\íEF)X\ÎCD¹M²n\Ôdþ¨”‘—1^º{\Ý.\è\ähf\í\n“rªM\×\È<_¾|ù\çR\êcõ\ëŸ\çO.œ¿<\ê]3»ÃŠ¡\ä!\äsœtH\Þÿ\0w\ÏF§»E\Ðs\à8‹À\Æ”X¥(¦9$Ÿ¶p\0÷\ÚðÎN?O?\Ðu}\ß?¦ ~ž^C¨“\îùýthÔ¼e÷p8dp?€|s€\0\æ8\rj\Õ\é\Þ\æ\Òöð\Í\Ã\ËÉ¸+[B‹Rª+°’«#\\ÌR\ìXÅŸI”\â!\ÂPQ²a\Å\Ô@\0GA´ú¤ry˜œ‡´`—À€O,0Æ›E¸OJ7av\ÄG\Ú‹‰~\æÛ•d\ÑVŸ‰$\r4w\È\ßl\É\ÄQ‰Ž\Ô\â\0;rÞ•žø«ò\È\Æ\ØKwl,tJÀt‘•’3ŠÆ¦E\Èaª“FË€`\Æ:R\âBŸŸ\0†A\Ð\îbnš’3\ÒÑ±\É}.ý¤c\0\äDUtùf\è1œ\åO\Ç!I]\æLvIn*€¹\Ô\Ö\ç&¬;\ØÚ¶š¦\ç¯;ª*\ÝCL°E²±LR7²B‚ŸŒˆ¨©“#\ÝÄ»m6ðñ\Ú$\Ô«\ëœEMº~\Öü\Ô\ê³-y¸-\Æ>’X\é«H[v•€B¬”Z.z\r¢$f\ÜDxD%¦Ã…{¾16\Ç/\ÙñÛŽ\Æ\Þ\Ô(\Ô\Ö\ï;€¸±ó-*šmSB¹¨d\ÙO,²\Ò	IS°õltŠ‚\ì\â4{\Ô]\Â\ØñÀ™† W”ü\ÕP\Õô}#UHÛˆJ¶¨eJN£ ù¤­2\Î~E´ò®\á[;ŠM\Ì\Ì\"dÜ˜{€!\Ü2•‹\Ý&òDP³6{r%\æAM\Å\Ð\É »GGvŠÈ¡j”ªŠ‡l\Ô\É,a›÷gL!Â²\Å1L,z¸6r\í\í\Âj>˜¼\Ö\ë\Ø\ê\ÝØºxƒ:\ÂN”|ù’\"’B£\ì\ÔMe’AÁ\È*»TL\â¡SLGŒD7kûŸ½»n¦\ê[3½[¢´e[\"\ÎBj\"•¨%*J®a…šUIœƒ\naÃ¸\ØõŽ‰;\è¦+•©M\ÑWA™p\ëŠ\"<„0?¨õ\ëùóÎ¡®xÏ·wµR\Ô0§ZÜ«\ïg^3‰M”-õ¢©ªº¶ªH™HP\ï©\ë\\ZNb%eS…¬¢Še¢ªd\nR»[²C´ú3´\Æ\Ò\ÜJ\Å4eyf\êøŠ2¹\Â;J¨œTPF©!\'©“OTñ-V`U›?…¨Ã–.Û•F’’l\Ý&ª@§5\â2.)id¢”*oŒ\ÕP@\æPR\08”xCŒ|dq\ÌJb‡¼F¾¼ù$S³:W¸l	ˆ®·KÝ¤\0<g\â7²!\Ï\"\×´h0ö\ç÷#n¶ej\Ë\åtU-)J-O°3H’±<œ¬\åYQFRt\Ì+É½ŒŠl¬¬ü\Ë‡‘—“Žˆ‹n¢òRÚ°jº\ÄCû\Ç\Úq\Ú_°U\Î\Ò,–\ÙW§48¥&\ÞøE^\nñš¦ ÷*¢\Ê!¼=G)„\ë60Í´:€ õT°\è\ëA¼\r´[}\Ý\íþ»°—^!\ä\ÅY¥²äŒ”{\r-/NÌ±¨i\ÉÈ©6\"Í¤!&£™H7•vŽµ~\Ñ\Ó5–@\ík¯=yh\îd\ìÿ\0®©u’P\ê²,\ËR*¤%0™08%)i<”xG½\ï”8µ\Ìt	‰¼;»\ÛotM,Ýº›€\\W:\Ô\Í\'G¯J\Ò €ˆ§\Åj\Ü\Ì\"¢\0LV(\Â\×1\Ò%’À^úú»oOT\ÕE¼§%$U0­VÞ›š­+\Ð\â¡J\'‘’®£(\Ùs˜\Âb „2Ê¨ §	C\Ztk\í‰ö\Ïm\è\Îÿ\0¹¸\ìø»¨©\n®Y\Ê+&@\ÉRû\áDTQ@\0™2\Ê‚\" \06Kˆj½\Çv[¤c¹]ŠÑ·‚\r¸˜¯d\ÝY\ß^‘ \à\êšn\Ø:”hQ‡–q^F\àûÀ!‡v‡\è\å3¿da5r·\Ûe\æ\â\ÎTÜ¼§¶\ëSRu›\â ª’•%E0Šm€…\â\ã]*-R¦\0\'\0\éI\Ãh~Ž—gK\Ùr-M×¹E\ï…©ªwû“®\ÂA°óHhjH²t#³*Q\0BJ&,ˆ#œ \ZLúwtÝžwvb\n\âvsC\ÓU±`zô‘•\á\éX¤\Ã\×\Ê\Ù\Ê%dz~\"y¬‚‡—\ÖPP°>!8ˆ\é-­\æ\Þ/\åØž–Gm\Û@’Jj– B¨ª\áŸH2F8“²	F	:°´\Ý2)!V\Ä+¢%1ß\ÉJbª\Ð9\Z»ô¬\íµ\Ù\ã°ZŽ³f\Å?VŒª®Y\"­MºfTƒ…7E¢(D9;B\à¦\àsPÄŸ»\ä~ôG\Í\ÉvÀöŠn)(k³¼˜›I=Rqg¶……9$-T\Ït¥]Lp¿°\"‰Áõm‘¹°\rl] ô÷Á|Áƒ‹\ÛtXQpN15;“\êÈ¤le£š–”¢›¥	r”yª[Mºz0\ÛZ£	\Zú\ë«=pHRY\Ê\\²Š±PC1¥iòA@$ <$‘BH¥Ï·\Þc˜1ú$\rKR.\Ö\ÙYú\Òò\×\ÒnEW3‹Š†º©$¨qw!M\Zje\Ò\ÇP\Âc)=Q¹1»\Ñ(qiTldj.\èÅ“D) ²4Kó&SX©\Ò-Qj¨†L­-A¦\îiÀ¦\êJ’8\ÆK˜¹ƒVOc[U\Û\Ô[H‹]fhª}i‰™(8ÿ\0h\Äw¦jÝ«xðPq\Å\Ç\ê‚p|B<\ÇlPA¨‘»dRn‚e¦‚	‘HP\Æ\nD’)(\0R€¥»kôV,\r$Œ|ö\é¯5ut\ä\ÄRZB“£D¶þ—Uq\0:œ/»ªúg 9•©Ž*D\ÅÓ”6Ëµ¾\íÛ·µ[pµtÍ©¡\Ó|´«¨ºv5&‹\ÍL®ŠM\ÜOT2*\n²\ÕÓ„·n¤¬\Û\×\ïÁ²µ\"\ÄjŠH“aù{ÀŸAóþQüº\ãž3\Ïù\ÓAŽn¶†ÈŽ=I|†3\à0c \Ë\ÄCŸAº5® 4\è\àWk¦@ƒ\×åŽ¼ôh21\Ô d†Àˆ`<—<t\Æ<3\î\ë¯9Š\Ðs\ÄTùûÍüÃ®\Zž¼lB\à\"³v\æ\Ï!)D—Ë§ÿ\0:j\Ù{BÑ’õ˜ö\n	ƒ\'IðÀ˜¿w=\Z4ºkkVJ¢wö„¥JI»\é\ënb8uYQ+Ãœ\à;\Ìg8\çWD‹¶tÀ¦xúb—t\0T\Ä\Z£’¡€˜\àa(\0`\nRC\0-\Z4-±!#Jn›tA0\äb&€\0÷\Ü\08Ç—-xV¬ ‘È™\Ð<—ñ\0\Îz|<4h\Ð|…®…\Üp\â]\rœaa~#\Ç\Ç:¢[³A\î\Ô1\æÿ\0‹„Œ?†>?¦\Z\n\é\Ý*\rAÀ\Ôq\Éô\æ¢Àò\È€:ó}5\ìV\â\ÑI .B¢ˆUñq„W‡„2 n€°  \r\Z4ª\ç\Ý\ÊhÉ Jn=\ÉýMa\"ep@)\ÄHl\äxy‡0\ãf\Zÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',48000,1),(3,'MEMORIA','KISTONG 64',8,_binary 'ÿ\Øÿ\à\0JFIF\0\0%\0%\0\0ÿ\Û\0C\0	\n\n			\n\n		\r\r\nÿ\Û\0C	ÿÀ\0\0h\0`\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0<\0\0\0\0\0\0!1AQV•\Ô	\"a2BRq#3br’S‘¡²ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AQa\"q±Á2‘\Ñ\áð¡Bÿ\Ú\0\0\0?\0Šz5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ð\Ð…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4¡STþ>Ê¯5¸ú\ZÐ©ªeWš\Ü}\r\0\èT\Õ?²«\Ín>†€t*jŸ\Ç\ÙU\æ·C@:5O\ã\ìªó[¡ \nš§ñöUy­\Ç\Ð\Ð…MSøû*¼\Ö\ã\èhB¦©ü}•^kqô4\Ô\Ð\n@(\0 €P\n@(\È/1mª\Ål$\Âf\Ú[i\×Š\Ù+B\Ò~‰$Ý¸\ï <¼M›Xo[#\â<Uˆ¢Aµ=!\Û„­µ¸²BR\nºö<ú¹U´¨T¯\'\Zqm¥º\"ª\Õ\éPŠ•Y$›\Êý^ˆy·\ÚC\Í()I ò\"ª-?thÏ{eGb™˜\èw+þ\"€„™1a¥¶ B\ÜQ\Ø+b	\0·«£J9)T–]µ¿\ÙDªÏ‹†œsÿ\0Y1W´»:qcˆ‡–ø\Z\ÑcnS¥†~%\Õ/m\ÂAYJ8¾›T¸\è\Ç\å‹~o\Ù}\ÌpV—\Í$¼—»ûf†µU‹³F\í|\Êü\àŸÇ‹ ­ra­\Ö\Â\Üm<d¥ $}[\ìOuS9q¼ò\ËÈº\àYgŸ™qª$…\0 €µA\nÉ„-(\Íûƒ±‰mGÁ^[’ –\æBw\äSj\ï$ºùƒøj\Ê1œ¦¸5WòÈª´  øôvó+4{\ä¾\Ã\Ñð®På¬©–\È|F+rŒ‚TU¸‰G\æ$öu×ª¤\á9ºµª9I\ë’÷yzZPœ)Æ•\Zj1Zfý–~§v×Ž§±T‡Á\Ð!Y˜Š!q¡A;\î\É\äO¼\ÝD]C´w\Õ.­%hC\ê\Ûû\"\åJ¬žsŸ\Ñ%÷eÿ\0Ó–v\Ú3\ç,-\Ø\Î\ÛEÁ)®±Ry±) q\r¿*¾ò~‡\èk\ÎzL\ÇöŒe5\Û.5pÆ§\Þ=m\Å\ç\í6#ñ’\ëd÷¥CýTš“½\È\ÅebÁóÛÇ‘-\ây+Iù\ã>9\Ç}\'ü÷õÞ¢H\Û\ÅX‹b{\áQð·‹,\Ð\Ý\å„7·º”—\åÂÀ\àWO\Þ\áû\Û\ï¹`ò»0\ìy­€l¸ÿ\0:\ï/po¹iÎ¥¶¯ªT?¥\ÕP\n@(\n‰\í:Áx\Ã\é\Û\âð\Ù.\Û\ìw&\îˆ\è­q\ÂT\àÛ±\nPQ\Üû*\È?¢µeS^(\ÉèŒÃ—%¶¥\Û$™\äß¶«-&\Ü7ˆ¦a\ÄÁº|B]¹ÂŒC\ì•|t’P\ë\\C˜RAW_>[ur &½=\çZvÍ›mþ<´¯/ñ\ÃL&[h üCd¾¶’\0eAÄºB?(X€\rsõ©’±3\ç!\ç¦\Ð\Ër\îöf\â\Ð\ã{(º7[i=¡m\ï·y¬«ØŒ­s¢-øn½muJJ›<$o·w\í¬;7³4C‰(H·B[\×+o\ÙòÜ–®0¥‚_Byl\à@ ¸\Ü\ï¶\àlºöc\êJŸ\Ê\É\ÝÝµ\Û\ï‹÷ö¢§930m\ìzƒ‰\ì‘\ßM§”€P\n\å¹\Û`^m²­H­É‡5•ÇËƒt¸\Ú\ÒR¤‘\Ú$Q<žh\ÃI¬™…Z»\È[–3šå†šm\ÕZœW\ÇY¤(Z\É\áö©tªw\í©M/™h\ÈÁÿ\0\Ë\Õ¾Å“\Øj\È/€¨O\Û#t¨€7\ëØ\ÌTI’ø\Ûµd½aý¦Ì¶\Üã‰°!´\â\ÚDŠ”7\ã\â$))«p\n‰;€¥P\Ï\ÙÛ©ð¹ÉœY;ŠõagŽ\Ö\ãªù¤\Âmó\ëSüŸ\í )§´\"•’ù\Ý.\ïg†Z°\â2«¤\ì„q«ù­ðY;Ê¤\Ö]\îEZÇ¥“w‚?… \â6­ñ\çNšß¼vK\ÉRU¿\Üý\Ð:¶\Õ7gf\à–ˆ\ÅJRÕ¾O§ôrý\ä\Ú8\ß\æ\Ï)8\Åh—N§\ë7²õi·±ŽpDTB\Äøq\ÔÏ„üdð8\ç»<E½\Ç^\àrúVoÄ¥Âº´b•H\ÝeÏ±\r\Þ\ÛU0x•N´³„­~]\Í+Ò®|Zõ“V\\y\ä}¢nÌŽE©h‹—`W%\×n\Ê\ä\ÇU%ú@(Yõ\í§4g\ÎNH›d„\ÅXU.\\-œ)ù\ä7·ó£ýx’7ó%=õ8_\Âù•\Î\Þ5\Ë\ÐÅ«L¥\Ún\n„ð)mgm•\ËcP\ÓR\Âw\ÊÌ¥gYÿ\0‰ñ©†\ë\Î5$up¥\n\á+q}|\È;%;r“Î·m\ßÝšXú‰m§¢VÓ©¥\íýä«®ð¸d³Z·ß¡\"Z°$¼¹¿\Ûñ\æVÉ“l\ÄG\Ó**W!n3 §­¥…’@P\Ý;ƒ·>`Šú\ÛGtp\Õ)7„\\3Z]´û\\ù{;{1ª–-ñA\ëlš\ïb\à\çÅŸ\ëcI	\Ç8N Uö\Î\Ò\î\Å\Ûw£\Êi;J†¡\Ö	\0\ì;JPk›8¸·	YûII)\Æ\ë\Ø\Ï]9\ã\ã‡\î30\áþ\ÝQvY\Û\ç\íHýEn[µ´°u_†W^•\èjÝ³\"”qt×Š6~_‚\Íû¨¼2¼$lw<«¤\Ý\Ø\ç6GÉ§,gK\Ù\ì\Ãh˜¶pc\ÉøI¬¸¿\åÛ®$•!c¹• +úW.ÞŠ¶}U‰¥òMýÙ7v6\Ë\Ç\Òxz¿<?\Õ÷FÁ­H\Ú\Ï\í\0 €\Æ\ïi›Pfª±\Æ\Z\î°\Î1qÉŒ{´ìˆ³w\Ýö~€“Æ‘Ü¢;*\Éx—Ô®>Áôý\ìr:f\Ìèª‚\æ½8\Z%\Æý`þü\ë{\Ý\r®¡ªû¯thûÙ²ä±´\×g\ì\Ë\ä«GRf´½úƒj\â\'ô·ïŽ\áI~œ3\Ö~œµ/bÇ‹X2\ä…/úpg\ìžg¼(÷W\'Þœð¸\éVk\Ã7Ÿ÷\Ì\ê{±Ž†\'\Z9ø¡g\åÈ‰µ\å’OdvxÈ¼\á\ÖK[\ÚþÙµ8\ß\ÝBV­\Ö\ÚHüŽo·ö”Ö½Êœ•H<šõ>û„gNwO\Ð÷ð^ua,Qb&uþ\r¾\â\Óa2\ã\Ét4BÀ\æ¤\ïÖ“×½uÍ›¼8\\f2œ\Ôd•\Óy\\\å;Gwñ8:\î0ƒ”^\\‰uVÝª6\Â3\Ó9\æf·1ùo\î\Û-\ïÂ„\ÄI<\È\å°Û¶µ\éÛ˜|e%„Ã¾+\æ\ß+rFÉ»¾«\ÅW\\6\É.w\æ\Íc\ÐþnL\Î\r>\Ø\î\×w‹·[Fö™«Q\ÝKSIIBÔ¶¤n{Á­\Ý\Éö€P\n@Eú’\É+F 2Žõ——¡Ÿo\â-’T71¦ \Òÿ\0MþSýª5(IE\ßFBqm[S	o\åa½\å\rp\î6Y«23ƒn¢• ý9\Zºj˜:\ê¤\âóýó*«Jº.œô’È³N\ê&lv\æe\Ü/¡‰N0‡Œ6c8·G\ßnI\Øþ»\í]R–ôlµB5\\ò“WY<\Ó\ès\n›³´\åZT”sŠvy¬š\êU\Ü÷\Ï\ÙÙ¥{„›<m¶[S…\È\ÈYù\×?\ì^Ü†Ã©#}·<\Íh»Á·žÙœc”#¦z¾\ì\Ýö\Ã[\"\r\Í\ç9k\ÑvE\ãË¼Sÿ\09´‹#/®J\ÌÜ±dK·nwv\á$%H¤”l6ü\Éo\ëZú\è}\éZ\åºZŸ‡-\Ëtö–…4¢”•\'˜\ç\ÔA¨´I>hû0þr\å5–bFz[\ËX\r¶”¹\ì\ä:\ë)7da´®Í±Ð†L\ßrk#c\Ã\Å-.=\Úý)WW\â¬l¨\èR–Ð¡Ø®‚GgÝ•ƒ%Œ €P\n2}ªZjgF\Ô´y\åqO$>\Ì\È;~`8{\Â{\êÏž×§\à«\ä—g\ëù3¢^b}Ÿ8ðK‡¿Ãºy\î“Öƒôß˜\î\ç\ßU–žC¸X-Ý¤>\Ø<\Â3ûöP\î1\å\Ï)ó\ç\â›c‹n\"d5Zy8ÃŠR\ÊUÿ\0ªUów@\Ù›ø‰\ì[6\Ý:\És–ç½–\å­\Ä!¹=kSkJ’{Jvß¬\îjY\ç©´:¼¢\Ò.Fä»Œ\Î\Â\ØQnlóE\Â\à û\É=\é\ä“õ\0\ZŸÅ’mûÔ‡Â‹—®L\ÕQh €P\nÁ\Çx*Á˜¸>\ïñD4ÊµÞ¢9Kd~\r¸‡rØƒ\Ø@©FN4FQ\âY7¨\Í?\ã-?\æ\\üŠ\á¬»ošCs¢“ò:ƒß·%\Å+3\rÖŒ\Ä%\Ågª8ksfq	z!Rúº?üT	–ÿ\0E\ZV\Äù§m˜Ž\çkv²In\\¹+l¥/©\n\nK-\ï÷”¢\ç°n{«..96µ\"¥<“5ò°HP\n@(\0 €\â3[%ò\×;,#\æFvŒ\Ù+a\Ån‡\ã¬þ&\ÜN\ÊAýÇ·z”f\ãnD%+ó\"\\\ìü\Óv\rº&\ê\ÞŸuR\èf\å5N´“þ /\ßz”j8>(¤¿{‘•%5\Ã&\Úý\èX{]ª\Ùd€Í®\Ïo\nt„4\Äv\Ãm¡=Á#¨JNo9]–F*+(«U`È €\Ånš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TþÊ¯*¸ú\ê\ÓWª\0\åW•\\}u\0\é«\Õ?€r«Ê®>º€t\Õ\êŸÀ9U\åW]@:jõO\àªò«® 5z§ðUyU\Ç\×Pš½Sø*¼ª\ã\ë¨M^©ü•^Uqõ\Ô¦¯TþÊ¯*¸ú\ê\ÓWª\0\åW•\\}uÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\momoria64.jpg',12000,1),(4,'Mause Inalambrico Negro','Gamer varios colores \nGarantia 2 aÃ±os',2,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\í/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B®7\020200721<\0124448+00008BIM%\0\0\0\0\0lD©.w@q&ô ò¼\'Ç8BIM:\0\0\0\0\0\ï\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\à\0\0\0\0\0\0\0\0\0Grn doub@o\à\0\0\0\0\0\0\0\0\0Bl  doub@o\à\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\í\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ð\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\Î\0\0\0\0\0\0 \0\0\0 \0\0\à\0,\0\0\0!²\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ð\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤þ\0_.\0\Ï\0\í\Ì\0\0\\ž\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ð\0\Õ\0\Û\0\à\0\å\0\ë\0ð\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„Ž˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áðþ\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\uŽ§À\Ùó\r\r\r&\r@\rZ\rt\rŽ\r©\r\Ã\r\Þ\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îð4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\Ý\Z\Z*\ZQ\Zw\Zž\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ð!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\Ý#\n#8#f#”#\Â#ð$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ð**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/þ050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e4ž4\Ø55M5‡5\Â5ý676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ÞF\"FgF«FðG5G{GÀHHKH‘H\×IIcI©IðJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\ÝP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbðcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qðrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰þŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿŽfŽÎ6žnÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒž@ž®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ý§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ð­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ð·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ð9Ðº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\ÝÝ–\ÞÞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ð\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌðXð\åñrñÿòŒóó§ô4ô\ÂõPõ\Þömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ý)ýºþKþ\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\Ý\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sð\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñð3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ý¸ZÚ¿ðD”ôi.J\Ïñ‘\Ñ\Zð\ÖS{¿”C\0ÿ\0ÏŽV©úù\Ð\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´ž\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\Ým\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECþ*½wý.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯þ3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Þû­¯ý* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ý&\Ï\Ñ\Õú\ç2^\ë®õŽ\0e-\ÝmŽÑ¬o\Ñoª\ï\Í\Þ\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛž\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikÝ\Ã÷9µ\Ý]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½þŽ1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\Ý\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\Ý{ƒkiš\èfŒoþ”³þêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ýÂ·1\ÃV´º;ð?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ð\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ÐS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\þqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉýŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4þŽšªý\"ž×ž‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ý`\éØ´\Ô:vef±¯Ä²\Ému\Öðc+;\Ûú-‘±¸ÿ\0Î¾\ïðI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™iþŽß§\ÓþžWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹ŽÁþ\Æfd»ù5SŽ]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIŽúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Þ\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœÝ”\×þ†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wþ	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\Ý\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYþfýkÀ»#\ÑSœ30^2ñ-i÷‡05\ÞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®ž§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\ÝBðF.4ò\Ó]C¿\Ïýÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ð/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»þ\ëZ\ßðu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»þ¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôþ‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îþ\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êþc¶’—\å0\ÒHû3\\\\N\Ð\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyýo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ÐWÿ\0^»üJwþ£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadýg\êG­õzºn\â\á¼\×N\Ý[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×ž²:?Mf	mYù\íô©\Ó\Ð\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\Ý¬ls\Âk\ÞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\Ýõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\Ýÿ\0A%<o\ÕN Þõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’žJ¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñð\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\îž\Ç>\ËKŽ$ÿ\0„w\î=\Íý\ï\èô«\Ýc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïð§þut?Rþ«;§cý»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgý\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜžIý\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElþQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØðZ\ÇX\ç82ª\Ú%\Ï{Ž\Ê\ëcG\ç9\î\Ø\Å\ì¤\àýNú³eýE\ík\Øß´õ›\Þ\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kþ5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsþ…_Î —‰\ÂfWÖŽ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Þ}\Ö\ä?ùW]µÞŸýÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yþ¾õ_­g\\,œ®\Øô\Ù`øµŽ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èþS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ð§þšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖŽ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzý:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Þv\ì\ì±\íþE–û?\ÒZ’œµž1˜\ìc9¿§xŸcHþd8…±®÷þ\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àý¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷þ\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Þ\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zþ±þ\Ú\Ê\â’:f3‰ =Wý™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶þ\é{\ïs?žý\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çþúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúYžž\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦þ»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\Ýt §‡7\'m-ö6\Z\Ðtc=­u¯ü\Ý\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwýcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\Ý\0öˆðÑŸõ\Î\Æh·©c\à4\é‰_«güeð\æÿ\0›ŽÊ¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrÝA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ÐûŽÛ²ŸýŸ\Õ\ë\Ýÿ\0½Efý]\è\Õt>‹‰\Ò\ë;þ\Í\\Xÿ\0ß±\ÇÔ¾\Ý\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@Ý¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿž~¶}S\ëý-\Öõ\Z·Qc¢¬\Êd\Ðd{+iúT9¿CÒ·ý\èýO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rý\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ýö\ê·û\ÐSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëWž\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®Ý«5ù¹on\Óakuž\Ñÿ\0Byž\äø¡J{ŽP98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ý3¾\Ñwúk?Eü\Ê\Þ\é8W\ç\ÜpºSM•Wý#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\Ý-\ÝfŒ\\\Ò\ìzŸ\Õ3\ãP\Ð>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»óž\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­þm ~\å\rÝ»ù?\Ï[þk\á\ä\âecW~•ÝŒñ5\ÙQaOc™\í^[þ0óz\ÏY\êV\ã\áþ±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñúž¢\äºG\\\ê½ó‘Ò²Ž\ç\Ò1º\Öò;dc¿ôo~¿ž\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\ÝNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlþÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\Ý\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ÞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaþ-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ý‡oþ–Mÿ\0Œ_ùr\ïý‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½þ&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^Ž;	tIq.w\Ò{\Þò\ç½\îX?Yºõ·\ä_\Ñ:s\ËŽûJö¯h±¢Ê±¨}~µn\Ývgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\Ýs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-Ý³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvMŽ\"¼ê™º«Kˆ.±õ\×\ìµ\Îuž\ë0\Ýÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘þ‘»›ÿ\0^\ÐýRšþ\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ýfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ðö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ù8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0\0 N\Ä\0,\Ä\ì\0¯‰\Ø\0(v\'\0¯‰\Ø\0(v\'\0\0±±;\0*‰\0±±;\0*‰\0±±;\0*‰\0\0º\ìN\09‰\0º\ìN\09‰\0º\ìN\09‰\0\0»Ø\09‰\0»Ø\09‰\0»Ø\09‰\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0\0¾\0\0\0;±;\0¾\0\0\0;±;\0¾\0\0\0;±;\0\0¾;\0=bv\0¾;\0=bv\0¾;\0=bv\0\0¿±\0>‰\0¿±\0>‰\0¿±\0>‰\0\0À\ìN\0?‰\0À\ìN\0?‰\0À\ìN\0?‰\0\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0\0ÁØ\0F\'b\0ÁØ\0F\'b\0ÁØ\0F\'b\0\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\0Å±;\0O±;\0Å±;\0O±;\0Å±;\0O±;\0\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\0\Æ;\0d‰\0\Æ;\0d‰\0\Æ;\0d‰\0\0\Æbv\0t‰\0\Æbv\0t‰\0\Æbv\0t‰\0\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\0«D\ì\0œI\Û\0¯‰\Ø\0¶;\0¯‰\Ø\0¶;\0\0°bv\0»\'b\0°bv\0»\'b\0°bv\0»\'b\0\0¯Ø\0¾\ìN\0­‰\0¿v\'\0­‰\0¿v\'\0\0Ø\0\ÇN\Ä\0—‰\Ø\0Ç‰\Ø\0—‰\Ø\0Ç‰\Ø\0\0ƒ±;\0\È\Ä\ì\0~‰\Ø\0Æ‰\0~‰\Ø\0Æ‰\0\0h\ìN\0\Ã\Ä\ì\0b;\0º;\0b;\0º;\0\0Xbv\0²‰\0T\0\0\0ž‰\0O‰\0Š‰\0\0VØ\0y‰\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0XØ\0u±\0XØ\0u±\0XØ\0u±\0\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0\0Xbv\0q‰\0Xbv\0q‰\0Xbv\0q‰\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h‰\Ø\0I‰\0v\0\0\0>\ìN\0v\0\0\0>\ìN\0\0x±\0>\0\0\0x±\0>\0\0\0x±\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿ\á%\ÔExif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ô\0\0\0\0\0\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\ã\0\0\0\0\0\0\0\ë(\0\0\0\0\0\0\01\0\0\0\0\0\0\0ó2\0\0\0\0\0\0\0\0\0\0\0\0\0¤\0\0\0\0ipp\0‡i\0\0\0\0\0\0(\0\0¼\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(‚š\0\0\0\0\0\0‚\0\0\0\0\0\0ˆ\"\0\0\0\0\0\0\0ˆ\'\0\0\0\0€\0\0\0\0\0\0\00210\0\0\0\0\0\0\0\0\0\0\0\02‘\0\0\0\0\0‘\0\0\0\0\0\0F’\0\n\0\0\0\0\0N’\0\0\0\0\0\0V’\0\n\0\0\0\0\0^’\0\n\0\0\0\0\0f’\0\0\0\0\0\0n’\0\0\0\0\0\0\0’\0\0\0\0\0ÿ\0\0’	\0\0\0\0\0\0\0\0’\n\0\0\0\0\0\0v’\0\0\0\0\0\0~’‘\0\0\0\0\0\0…’’\0\0\0\0\0\0Œ \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0  \0\0\0\0\0\0  \0\0\0\0\0\0œ¢\0\0\0\0\0\0\0£\0\0\0\0\0\0\0\0£\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0“¤\0\0\0\0\0\Z\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤	\0\0\0\0\0\0\0\0¤\n\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0“‡\0;š\Ê\0\0\0\0´\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0\Ý\0\0\'\0\0\0©\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0©\0\0\0d\0\0$\0\0\è354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!²\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ð\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤þ\0_.\0\Ï\0\í\Ì\0\0\\ž\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ð\0\Õ\0\Û\0\à\0\å\0\ë\0ð\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„Ž˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áðþ\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\uŽ§À\Ùó\r\r\r&\r@\rZ\rt\rŽ\r©\r\Ã\r\Þ\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îð4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\Ý\Z\Z*\ZQ\Zw\Zž\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ð!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\Ý#\n#8#f#”#\Â#ð$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ð**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/þ050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e4ž4\Ø55M5‡5\Â5ý676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ÞF\"FgF«FðG5G{GÀHHKH‘H\×IIcI©IðJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\ÝP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbðcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qðrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰þŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿŽfŽÎ6žnÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒž@ž®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ý§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ð­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ð·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ð9Ðº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\ÝÝ–\ÞÞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ð\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌðXð\åñrñÿòŒóó§ô4ô\ÂõPõ\Þömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ý)ýºþKþ\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\Ý\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sð\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñð3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ý¸ZÚ¿ðD”ôi.J\Ïñ‘\Ñ\Zð\ÖS{¿”C\0ÿ\0ÏŽV©úù\Ð\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´ž\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\Ým\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECþ*½wý.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯þ3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Þû­¯ý* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ý&\Ï\Ñ\Õú\ç2^\ë®õŽ\0e-\ÝmŽÑ¬o\Ñoª\ï\Í\Þ\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛž\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikÝ\Ã÷9µ\Ý]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½þŽ1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\Ý\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\Ý{ƒkiš\èfŒoþ”³þêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ýÂ·1\ÃV´º;ð?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ð\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ÐS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\þqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉýŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4þŽšªý\"ž×ž‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ý`\éØ´\Ô:vef±¯Ä²\Ému\Öðc+;\Ûú-‘±¸ÿ\0Î¾\ïðI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™iþŽß§\ÓþžWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹ŽÁþ\Æfd»ù5SŽ]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIŽúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Þ\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœÝ”\×þ†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wþ	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\Ý\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYþfýkÀ»#\ÑSœ30^2ñ-i÷‡05\ÞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®ž§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\ÝBðF.4ò\Ó]C¿\Ïýÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ð/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»þ\ëZ\ßðu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»þ¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôþ‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îþ\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êþc¶’—\å0\ÒHû3\\\\N\Ð\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyýo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ÐWÿ\0^»üJwþ£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadýg\êG­õzºn\â\á¼\×N\Ý[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×ž²:?Mf	mYù\íô©\Ó\Ð\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\Ý¬ls\Âk\ÞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\Ýõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\Ýÿ\0A%<o\ÕN Þõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’žJ¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñð\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\îž\Ç>\ËKŽ$ÿ\0„w\î=\Íý\ï\èô«\Ýc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïð§þut?Rþ«;§cý»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgý\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜžIý\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElþQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØðZ\ÇX\ç82ª\Ú%\Ï{Ž\Ê\ëcG\ç9\î\Ø\Å\ì¤\àýNú³eýE\ík\Øß´õ›\Þ\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kþ5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsþ…_Î —‰\ÂfWÖŽ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Þ}\Ö\ä?ùW]µÞŸýÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yþ¾õ_­g\\,œ®\Øô\Ù`øµŽ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èþS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ð§þšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖŽ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzý:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Þv\ì\ì±\íþE–û?\ÒZ’œµž1˜\ìc9¿§xŸcHþd8…±®÷þ\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àý¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷þ\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Þ\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zþ±þ\Ú\Ê\â’:f3‰ =Wý™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶þ\é{\ïs?žý\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çþúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúYžž\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦þ»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\Ýt §‡7\'m-ö6\Z\Ðtc=­u¯ü\Ý\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwýcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\Ý\0öˆðÑŸõ\Î\Æh·©c\à4\é‰_«güeð\æÿ\0›ŽÊ¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrÝA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ÐûŽÛ²ŸýŸ\Õ\ë\Ýÿ\0½Efý]\è\Õt>‹‰\Ò\ë;þ\Í\\Xÿ\0ß±\ÇÔ¾\Ý\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@Ý¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿž~¶}S\ëý-\Öõ\Z·Qc¢¬\Êd\Ðd{+iúT9¿CÒ·ý\èýO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rý\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ýö\ê·û\ÐSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëWž\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®Ý«5ù¹on\Óakuž\Ñÿ\0Byž\äø¡J{ŽP98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ý3¾\Ñwúk?Eü\Ê\Þ\é8W\ç\ÜpºSM•Wý#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\Ý-\ÝfŒ\\\Ò\ìzŸ\Õ3\ãP\Ð>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»óž\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­þm ~\å\rÝ»ù?\Ï[þk\á\ä\âecW~•ÝŒñ5\ÙQaOc™\í^[þ0óz\ÏY\êV\ã\áþ±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñúž¢\äºG\\\ê½ó‘Ò²Ž\ç\Ò1º\Öò;dc¿ôo~¿ž\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\ÝNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlþÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\Ý\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ÞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaþ-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ý‡oþ–Mÿ\0Œ_ùr\ïý‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½þ&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^Ž;	tIq.w\Ò{\Þò\ç½\îX?Yºõ·\ä_\Ñ:s\ËŽûJö¯h±¢Ê±¨}~µn\Ývgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\Ýs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-Ý³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvMŽ\"¼ê™º«Kˆ.±õ\×\ìµ\Îuž\ë0\Ýÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘þ‘»›ÿ\0^\ÐýRšþ\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ýfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ðö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ùÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ð\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤þ\0_.\0\Ï\0\í\Ì\0\0\\ž\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ð\0\Õ\0\Û\0\à\0\å\0\ë\0ð\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„Ž˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áðþ\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\uŽ§À\Ùó\r\r\r&\r@\rZ\rt\rŽ\r©\r\Ã\r\Þ\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îð4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\Ý\Z\Z*\ZQ\Zw\Zž\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ð!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\Ý#\n#8#f#”#\Â#ð$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ð**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/þ050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e4ž4\Ø55M5‡5\Â5ý676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ÞF\"FgF«FðG5G{GÀHHKH‘H\×IIcI©IðJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\ÝP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbðcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qðrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰þŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿŽfŽÎ6žnÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒž@ž®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ý§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ð­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ð·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ð9Ðº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\ÝÝ–\ÞÞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ð\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌðXð\åñrñÿòŒóó§ô4ô\ÂõPõ\Þömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ý)ýºþKþ\Üÿmÿÿÿ\áŠhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa‘Br¡±Á\Ñ\áðÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AðQaq\"2‘¡±Á\ÑñB\ábÿ\Ú\0\0\0?\0\ßÆ€4 \r\0h@\Z\0\Ð€4 \r\0h@\Z\0\Ð€4 \r\0h@\Z\0\Ð€4 \r\0h@:‹\ÎÛ›\Û\î\Ø\ë¸\çüÃ±%xH±Ú¼»\Ù#\á\ÜJ\n¢²0Q*¨/,.ŠS\0Š,[¸W€\í\àt3n\êN\éåˆ¢\Úÿ\0…Rw\Ý\ËYdb’“iŽkN+5\Èó.u–K–A$zq®…$\Ês¢Í¤“„ˆ±=THcu¤p\å/\â\n˜šú¦75z–~L\'³(À¦º\Ì\ÓQ£\\£™eZ»\'\0\r\ÝJV#¢#\ÓzA:~¢\0‰\ÌÀ%\r_£	dñš\ì\Úc¯ªWs\Ï=2\Æ64›»Q\Ù1­\Ê@¨\ÌR]TUnªG±d\×MtWEB*p:j\"r\0\åÿ\0•\Æu\ÏB­´þEªm\Ï\ê/¨\äGQ¬²¾%`¯A\'r•‹a=F)¨r”\î\r:\Ü\ÅU2€ˆ‰ ð§‘ñ¬\å‚ÿ\0\Ñõ ¦·\È\Ðn!\ÎØ¯:V™Z±¥º.\ÅôN@I(Aº\Éª¦1T)D½\ä\à@Àa/d\ÓNš%4óC½¨$4 \r\0hs8nm¶#’3†E¬\ãŠtjj™I[ò £Õ’(\Ø\ÃG$u9&n\â4EeŒ&\0jKVJMèŒ•\ï·\êX·I¶°Uv[U&;«4E\Ù]\çL—\ÒF\Ü\å’7«!P¡/ê²­&)‚‚“‰o~\è@J!\ÝN\0+\Õzd‰¤µÏŸ379“0\Ù_¸Ê›‘³\Îdüýrbß½\Êr\Ë[\ÜbZ»¦\å|Í´\Ñ\'(ƒœ \î9Dœ4\Ä,EA’È¢f¿\nß…ºÖºQ=¨ƒ,$-Æ¹\')o\ÖÆ­\Ï=)™O¸ª\Ümµ‡jÑ¬ž½n‰\ÒceY\0*‚þ?;•\Ò-\Ðná»•OO-‹(w/¬Pöù†p]Jfž\Åó+°3lm\Óy^g¬i\Ì/‰J\×‰\ØcwN…_g þ9¤´\é›*ñ‹wmT,¡¢2m«¯k2ƒm¹”-÷\ë\ÆC<\\$\ÆAµ\Ë\Üg\ZW\Z:,%\çû\âG³N(7;\ÅTH0e\ÕXÜ¨©\ÄvRj÷Ô„¯AyJ\ÌS„|‚q•k…\Ñ\Êc¤\Ö51IU˜Â²E0O@´LoLJ\0 \" \Z²\Åk8‘(k{û±n %Ä™5¦KañZ(HFg¬ô°ñN\ÜJÁÄ„\ÔIˆ­y\Ð	Nt\ÕY2¥)Žs\á\ÔO5\ï*o~sBª4\í<¹\ÍÎ€»i\Ï“\ë5öó›\ÊIIA#-fhf\Æei`TRYEöe˜#U›¬@E³\Äm{@«¢³@\Z\0\Ð1\Õ\'ªž0\é\ÛEaŠLo[½1Y|ŒRz™Uk\Ü\å¨]-i$§ªÊ®G\èÇ‚µQ4Œ>‘\ÃYbbt*_-ß‘„\Ý\Â\îk>nòò\ï)nñ-n—p¢ªDE*¡Ò­\ÖY®s\nq\Õ\Ø4¸B5©\0¼‘2˜Ý¾D =¡Ì¦\Û\ê•\Ûð\å\ÍVU\Õ\Î|ˆow»\Âc¯ig–I‚«\ÒÐ–\"\Ç\Ép,¥œ@K°›kõ”Lá‹—,nº`2©82e(˜À\Z\ÚôQy·±o[;\ØV1\Üþs°f<¹ðmŠm\ä\Ë\ë¦ \Ù\\û‹\ì¹\Øb$S=\Ê\"f\\h„ú3\ÒDŒFB:	*ª¸•9\é„)Ù³-z²m¦’.~y©:‰bý°m.ör\ãˆ\Ë&B\Îu0¥Jô\älXú€\îq$\Ýë’H·nVµù+¶P.\Ô\"/¹d§\Êé‘“hþmº~\éguÙ•IAÀY“qV;­ã·²‰\Òö,’¬òˆ´¯B¤©Š.\ìŒ:ªUöe)\nR™Ë¤Çµ4\Û1l •ú¹U\Z·%ùööÝ¥m\èžÒ™YOt\Ù-¡}3Û­‰\ÊÀ`XI€«[X\æò¡SP9*\Ïÿ\0ŠXJFŽ\ã\ÊM²rVÒµóœ,\Â÷˜ó4mj…\Ý\îEÊ¶u\Û&F“ˆŒ+Ùµ–/)\"\Ú)$’ˆª1`G\ï^$\Ý4›7ar$˜\0$AÑµ–¥=\é*N\Í\Ñ\í\Û`O·V8Ÿ!ÀD\ÜñK„ f¡\ìQ­]>\Ê\ÖÙ£,¤¬›ô\Ì%7\æ99UÞ»+ Q3\Æ%\Û\é.ŠL\Ó\å)d›\É¢ß¨Ž\Ú\ÞroÓ¿6-µ9I›¾\ÝnÓ¶;\Æ\Îe®¯Jú\áˆl•HJ^6\ÅoEANÁ\î	û÷u§e\í1S3–G `)-	¦\ÒN\Ó!Å§\äkB.Eœ\Äl|´r\Åq&É¤ƒþ…Ù½n›¦«Ï’™S0½­ˆ?v€ª®©ýS±7MŒN‹\ÇÄ¾\îþÁúX[‘ø¢¼Ë„DZ­w»¬\ÔEjö1Žvr{§@^Er„d`ÊŠ¨\Û9\ÍAx½F6ü{ù(e­\Íe\Ëvw\Î÷÷Ü~‘,”\ì\ëò•è¤z1°p1i£Wd	µŽŽn\0ƒF\è…(eUS‘·&\ÛvÙ²Ihyù\Õ\\\Å\ÔwÖ»[\Ä°j’ÀØ‡1J³\å\Ò \ÐH8\îK\Üb€ö÷”¹C¦C\Õ+\Ñ\\ŠªIµ©_\Ó%ºX\ìœm±jŒÃˆô\ß\Õ)J‘G(Tb%™™RIND¤˜Fðh¥TT­Š©\Ä5PÂº\Þðê”½šO\\Ä¢\åCr•\Õõ¾\Ñf…n\Â1\Õ\n\ák¯e8DA^\reö.c?˜n\èh‹YF-œ¤\Ä¢R$ &\í»•ªªûQk|µû\Ú[„\ÎqR¶	¸\ìÏ•XK\Ú\'$¬\Ög\ír\r­5\ì6I…½Ä¬ô\ÑBW²J]\Ê\Üe\Ö!”8¥v…-)v4\ÛQ‘ó®]\ÉlšE\äl©¯qq«{¨ø{]\Âvnƒ²”JWŒ\á^=3F\ï@x\\¨¥\0\"\Z”¶H£y;ô_±–IÓ‡\nš¨\çDCŽDD\æ0ø)@90\0\0<\Z\Ó\áK%zþù\êR¤\ë\Å\ZZ\Øf©\ìg~¢;‰ŠÌ¶\ê\Ê-ñ=M\à9‰*Í‰\Ê$¤Õ¡Š¸zl÷©ö\ìV2€P;:\ÔjN”\íD^†°”œ¥K¿9ß±tšWY\í\á\ÏøH^žö\r\Ò\åc#w\'sŸ³Gä›¥’õEœU\êŒ\ë1–R¤Y”k\r–1’r«”Lb R·gH%¦2™Ê›\Ë@“ª¬›²|uMª–hŸD–Š‹¥\\ªó‡¦\åŽC¦M\Ä\ã\ë\å\×]9* ¥@t\ÂO\ÃmÊ®\éóÈ†µï¯¯\Ø\Ò7L\à]\Åll9X\Êw½—ÆŒ e€L&1&¨ÏŸ\Ò%@\Ãû\Ý|\ç/ßµRó\ç^‰˜\ào»r{C\Ú\à7\'[¤§‘g°þ;”·\ÅS\ÜHž)”«¶\î±MYG\É$u†h/½\ëÒ¢_]F‘\Ë$\ÜJ±\È`¬ŸL[Ö‰J\ÚZY\Ì+%eŒÁºŒ\Ët\Ü~·=½d\Ëäˆ¾›šxI“&­\Ä\È\ÄV\ëqE0¥^©\Ç3oß„Z¢A\æ.ª\ë«\Å&\ä\í\çfµ¢¬¨\\5R™[¹Zœ:¹\nˆ™C˜\ÄMW‹˜‡2Lú‚\0£•=3|iC¬¨•4\Ì:&Ö‹/\É®Œo™ºË…³&RŠ“«\à‡“ÆŸˆ››¡klV¥%\æaú>\å¸ œ© VË®qVI\Ë`Ù²¢ETCH\ÒNŸ¼–d&_9\à{[\Íy%n\Ü5ú¯\\U\n\í:0Y\ÃK§\ns¬\è\Z\çw\'*\"BšÆ¿\"\rZ\íÙ‚\ÇAg+«\ê\Ñ\ZY½l¶¶¨dÁ‹xöˆ1dÜY4H¨ \Ù\"ðšIÀ?\Õ\Èò\"<ˆ˜D\Â\"#Î­vó\Éyó±5^&dG·õ|€‡\Ç\â<~ÿ\0ô\Õ\ÊOF7¯•1ŒnDD¢o°÷ùñ©jŸs7{—U\ÑW¦,\æþw!¦\â¸?\'x\Ì\ïLš‰·“Œ]Ê£M\Åh¹;e\ìòL\\{ )Fð1r\ë6c‰Š£¾Z^F°‹ò\çÐ°\í\ã]\ãzžo½¶\"\ÇK±u²MX\r\êZ5d\ØSòŽ[”¯ZfY*\Ý1læ¸™£”¬B˜ˆ¡70\ÝD‚E¨[\èK»×º\æ\ä­]\ä—9Ø»ŒeI;:\Ú:¾\Í1¬V\ãQ…Œ\ÍHƒu\â\ë€#!.TS)J‘^Í¬¢\é„Ú¸A\0\0M¹\n9?$I:\ìÛ™U6eŒ\Ú<\0üÕ“q}E>\Óö„š\ÊH_¬*z%0€\0%UL\Èvœ\ç\ÖþÎ®JüJOL×‘y\ßN\é\Î=*pJGS\Õö¶\Ì\àÐŠr&\Ão/Ž~\0\r\Üx\ãŽ8\×y‘`»ý¬´¸lsx5\ÇÉ•VÒ›f\Íè˜†\à\ïO\Ø] n>\âUÛ¤`ûòP\ãUžp—“%jŽn”\ÌVÝŒ;›=‘\Óx\Z\Ä$g\ãÒ¯¿–Õ‹Q\"«,¨ð›“‰H™@\ÇUC‘\"”9J<®öu\é\Ï¶\í½\\º«nQ:<sIš¶\Ñ0\ãÖ¯2‹qU£‰\ä·ªÆš\Ù\ê!\Ú6™\Ïj\'x±D\Â\Â=˜ƒü¦‚\æ\Íô+Ð‹nÖž&ž÷%µ \í%V™ƒP.4c\é¸\ËJÀ\Ã<ŽºY\â\ã\Ãò\ÕZ1\ëeÁ‹4R]\ä’EDÇ·;‚¨.Tn’ø\ÅËª\Ó-F#,’©\Ï\Ï\ÏO\'	]­–rbB`+\Õ\Â\ÃUaEÚŽ€‹,¢P*€š%1Î¨•0:\Ê(±Ž¡µ·–wC-ß‘&\ä8yò\Ü<‡Ÿ<ùÿ\0¾¬šo<‘\"Y^\Þ~€\0>x|}¼‡üõªw™I=+[˜—\Èd[3d\Òju˜·tˆ.¦1\\81€\É4?¯ýjqþÁxñ\Þ\Z\ÏB7»&8jMW\Ø\Ù\ÖÐ²’¸[¡¶ýðV!3<w»\Û\ÓZM~ÁY7±»\åI-Ú½¬Wq|\Ä#ó\ÇopJ¬º«EQôQ‰&8ü@\Ù28X˜\ÆP“Sz«¬÷òòNõø‘iFQ•V[ó\Ï\ì{;?\Út6¢Qð.‘…“4W°™³r–Á)8V“¶\"\Ý`\"Átš\ã9Q†A&\"a9\ÍG)K\\\Ù,»;…3PPNQ\âgm‡ew›J\ÊG6	€8{ `¬ˆ‚	H\Ê%L\àWi\ÓU¾hªiï¡ŽÎ¿´Î².\ß11Ý˜§ƒŽ¸\å»\"\'Pyn3\'L¬’óÁTöQV\å‹\ÏÁ\ä<:\ëöuu±œÞ†\×:\âK&\Z\éO³\Úå½¢¬l–j®X‘f¹5š¡™n6<Ÿ\ÙrrG®Z!@7S¸Ž5\ÚP—û\éŸk[\Ù\Þ\å»PI\Þ¼Wˆc¤;¶C¯Ubˆ\ãÀ\ï&P!yù\ê“iBM\éD¥m#š.\é\î¤\É\Ôi“\Ñ\Ø#[”¥),G¨û¬!Y²u`h\ÐS¿¨@£%‹a\'%w)$\n´©”\ÉaÒ•e¡g\'t\ÖD\è\è\×\Õ+k¸/\Ø0.\\¢-Š™Rd\ìFù’ˆ\Ù\Õ\Õ+xÉ•Y4\ÖÊ´\Ó¯R´¸3r³k%²\ÍDj\ÕX´LX7+½K\ÇL—;üŠ\Ä\ß^ó¯›\â\ÎRùBÎ›ˆ\n|YWñF:>»*$®AT\Û,d\Ç\ÓykX‰<›zP\0p\ìJ‚\\3f\Í2UE,‰\×.\ä+TK\Ú!ñÀŸ¿\Ï!\ã\íÿ\0­X›²+J öãøó\Ç\ä\ÛWŠ\Ò÷Yóû)&ò°\ÒV™–°Ñ©z®*}4SUuD?¥\'\Üc\Ø\Ç\Ï\Z»j	Y\å,\Þ~\Î\í[V*LZ®qm\í\áÙ¬õä“ƒ&™)$+=‘p©‡µ \íõcˆö¦‘|ˆ5\æ\âM\Îmý\Ì5³Ó›£M\Ú&.\×\\\Å[Qªuùb\Ñkp0mœE¡uaJ1­IU\\_\ç\ZI\Û\'PL¨¤x\ÊúdM\ë\Â¢ºR[­yú\"Y\Ê\ë>v®}u/²<a*‹\È\Ù\ÕH§?Q²-†v\Üx»\Ät@H4ZR\Æö\Ï%Z1@ˆšVX®™5X\Å$|C’¡î¾OSm¥]\Õý7õ\ËÖŽy\ëQ\\ó\Ñü3RÁ\Ë\êr§¶\ä™\ÕI¼§s‘ym»\Ë;vqE\"Œ\ÄÛ€,s^N\0TY Í²dþR¦˜58‹®W<^oÄˆ¦–”b\Z\'n\Ò}Z:\Å\Õ\éQöS˜\Þ÷—§¢,HC92\ÏjW\Û;\Ä!.¶7ªòdY¡6n˜10	Šyl„9\Z\èÀUJ´Ì¤£Y÷:ƒ\ÅÆ±‡ŽaÉ´llc6±ññÌ‘I³6Y ›flZ7D D\"\Ù$“L…\0)H\0\0\0k¨ ‰\Ë8£g<ms\ÄYV²\Ê\ã2\êÍ¶· £¤”ˆ‘HS]2<`\á\'1\Ïn\Å[»j².š8E7\r–Id\Èr\ÃIªj\Ó\0º\Éý/ÛŠ\Ç%™ºt>\Ì8Rƒ\ì\é\í£Ü¨–n¢¢¸û<\Õ.Uó\ÏC6\Å\Û(\å\âG3+\"‡ô“A¤\ê\âuu^”¶¾sÄœžl\ËV-\Ç\îhÐŽ”:ª\Ù\ì \Õ\Ü\è\n‡9¢‰…v¦\äx;”TT\Ê;8ù÷\"(€ö7?4\ßUt¬—×Ÿ\"t\Ý\ß9ò®¤™3(™\Ëö-y\ãõ9zÑ°U`<ö\ÕT$Õ¼šÛŒ³“Uyµó\Î\îu4ù)­0…0r¤z<ƒD\Ôô\çR¡*\íù\æ\ä9]m^¿a6ò\ãM)•±€\Ì(µƒ²»þO¶(…T\Ãö\07Ÿ°\ëEL²\Éú\Ë\ê,(—²@5u%\nC{¥CX¬\ÓUx\Ïf‰„À™|ùE\Ò(ö‰”M4W˜œ—¬\â\å•\ÒÐ˜\É->¿\Øó\ÒwIf—\ÉT\Ü@\êF™;\í“1v”ª<T\æU~UÖ¾\î~]š+¿…	\ãÒE«F\ä‘Ie™Þ’Š\Ù\Ë\Ù\Ôc)¥\ï-?­K\Çõ(º£T;ÚžeÎ³±Jx\é[\"­i\ÉW[W%+\n!pO\ïgA$ñ³/\Ê90\é\îFGJš	8t\è˜\á\á\Ï\Ôv\Õö\çcI\Ê1\×\\‹—\Ü^\èºjô{’\ÄT]\ÇXm¹‹-dG\è‹x\èv·\Ëž›w@\ã(Xq\ÓyDÑ®Ñ‚X7D¥9 e\×R5\"±zdû\á-:Ÿ‰\Í,I;¯u>\Å\Â\íó8\ísu˜Ñ†HÛ¥\ë\å\ìm$@²´³CÈ³`\äJ‹1š‘\Õbm2‰}Xù&­\"\"\0£r\ëZ]Šs·Œ‡\çl–ŒM„10³\\\"\Û\ìXó\Z\Ò\éS–¢ ¨®lrÕ¨F«Í”‹˜\ê¨ \ê\à\â&Ò’\ÑP-H\r\0\0ü€>|€òýù\0ÿ\0MB›òúu6¾ìŒ–Y˜C\"\à±\àÕ‰›þÓ©U+s\Ðpõ\ãK5®“#NzÁý¤®^œ|.ýÈ“\ã.)¦¡(\áÛª²m÷2«¹o£\Û4\Ûb\ç\ÛVm\Û\Æu¢:YØ²uuRcd	&b™ªS0\ÊB\Ï\Å\È(tT\n\ì\å“)”@\æˆ\Å(Y* ˆn>”\î³Hˆ‚Xó:\àGk¸Êše?\ØLs—\0û€`Ò¾@òúUzÏ˜DG\áõ„GžCrð\ÜüqÇªpñÿ\0+\Ô)}*\Ýf\Ë\È\á\î@y)‡q\Ø\Ø@\0D;T\ã\çöù\ÔþA/v©ô õT‹\Ê8\ß\"\Ü\î[_Á‘\ï5ko»•¿L\å;¯\Í4“;†5Š¥XÙ‡¥M°Š-\ÜÊ ‚ŠUS/&\n\Ê.Qq\Õ>\ä§M=h\ÝDŒŽßºZmf6BE4\ä\rX‚Ad\\\äŒ÷š,L\Þ\ÌJHJJ9\äd\í’c+%+$\àE¼\\TJ\êSaƒ`£pÀ‡d¾¯ö\Í!cN®·o²üø-Y½\çmz?Y^ó›²ô\Z1¹Ÿ 9ŽüRóA]8‚S!  Q‡¨WùE±\×cb\Z0lƒY6\åxôTq\"£¦k.¡‹\ÃþN7òu_ºÿ\0\×oÝ?Ã…J=÷\ßÔ¬¨m}ûl\êo…¶ó´¯8†g¹<¥],s˜žu\Ô3xœ\n[[c[§3\ÕVXª±Ž¯·«²|¸°šNM«¡|Ä±¦Q\ë\æH›·b¦Ò¦²g.&\Ãi]§§‘Ô´œñ\çÇ“qöý=\Ã\Û\à~·\Z\Ø\Ìú\Ð€4 \r\0h@\Z\0\Ð»}[À}Bð\Ûl5žš[\Ú4€´°¿\ã\Ë\æ9·IÑ²F-È±1òq1Wº5’8LF\ÓhFMK!\è½lö=tŸœŽY«ÁCVš\î\n¬t\åê•·œ¥\Ñ6%\Ý\Æ¹/*l{¼\éwq\ÆE\Ãò\ärW{¤\Ä\Çp¢9Et£ô\ìd Tri7ÑP‘+d\Üž¸ñ}–-§†º]\é·üªõ7†<£jN\Õzš2\Û\ÓqN\ÖiõºTR2öÕ’|\îó•ç˜±s‘²Mžu\ÛyKMš\ÙcôEË…_Ë¶n°3*\ÞÉšLš5j‰hˆ§ÃŠŒtF2“”œž¬“º¹ \r\0h@\Z\0\Ð€4 \r\0pÀˆ!ð?·\Û\Ç\í\ã@\Z\0\Ð€ÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\mauseinalam.jpg',60000,1),(5,'Teclado','Negro',4,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\Z \"\"\Zÿ\Û\0C\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0A\0\0\0\0\0\0!1Q\"Aaq2‘¡	$B’#3±²\Â%RSTdr¢³Á\áñÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\0\0!1AQaq‘\"2¡±ð#\Ñ3BS\áÁÿ\Ú\0\0\0?\0\ß\ê\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 \n\0 +Þ®õ‚\Í\Ñ\ËK¥\æ,¹)˜ùŒ\Ãq”\ÒJœ\ØW‚§V„Ž~9\ãµ	Q´\ßqDZÿ\0hL\æa2¬ºª\"ý}•—Sù¥\Üþ” p·x\Ý\èô\à’õ\ê\å?\ï6™Š¡@4[üUôr\äp\ÏP,\è?ñ*[÷š¶\Û\ÖŸ]\ÂL\rq¦¥v\r]XQü·\æ€i‡s…qN\è’\ã\ÈO«.¥cô4V~¿•û@@@©þ\Ð{`\Ðf¤mÉyŠñ>Iq¿óŠG¡Û¬’­ö÷QlŠ\Ú\ÐÀJÔ¦AóÏ¼HP=ˆl\Õ\'“•\ÒFñ\á/i\Ìõ$½Š\Þ¶<x,\Ç+\'rüÄ«¼1úüjeuGŸ9N\n\Ù\âÍŽ\Ùi\Ø\ÊB¶ùÈ%\ã´‘´¥_\Ô\Ý$\Îú¬#ó\'\êŸðG#¡\Ó\ï\åõY\\mjg\Æ\å4YRrx<÷\ì/tO±¥Í¥Xø\ìsV¶µ7Ku^…Ë—A‡\r‰\ÖT”¨ž#\Ï\Ã=\ë\'ŽˆfŒôE½\á\Ò\é~‘\×=k{»¦*\î¹z\Zg\É	-6×˜w!\\ñ\ÎI\ïƒ\ÇzÅ¥v¬\ê\à\ì*JŸ´@@\ã\È/\ÞµŒ}\éB\ÚDy	R»‰\rŸ\î\ÍCt¬´ \ç%»9¯k¹\"$£yñ’„\íRRš\É\nÁ·Ê¡\ãS\Ö\Í,Qx¥\r‰6$¸³—m²™\ãûV€uÌŒŸÒ³–	­µ83O™:3\íÄ¸\Ý\Ð\Ê\ä¡\n[#zÀÜS“ÂŽx\È\ãŽæ§‡K]É¦O…s\'õ\Ó\Ã_;Ð™v›dw\"\\\ßS\Ê(,—RBAU\ê~\áÚ¾“†”rE\ãœ6=>\nR]\Ä?QõE\Í}<¿B™.K\È}\èm\'\Ï@9kZ°­ ÿ\0>•\çñ±ŒeQTzù±B#\É\Z\Ò\ÉOvß´:ÿ\0\nBƒ‹û>—Ç¢r™?\Ìÿ\0+Ï½JI¾h£ª\Õ&@@@xL…\áØ²\ØjDg’P\ãO -I\î\nO}h\nOYøA\é6³.¸­6›D·L‹3†)þA–\Ï\âšŠ\Ô^\ï6…-ý­P\êFJc]Y-+\éæ·\n›\"ŠcXt‹¬\Z·x\Ñò\î\Û2a¶&µ·Ô–ò >©*Tg,0–\èB¶j9‹„ó\É\Ó\×;\Øyp‰>ZÀ\nA\ä`\Ücš\è‡’\n“1\\3Œ¹ õ0µ··]lò-M6\ãÈ–\ãO<©b›-‚@¹\É?*\Ï6g‘\Û7Jr—>MêŠýžöhÃ¨š¢\á¢–Úµ†ŠŠ‰÷”\êp~I5ˆz\Ï\Ð\è}\r€(€(€(€(•©(B–¢”Œ’N0>´\ZwMõN\È.w­/\Èó·*:\ß@/;ð…©@\'zp­¹8gœ€©u·‚}©\\¹I¶\Ü\'Û¥\Ü§]ó\Âf6V¡‚¡¼oJ¸\î@JødðÖ¾‚JüËº.“.®4\Û+m*J[a°H\â*R‰\ïÀO=\è\rƒ \n\0 \n\0 \n\"\ïª\ì6\0M\Úõm·\ÜË”\Û_\â\"€[·u§@]\î\ÍZ j\Ë\\©\Ï­¡‡·…@¡\îþ´2\\uUŽÎ¥¦}\âU£º^„¨~æ€¯µ÷Vt“ú?PB‰|isdÀ\Ë\nm—J	\Âvƒž\Ü\ÐNuG\é\Ëdˆ¨}\×´!¶—\r¶\Â\\Û€@YHX}\Ò*bLÿ\0ñT-\ÚV\á#\ÑO¼–\Ç\èAc.ñ`\Ô\ËbõL\Ø/2-Ç)ñ\å\Éù6³{6œF3Ae¿BB€À»\ß-š~¶]®1-ñ7y\Ò\ÞKH\Ü{\r\Ê gŠ¥¼ø¨\éÅ•\Ù,¹r’ó‘Ò¢ \Ôec)I^2q\Ý Ÿ¥´W÷\ïzn3²Zµ\ÅCŠfJ#m’¥!y_\ÜR†@?ó1\È\ng_ø¬WQWjS¶™rlð™ö·\íf8\Ç\ÚÜ¦ö)M’ Â±“€9ÁW–lqù¤½Î¼<Ÿ\\X¥.º\'·y“q\êö\Ã2\åLôSNGŸ\r”\ëvu\ÌX|+At\ã;~\'¹=ªqdŽf\ãmrý„yåŽ“\\É¶•®õ¯\ÓqX\ê^¬k\ë¬_´­Ñ­\é%-Á}\æ£\Åj<w6”´•e_w±\ìšô#ÁI\ÛrŽž7ö<Ü˜eÓ¯ME‹ü_~¹^nª\Ô\Ö\Ö#IdG&m\Ü!\ä8	J\\)O¾R€®\Üw­WŠ\é\åZ«TŸ\ç©Í’n+>­M¨Ü—r\ÔP.·qÛŠ\ä8fCÄ¸\â’Tó¥i	\'b\\\ÆNw(qÞ°Ë‹`¥Šm¾ºW±”rds\å”iyŒõK5\n<¶—%q\Þw\ÉB‘	ó9\Ây \ç ƒ\Æ>µ\Èjœ¹š­\Çz±wmDI\Û)u\â\â‚Q·i=\Æ~<c=‘Ú™ú\îÿ\0¥-VH\åWk‚¿¨`¬p\â”I=€\n³\è3F¨¬d¤\Ú]¤\ÄKÉŠÈ¤©ð„‡Ž\ÅXä–sPj{P\Ze\ã›]\ÆlXôsö_´\ã)&\è\ê\Ðû‰(R7aµ„({ªHQ9\ÇŽj\Å\'ª£Rf^\Ñ2\í2l\Ý,\Ü\É%)\×W)8/\ì).„uIH\îH\ìš\Å\áO«÷9ð`X´Ro\ÌùcZ]\ã1Z-q£°\ãoùQØŒ\ÚJü\Â\Ò\È’¬%	\'8	$w\ÍWúLOu~¬\ï†y\Ã\åtuY{B#~\ìúJÙš[Âšw*XJžNB>¦¯tQFË\Ïþ\Çùù\êCN\Õ•*BÝ¾G\ÜÜ¦¤ù>Ðµ‚·F<¾W‚”ý\åS\Ík[\Ë,\åóI¾žƒVŒÄ«õ\Å\é·XsaÀ¶\Èp{3 ¼¬6\Ñ\'q\ä)A\\ú|\ë\Õ\à#>\Ë+‚»¥]]³\ÚN„”\Ây\æ\Ú.wr©)CiB§\0}Ï¥`¸<\ê¯\îõ2”\ÔV¬mtÄ´h9\ÒfÍº¡\Ë\Í\Õ\ç[|\îº˜\í£%)O+\'·Ò¶\â1¼<4 ÷vß†¿ð\ä\Ç5“ˆml—\ç\ÜEŒÅµ\r\Ør\r\Å\Å3—n\r3jG9(·{\Éõ\ä\×*Œ”ŸÃ²ö\Ó3IN.\ãùžž:\íù\æJX\íV»„‹©U¯÷ \îXö”¨9À	\ç$žù\ã\çTzbJ·e\ã®f\ïd—»³b<:Z“\â#K°\Û[cÚ¢(€\Â|¸¤}r¡Q—t¼NU\'\âÎŽdv.8–›[‹PJ	$ü\0 9G\×\Íd\ÏQºy¾7\ìo\ÂyE˜‹T\Ùq„©-¶JDsÜœžPÌ¦\ÊÑ¶c.K_\ÔZW¹\Äp©«Ú¬¾¿‰\ì;ü’{ªªLQŽ\ÓQ\ÃM(G³9„0¬y‡.e\åcÿ\0Òó§¡¬|\ë\Ðú\r£b“ho-\ÊGš”ñÂ²§1\è>\êG\ãQO¸\Þ2ŠZ\Íû\ÒjÑ»+”WjlICE-¸?²	Oùœ\äš\×-ôò\"sNþ6ÿ\0<\ËS§ñn\Ì\ë\î*M\ÆkL©,3´:\Û@½¸+\Ð+\Ê\ã\çšôó®Ï…\Ç\ï+•õ\îF3U\â0Z/±o—		&Z#\Â@Rœöµœ¬$\'¾A%i\ã\ë\\ñ\áòK\â/D\ë\ég,²EMc{Õ•·\\f*(TxòR\Û%”3+~]u[Õ”„e^™\'\á\Ís¦›JLºM_*\ÔFm»‡ôºF2\íðˆŽ €[Kg\Ý ’®U·Ž?ñÍ®\'¯‡¿Rµ;†Šºût=ôÍ¦t›{S\áOÚ‰¯n§bd-e\Â=Ó»Œ\ê¦j)E.\í}YHJw‘´´zz.¦\Ùøg»G·u‡½\Él\Ü/3\àYRIŠ\áa¢ÊœNr¤2ø¶Aô5\\\Ë\ãcƒ³\ÞoOz\È\ë µ­šF¢\Ò7»TI\ÏÀ“6#Œ·)„\î[JRH3ô\ÈúŽô-n2œYq¶¦\Â[ª!E\È\ÞYË‹Ü²qžx\Ú=V¼X©¹üQU\ßzý¿ôøwD\Ü\ÆO‘l#\ç\Ç÷¢¢¼\râ¨¸\è{³\Ñ\Ëh‰lJFHq)÷B#;~ \Zšð4‹kiN\èK¼–§8Z´0©RZ@Q*m´„ç”¤„ƒ\È\ïžüqU¤ÿ\0\Ä\éÇ“\"Iöµ^,ô:6\à\Ý\Îl¥Á³8\Ë\ÈJgwº€3ž\éù\ÈVÑ´©:3\È\æ\Õ9§\êN\ÜM\î˜\Óv«\"cÇ•\rl©1K>[®=—’pv6\ß8 gó]œfeši\ÃD’_\Ï\Ô\ÆnØº\Ì]A\Ûóm\í\ÃU\Å\æ‹F3\í$7´\çy\\œ’y\Èô¨Å’R”c•ü7®ßŒ\ç$\ÚÜ›\×\â\Ýõ™_a½11\×\äGšR•‡›o	\nNH8*\nVqüU”\åû\ã\Ñ^žcý´²oZˆ­\é\Ç\Ð\Õ\ã~šw\Ø\Ü)1ˆÀ’´ ý\â@\ç\éDòv|µ§‘Fñv¼\îZ¥\Þ\ë¸Ã¥\"Ì·›L9¶\ÙQŸmhq\ï\ÝT†\Ð³08\Íe,Š\×qN\ÓpË–W¿]z›\áI\Þ\ïú¦Ï¨]\Ó\Í\"\ËhzSé½¨\ÖòiHòû`­Á_Á\ïûØ¬¤\í¶u\â,WC}*†¡@)\\:]£nŽ¸\ì­3k[®(©kÒ•(“’Iæ€•\Ðž\Êý\0–«2G÷*–E:¢\ZN¦RZ²1/\ÚÉŸûÁH\ï\Î\Ñô©±H÷•\Ñ}3>n”µóþ£[?ÃŠ‹ˆi¾ºs-µ¥6J±)Ô”üÇ¼G\éSb‘F\Üü\êt¼÷\Ù÷ûK\ì/\Ú\ãk)\Ï\ÂT3Š›#”VŸ\áO¨\Ì\å1i”o*n3ü\Ér±n\á\áÏ©ðòU¥x‹Ysüõ:\nb´\îkø!E\í}\0wR!)cóH4\ÐQ!ÓŽ‡j®¡j†­[\'Z ·…Ì™6*\ÛK\r\ç\à\åžÁ#\ã\ÉÀ¦\èŽD÷GH\à\Âb\Ýˆ‘šCQ\ØB[m´$%)H\0Àü*¥‘“PX(€(€(€(€0( P\0Pÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\teclado-gamer-esca-gxt-853.jpg',12000,1),(6,'Porta Celular','negro',4,_binary 'ÿ\Øÿ\à\0JFIF\0\0`\0`\0\0ÿþ\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0=\0\0\0\0\0\0\0!1	Q\n\"Aaq‘2¡±Á\Ñð\á#RrB’¢£ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0\01Q‘!qÁðñÿ\Ú\0\0\0?\0‘‘)Œ&Èˆrúü¿MK\ê\åø}ö×£ùüú\êQ\ä>\ì.\ïøü9\ê\í\îú™:ž(w(d@Ÿ†m@SH\éÿ\0\Ä?}U0\ä:\ä3òü:ò\åÏ—Ÿ]I¦\Þ\ï\ïòx¹:I\Ý#þ\Ðÿ\0´?}C¹K?p¸ÿ\0ˆgóý\ÅMU)J \Ä\Çó\ë¦\Þ\ïµ2u<7r—¸…÷õ(y{ÿ\0Ÿº°ª\Úö\×\ÑØ´®kš{,“…\ãZ\Õu<<\âIª$“•¥.ý‘¦\ÝU‘Mc\"\ngT…6ÁœŠp)Ja\à>ðô/‰‡\"\ÂPö‘\0\0z\æÃ¿\Íÿ\0^½\Ä\ïfûW–\Æ÷ÜºB®\ä({`Ú•®jhH&6\îÞ¨zF˜•k\á\äbfªŸ´=Fõt\â$ºsX\â\ÞAB·@\Ëm\æ\Ûõ2N$ŸgFZª\ÝÔ€Q§ªº>w#P\ÂJ³Œpúƒ÷Y\Èp\ã\åÏ\ê\è<S€”[s\×	\çŒc¦0=@|C\\À£«\ÎÕ˜7	#º½¬\\W\á‹\ÅG\Æ*\éu\ÈR%¸7K<1–9€„õ—§P«’\Ôö¥\ïž.¯Û•5\Z\Ö}yG1D«D\Â3E²ì¦–‡Uõz!W*£EªtLŽg \åQŠ\éš4¬\"‡ƒq0ˆ¦\0ox‡Pñ\êÆ­¤­-\nŠÊ®”y¯\nñŸŒÀ\Ï s\ÇNœ´\Þ\ïF»p{¨\Üu Ý•c~.Mot-´EúŒ§l¤\Íw(¼\ìŒB\ãM8¨n1,ôªH+œõHx•Þ¼mº¯˜³P…* .\\Õ¿¹-¶N6Û›\Î|\î~RI7$–óm¼¶ÊŽ-º©„!Y‚9S\0‚$\êQ)\ËÔ¾\ã”3\Ðyû´k ^@Í¼©ƒ\Æ1À¦>ŸL\è\ÔVQ\0Ž©‰Š#\Ó\Ï\è=1žsþ51ú\ÏôR\ÐMŽ!\0\0õø\0túø\ê<\â\í G\åú†ª\è)pˆ~?¶ª\0`\0Ý¨\è\Ð&wk\Þ\ç\ÇiÝŸ÷ö\âE\È>·©i¿\í%³?x¢n¯n˜©JF¾bdÄ¦T\ÜK¹\Ê\Ã >\Â4\êªp”u\Ë\ê\áT\nÒ”\í8\í€Uyq¨8¶¨€\åCÁR3QU=C‘\Ï¦«¤é†‹¡‹Ò˜pC\é\Ú”v\é	P]»´\Ø9ú*\ÖS\ïu\Äh\ÑuM\Þ\Ö5\Êo)\Ê1\ã|÷bö‹Œ©¥L\n\'\ëVJ\äEBa6_·†÷\æO~—.u\ä(Mv}\î:ºp¨\"Ç¯~*›iYS´\Ù ‘õ˜©Ù«<Û‹)\èÓ”»H@-\×U\ë\æ4Ñ¤£Ÿ®Øˆ6ZE‹¦Ž\\ \íg/K\ÔeJ\àJb¢\à\ÍÁº@B•3ûF\âó\×	O± §¦*ªæ‡†X¥T\Æ:Ž\\\Ì\Î\ÌzK”\Ü\ÔY\á˜¤’Èˆªw$IA\âPùZ«\Ï9DAD•Nð\ZªE?ŒÝšEû8ƒþ\à:\Ë&¡@Dy5\ÈôÎ”³“m¡»}òmo\ï}¡J\Ô·¶\ë pWþ\ÕZÀþ¦t\É\ê‚S6óñô\Ë84B‰TZ\à\"@\ÊSü»!¶¶;=\ìò\ÛU¢“Ml\æ†B\ä\Ü\à*\'EÉ®M\Ö\\õ\åV\Õð(¸€^iµ*™°\0V\r’¦¥*\ãü?}S\ÆzˆqdGa\ÈóÀgð\0\0\0Z†ƒ]\á[ú”<c‡þ³||>½:h\Õ+¼`-¿¨ó\ïq\Ï\Ü\é›9@ñZ4Dý\çú©j©úyþƒ¨ !\Ì?\çü\éå >ðü‡ó\rU\Ô\0 À?\Ôt¼2rbcŸJI»A„tsG/¤9T¨7dÅš*9x\íuŽ D‘j\Ù%WUC‰¦c\à^\í#ov\ì[\í7³^ö\Ë6˜j®ò$\ÆÀ\ÒOP\ná‘®Q\\³¬¦ŠY4\à­\ËJµ\ï®\nV¯E†T*‹\"Cƒ÷›¹•÷9»=\Æ\îª`\ë=…¨«z\Î\äÂ´v Ÿº·t\ZhDZšt\Â~@›¨xŠÈ@¬«‘\åCŽœ9\Ù]µG¶oÑ¤\ß\Ýñ«\Zn.ôö\å»+\Õ*ýÁT+õ\è8«WZ\Òv\Í5À\å\nm£\ê:\í¡² t«T¼”3T-Í¼{¹Ñ·ö\ÓH3“«wAy\íõˆ¦T]%\Æ&%\Ô\ìJR²\ÎH™…Vl>™m4ªŽH‰B»\\2\Ý1>ºjïª—µ{p\ì•\ÜÕ²l\ÓVª\Ûì–»³t»P*g*\ÈZµ­}‘H	‘GRoBÅ Y\ë\àÉŒ9Z¶>Ej*‹0ŠRõ9c\"†\ËP–9jªœ€@Œ«\ë\ËôŽlpŽžQ\è³Z\nf¬¹û\Ï\Ý9…%ŸR\é\Ð[t·\Í\"œðô\Ã\æI\×5²œ\åDò‘ð¶ú0‚»\Ñ,D€*$#€´šä§¡j)\ã-/M„Dp\nROU(8g\Ü\0\0d\ì`\Õ/\Ò\0\0™§—/(ôIQU½ƒ\ÞJk\å\\/\íu\È`Áˆº¶–=US\nf8@q\Â%\å¹\Ô>_¨\êMLn¾_O~:ó K ±®!Hje\éT)NC\0\ÈrˆrRœ¦)Š!\È@À !\È@CF©\\µŠÞ’’\\\â D’1\Ì \"\0ò\0\0ü´h2úyþƒ <þŸÎ¾z\Ó\Ï\ë\Èu}\ß?®‚m\Z4h5ût[™µ›A²5þ¼²R1\ÔœAd	ö\ÍC)#PNGSP”ô)\\6R^fZbQ£V¬\ÓY \n\î\Ü,ƒF®M…þ‘/iM’\í	—°VŠ\Å\ÎNT–êˆ„Ÿ¬ª9\Èiº*jJ½—~\Õf\âžz£I9ˆ\è(8¸“•\Ûpwºòi¶YS5T\ä~v\èö¿e÷‹d«;)+wZµnWmAu#\æaf#\\õ?UÒ“ðöž«)™DÑ”šfnñ³´»§	:`\á\ã7ë·\Ø3\Úy·+—p\"lå‹¸œ²ð•\ä\í}J\Ê\Ñ\Õ,QG\Ôd”Õ¼iQž¦©š¢\áhÙ¨D)¯Qu,Ág°ªý˜õªB\ÓÑ“Û½™\Þü®\à«f4•º¤¶\ËD¹JŸûn]H˜Ù›\íxZ\Í\Òôsh\Ö\Ó\Îxª\Ëws§\Ër*ˆ) ”zbp‡ôƒwKhl/g•UE\\z=…\Ê\r\ÐL#f)\Ù#C¿ZN´¨\Æ5û\Æ,%Õ¶)ØŠŽ!Ê±Hõ\Z´ù”\\è›®\Ö\èž\Ã.\ÚG˜¢\íõ¦oSºþ\é\ÃN\ÜjZ®cj©zUŒYŠž¦¥a\"a\ëÐ¦\ÒŒ¥jµ^S ‚\Ð\Ò,\á\×<‚fLš¯uu%iihˆï¹¥Ó¶µ¶Ïªª\â\ÞXji\Ìe»¦\Û\ÛI[•Q\Ã2¨(«\Û_SO\ê§4\å*\á“Gpµ4L\ÛiH\ÊMšG}«\æ.L«h’Ž·t=?gÒ§•rÊ™p\â=Fn\×i+ \Ê—,£A‘œ+’	Š\n¦\n\Ê;jCT\É÷j\ÖÊ†ºz6mmjv&½ÿ\0N®w4¾ñky;²­,¼3hô-ú|¥CkXB6•Mû¥j1“mLP/$³8’·V@#›±Q6ž¸ãŸ¬\âM.Y[Í¶˜i„‹Z~tœ\Êm\ÜÁÁ‹B\Ä7M\Üc\íN5”d\nb\Ù\è¤C,‘S1\ïÞŠ]Ø¹Už\Ö7m*ú\Öz¦¢¬mß¦iS2»WHQ4\íEF)X\ÎCD¹M²n\Ôdþ¨”‘—1^º{\Ý.\è\ähf\í\n“rªM\×\È<_¾|ù\çR\êcõ\ëŸ\çO.œ¿<\ê]3»ÃŠ¡\ä!\äsœtH\Þÿ\0w\ÏF§»E\Ðs\à8‹À\Æ”X¥(¦9$Ÿ¶p\0÷\ÚðÎN?O?\Ðu}\ß?¦ ~ž^C¨“\îùýthÔ¼e÷p8dp?€|s€\0\æ8\rj\Õ\é\Þ\æ\Òöð\Í\Ã\ËÉ¸+[B‹Rª+°’«#\\ÌR\ìXÅŸI”\â!\ÂPQ²a\Å\Ô@\0GA´ú¤ry˜œ‡´`—À€O,0Æ›E¸OJ7av\ÄG\Ú‹‰~\æÛ•d\ÑVŸ‰$\r4w\È\ßl\É\ÄQ‰Ž\Ô\â\0;rÞ•žø«ò\È\Æ\ØKwl,tJÀt‘•’3ŠÆ¦E\Èaª“FË€`\Æ:R\âBŸŸ\0†A\Ð\îbnš’3\ÒÑ±\É}.ý¤c\0\äDUtùf\è1œ\åO\Ç!I]\æLvIn*€¹\Ô\Ö\ç&¬;\ØÚ¶š¦\ç¯;ª*\ÝCL°E²±LR7²B‚ŸŒˆ¨©“#\ÝÄ»m6ðñ\Ú$\Ô«\ëœEMº~\Öü\Ô\ê³-y¸-\Æ>’X\é«H[v•€B¬”Z.z\r¢$f\ÜDxD%¦Ã…{¾16\Ç/\ÙñÛŽ\Æ\Þ\Ô(\Ô\Ö\ï;€¸±ó-*šmSB¹¨d\ÙO,²\Ò	IS°õltŠ‚\ì\â4{\Ô]\Â\ØñÀ™† W”ü\ÕP\Õô}#UHÛˆJ¶¨eJN£ ù¤­2\Î~E´ò®\á[;ŠM\Ì\Ì\"dÜ˜{€!\Ü2•‹\Ý&òDP³6{r%\æAM\Å\Ð\É »GGvŠÈ¡j”ªŠ‡l\Ô\É,a›÷gL!Â²\Å1L,z¸6r\í\í\Âj>˜¼\Ö\ë\Ø\ê\ÝØºxƒ:\ÂN”|ù’\"’B£\ì\ÔMe’AÁ\È*»TL\â¡SLGŒD7kûŸ½»n¦\ê[3½[¢´e[\"\ÎBj\"•¨%*J®a…šUIœƒ\naÃ¸\ØõŽ‰;\è¦+•©M\ÑWA™p\ëŠ\"<„0?¨õ\ëùóÎ¡®xÏ·wµR\Ô0§ZÜ«\ïg^3‰M”-õ¢©ªº¶ªH™HP\ï©\ë\\ZNb%eS…¬¢Še¢ªd\nR»[²C´ú3´\Æ\Ò\ÜJ\Å4eyf\êøŠ2¹\Â;J¨œTPF©!\'©“OTñ-V`U›?…¨Ã–.Û•F’’l\Ý&ª@§5\â2.)id¢”*oŒ\ÕP@\æPR\08”xCŒ|dq\ÌJb‡¼F¾¼ù$S³:W¸l	ˆ®·KÝ¤\0<g\â7²!\Ï\"\×´h0ö\ç÷#n¶ej\Ë\åtU-)J-O°3H’±<œ¬\åYQFRt\Ì+É½ŒŠl¬¬ü\Ë‡‘—“Žˆ‹n¢òRÚ°jº\ÄCû\Ç\Úq\Ú_°U\Î\Ò,–\ÙW§48¥&\ÞøE^\nñš¦ ÷*¢\Ê!¼=G)„\ë60Í´:€ õT°\è\ëA¼\r´[}\Ý\íþ»°—^!\ä\ÅY¥²äŒ”{\r-/NÌ±¨i\ÉÈ©6\"Í¤!&£™H7•vŽµ~\Ñ\Ó5–@\ík¯=yh\îd\ìÿ\0®©u’P\ê²,\ËR*¤%0™08%)i<”xG½\ï”8µ\Ìt	‰¼;»\ÛotM,Ýº›€\\W:\Ô\Í\'G¯J\Ò €ˆ§\Åj\Ü\Ì\"¢\0LV(\Â\×1\Ò%’À^úú»oOT\ÕE¼§%$U0­VÞ›š­+\Ð\â¡J\'‘’®£(\Ùs˜\Âb „2Ê¨ §	C\Ztk\í‰ö\Ïm\è\Îÿ\0¹¸\ìø»¨©\n®Y\Ê+&@\ÉRû\áDTQ@\0™2\Ê‚\" \06Kˆj½\Çv[¤c¹]ŠÑ·‚\r¸˜¯d\ÝY\ß^‘ \à\êšn\Ø:”hQ‡–q^F\àûÀ!‡v‡\è\å3¿da5r·\Ûe\æ\â\ÎTÜ¼§¶\ëSRu›\â ª’•%E0Šm€…\â\ã]*-R¦\0\'\0\éI\Ãh~Ž—gK\Ùr-M×¹E\ï…©ªwû“®\ÂA°óHhjH²t#³*Q\0BJ&,ˆ#œ \ZLúwtÝžwvb\n\âvsC\ÓU±`zô‘•\á\éX¤\Ã\×\Ê\Ù\Ê%dz~\"y¬‚‡—\ÖPP°>!8ˆ\é-­\æ\Þ/\åØž–Gm\Û@’Jj– B¨ª\áŸH2F8“²	F	:°´\Ý2)!V\Ä+¢%1ß\ÉJbª\Ð9\Z»ô¬\íµ\Ù\ã°ZŽ³f\Å?VŒª®Y\"­MºfTƒ…7E¢(D9;B\à¦\àsPÄŸ»\ä~ôG\Í\ÉvÀöŠn)(k³¼˜›I=Rqg¶……9$-T\Ït¥]Lp¿°\"‰Áõm‘¹°\rl] ô÷Á|Áƒ‹\ÛtXQpN15;“\êÈ¤le£š–”¢›¥	r”yª[Mºz0\ÛZ£	\Zú\ë«=pHRY\Ê\\²Š±PC1¥iòA@$ <$‘BH¥Ï·\Þc˜1ú$\rKR.\Ö\ÙYú\Òò\×\ÒnEW3‹Š†º©$¨qw!M\Zje\Ò\ÇP\Âc)=Q¹1»\Ñ(qiTldj.\èÅ“D) ²4Kó&SX©\Ò-Qj¨†L­-A¦\îiÀ¦\êJ’8\ÆK˜¹ƒVOc[U\Û\Ô[H‹]fhª}i‰™(8ÿ\0h\Äw¦jÝ«xðPq\Å\Ç\ê‚p|B<\ÇlPA¨‘»dRn‚e¦‚	‘HP\Æ\nD’)(\0R€¥»kôV,\r$Œ|ö\é¯5ut\ä\ÄRZB“£D¶þ—Uq\0:œ/»ªúg 9•©Ž*D\ÅÓ”6Ëµ¾\íÛ·µ[pµtÍ©¡\Ó|´«¨ºv5&‹\ÍL®ŠM\ÜOT2*\n²\ÕÓ„·n¤¬\Û\×\ïÁ²µ\"\ÄjŠH“aù{ÀŸAóþQüº\ãž3\Ïù\ÓAŽn¶†ÈŽ=I|†3\à0c \Ë\ÄCŸAº5® 4\è\àWk¦@ƒ\×åŽ¼ôh21\Ô d†Àˆ`<—<t\Æ<3\î\ë¯9Š\Ðs\ÄTùûÍüÃ®\Zž¼lB\à\"³v\æ\Ï!)D—Ë§ÿ\0:j\Ù{BÑ’õ˜ö\n	ƒ\'IðÀ˜¿w=\Z4ºkkVJ¢wö„¥JI»\é\ënb8uYQ+Ãœ\à;\Ìg8\çWD‹¶tÀ¦xúb—t\0T\Ä\Z£’¡€˜\àa(\0`\nRC\0-\Z4-±!#Jn›tA0\äb&€\0÷\Ü\08Ç—-xV¬ ‘È™\Ð<—ñ\0\Îz|<4h\Ð|…®…\Üp\â]\rœaa~#\Ç\Ç:¢[³A\î\Ô1\æÿ\0‹„Œ?†>?¦\Z\n\é\Ý*\rAÀ\Ôq\Éô\æ¢Àò\È€:ó}5\ìV\â\ÑI .B¢ˆUñq„W‡„2 n€°  \r\Z4ª\ç\Ý\ÊhÉ Jn=\ÉýMa\"ep@)\ÄHl\äxy‡0\ãf\Zÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',12000,1),(7,'Portatil Lenovo','Portatil de 1 Tera de memoria y 8 de RAM',-4,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿþ\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0	\0\0\0\0\0\0!1	\"A2Qaq‘¡¢ƒ#Br‚$R£±ðÿ\Ú\0\0\0?\0Úš\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\".2+”D]µ´ö\êIjªçŽšš—\É4\Ïc\Z:’O >%c«öó[$\Ó!ß©\í+JÒ¹½Xnð9\ãüZ\âT\ë\Ú°kc]Á®\â¸\È9p[¨jgÏ›c\Ç\ÝD.¦[,Œ9¶\ëf¥º¿úK(c…§\ÎIû+GiE-Omz©ùö_]sdP\Æ;þ\Õ·ñÖ·,Š==b i\èe|\Õ~L\n•û\Ô\í\"\çÅ‹\Í>–ø\Æ<\Þ\\­•›g\Ö÷MF¯»õ\Î!ñ†©Á¶·_aÚ¹—[½e]\Ôú„Þ¹TùZ×¸ÿ\0-ý÷aø÷8¯o\Ê\"‚\í\Óf\Ð\í{c\Ú\ËFN/V¹\é#q8\r”´ú7y<4ù/\Ïm4¶ùå¦¨‡Õª ‘\Ð\Í	d%¯iùG’“Z\ä\Éo2T\Ê\Í\'²§6Yz)Å¢ \09©=n\ÕU¾\æ\Z\Ã\ÞVš\ëÁo6HXñÍ¯›H\èGš\ÙNÂ¶Ô¶_c¿ñµ\ÕrE\èk\Z³P\Î\ìƒÌŽ/“‚Ÿ\".<7õÙ‡ð§z\ÍeK&+u\îF_¨ð\Ü7†£&P>S6QôXn\Ù/E/´Ts\ngh«\Æ9©\í‚#SL\é\ß;`„<D	c\Þ^üg­ò$üG‰WJŠ‰-²ú)H\Îš\æžNi\èGþ\ÏPy…K=\ì\0yý’¾÷\È÷—¨û;¶¾\Ú=e{\Ðusb¤¨PµÇ¤ñŒH\Ñý\Ñ\áß¶W¿\Ñk³¶eþ»¤´F\Ñ)¡Ì¶º·\Ù\ëd}\ãŽ\"~H\ÈýÅ­;}F1\ÍIí•˜\Ç5*¶\ÜxGU=\ÒC­\Ó1TEMSSU/u$ÞŠV‘\â\×`õˆ#Ÿ’ú½\ëI/\È÷JDqˆ\Ú\é\åô’8d’\\\ì’Ið\0r¢²\Ï}\ä{\Ê\ÍY|\È=\ïºú\ÑN®\ÙÎº±j‹sÿ\0\ÖZk#ªcsí†žóÁ\Í\âiù­\åiMA¬ô½¦ÿ\0k”On¹\Ò\ÅWO =Xö‡7\Ï]‘`½½o¡7x¿RYu=5\î{…]8©¶ûy|on\\1\é\\\æ³9o1œŽK\Ë{\Äo™§·‹\Ø\îªÐ´Z>²\î´\Ü0V\×U\Æ\Ìp’\'†0;˜s[ýAkŠ \Þ.ño¸ø…}¢­\áš¾R]8GUs†õ\í.\Ã|\ä{\Ã\ê©f¾dò¶T\ÞryZ*n¹\Î\nÚŸeN\ÛÛ­öMtÐ•µ÷--8}3\\\în£˜—7\Ù xù9«\Üh°\Öò{¾Zv\í¤o¯iõ˜ŸM0tO÷·%ª}s /\Û\ÕU\Zz\ì÷P\Õ4—\ÒT¹€²¡€õòóÁ\á=Bó¾³£­Wp‰¼A’?Ó´<\0{ü\È rö³\ÑPA[\Â:ªØ®|>8]ß­µd\æSõ§=¤°=\Ã\Þ/ª©µR]õ\âeõò¸\à2–7\Ì\ï£YKInƒµ\ÝhXiôÂš\'ô’´2•¿™\âüVw\Ù\çen³º\ÕE>¨»P\Ð\Ò\äSQ5ó\Êáž…\î\áhò{ÿ\0v=×´¾\îVzØ¬v\æGq¸p\n\ÊùH|Ò†g…¹À\áh$ž\ãÏš\Î¸#!a½\á÷s°m\ÇJTP\\ 1U´\Ó\ÖAÝšÿ\0¹Žð÷\ÑÃ‘Zk\ÞwÝ lóS2\Õr±\Õ\Ü\ê)œ!†²\ÝK,°\ÕF\â\â\×F\0q\á9i\æ\Ò\ìx‚czgv\r¯jª†\ÃC o\â\ÂJŠa0zw¤p\Ç\Ó+6\è¾\Ì-®\êWµ\×:›M‚\ÔI$•Rñ`k\"½	 »!mt\Ü\êMWu¸»—tŒŽ’?°s¿%\èm\ÙÓ²\r Y!\Ó•ó·Î¸—U??¸Hû,é§¶G¥ô\Í;a·Ú©©¢hÀd15@(¦µ\ÒREOÁª¤\0:|—(ˆ¸ ª\Óp\Òv›¤Þ–ªŠ9d÷œ®\ÊM5l¡\0AG`{‚¸G\"c\Z\Ñð\íÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\dell.jpg',1200000,1),(8,'MAUSE','inalambrico',5,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\í/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B®7\020200721<\0124448+00008BIM%\0\0\0\0\0lD©.w@q&ô ò¼\'Ç8BIM:\0\0\0\0\0\ï\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\à\0\0\0\0\0\0\0\0\0Grn doub@o\à\0\0\0\0\0\0\0\0\0Bl  doub@o\à\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\í\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ð\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\Î\0\0\0\0\0\0 \0\0\0 \0\0\à\0,\0\0\0!²\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ð\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤þ\0_.\0\Ï\0\í\Ì\0\0\\ž\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ð\0\Õ\0\Û\0\à\0\å\0\ë\0ð\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„Ž˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áðþ\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\uŽ§À\Ùó\r\r\r&\r@\rZ\rt\rŽ\r©\r\Ã\r\Þ\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îð4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\Ý\Z\Z*\ZQ\Zw\Zž\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ð!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\Ý#\n#8#f#”#\Â#ð$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ð**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/þ050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e4ž4\Ø55M5‡5\Â5ý676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ÞF\"FgF«FðG5G{GÀHHKH‘H\×IIcI©IðJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\ÝP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbðcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qðrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰þŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿŽfŽÎ6žnÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒž@ž®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ý§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ð­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ð·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ð9Ðº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\ÝÝ–\ÞÞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ð\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌðXð\åñrñÿòŒóó§ô4ô\ÂõPõ\Þömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ý)ýºþKþ\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\Ý\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sð\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñð3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ý¸ZÚ¿ðD”ôi.J\Ïñ‘\Ñ\Zð\ÖS{¿”C\0ÿ\0ÏŽV©úù\Ð\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´ž\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\Ým\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECþ*½wý.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯þ3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Þû­¯ý* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ý&\Ï\Ñ\Õú\ç2^\ë®õŽ\0e-\ÝmŽÑ¬o\Ñoª\ï\Í\Þ\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛž\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikÝ\Ã÷9µ\Ý]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½þŽ1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\Ý\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\Ý{ƒkiš\èfŒoþ”³þêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ýÂ·1\ÃV´º;ð?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ð\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ÐS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\þqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉýŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4þŽšªý\"ž×ž‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ý`\éØ´\Ô:vef±¯Ä²\Ému\Öðc+;\Ûú-‘±¸ÿ\0Î¾\ïðI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™iþŽß§\ÓþžWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹ŽÁþ\Æfd»ù5SŽ]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIŽúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Þ\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœÝ”\×þ†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wþ	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\Ý\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYþfýkÀ»#\ÑSœ30^2ñ-i÷‡05\ÞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®ž§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\ÝBðF.4ò\Ó]C¿\Ïýÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ð/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»þ\ëZ\ßðu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»þ¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôþ‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îþ\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êþc¶’—\å0\ÒHû3\\\\N\Ð\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyýo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ÐWÿ\0^»üJwþ£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadýg\êG­õzºn\â\á¼\×N\Ý[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×ž²:?Mf	mYù\íô©\Ó\Ð\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\Ý¬ls\Âk\ÞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\Ýõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\Ýÿ\0A%<o\ÕN Þõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’žJ¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñð\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\îž\Ç>\ËKŽ$ÿ\0„w\î=\Íý\ï\èô«\Ýc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïð§þut?Rþ«;§cý»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgý\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜžIý\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElþQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØðZ\ÇX\ç82ª\Ú%\Ï{Ž\Ê\ëcG\ç9\î\Ø\Å\ì¤\àýNú³eýE\ík\Øß´õ›\Þ\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kþ5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsþ…_Î —‰\ÂfWÖŽ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Þ}\Ö\ä?ùW]µÞŸýÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yþ¾õ_­g\\,œ®\Øô\Ù`øµŽ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èþS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ð§þšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖŽ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzý:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Þv\ì\ì±\íþE–û?\ÒZ’œµž1˜\ìc9¿§xŸcHþd8…±®÷þ\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àý¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷þ\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Þ\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zþ±þ\Ú\Ê\â’:f3‰ =Wý™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶þ\é{\ïs?žý\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çþúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúYžž\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦þ»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\Ýt §‡7\'m-ö6\Z\Ðtc=­u¯ü\Ý\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwýcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\Ý\0öˆðÑŸõ\Î\Æh·©c\à4\é‰_«güeð\æÿ\0›ŽÊ¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrÝA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ÐûŽÛ²ŸýŸ\Õ\ë\Ýÿ\0½Efý]\è\Õt>‹‰\Ò\ë;þ\Í\\Xÿ\0ß±\ÇÔ¾\Ý\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@Ý¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿž~¶}S\ëý-\Öõ\Z·Qc¢¬\Êd\Ðd{+iúT9¿CÒ·ý\èýO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rý\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ýö\ê·û\ÐSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëWž\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®Ý«5ù¹on\Óakuž\Ñÿ\0Byž\äø¡J{ŽP98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ý3¾\Ñwúk?Eü\Ê\Þ\é8W\ç\ÜpºSM•Wý#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\Ý-\ÝfŒ\\\Ò\ìzŸ\Õ3\ãP\Ð>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»óž\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­þm ~\å\rÝ»ù?\Ï[þk\á\ä\âecW~•ÝŒñ5\ÙQaOc™\í^[þ0óz\ÏY\êV\ã\áþ±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñúž¢\äºG\\\ê½ó‘Ò²Ž\ç\Ò1º\Öò;dc¿ôo~¿ž\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\ÝNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlþÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\Ý\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ÞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaþ-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ý‡oþ–Mÿ\0Œ_ùr\ïý‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½þ&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^Ž;	tIq.w\Ò{\Þò\ç½\îX?Yºõ·\ä_\Ñ:s\ËŽûJö¯h±¢Ê±¨}~µn\Ývgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\Ýs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-Ý³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvMŽ\"¼ê™º«Kˆ.±õ\×\ìµ\Îuž\ë0\Ýÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘þ‘»›ÿ\0^\ÐýRšþ\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ýfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ðö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ù8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\Â\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0‰\Ø\0(\Ä\ì\0\0 N\Ä\0,\Ä\ì\0¯‰\Ø\0(v\'\0¯‰\Ø\0(v\'\0\0±±;\0*‰\0±±;\0*‰\0±±;\0*‰\0\0º\ìN\09‰\0º\ìN\09‰\0º\ìN\09‰\0\0»Ø\09‰\0»Ø\09‰\0»Ø\09‰\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0¼±;\0:\0\0\0\0¾\0\0\0;±;\0¾\0\0\0;±;\0¾\0\0\0;±;\0\0¾;\0=bv\0¾;\0=bv\0¾;\0=bv\0\0¿±\0>‰\0¿±\0>‰\0¿±\0>‰\0\0À\ìN\0?‰\0À\ìN\0?‰\0À\ìN\0?‰\0\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0ÁØ\0A\ìN\0\0ÁØ\0F\'b\0ÁØ\0F\'b\0ÁØ\0F\'b\0\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\ÃN\Ä\0I±\0\0Å±;\0O±;\0Å±;\0O±;\0Å±;\0O±;\0\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\Æ±\0W‰\Ø\0\0\Æ;\0d‰\0\Æ;\0d‰\0\Æ;\0d‰\0\0\Æbv\0t‰\0\Æbv\0t‰\0\Æbv\0t‰\0\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\ÆN\Ä\0€bv\0\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\Ä\ìN\0Š\'b\0\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\Ã\ìN\0Œ;\0\0«D\ì\0œI\Û\0¯‰\Ø\0¶;\0¯‰\Ø\0¶;\0\0°bv\0»\'b\0°bv\0»\'b\0°bv\0»\'b\0\0¯Ø\0¾\ìN\0­‰\0¿v\'\0­‰\0¿v\'\0\0Ø\0\ÇN\Ä\0—‰\Ø\0Ç‰\Ø\0—‰\Ø\0Ç‰\Ø\0\0ƒ±;\0\È\Ä\ì\0~‰\Ø\0Æ‰\0~‰\Ø\0Æ‰\0\0h\ìN\0\Ã\Ä\ì\0b;\0º;\0b;\0º;\0\0Xbv\0²‰\0T\0\0\0ž‰\0O‰\0Š‰\0\0VØ\0y‰\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0XØ\0u±\0XØ\0u±\0XØ\0u±\0\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0X\0\0\0s‰\Ø\0\0Xbv\0q‰\0Xbv\0q‰\0Xbv\0q‰\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h‰\Ø\0I‰\0v\0\0\0>\ìN\0v\0\0\0>\ìN\0\0x±\0>\0\0\0x±\0>\0\0\0x±\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿ\á%\ÔExif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\Î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ô\0\0\0\0\0\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\ã\0\0\0\0\0\0\0\ë(\0\0\0\0\0\0\01\0\0\0\0\0\0\0ó2\0\0\0\0\0\0\0\0\0\0\0\0\0¤\0\0\0\0ipp\0‡i\0\0\0\0\0\0(\0\0¼\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(‚š\0\0\0\0\0\0‚\0\0\0\0\0\0ˆ\"\0\0\0\0\0\0\0ˆ\'\0\0\0\0€\0\0\0\0\0\0\00210\0\0\0\0\0\0\0\0\0\0\0\02‘\0\0\0\0\0‘\0\0\0\0\0\0F’\0\n\0\0\0\0\0N’\0\0\0\0\0\0V’\0\n\0\0\0\0\0^’\0\n\0\0\0\0\0f’\0\0\0\0\0\0n’\0\0\0\0\0\0\0’\0\0\0\0\0ÿ\0\0’	\0\0\0\0\0\0\0\0’\n\0\0\0\0\0\0v’\0\0\0\0\0\0~’‘\0\0\0\0\0\0…’’\0\0\0\0\0\0Œ \0\0\0\0\00100 \0\0\0\0\0\0\0 \0\0\0\0\0\0  \0\0\0\0\0\0  \0\0\0\0\0\0œ¢\0\0\0\0\0\0\0£\0\0\0\0\0\0\0\0£\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0“¤\0\0\0\0\0\Z\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤	\0\0\0\0\0\0\0\0¤\n\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0\0\0\0\0“‡\0;š\Ê\0\0\0\0´\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0\Ý\0\0\'\0\0\0©\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0©\0\0\0d\0\0$\0\0\è354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!²\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ð\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤þ\0_.\0\Ï\0\í\Ì\0\0\\ž\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ð\0\Õ\0\Û\0\à\0\å\0\ë\0ð\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„Ž˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áðþ\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\uŽ§À\Ùó\r\r\r&\r@\rZ\rt\rŽ\r©\r\Ã\r\Þ\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îð4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\Ý\Z\Z*\ZQ\Zw\Zž\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ð!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\Ý#\n#8#f#”#\Â#ð$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ð**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/þ050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e4ž4\Ø55M5‡5\Â5ý676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ÞF\"FgF«FðG5G{GÀHHKH‘H\×IIcI©IðJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\ÝP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbðcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qðrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰þŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿŽfŽÎ6žnÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒž@ž®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ý§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ð­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ð·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ð9Ðº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\ÝÝ–\ÞÞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ð\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌðXð\åñrñÿòŒóó§ô4ô\ÂõPõ\Þömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ý)ýºþKþ\Üÿmÿÿÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0 \"\0ÿ\Ý\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sð\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñð3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’R’I$”¤’I%)$’IOÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)%_3?¿W7\"¬jû>çµ€ü\ËV%ÿ\0\ã\ê­N\Û^S²\Ç\èk{‡ý¸ZÚ¿ðD”ôi.J\Ïñ‘\Ñ\Zð\ÖS{¿”C\0ÿ\0ÏŽV©úù\Ð\íK\Ú{ƒ´ÿ\0\ßÒ¥=\ZK3\ë\'DÈ™u´ž\ÖŸùókV“\\\×\0\æZujIK¤’I)I$’Jÿ\ÑõT’I%)$’IJI$;¯¦Š\Ým\Ïmu·W=\Æ\0û\ÒRD¼\ÌL\Z“™s1\égÒ²\Ç·\ïr\ã:\ïøÊ¢¢\ê:%c!\âAÊ²ECþ*½wý.©uN¡\Ôrve–ge\Ø\á^=|’÷¬«†{+\Ü\çƒbJ{Î¯þ3\êmŸf\èX®Ëµ\çk/´85\Î\ì(Ä¬}«\'ú¿«®[/\ë\Ï\×Š.\Ëôó°úM¯s\0úM©õzc¿5\Þû­¯ý* û\Ó+³›ó¬™ùŒ2\Ö\Ï\éøO\à™ôr²™ý&\Ï\Ñ\Õú\ç2^\ë®õŽ\0e-\ÝmŽÑ¬o\Ñoª\ï\Í\Þ\ïeT·ô\×6’™\Ûu\Ù\Ï6e\æ\\v´¸ºÛž\ãù­s÷\Ú÷-¼©\Ù÷V™–\ÜW»SCê–\Ø,®½ÿ\0\Ôõ?®²ú/T\È\èÖºÚ©ª\ë¯ikÝ\Ã÷9µ\Ý]•[Œ\Ïô¾›ÿ\0\ã*±t\ßó«½5™ù8\Ï\Å}\ßÑ±·‡ºöûQHs+²Œ]\ß\ár?\ë~¢V§Ÿ\ë½þŽ1\ìe\Î\ÉÇ¼––l,´{\ØÃµ\ï\Ü\Ûk\Ý\éÿ\0\ÅØª²´q\ä)u.¹™Ô¬\Ý{ƒkiš\èfŒoþ”³þêŸ­\Z’•©\Ù\Å\ËuP\Zt]\'Dú\Ñ~Ö³J\æ\\Ñ¤ü¾‡ýÂ·1\ÃV´º;ð?b®§’ ·pò.ÿ\0ªÛµ>ÓõŸ.7MA\Ñw\ÑöyCúÿ\0Al¯#ú»õ‹ö¶›?Cc\Î\Ð\×\Æ\×\ÜmŸGwò½§fš+cg\Ãu\æ©ú?õüóÿ\0ü\ÐS°’I$§ÿ\ÒõT’I%)$—;õ\Ç\ëeWñ]qoQÉŸB‰ˆo\çd[ûµ3\èÿ\0.Ä”›\ëÖ¼‡YkÏ©’~C±:û¿\ê½?ûsÒ¯ô«\Ìú\Ç_\ê}n\Ò\ì»¦}´\í\Ö\ëÿ\0\\þqgYnF]\î\É\Éy²×’KŒ÷;¡¿\Ú(› h‚Q€¬tš÷eäº²Sp®8F`ú€±\Ù^™ÿ\0¹³¾\×öu^\ç¶J¥‰sr:†9³Û„,\ÛmÀí¶º¦;ù\Æ\Ô\×\×?›ÿ\0Šx]3+¬\æ¿§Ex\Õ³$‰®š\ÉýŸ\ár,oó\êK+\×\êU2ë©˜ø\0;“ººG¹\Ïqn\Û2svš\î³1\Îõ?IO¯U4þŽšªý\"ž×ž‰\Ó1\é\é\îú¿~&\rd^¬‘e¤Ÿ¥s\ê}T\ÕmöÇ¿}ŸõW­ý`\éØ´\Ô:vef±¯Ä²\Ému\Öðc+;\Ûú-‘±¸ÿ\0Î¾\ïðI)\ã\îÅ¯£´Y\ÕÛ³Ÿ£¦¼\î\0\æ²:™iþŽß§\ÓþžWó¹[1ÿ\0D±ò2rr²““c®È´\Ë\ìw\'°\Z}7\è\×[=•­GôlÜ›_q\Ê\ÂÊ¶\×Yg\Û\è\Ü\ç^ÿ\0Z\Ê]ÿ\0E¾‘‡ˆ=N§Ÿ‹ŽÁþ\Æfd»ù5SŽ]Eñ™9­%9x¸Yy66ª˜\ç½ÿ\0A¹\ß\Õh[G¢t\î–=Nµ\àKz}½\ßÉ¶\Ï{1š\ï\ßUò>°\Ú\Êß‹\Ñ\ë=7\Ú>À\íùv\ß\'7MŸñ8¾•lYIŽúŸ3æ’›3ib\ékÑºûXô³\è\îüõ\Ò}_Ä·«gK°±ÿ\0I’\Ñ\ík\Þ\éôq?G·\Úÿ\0\ç®ÿ\0€¯\Óÿ\0¹œj¯È¾º1\Ømº\×UXü\ç»\èüŸü\Zô®—…‹\Òp©\ÅõX\Ö5ÀY‘amb\Û\ìúO—\ínûœÝ”\×þ†º\ëÿ\0’›T:OV\ÆôMxV\í¦\êX\Z\Ñü›ªf\Ö[Wþ	û–!}T\êy˜}FÏªX\Ü\ÚÁû\î%Í¾¸\Ý\èú‡ù\×z~ü{\ÂWú¿OR»—\Ô[Q8%´\ÖZp™?¿ScóYþfýkÀ»#\ÑSœ30^2ñ-i÷‡05\ÞÇŸø&û—MH)\ï°.6PX\ã¹ô¸\Ö\â{Æ¬wö«-VW\'õ3®ž§cd6\ëªµ£egköÿ\0&\ÏSr\ëSÿ\ÓõT’X[¾¶\â}\\\Ã\ÝBðF.4ò\Ó]C¿\Ïýÿ\0\æ\ëIL~·}n\Åú¹Š\Z\Ð/\êWƒö\\Yùz÷Ç¹˜õÿ\0\à¿\ÍT¼’\ëòó²­\ÍÎ´ß•{·[k»þ\ëZ\ßðu3üMú\n\äeõ\Ës³­7\å^wYa\ïû¬`ÿ\0UFºÿ\01\Z¶ÀAI+b›\Ëk¬¾\Ã\r‰\ì\Öÿ\0)\ÊLkZ\Ãe‡mm\â°:·P³.\ÃE:4H\Øwgõÿ\0Ò»þ¶’Y\ße™\åÏ˜u¸2Ç·—}\n?{ùoÿ\0¾&6²[[¶±&\Ï\é\\\Ù\çnZy\Øtôþ‘ˆ^C! \0N¥\Äz–˜ü\ç¹\îþ\Ã%—Y–5~\Ê\Zw\Ø\è‚\çvŸ\êþc¶’—\å0\ÒHû3\\\\N\Ð\Ògó7}-¿·óô\Z4\0<´N\Z\Ö41¢\Z8LQRÎƒ\ÈB@\ãO‚r JHQ)7sŒJŠ\Üú­õyýo©³ÀŒjÇ«šñ:T\ßE®ÿ\0M”\ï\ÐWÿ\0^»üJwþ£t2‘Õ®dÛ‘5\à¶5>\Ërü¬¯\æiÿ\0ºÿ\0øadýg\êG­õzºn\â\á¼\×N\Ý[u\Îö\ßîº¶\íôhÿ\0ƒ­÷ÿ\0„]_×ž²:?Mf	mYù\íô©\Ó\Ð\Çhô­¹­\ÍûT\Æÿ\0¯z\Ì,©\Ý¬ls\Âk\ÞX\íjÊ©ÿ\0ŒÏ¸\×ÿ\0 Ÿõ\Ô\ë\à\Òúé®«,õ^\Ö5·÷ˆ»\Ü\Ýõ\î\Æ\Æ\Ëh–µ¢‹{\ê\ÏkwYª†=n°‚ÿ\0s\ÜK\Ü|Lÿ\0\äÜµš\ç·¸ó\ì¹\á\Îly·\Ýÿ\0A%<o\ÕN Þõ\Ï\ìƒJM\ï\Æ\r\Z	;©«ÿ\0E¯Z^\Ñòo\Ö\\|Àu»©2À|\Ø^ôŠÿ\ÔõU\ãŸ\ã\ìú\ã˜\ç\ámtX\É$\Ãvz{?™\ê\Õk—±¯1ÿ\0Tƒõ’‡«°\Øöm¿ÿ\0&’žJ¶@\ÑZ¦¢\éq†µ¢\\O\0\\Tñð\Ü÷\0<™\×:«Ó‰ŠAcO½\ãP÷\ÏüMnú\é­A(ú†eùù5ô\îž\Ç>\ËKŽ$ÿ\0„w\î=\Íý\ï\èô«\Ýc\ê¦_H\ÃÆ·£}{6õŠÃœ\éú3_Oó?F\Ïð§þut?Rþ«;§cý»1³Ÿ”%ÀóUn÷z_ñ\Ö},ûgý\"\éò/\ÇÁÆ³3&\ÏC†\î¶\Ï\ÃC[ùöX\ïeUÿ\0„±%>[\Ö3\èÍ¯˜\Ö6Û¶‡Yw>“?6Š\Ûû\îs½Kô5‚TY[kn\ÖñÜžIý\ç-.·\Ö2:\Îs²\ío¥S}¸\ØúElþQoÓºÏ§}¿¿ÿ\0\Ê\Õ’˜ TÊƒ’S!•7ª©Ö¼5¿3\àC<Lw\ØðZ\ÇX\ç82ª\Ú%\Ï{Ž\Ê\ëcG\ç9\î\Ø\Å\ì¤\àýNú³eýE\ík\Øß´õ›\Þ\Â[E;Ï»\Óöbb3ü%Ÿñ\Ë\Ï>¯\ØÎ“\Õ:V¹­8¸—4^\Ãk·õgdÿ\0_\Õõ—kþ5+\Ì\Ê\Ç\é=;oY…¦¹\Ïmnô7ÿ\0À3{Ÿsþ…_Î —‰\ÂfWÖŽ·“\Öz›c¸VI,\rõlm\Ûì®¯}ÿ\0ù<•\ÙR\×:‘HalÙº\Ãû\ÛZCZ\ß\ÍeM}Ÿö\â­\ÓñhÁÇ«+\Ç2×‘£\Þ}\Ö\ä?ùW]µÞŸýÇ®Š\ßN\Åx©×º^[%€\É.|{Cy\ïrJeŒ\ÖV^\ãŒ\Ì{yþ¾õ_­g\\,œ®\Øô\Ù`øµŽ\Ûÿ\0Ihf±¸Í¢€}Õ¶^gBcf\èþS½E\È}y\Ìôºµ\Ì;2\ÆPß„úöÿ\0Ð§þšJy«\à7?¦Wù\ßj\Åhø›ª_@¯ú£foÖŽ“_#)—»ú˜ÿ\0­?ÿ\0<¯{Eÿ\ÕõU\çÿ\0_)õzý:}F\ëñ²\ßüŠô\åÿ\0_º\íXS*Æ¸:\æ5´\Ò\Þv\ì\ì±\íþE–û?\ÒZ’œµž1˜\ìc9¿§xŸcHþd8…±®÷þ\åñŠ_Q~¯3¨õ\çÛ¶Ñ…µõcH/s¿7#\Ñú~…\àý¿\Îÿ\0Åª¬Á\Â\Åf=¶‹:‹\ÚÛ³˜I.õ,¯¤÷þ\å\r~\Ë6†õ\Â,šs\ßGQ¯*»]M\á\Þ\ÛXv9¿ºC™6 §\Ûkma¥\ÅÁ­\0¹\Îq†€=\Î{\Ü~‹Zß¦\å\æ¿Zþ±þ\Ú\Ê\â’:f3‰ =Wý™cöÕŸ\à\éÿ\0…¹\èg\ë‡U\ê=0tË‹%\Ä}¯%ƒm–°}k¶þ\é{\ïs?žý\é=N}$­	“¦%%,P\ÜTœT’x[;\0€úN\Õ\Çþúª`c‰?ôŸ\ï-ü´‘ø¤R“-”\Ó\Ór\rºU\é9¯ø8lÿ\0¿-LL\ë³Ù‰™Ÿg©™†\Ìv¨¬X\Ê\Ù}Á\ÎúYžž\Û6ÿ\0€ûK?Ã¬l¬†ßf‹‚ùsN¢Ì7²²>‹\è\Ão\éò?\á=\Z?Â­J°¿X¯\Z\'.¦þ»{‰;,³ô\Åc\íu”³o\Ú\îÇ­ü\Ýt §‡7\'m-ö6\Z\Ðtc=­u¯ü\Ý\ßIÿ\0\é-[\ß~ÁOE¬eÛ¨vs\Æ\Ú\Ú(\'\Ûwýcü\'¨©ô\Ú:[*1\Æ\ê™¬O¤\Â\ïÎ¾\æ¶}¿ñß¢¯üúE±ûe®qª.\0h.ÿ\0£Z*r¯ÀÊ¥Î·¨dœ›\Ý\0öˆðÑŸõ\Î\Æh·©c\à4\é‰_«güeð\æÿ\0›ŽÊ¿\í\Å\èùv\å\Øñ\êQc\â7=\Õ>\0\'\ÜIÚ¼›&\á\ÖsrÝA\È\ê™ùOû=\r6\0\\}6ú\àëª†·\éÿ\07ZJ{ñ?Ñ‹ò3z\åƒ\ÙXû1\ÐûŽÛ²ŸýŸ\Õ\ë\Ýÿ\0½Efý]\è\Õt>‹‰\Ò\ë;þ\Í\\Xÿ\0ß±\ÇÔ¾\Ý\Ò\\\ç½i\"‡ÿ\ÖõUõ‹\êgF\ë\Ö«\ë\ç\Ö\Ò\Úò@Ý¤9­mô“\é\ä1»ÿ\0;ôŸè­­o¤’Ÿž~¶}S\ëý-\Öõ\Z·Qc¢¬\Êd\Ðd{+iúT9¿CÒ·ý\èýO¦²°qwŸ^\Ñ5´\ÃAü\çû\ã??ü\Åô\Å\ÔS‘Kè¾¶\ÛM­-²·€æ¹§G1\ìwµ\Íròo­\ß\â÷;£\ÓwP\éƒ\í˜\r°‘‹SH¶šœK\Û\rý\'¯U.v×½¿¤\Ùú_ô\Ö$§’I\'Ru%)U“h‰¬U<z’\'\á»b³.ýö\ê·û\ÐSu-¯<4Ÿ€+<\ä\Úyµÿ\0-?\"³w\Ò.w\Å\Å:F›{´Œú¤3\é1\àZö\ÉÁ\ßõ–q\Ø0=IüJ%všÏµ¬ø‚?”\ëWž\à\Ìz\ßy\à6¶’>ô²:\×Q\Äq£\Ón;€—C\ì\0øƒ®Ý«5ù¹on\Óakuž\Ñÿ\0Byž\äø¡J{ŽP98õb³\ÛH;\Ü\Zœe÷ÿ\0¤ý3¾\Ñwúk?Eü\Ê\Þ\é8W\ç\ÜpºSM•Wý#.Ã£œ\ã¹ö\Ûgü+½ûúKÿ\0\âU/ª\Ý-\ÝfŒ\\\Ò\ìzŸ\Õ3\ãP\Ð>\ÇF\ï\Ïöz_\çÿ\0/\ÖõNŸŠ\ÌL:\ÅT\×\ÃGw9\Ç\Ü÷»óž\ä©.SzWH\è¸V\çõ;C\ë\Çi²\ë­þm ~\å\rÝ»ù?\Ï[þk\á\ä\âecW~•ÝŒñ5\ÙQaOc™\í^[þ0óz\ÏY\êV\ã\áþ±\Òp\\]t/¸7õ‹½?¥•ö{7Qú/\æ\Ñúž¢\äºG\\\ê½ó‘Ò²Ž\ç\Ò1º\Öò;dc¿ôo~¿ž\ß]Ÿ\éCô*h1¯¸oªÿ\0\ã?©\ÝNV§\ì™×½µUmRú,{‹Y[?:\ìg\Ø÷}=J¿\î\Ê\î’R’I$”ÿ\0ÿ\×õT’I%)$’IMlþÔ±\Î/PÇ¯*‡jkµ¡\âx\Ü\Ý\ßEíŸ¦¸\Ü\ïñ=õ_\"\Óf-™8-\"=\Z\ÞÁ\æ>\ÒË­ÿ\0Á—v’J|\Õ\ß\âO§“\ì\ê—\àkaþ-P?\âK·W°|hiÿ\0Ñ‹\ÓRIO˜\ã#On°ÿ\0ý‡oþ–Mÿ\0Œ_ùr\ïý‡ú]z‚I)óüdªÿ\0Ë—ÿ\0\ì;ô²½þ&:\Z>Õ›™s\Ç;\ru´ÿ\0gÒ±ÿ\0ø*ô’SG£t^›\Ñ0\Óúm^Ž;	tIq.w\Ò{\Þò\ç½\îX?Yºõ·\ä_\Ñ:s\ËŽûJö¯h±¢Ê±¨}~µn\Ývgø*ÿ\0Cú×¿¬\\oÖ¿ñ}ûS=\Ýs£f?§u¢¹\ä“U›\é7~\ß\ÒQ\ìmL§\êS\é\×úLkSŠ1=†šv³`\röˆ€\Ñú-Ý³\Ù[X«u^…\Òòª·3<š\rCu¹Ìf¼5û½¹vÛ·\Ù]¿\çÔ¡Ö²ºV]}\ëVºvMŽ\"¼ê™º«Kˆ.±õ\×\ìµ\Îuž\ë0\Ýÿ\0‹B\èºG=\"¾¥›YgH\ÄtôüWk\ë<s™‘þ‘»›ÿ\0^\ÐýRšþ\Ò)6ñÿ\0\â\×\ê\ÎWW\ê¸ýfÁ\é\àt\ë=@ø?¥¹»½:\êŸô~\Ûn\æ5ÿ\0\ì\Ê-c!\r“\0F®;œ\ï\í8\îRE\nI$’Sÿ\ÐõT’I%)$’IJI$’R’I$”¤’I%)$’IJI$’S_7>Ÿ³\çQ^M2\é\Ú\Ðö\îE\Û_ù\ÍGkZÆ†´µ¢\ZÑ \0v	\ÒIJI$’R’I$”ÿ\0ÿ\Ùÿ\âXICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Î\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0„\0\0\0lwtpt\0\0ð\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\Ä\0\0\0ˆvued\0\0L\0\0\0†view\0\0\Ô\0\0\0$lumi\0\0ø\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0¤þ\0_.\0\Ï\0\í\Ì\0\0\\ž\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\çmeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ð\0\Õ\0\Û\0\à\0\å\0\ë\0ð\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„Ž˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áðþ\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\uŽ§À\Ùó\r\r\r&\r@\rZ\rt\rŽ\r©\r\Ã\r\Þ\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îð4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\Ý\Z\Z*\ZQ\Zw\Zž\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ð!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\Ý#\n#8#f#”#\Â#ð$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ð**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/þ050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e4ž4\Ø55M5‡5\Â5ý676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ÞF\"FgF«FðG5G{GÀHHKH‘H\×IIcI©IðJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\ÝP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbðcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qðrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰þŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿŽfŽÎ6žnÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒž@ž®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ý§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ð­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ð·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ð9Ðº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\ÝÝ–\ÞÞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ð\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌðXð\åñrñÿòŒóó§ô4ô\ÂõPõ\Þömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ý)ýºþKþ\Üÿmÿÿÿ\áŠhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿ\Û\0C\0ÿ\Û\0CÿÀ\0\0h\0h\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa‘Br¡±Á\Ñ\áðÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0\0\0\0!1AðQaq\"2‘¡±Á\ÑñB\ábÿ\Ú\0\0\0?\0\ßÆ€4 \r\0h@\Z\0\Ð€4 \r\0h@\Z\0\Ð€4 \r\0h@\Z\0\Ð€4 \r\0h@:‹\ÎÛ›\Û\î\Ø\ë¸\çüÃ±%xH±Ú¼»\Ù#\á\ÜJ\n¢²0Q*¨/,.ŠS\0Š,[¸W€\í\àt3n\êN\éåˆ¢\Úÿ\0…Rw\Ý\ËYdb’“iŽkN+5\Èó.u–K–A$zq®…$\Ês¢Í¤“„ˆ±=THcu¤p\å/\â\n˜šú¦75z–~L\'³(À¦º\Ì\ÓQ£\\£™eZ»\'\0\r\ÝJV#¢#\ÓzA:~¢\0‰\ÌÀ%\r_£	dñš\ì\Úc¯ªWs\Ï=2\Æ64›»Q\Ù1­\Ê@¨\ÌR]TUnªG±d\×MtWEB*p:j\"r\0\åÿ\0•\Æu\ÏB­´þEªm\Ï\ê/¨\äGQ¬²¾%`¯A\'r•‹a=F)¨r”\î\r:\Ü\ÅU2€ˆ‰ ð§‘ñ¬\å‚ÿ\0\Ñõ ¦·\È\Ðn!\ÎØ¯:V™Z±¥º.\ÅôN@I(Aº\Éª¦1T)D½\ä\à@Àa/d\ÓNš%4óC½¨$4 \r\0hs8nm¶#’3†E¬\ãŠtjj™I[ò £Õ’(\Ø\ÃG$u9&n\â4EeŒ&\0jKVJMèŒ•\ï·\êX·I¶°Uv[U&;«4E\Ù]\çL—\ÒF\Ü\å’7«!P¡/ê²­&)‚‚“‰o~\è@J!\ÝN\0+\Õzd‰¤µÏŸ379“0\Ù_¸Ê›‘³\Îdüýrbß½\Êr\Ë[\ÜbZ»¦\å|Í´\Ñ\'(ƒœ \î9Dœ4\Ä,EA’È¢f¿\nß…ºÖºQ=¨ƒ,$-Æ¹\')o\ÖÆ­\Ï=)™O¸ª\Ümµ‡jÑ¬ž½n‰\ÒceY\0*‚þ?;•\Ò-\Ðná»•OO-‹(w/¬Pöù†p]Jfž\Åó+°3lm\Óy^g¬i\Ì/‰J\×‰\ØcwN…_g þ9¤´\é›*ñ‹wmT,¡¢2m«¯k2ƒm¹”-÷\ë\ÆC<\\$\ÆAµ\Ë\Üg\ZW\Z:,%\çû\âG³N(7;\ÅTH0e\ÕXÜ¨©\ÄvRj÷Ô„¯AyJ\ÌS„|‚q•k…\Ñ\Êc¤\Ö51IU˜Â²E0O@´LoLJ\0 \" \Z²\Åk8‘(k{û±n %Ä™5¦KañZ(HFg¬ô°ñN\ÜJÁÄ„\ÔIˆ­y\Ð	Nt\ÕY2¥)Žs\á\ÔO5\ï*o~sBª4\í<¹\ÍÎ€»i\Ï“\ë5öó›\ÊIIA#-fhf\Æei`TRYEöe˜#U›¬@E³\Äm{@«¢³@\Z\0\Ð1\Õ\'ªž0\é\ÛEaŠLo[½1Y|ŒRz™Uk\Ü\å¨]-i$§ªÊ®G\èÇ‚µQ4Œ>‘\ÃYbbt*_-ß‘„\Ý\Â\îk>nòò\ï)nñ-n—p¢ªDE*¡Ò­\ÖY®s\nq\Õ\Ø4¸B5©\0¼‘2˜Ý¾D =¡Ì¦\Û\ê•\Ûð\å\ÍVU\Õ\Î|ˆow»\Âc¯ig–I‚«\ÒÐ–\"\Ç\Ép,¥œ@K°›kõ”Lá‹—,nº`2©82e(˜À\Z\ÚôQy·±o[;\ØV1\Üþs°f<¹ðmŠm\ä\Ë\ë¦ \Ù\\û‹\ì¹\Øb$S=\Ê\"f\\h„ú3\ÒDŒFB:	*ª¸•9\é„)Ù³-z²m¦’.~y©:‰bý°m.ör\ãˆ\Ë&B\Îu0¥Jô\älXú€\îq$\Ýë’H·nVµù+¶P.\Ô\"/¹d§\Êé‘“hþmº~\éguÙ•IAÀY“qV;­ã·²‰\Òö,’¬òˆ´¯B¤©Š.\ìŒ:ªUöe)\nR™Ë¤Çµ4\Û1l •ú¹U\Z·%ùööÝ¥m\èžÒ™YOt\Ù-¡}3Û­‰\ÊÀ`XI€«[X\æò¡SP9*\Ïÿ\0ŠXJFŽ\ã\ÊM²rVÒµóœ,\Â÷˜ó4mj…\Ý\îEÊ¶u\Û&F“ˆŒ+Ùµ–/)\"\Ú)$’ˆª1`G\ï^$\Ý4›7ar$˜\0$AÑµ–¥=\é*N\Í\Ñ\í\Û`O·V8Ÿ!ÀD\ÜñK„ f¡\ìQ­]>\Ê\ÖÙ£,¤¬›ô\Ì%7\æ99UÞ»+ Q3\Æ%\Û\é.ŠL\Ó\å)d›\É¢ß¨Ž\Ú\ÞroÓ¿6-µ9I›¾\ÝnÓ¶;\Æ\Îe®¯Jú\áˆl•HJ^6\ÅoEANÁ\î	û÷u§e\í1S3–G `)-	¦\ÒN\Ó!Å§\äkB.Eœ\Äl|´r\Åq&É¤ƒþ…Ù½n›¦«Ï’™S0½­ˆ?v€ª®©ýS±7MŒN‹\ÇÄ¾\îþÁúX[‘ø¢¼Ë„DZ­w»¬\ÔEjö1Žvr{§@^Er„d`ÊŠ¨\Û9\ÍAx½F6ü{ù(e­\Íe\Ëvw\Î÷÷Ü~‘,”\ì\ëò•è¤z1°p1i£Wd	µŽŽn\0ƒF\è…(eUS‘·&\ÛvÙ²Ihyù\Õ\\\Å\ÔwÖ»[\Ä°j’ÀØ‡1J³\å\Ò \ÐH8\îK\Üb€ö÷”¹C¦C\Õ+\Ñ\\ŠªIµ©_\Ó%ºX\ìœm±jŒÃˆô\ß\Õ)J‘G(Tb%™™RIND¤˜Fðh¥TT­Š©\Ä5PÂº\Þðê”½šO\\Ä¢\åCr•\Õõ¾\Ñf…n\Â1\Õ\n\ák¯e8DA^\reö.c?˜n\èh‹YF-œ¤\Ä¢R$ &\í»•ªªûQk|µû\Ú[„\ÎqR¶	¸\ìÏ•XK\Ú\'$¬\Ög\ír\r­5\ì6I…½Ä¬ô\ÑBW²J]\Ê\Üe\Ö!”8¥v…-)v4\ÛQ‘ó®]\ÉlšE\äl©¯qq«{¨ø{]\Âvnƒ²”JWŒ\á^=3F\ï@x\\¨¥\0\"\Z”¶H£y;ô_±–IÓ‡\nš¨\çDCŽDD\æ0ø)@90\0\0<\Z\Ó\áK%zþù\êR¤\ë\Å\ZZ\Øf©\ìg~¢;‰ŠÌ¶\ê\Ê-ñ=M\à9‰*Í‰\Ê$¤Õ¡Š¸zl÷©ö\ìV2€P;:\ÔjN”\íD^†°”œ¥K¿9ß±tšWY\í\á\ÏøH^žö\r\Ò\åc#w\'sŸ³Gä›¥’õEœU\êŒ\ë1–R¤Y”k\r–1’r«”Lb R·gH%¦2™Ê›\Ë@“ª¬›²|uMª–hŸD–Š‹¥\\ªó‡¦\åŽC¦M\Ä\ã\ë\å\×]9* ¥@t\ÂO\ÃmÊ®\éóÈ†µï¯¯\Ø\Ò7L\à]\Åll9X\Êw½—ÆŒ e€L&1&¨ÏŸ\Ò%@\Ãû\Ý|\ç/ßµRó\ç^‰˜\ào»r{C\Ú\à7\'[¤§‘g°þ;”·\ÅS\ÜHž)”«¶\î±MYG\É$u†h/½\ëÒ¢_]F‘\Ë$\ÜJ±\È`¬ŸL[Ö‰J\ÚZY\Ì+%eŒÁºŒ\Ët\Ü~·=½d\Ëäˆ¾›šxI“&­\Ä\È\ÄV\ëqE0¥^©\Ç3oß„Z¢A\æ.ª\ë«\Å&\ä\í\çfµ¢¬¨\\5R™[¹Zœ:¹\nˆ™C˜\ÄMW‹˜‡2Lú‚\0£•=3|iC¬¨•4\Ì:&Ö‹/\É®Œo™ºË…³&RŠ“«\à‡“ÆŸˆ››¡klV¥%\æaú>\å¸ œ© VË®qVI\Ë`Ù²¢ETCH\ÒNŸ¼–d&_9\à{[\Íy%n\Ü5ú¯\\U\n\í:0Y\ÃK§\ns¬\è\Z\çw\'*\"BšÆ¿\"\rZ\íÙ‚\ÇAg+«\ê\Ñ\ZY½l¶¶¨dÁ‹xöˆ1dÜY4H¨ \Ù\"ðšIÀ?\Õ\Èò\"<ˆ˜D\Â\"#Î­vó\Éyó±5^&dG·õ|€‡\Ç\â<~ÿ\0ô\Õ\ÊOF7¯•1ŒnDD¢o°÷ùñ©jŸs7{—U\ÑW¦,\æþw!¦\â¸?\'x\Ì\ïLš‰·“Œ]Ê£M\Åh¹;e\ìòL\\{ )Fð1r\ë6c‰Š£¾Z^F°‹ò\çÐ°\í\ã]\ãzžo½¶\"\ÇK±u²MX\r\êZ5d\ØSòŽ[”¯ZfY*\Ý1læ¸™£”¬B˜ˆ¡70\ÝD‚E¨[\èK»×º\æ\ä­]\ä—9Ø»ŒeI;:\Ú:¾\Í1¬V\ãQ…Œ\ÍHƒu\â\ë€#!.TS)J‘^Í¬¢\é„Ú¸A\0\0M¹\n9?$I:\ìÛ™U6eŒ\Ú<\0üÕ“q}E>\Óö„š\ÊH_¬*z%0€\0%UL\Èvœ\ç\ÖþÎ®JüJOL×‘y\ßN\é\Î=*pJGS\Õö¶\Ì\àÐŠr&\Ão/Ž~\0\r\Üx\ãŽ8\×y‘`»ý¬´¸lsx5\ÇÉ•VÒ›f\Íè˜†\à\ïO\Ø] n>\âUÛ¤`ûòP\ãUžp—“%jŽn”\ÌVÝŒ;›=‘\Óx\Z\Ä$g\ãÒ¯¿–Õ‹Q\"«,¨ð›“‰H™@\ÇUC‘\"”9J<®öu\é\Ï¶\í½\\º«nQ:<sIš¶\Ñ0\ãÖ¯2‹qU£‰\ä·ªÆš\Ù\ê!\Ú6™\Ïj\'x±D\Â\Â=˜ƒü¦‚\æ\Íô+Ð‹nÖž&ž÷%µ \í%V™ƒP.4c\é¸\ËJÀ\Ã<ŽºY\â\ã\Ãò\ÕZ1\ëeÁ‹4R]\ä’EDÇ·;‚¨.Tn’ø\ÅËª\Ó-F#,’©\Ï\Ï\ÏO\'	]­–rbB`+\Õ\Â\ÃUaEÚŽ€‹,¢P*€š%1Î¨•0:\Ê(±Ž¡µ·–wC-ß‘&\ä8yò\Ü<‡Ÿ<ùÿ\0¾¬šo<‘\"Y^\Þ~€\0>x|}¼‡üõªw™I=+[˜—\Èd[3d\Òju˜·tˆ.¦1\\81€\É4?¯ýjqþÁxñ\Þ\Z\ÏB7»&8jMW\Ø\Ù\ÖÐ²’¸[¡¶ýðV!3<w»\Û\ÓZM~ÁY7±»\åI-Ú½¬Wq|\Ä#ó\ÇopJ¬º«EQôQ‰&8ü@\Ù28X˜\ÆP“Sz«¬÷òòNõø‘iFQ•V[ó\Ï\ì{;?\Út6¢Qð.‘…“4W°™³r–Á)8V“¶\"\Ý`\"Átš\ã9Q†A&\"a9\ÍG)K\\\Ù,»;…3PPNQ\âgm‡ew›J\ÊG6	€8{ `¬ˆ‚	H\Ê%L\àWi\ÓU¾hªiï¡ŽÎ¿´Î².\ß11Ý˜§ƒŽ¸\å»\"\'Pyn3\'L¬’óÁTöQV\å‹\ÏÁ\ä<:\ëöuu±œÞ†\×:\âK&\Z\éO³\Úå½¢¬l–j®X‘f¹5š¡™n6<Ÿ\ÙrrG®Z!@7S¸Ž5\ÚP—û\éŸk[\Ù\Þ\å»PI\Þ¼Wˆc¤;¶C¯Ubˆ\ãÀ\ï&P!yù\ê“iBM\éD¥m#š.\é\î¤\É\Ôi“\Ñ\Ø#[”¥),G¨û¬!Y²u`h\ÐS¿¨@£%‹a\'%w)$\n´©”\ÉaÒ•e¡g\'t\ÖD\è\è\×\Õ+k¸/\Ø0.\\¢-Š™Rd\ìFù’ˆ\Ù\Õ\Õ+xÉ•Y4\ÖÊ´\Ó¯R´¸3r³k%²\ÍDj\ÕX´LX7+½K\ÇL—;üŠ\Ä\ß^ó¯›\â\ÎRùBÎ›ˆ\n|YWñF:>»*$®AT\Û,d\Ç\ÓykX‰<›zP\0p\ìJ‚\\3f\Í2UE,‰\×.\ä+TK\Ú!ñÀŸ¿\Ï!\ã\íÿ\0­X›²+J öãøó\Ç\ä\ÛWŠ\Ò÷Yóû)&ò°\ÒV™–°Ñ©z®*}4SUuD?¥\'\Üc\Ø\Ç\Ï\Z»j	Y\å,\Þ~\Î\í[V*LZ®qm\í\áÙ¬õä“ƒ&™)$+=‘p©‡µ \íõcˆö¦‘|ˆ5\æ\âM\Îmý\Ì5³Ó›£M\Ú&.\×\\\Å[Qªuùb\Ñkp0mœE¡uaJ1­IU\\_\ç\ZI\Û\'PL¨¤x\ÊúdM\ë\Â¢ºR[­yú\"Y\Ê\ë>v®}u/²<a*‹\È\Ù\ÕH§?Q²-†v\Üx»\Ät@H4ZR\Æö\Ï%Z1@ˆšVX®™5X\Å$|C’¡î¾OSm¥]\Õý7õ\ËÖŽy\ëQ\\ó\Ñü3RÁ\Ë\êr§¶\ä™\ÕI¼§s‘ym»\Ë;vqE\"Œ\ÄÛ€,s^N\0TY Í²dþR¦˜58‹®W<^oÄˆ¦–”b\Z\'n\Ò}Z:\Å\Õ\éQöS˜\Þ÷—§¢,HC92\ÏjW\Û;\Ä!.¶7ªòdY¡6n˜10	Šyl„9\Z\èÀUJ´Ì¤£Y÷:ƒ\ÅÆ±‡ŽaÉ´llc6±ññÌ‘I³6Y ›flZ7D D\"\Ù$“L…\0)H\0\0\0k¨ ‰\Ë8£g<ms\ÄYV²\Ê\ã2\êÍ¶· £¤”ˆ‘HS]2<`\á\'1\Ïn\Å[»j².š8E7\r–Id\Èr\ÃIªj\Ó\0º\Éý/ÛŠ\Ç%™ºt>\Ì8Rƒ\ì\é\í£Ü¨–n¢¢¸û<\Õ.Uó\ÏC6\Å\Û(\å\âG3+\"‡ô“A¤\ê\âuu^”¶¾sÄœžl\ËV-\Ç\îhÐŽ”:ª\Ù\ì \Õ\Ü\è\n‡9¢‰…v¦\äx;”TT\Ê;8ù÷\"(€ö7?4\ßUt¬—×Ÿ\"t\Ý\ß9ò®¤™3(™\Ëö-y\ãõ9zÑ°U`<ö\ÕT$Õ¼šÛŒ³“Uyµó\Î\îu4ù)­0…0r¤z<ƒD\Ôô\çR¡*\íù\æ\ä9]m^¿a6ò\ãM)•±€\Ì(µƒ²»þO¶(…T\Ãö\07Ÿ°\ëEL²\Éú\Ë\ê,(—²@5u%\nC{¥CX¬\ÓUx\Ïf‰„À™|ùE\Ò(ö‰”M4W˜œ—¬\â\å•\ÒÐ˜\É->¿\Øó\ÒwIf—\ÉT\Ü@\êF™;\í“1v”ª<T\æU~UÖ¾\î~]š+¿…	\ãÒE«F\ä‘Ie™Þ’Š\Ù\Ë\Ù\Ôc)¥\ï-?­K\Çõ(º£T;ÚžeÎ³±Jx\é[\"­i\ÉW[W%+\n!pO\ïgA$ñ³/\Ê90\é\îFGJš	8t\è˜\á\á\Ï\Ôv\Õö\çcI\Ê1\×\\‹—\Ü^\èºjô{’\ÄT]\ÇXm¹‹-dG\è‹x\èv·\Ëž›w@\ã(Xq\ÓyDÑ®Ñ‚X7D¥9 e\×R5\"±zdû\á-:Ÿ‰\Í,I;¯u>\Å\Â\íó8\ísu˜Ñ†HÛ¥\ë\å\ìm$@²´³CÈ³`\äJ‹1š‘\Õbm2‰}Xù&­\"\"\0£r\ëZ]Šs·Œ‡\çl–ŒM„10³\\\"\Û\ìXó\Z\Ò\éS–¢ ¨®lrÕ¨F«Í”‹˜\ê¨ \ê\à\â&Ò’\ÑP-H\r\0\0ü€>|€òýù\0ÿ\0MB›òúu6¾ìŒ–Y˜C\"\à±\àÕ‰›þÓ©U+s\Ðpõ\ãK5®“#NzÁý¤®^œ|.ýÈ“\ã.)¦¡(\áÛª²m÷2«¹o£\Û4\Ûb\ç\ÛVm\Û\Æu¢:YØ²uuRcd	&b™ªS0\ÊB\Ï\Å\È(tT\n\ì\å“)”@\æˆ\Å(Y* ˆn>”\î³Hˆ‚Xó:\àGk¸Êše?\ØLs—\0û€`Ò¾@òúUzÏ˜DG\áõ„GžCrð\ÜüqÇªpñÿ\0+\Ô)}*\Ýf\Ë\È\á\î@y)‡q\Ø\Ø@\0D;T\ã\çöù\ÔþA/v©ô õT‹\Ê8\ß\"\Ü\î[_Á‘\ï5ko»•¿L\å;¯\Í4“;†5Š¥XÙ‡¥M°Š-\ÜÊ ‚ŠUS/&\n\Ê.Qq\Õ>\ä§M=h\ÝDŒŽßºZmf6BE4\ä\rX‚Ad\\\äŒ÷š,L\Þ\ÌJHJJ9\äd\í’c+%+$\àE¼\\TJ\êSaƒ`£pÀ‡d¾¯ö\Í!cN®·o²üø-Y½\çmz?Y^ó›²ô\Z1¹Ÿ 9ŽüRóA]8‚S!  Q‡¨WùE±\×cb\Z0lƒY6\åxôTq\"£¦k.¡‹\ÃþN7òu_ºÿ\0\×oÝ?Ã…J=÷\ßÔ¬¨m}ûl\êo…¶ó´¯8†g¹<¥],s˜žu\Ô3xœ\n[[c[§3\ÕVXª±Ž¯·«²|¸°šNM«¡|Ä±¦Q\ë\æH›·b¦Ò¦²g.&\Ãi]§§‘Ô´œñ\çÇ“qöý=\Ã\Û\à~·\Z\Ø\Ìú\Ð€4 \r\0h@\Z\0\Ð»}[À}Bð\Ûl5žš[\Ú4€´°¿\ã\Ë\æ9·IÑ²F-È±1òq1Wº5’8LF\ÓhFMK!\è½lö=tŸœŽY«ÁCVš\î\n¬t\åê•·œ¥\Ñ6%\Ý\Æ¹/*l{¼\éwq\ÆE\Ãò\ärW{¤\Ä\Çp¢9Et£ô\ìd Tri7ÑP‘+d\Üž¸ñ}–-§†º]\é·üªõ7†<£jN\Õzš2\Û\ÓqN\ÖiõºTR2öÕ’|\îó•ç˜±s‘²Mžu\ÛyKMš\ÙcôEË…_Ë¶n°3*\ÞÉšLš5j‰hˆ§ÃŠŒtF2“”œž¬“º¹ \r\0h@\Z\0\Ð€4 \r\0pÀˆ!ð?·\Û\Ç\í\ã@\Z\0\Ð€ÿ\Ù','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\mauseinalam.jpg',12000,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
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
INSERT INTO `proveedor` VALUES (19293,'CÃ©dula','Marcelino','2228','marcdlien@','pamplona','Juridica',2,'2023-10-09',1),(109387,'Nit','AguaAfro','1010','aguafro@hotmajj','centro','Natural',1,'2023-11-06',1),(1077473,'Nit','Hibi','2134','hibi@hot.com','porvenir','Juridica',1,'2023-10-16',1),(1627363,'Nit','arnol','2345','sfdf','medrano','juridica',2,'2023-10-16',1);
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
INSERT INTO `usuario` VALUES (44,'CÃ©dula de ciudadanÃ­a','4',1,'4','4@gmail.com',2,'2','2023-11-01','1','',0),(2222,'CÃ©dula de ciudadanÃ­a','ana maria wENDY',1,'10101','hsjshdd@hiot.com',2,'medranosur','2023-10-17','admin','123',1),(18374,'CÃ©dula de ciudadanÃ­a','marmar mar camo',1,'2323','sdsff',1,'cabi llll','2023-11-12','123','123',1),(107780,'CÃ©dula de ciudadanÃ­a','Yara Eliza',1,'31456','yara@hotamil.com',2,'medranosur','2023-10-17','admin','12345',1),(134560,'CÃ©dula de ciudadanÃ­a','Camila',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','1111',1),(1077345,'CÃ©dula de ciudadanÃ­a','marcelaaaaa',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','1010',0);
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
in dire varchar(250), in sexcli int, in fecha_naci date)
BEGIN
update cliente set nombre= nom, telefono= tele, correo= correo, direccion= dire, sexo_cli= sexcli, fecha_nacimiento= fecha_naci where idcliente= idcli;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_factura`(in idfactu int, in cli int, in usuar int, in tipopag varchar(100))
BEGIN
update factura set cliente= cli, usuario= usuar, tipo_pago= tipopag where idfactura= idfactu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_facturacompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_facturacompra`(in idfactucomp int, in idprovee int, in idusuar int, in tipo_pag varchar(100))
BEGIN
update factura_compra set id_proveedor= idprovee, id_usuario= idusuar, tipo_pago= tipo_pag where idfactura_compra= idfactucomp;
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
in dire varchar(250), in tipo_per varchar(100), in sex_pro int, in fecha_nacimi date)
BEGIN
update proveedor set nombre_pro= nom, telefono_pro= tele, correo= correo, direccion_pro= dire, tipo_persona= tipo_per, sexo_pro= sex_pro, fecha_nacimiento= fecha_nacimi where idproveedor= idprovee;
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
/*!50003 DROP PROCEDURE IF EXISTS `buscar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_factura`(in valor int)
BEGIN
select * from factura where idfactura = valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_facturacompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_facturacompra`(in valor int)
BEGIN
select * from factura_compra where idfactura_compra = valor;
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
/*!50003 DROP PROCEDURE IF EXISTS `consultar_detalle_factura_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_detalle_factura_compra`(in valor varchar(45))
BEGIN
select * from mostrar_detalle_factura_compra where NÂ°_Detalle_Factura_Compra like concat('%',valor,'%') || NÂ°_Factura_Compra like concat('%',valor,'%') || Producto like concat('%',valor,'%') || Cantidad like concat('%',valor,'%') || Precio_Unitario like concat('%',valor,'%') || Precio_Total like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_factura`(in valor varchar(45))
BEGIN
select * from mostrar_factura where NÂ°Factura like concat('%',valor,'%') || Cliente like concat('%',valor,'%') || Empleado like concat('%',valor,'%') || Fecha_Compra like concat('%',valor,'%') || Tipo_Pago like concat('%',valor,'%') ||comprobante like concat('%',valor,'%') || Impuesto like concat('%',valor,'%') || Total_Venta like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_facturacompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_facturacompra`(in valor varchar (45))
BEGIN
select * from mostrar_factura_compra where NÂ°Factura like concat('%',valor,'%') || Proveedor like concat('%',valor,'%') || Usuario like concat('%',valor,'%') || Tipo_Pago like concat('%',valor,'%') || Descuento like concat('%',valor,'%')|| Total_Compra like concat('%',valor,'%') || NÂ°_Comprobante like concat('%',valor,'%') || Fecha_Compra like concat('%',valor,'%');
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
/*!50003 DROP PROCEDURE IF EXISTS `detalle_factura_compra_mostrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalle_factura_compra_mostrar`(in valor int)
BEGIN
select f.idfactura_compra 'Factura', o.nombre_pro 'Proveedor', u.nombre 'Usuario', f.tipo_pago 'Tipo Pago', f.comprobante 'NÂ° Comprobante', f.descuento 'Descuento', f.total_compra 'Total Compra', f.fecha_compra 'Fecha', p.idproducto 'CÃ³digo', p.nombre 'Producto', p.descripcion 'DescripciÃ³n', d.cantidad_comprada 'Cantidad', d.precio_unitario_compra 'Precio Unitario', d.precio_total_compra'Total' from factura_compra f inner join detalle_factura_compra d on d.id_factcompra=f.idfactura_compra inner join producto p on d.id_producto = p.idproducto inner join usuario u on f.id_usuario = u.idusuario inner join proveedor o on f.id_proveedor = o.idproveedor where f.idfactura_compra = valor; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `detalle_factura_mostrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalle_factura_mostrar`(in valor int )
BEGIN
select f.idfactura 'Factura', c.nombre 'Cliente', u.nombre 'Usuario', f.tipo_pago 'Tipo Pago', f.comprobante 'NÂ° Comprobante', f.impuesto 'Impuesto', f.total_factura 'Total Venta', f.fecha 'Fecha', p.idproducto 'CÃ³digo', p.nombre 'Producto', p.descripcion 'DescripciÃ³n', d.cantidad 'Cantidad', d.descuento 'Descuento', d.total_venta 'Total' from factura f inner join detalle_factura d on d.iddetalle_factura = f.idfactura inner join producto p on d.producto = p.idproducto inner join usuario u on f.usuario = u.idusuario inner join cliente c on f.cliente = c.idcliente where f.idfactura = valor; 
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
update cliente set condicion= '0' where idcliente= idclien;
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
update proveedor set condicion_pro= '0' where idproveedor= idprovee;
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
/*!50003 DROP PROCEDURE IF EXISTS `inst_detalle_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_detalle_factura`(in id_produc int, in id_fact int, in cant int, in descu float)
BEGIN
insert into detalle_factura (producto, factura, cantidad, descuento,total_venta) values (id_produc, id_fact, cant, descu, '0');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_factura`(in id_cli int, in id_usu int, in comproba int, in tip_pago varchar (100))
BEGIN
insert into factura (cliente, usuario, tipo_pago, fecha, comprobante, impuesto, total_factura) values (id_cli, id_usu, tip_pago, current_date(), comproba, '0.19', '0');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_factura_compra`(in id_provee int, in id_usua int, in compro int, in tip_pago varchar(100))
BEGIN
insert into factura_compra (id_proveedor, id_usuario, tipo_pago, descuento, total_compra, comprobante, fecha_compra) values (id_provee, id_usua, compro, tip_pago, '0.19', '0', current_date());
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
-- Final view structure for view `mostrar_detalle_factura_compra`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_detalle_factura_compra` AS select `detalle_factura_compra`.`iddetalle_factura_compra` AS `NÂ°_Detalle_Factura_Compra`,`detalle_factura_compra`.`id_factcompra` AS `NÂ°_Factura_Compra`,`producto`.`nombre` AS `Producto`,`detalle_factura_compra`.`cantidad_comprada` AS `Cantidad`,`detalle_factura_compra`.`precio_unitario_compra` AS `Precio_Unitario`,`detalle_factura_compra`.`precio_total_compra` AS `Precio_Total` from (`detalle_factura_compra` join `producto` on((`producto`.`idproducto` = `detalle_factura_compra`.`id_producto`))) */;
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
/*!50001 VIEW `mostrar_factura` AS select `factura`.`idfactura` AS `NÂ°Factura`,`cliente`.`nombre` AS `Cliente`,`usuario`.`nombre` AS `Empleado`,`factura`.`fecha` AS `Fecha_Compra`,`factura`.`tipo_pago` AS `Tipo_Pago`,`factura`.`comprobante` AS `comprobante`,`factura`.`impuesto` AS `Impuesto`,`factura`.`total_factura` AS `Total_Venta` from ((`factura` join `cliente` on((`cliente`.`idcliente` = `factura`.`cliente`))) join `usuario` on((`usuario`.`idusuario` = `factura`.`usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_factura_compra`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_factura_compra` AS select `factura_compra`.`idfactura_compra` AS `NÂ°Factura`,`proveedor`.`nombre_pro` AS `Proveedor`,`usuario`.`nombre` AS `Usuario`,`factura_compra`.`tipo_pago` AS `Tipo_Pago`,`factura_compra`.`descuento` AS `Descuento`,`factura_compra`.`total_compra` AS `Total_Compra`,`factura_compra`.`comprobante` AS `NÂ°_Comprobante`,`factura_compra`.`fecha_compra` AS `Fecha_Compra` from ((`factura_compra` join `proveedor` on((`proveedor`.`idproveedor` = `factura_compra`.`id_proveedor`))) join `usuario` on((`usuario`.`idusuario` = `factura_compra`.`id_usuario`))) */;
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

-- Dump completed on 2023-12-12 12:00:03
