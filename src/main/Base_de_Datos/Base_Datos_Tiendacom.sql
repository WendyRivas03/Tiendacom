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
INSERT INTO `cliente` VALUES (1098,'CC','Maria','27363','marialamejor','caraño',1,'2023-10-16',1),(1297,'Cédula de extranjería','Jhon','4444','jhonelsexy','cabi',2,'2023-10-16',1);
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
INSERT INTO `producto` VALUES (1,'Portatil lenovo','5 de ram, disco duro ssd de 500G',50,NULL,NULL,2500000,1),(2,'Mause Inalambricos','Mause inalambrico, falcil manejo',49,NULL,NULL,60000,1),(3,'Teclado','teclado flexible, de facil portabilidad',33,NULL,NULL,72000,1),(4,'Portatil Dell','9 de ram, disco duro ssd de 500G',15,'',NULL,4000000,1),(5,'Teclado Inalambrico','teclado inalambrico y portable',15,NULL,NULL,48000,1),(6,'Porta celular','porta celular de aluminio',30,NULL,NULL,15000,1),(7,'Memoria USB','Capacidad 32GB',14,'',NULL,60000,1),(8,'portatil','dell',0,_binary '�\��\�\0JFIF\0\0\0\0\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 90\n�\�\0C\0\n\n\n\r\r��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\09\0	\0\0\0\0\0\0!1	\"A�2Qaq����#Br�$R����\�\0\0\0?\0ښ\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\".2+�D]���\�Ij�玚��\�4\�c\Z:�O >%c���[$\�!ߩ\�+Jҹ�Xn�9\��Z\�T\�\��kc]��\�\�9p[�jgϛc\�\�D.�[,�9�\�f����K(c��\�I�+GiE-Omz���_]sdP\�;�\���ַ,�==b�i\�e|\�~L\n��\�\�\"\�ŋ\�>��\�<\�\\���g\��MF���\�!����_aڝ��[�e]\���޹T�Z׸�\0-��a��8�o\�\"�\�\�f\�\�{c\�\�FN/V�\�#q8\r���7y<4�/\�m4��妨�ժ��\�\�	d�%�i�G��Z\�\�o2T\�\�\'��6Yz)Ţ�\09�=n\�U�\�\Z\�\�V�\��o6HX�ͯ�H\�G�\�N¶�Զ_c��\�rE\�k\Z�P\�\�̎/���\".<�7�ه�z\�eK&+u\�F_��\�7��&P>S6Q�Xn\�/E/�Ts\ngh�\�9�\�#SL\�\�;`�<D	c\�^�g��$�G�WJ��-��)H\��\�Ni\�G�\�Py�K=\�\0y����\�����;��\�=e{\�usb��P�Ǥ�H\��\�\�߶W�\�k��e����F\�)�̶��\�\�d}\�\"~H\��ŭ;}F1\�I하\�5*�\�xGU=\�C�\�1TEMSSU/u$ފV�\�\�`��#����\�I/\��JDq�\�\�\���8d�\\\��I�\0r��\�}\�{\�\�Y|\�=\��\�N�\�κ�j�s�\0\�Zk#�cs톞��\�\�i��\�iMA�����\0k�On�\�\�WO =X��7\�]�`��o��7x�RYu=5\�{�]8����y|on\\1\�\\\�9o1��K\�{\�o����\�\�дZ>�\�\�0V\�U\�\�p�\'�0;�s[�Ak���\�.�o���}��\���R]8GUs���\�.\�|\�{\�\�f�d�T\�ryZ*n�\�\nڟeN\�ۭ�MtЕ��--8}3\\\�n���7\� x�9�\�h�\��{�Zv\�o�i���M0tO���%�}s�/\�\�U\Zz\��P\�4�\�T���������\�=B󾳣�Wp��A�?Ӵ<\0{�\� r��\�PA[\�:�خ|>8]߭��d\�S��=��=\�\�/���R]�\�e��\�2�7\�\�YKIn��\�hXi��\'���2���\��Vw\�\�en��\�E>��P\�\�\�SQ5�\�ច\�\�h�{�\0v=״�\�Vzجv\�Gq�p\n\��H|҆g���\�h$�\�Ϛ\��#!a�\��s�m\�JTP\\ 1U�\�\�Aݚ�\0����\�ÑZk\�wݠl�S2\�r�\�\�\�)�!��\�K,�\�F\�\�\�F\0q\�9i\�\�\�x�czgv\r�j��\�C�o�\�\�J�a0zw�p\�\�+6\�\�-�\�W�\�:�M�\�I$�R��`k\"�	��!mt\�\�MWu���t���?�s�%\�m\�Ӳ\r Y!\���θ�U??�H�,駶G��\�;a�ک��h�d15�@(��\�REO���\0:|�(�� �\�p\�v��ޖ��9d���\�M5l�\0AG`{��G\"c\Z\��\��\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\dell.jpg',0,1),(9,'memoria usb','memoria de 64Gb, todo terreno',0,_binary '�\��\�\0JFIF\0\0%\0%\0\0�\�\0C\0	\n\n			\n\n		\r\r\n�\�\0C	��\0\0h\0`\0�\�\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0<\0\0\0\0\0\0!1AQV�\�	\"a2BRq�#3br�S����\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1AQa\"q��2�\�\����B�\�\0\0\0?\0�z5O\�\��[���\n����Uy�\�\�\��MS��*�\�\�\�hB���}�^kq�4�ST�>ʯ5��\ZЩ�eW�\�}\r\0\�T\�?���\�n>��t*j�\�\�U\�C@:5O\�\��[���\n����Uy�\�\�\��MS��*�\�\�\�hB���}�^kq�4\�\�\n@(\0��P\n@(\�/1m�\�l$\�f\�[i\��\�+B\�~�$ݸ\�<�M�Xo[#\�<U��A�=!\������BR\n��<��U��T�\'\Zqm���\"�\�\�P��Y$�\��^��y�\�C\�()I �\"�-?thύ{eGb��\�w+�\"���1a���B\�Q\�+b	\0���J9)T�]��\�D�ϋ��s�\0Y1W��:qc����\Z\�cnS���~%\�/m\�AYJ8��T�\�\�\�~o\�}\�pV�\�$����f��U��F\�|\��\��ǋ �ra�\�\�\�m<�d� $}[\�OuS9q��\�Ⱥ\�Yg��q�$�\0����A\nɄ-(\�����mG�^[���\�Bw\�Sj\�$�����j\�1���5W�Ȫ�����v�+4�{\�\�\��P嬩�\�|F+r��TU��G\�$�uת�\�9���9I\��yzZP�)ƕ\Zj1Zf��~�v׎��T��\�!Y��!q�A;\�\�\�O�\�D]C�w\�.�%hC\�\��\"\�J��s�\�%�e�\0Ӗv\�3\�,-\�\�\�E�)��Ry�) q\r�*��~�\�k\�zL\���e5\�.5pƧ\�=m\�\�\�6#��\�d��C�T���\�\�eb��ۍǑ-\�y+I�\�>9\�}\'����ޢH�\�\�X�b{\�Q�,\�\�\�7����\��\�WO\�\��\�\�`�0\�y��l��\0:\�/po�iΥ���T?�\�P\n@(\n�\�:�x\�\�\�\��\�.\�\�w&\��\��q\�T�\�۱\nPQ\��*\�?��eS^(\�茏×%��\�$�\�߶�-&\�7��a\���|B]�C\�|t�P\�\\C�RAW_>[ur�&�=\�Zv͛m�<��/�\�L&[h �Cd���\0eAĺB?(X�\rs����3\�!\�\�\�r\��f�\�\�\�{(�7[i=�m\�y��،�s�-�n�muJJ�<$o�w\�;7�4C�(H�B[\�+o\��ܖ�0��_Byl\�@ �\�\�\�l��c\�J�\�\�\�ݵ\�\�����930m\�z��\�\�M���P\n\�\�`^m��H�ɇ5�ǐ˃t�\�\�R��\�$Q<�h\�I���Z�\�[��3�冚m\�Z�W\�Y�(Z\�\���t�w\�M/�h\���\0\�\��œ\�j\�/��O\�#t��7\�؁\�TI��\��d�a��̶\�㉰!�\�\�D��7\�\�$))�p\n�;��P\�\�۩��ɜY;��ag�\�\���\�m�\�S��\�)��\"���\�.\�g�Z�\�2��\�q����Y;ʤ\�]\�EZǥ�w�?� \�6��\�N�߼vK\�RU�\��\�:�\�7gf\���\�JRվO��r�\�\�8\�\�\�)8\�h�N�\�7��i���pDTB\��q\�τ�d�8\�<E�\�^\�r��Voĥ�º�b�H\�eϱ\r\�\�U0x�N����~]\�+Ү|Z��V\\y\�}�n̎E�h��`W%\�n\�\�\�U%�@(Y�\�4g\�NH�d�\�XU.\\-�)�\�7���x�7�%=�8_\���\�\�5\�\�ūL�\�n\n��)mgm�\�cP\�R\�w\�̥gY�\0����\�\�5$up�\n\�+q}|\�;%;r�ηm\�ݚX��m��Vө�\��䫁��d�Z�ߡ\"Z�$���\��\�Vɓl\�G\�**W!n3 �����@P\�;��>`��\�Gtp\�)7�\\3Z]��\\�{;{1��-�A\�l�\�b\�\�ş\�cI	\�8N U�\�\�\�\�\�w�\�i;J��\�	\0\�;JPk�8��	Y��II)\�\�\�\�]9\�\�\�30\��\�QvY\�\�\�H�En[����u_�W^�\�jݳ\"�qt׊6~_�\����2�$lw<��\�\�\�6Gɧ,gK\�\�\�h��pc\��I���\�ۮ$�!c���+�W.ޝ��}U���M�ٝ7v6\�\�\�xz�<?\��F���H\�\�\�\0��\�\�i�Pf��\�\Z�\�\�1qɌ{�숳w\��~��Ƒܢ;*\�x�Ԯ>���\�r:f\�誂\��8\Z%\��`��\�{\�\r������th�ٲ䱴\�g\�\�\�GRf����j\�\'��\�I~�3\�~��/bǋX2\�/�pg\��g�(�W\'ޜ�\�Vk\�7��\�\�{���\'\Z9��g\�ȉ�\�Odvxȼ\�\�K[\��ٵ8\�\�BV�\�\�H��o���ֽʜ�H<��>��gNwO\���^ua,Qb�&u�\r�\�\�a2\�\�t4B�\�\�֓׽u͛�8\\f2�\�d�\�y\\\�;Gw�8:\�0��^�\\�u�Vݪ6\�3\�9\�f�1��o\�\�-\�\�I<\�\�۶��\�ۘ|e%�þ+\�\�+rFɻ��\�W\\6\�.w\�\�c\��nL\�\r>\�\�\�w��[F���Q\�KSIIB�Զ�n{��\�\���P\n@E��\�+F�2������o\�-�T71� \��\0M�S��5(IE\�FBqm[S	o\�a�\�\rp\�6Y��23�n����9\Z��j�:\�\����*�J�.���ȳN\�&lv\�e\�/��N0��6c8�G\�nI\���\�]R��l�B5\\�WY<\�\�s\n���\�ZT�s�vy��\�U\��\�\�٥{��<m�[S�\�\�Y�\�?\�^܆é#}�<\�h����ٜc�#�z�\�\��\�[\"\r\�\�9k\�vE\�˼S�\09��#/�J\�ܱdK�nwv\�$%H��l6�\�o\�Z�\�}\�Z\��Z��-\�t���4���\'�\�\�A��I>h�0�r\�5�bFz[\�X\r���\�\�:\�)7da��ͱІL\�rk#c\�\�-.=\��)WW\�l�\�R�Сخ�Ggݕ�%���P\n2}�ZjgF\���y\�qO$>\�\�;~`8{\�{\�Ϟק\�\�g\��3��^b}�8�K��úy\�փ�ߘ\�\�\�U��C�X-ݤ>�\�<\�3��P\�1\�\�)�\�\�c�n\"d5Zy8ÊR\�U�\0�U�w@\����\�[6\�:\�s�罖\�\�!�=kSkJ�{Jv߬\�jY\��:��\�.F仌\�\�\�Qnl�E\�\��\�=\�\���\0\Z�Œ�m�ԇ��L\�Qh��P\n�\�x*���>\��D4ʵޢ9Kd~\r��r�؃\�@�FN4FQ\�Y7�\�?\�-?\�\\��\���o�Cs���:�߷%\�+3�\r֌\�%\�g�8ksfq	z!R���?�T	��\0E\ZV\����m��\�kv�In\\�+l�/�\n\nK-\����\�n{�..96�\"�<�5�HP\n@(\0��\�3[%�\�;,#\�F�v�\�+a\�n�\��&\�N\�A�Ƿz�f\�nD%+�\"\\\��\�v\r�&\�\��uR\�f\�5N��� /\�z�j8>(��{��%5\�&\��\�X{]�\�d�ͮ\�o�\nt�4\�v\�m�=�#��JNo9]�F*+(�U`Ƞ�\�n��S�*��\�\�M^���^Uq�\���T�ʯ*��\�\�W�\0\�W�\\}u\0\�\�?�r�ʮ>��t\�\��9U\�W]@:j�O\��򫏮�5z��UyU\�\�P��S�*��\�\�M^���^Uq�\���T�ʯ*��\�\�W�\0\�W�\\}u�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\momoria64.jpg',0,1),(10,'Memoria ok','32Gb',0,_binary '�\��\�\0JFIF\0\0%\0%\0\0�\�\0C\0	\n\n			\n\n		\r\r\n�\�\0C	��\0\0h\0`\0�\�\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0<\0\0\0\0\0\0!1AQV�\�	\"a2BRq�#3br�S����\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1AQa\"q��2�\�\����B�\�\0\0\0?\0�z5O\�\��[���\n����Uy�\�\�\��MS��*�\�\�\�hB���}�^kq�4�ST�>ʯ5��\ZЩ�eW�\�}\r\0\�T\�?���\�n>��t*j�\�\�U\�C@:5O\�\��[���\n����Uy�\�\�\��MS��*�\�\�\�hB���}�^kq�4\�\�\n@(\0��P\n@(\�/1m�\�l$\�f\�[i\��\�+B\�~�$ݸ\�<�M�Xo[#\�<U��A�=!\������BR\n��<��U��T�\'\Zqm���\"�\�\�P��Y$�\��^��y�\�C\�()I �\"�-?thύ{eGb��\�w+�\"���1a���B\�Q\�+b	\0���J9)T�]��\�D�ϋ��s�\0Y1W��:qc����\Z\�cnS���~%\�/m\�AYJ8��T�\�\�\�~o\�}\�pV�\�$����f��U��F\�|\��\��ǋ �ra�\�\�\�m<�d� $}[\�OuS9q��\�Ⱥ\�Yg��q�$�\0����A\nɄ-(\�����mG�^[���\�Bw\�Sj\�$�����j\�1���5W�Ȫ�����v�+4�{\�\�\��P嬩�\�|F+r��TU��G\�$�uת�\�9���9I\��yzZP�)ƕ\Zj1Zf��~�v׎��T��\�!Y��!q�A;\�\�\�O�\�D]C�w\�.�%hC\�\��\"\�J��s�\�%�e�\0Ӗv\�3\�,-\�\�\�E�)��Ry�) q\r�*��~�\�k\�zL\���e5\�.5pƧ\�=m\�\�\�6#��\�d��C�T���\�\�eb��ۍǑ-\�y+I�\�>9\�}\'����ޢH�\�\�X�b{\�Q�,\�\�\�7����\��\�WO\�\��\�\�`�0\�y��l��\0:\�/po�iΥ���T?�\�P\n@(\n�\�:�x\�\�\�\��\�.\�\�w&\��\��q\�T�\�۱\nPQ\��*\�?��eS^(\�茏×%��\�$�\�߶�-&\�7��a\���|B]�C\�|t�P\�\\C�RAW_>[ur�&�=\�Zv͛m�<��/�\�L&[h �Cd���\0eAĺB?(X�\rs����3\�!\�\�\�r\��f�\�\�\�{(�7[i=�m\�y��،�s�-�n�muJJ�<$o�w\�;7�4C�(H�B[\�+o\��ܖ�0��_Byl\�@ �\�\�\�l��c\�J�\�\�\�ݵ\�\�����930m\�z��\�\�M���P\n\�\�`^m��H�ɇ5�ǐ˃t�\�\�R��\�$Q<�h\�I���Z�\�[��3�冚m\�Z�W\�Y�(Z\�\���t�w\�M/�h\���\0\�\��œ\�j\�/��O\�#t��7\�؁\�TI��\��d�a��̶\�㉰!�\�\�D��7\�\�$))�p\n�;��P\�\�۩��ɜY;��ag�\�\���\�m�\�S��\�)��\"���\�.\�g�Z�\�2��\�q����Y;ʤ\�]\�EZǥ�w�?� \�6��\�N�߼vK\�RU�\��\�:�\�7gf\���\�JRվO��r�\�\�8\�\�\�)8\�h�N�\�7��i���pDTB\��q\�τ�d�8\�<E�\�^\�r��Voĥ�º�b�H\�eϱ\r\�\�U0x�N����~]\�+Ү|Z��V\\y\�}�n̎E�h��`W%\�n\�\�\�U%�@(Y�\�4g\�NH�d�\�XU.\\-�)�\�7���x�7�%=�8_\���\�\�5\�\�ūL�\�n\n��)mgm�\�cP\�R\�w\�̥gY�\0����\�\�5$up�\n\�+q}|\�;%;r�ηm\�ݚX��m��Vө�\��䫁��d�Z�ߡ\"Z�$���\��\�Vɓl\�G\�**W!n3 �����@P\�;��>`��\�Gtp\�)7�\\3Z]��\\�{;{1��-�A\�l�\�b\�\�ş\�cI	\�8N U�\�\�\�\�\�w�\�i;J��\�	\0\�;JPk�8��	Y��II)\�\�\�\�]9\�\�\�30\��\�QvY\�\�\�H�En[����u_�W^�\�jݳ\"�qt׊6~_�\����2�$lw<��\�\�\�6Gɧ,gK\�\�\�h��pc\��I���\�ۮ$�!c���+�W.ޝ��}U���M�ٝ7v6\�\�\�xz�<?\��F���H\�\�\�\0��\�\�i�Pf��\�\Z�\�\�1qɌ{�숳w\��~��Ƒܢ;*\�x�Ԯ>���\�r:f\�誂\��8\Z%\��`��\�{\�\r������th�ٲ䱴\�g\�\�\�GRf����j\�\'��\�I~�3\�~��/bǋX2\�/�pg\��g�(�W\'ޜ�\�Vk\�7��\�\�{���\'\Z9��g\�ȉ�\�Odvxȼ\�\�K[\��ٵ8\�\�BV�\�\�H��o���ֽʜ�H<��>��gNwO\���^ua,Qb�&u�\r�\�\�a2\�\�t4B�\�\�֓׽u͛�8\\f2�\�d�\�y\\\�;Gw�8:\�0��^�\\�u�Vݪ6\�3\�9\�f�1��o\�\�-\�\�I<\�\�۶��\�ۘ|e%�þ+\�\�+rFɻ��\�W\\6\�.w\�\�c\��nL\�\r>\�\�\�w��[F���Q\�KSIIB�Զ�n{��\�\���P\n@E��\�+F�2������o\�-�T71� \��\0M�S��5(IE\�FBqm[S	o\�a�\�\rp\�6Y��23�n����9\Z��j�:\�\����*�J�.���ȳN\�&lv\�e\�/��N0��6c8�G\�nI\���\�]R��l�B5\\�WY<\�\�s\n���\�ZT�s�vy��\�U\��\�\�٥{��<m�[S�\�\�Y�\�?\�^܆é#}�<\�h����ٜc�#�z�\�\��\�[\"\r\�\�9k\�vE\�˼S�\09��#/�J\�ܱdK�nwv\�$%H��l6�\�o\�Z�\�}\�Z\��Z��-\�t���4���\'�\�\�A��I>h�0�r\�5�bFz[\�X\r���\�\�:\�)7da��ͱІL\�rk#c\�\�-.=\��)WW\�l�\�R�Сخ�Ggݕ�%���P\n2}�ZjgF\���y\�qO$>\�\�;~`8{\�{\�Ϟק\�\�g\��3��^b}�8�K��úy\�փ�ߘ\�\�\�U��C�X-ݤ>�\�<\�3��P\�1\�\�)�\�\�c�n\"d5Zy8ÊR\�U�\0�U�w@\����\�[6\�:\�s�罖\�\�!�=kSkJ�{Jv߬\�jY\��:��\�.F仌\�\�\�Qnl�E\�\��\�=\�\���\0\Z�Œ�m�ԇ��L\�Qh��P\n�\�x*���>\��D4ʵޢ9Kd~\r��r�؃\�@�FN4FQ\�Y7�\�?\�-?\�\\��\���o�Cs���:�߷%\�+3�\r֌\�%\�g�8ksfq	z!R���?�T	��\0E\ZV\����m��\�kv�In\\�+l�/�\n\nK-\����\�n{�..96�\"�<�5�HP\n@(\0��\�3[%�\�;,#\�F�v�\�+a\�n�\��&\�N\�A�Ƿz�f\�nD%+�\"\\\��\�v\r�&\�\��uR\�f\�5N��� /\�z�j8>(��{��%5\�&\��\�X{]�\�d�ͮ\�o�\nt�4\�v\�m�=�#��JNo9]�F*+(�U`Ƞ�\�n��S�*��\�\�M^���^Uq�\���T�ʯ*��\�\�W�\0\�W�\\}u\0\�\�?�r�ʮ>��t\�\��9U\�W]@:j�O\��򫏮�5z��UyU\�\�P��S�*��\�\�M^���^Uq�\���T�ʯ*��\�\�W�\0\�W�\\}u�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\momoria64.jpg',0,1),(11,'prueba','hola',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0A\0\r\0\0\0\0\0!\"1AQ	a�2Bqbr�$��%3CRcs������\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\00\0\0\0\0\0\0\0!1AQ\"aq����#2R\�B���\�\0\0\0?\0\�\0P\0PJ\0�+@@@@@@A��~�^6�b4�\r9w�e�\�/m�Ɂ%l:a\nq\�)+� \��\�gN\�ݧ\Z\�Qn)\�v�T��.V���-iRB�)�/%$k@\�=ee�\�{�\�\�a���\�zԴڵ��\�\�\����:�\�&�\�m��\�8�	U\�ʴ\�\��\�2H\��\��a�隔��Z�r�\0%�{�2bU��EuN/{�\���ٽ\�Z\�;�f�1x	�)O�i\�*?`k\�1�(#@V�(�(�(�(4|i7���i= ˥l\�,\�0\�3\�/\�p���\�ހR�X\�\�%\�I[m\�i33jq\�rI=\0ǹ�OZ��\�:=\�;�\�\�\�&��\�O�MG�/v��]cih\�b2�\��+h)i\�\�O�S\�\��{g�Y�]\Z��r\�~�|��+�s�6\��\0d&\��\�\�M\rI6sRз��Jz��C�޴\�PZ\�\\~��i��{�T�k:P\�l\�\�m-\�\�B��Ƶ�ń�?\������ܒ�\��2��\�S~����L\�\0	T\�#\��\�Zp���M@&\��K�r�-/U�JNp�����d�\0�M�\�	/e�[u\�Znnp�D�o�\�\��)$��\��\0�\n\0�(|�\�;�\�\�Yݪ�3P!\��cxve�c\��!��\�N6ȣ\�ͮ�i�`��/�D������!)\n\nH\'\�y�Es�S\�м��\�c�-t�Z��\�zF�uEU�E\�2{?8\�\�\�K=U�\�\�\�.ʸ����J���\n��$�\��͞�JW�%�����j\��k�6\�Uk4�\�[\����\�un����\�E\�p-.\��Q\�q��\��5\�t?NԵ�ج�m��K�\\T���S�O�>ޫR\�\�r2�6\�vBz��\�]\'K[ҍz^�v|;R	�����\�R\�\��YH��ⲏ\�>uf�c/\�D>�|��}\�Vk}l�\�\Z�[��la�8�2\�\�kQ@<TR�\'�;\�ŭҧ�,�gXj\�\n\0�\n�\Z�\�Me��XBl��S\�U\�\�R�>\�	z\�\�\�=)\�^|�\�\�Y[�R��D\��&�ؿ\r�%ܢ؝���W\�C��Po\� \�\�\��\�j.j��\�f}\�\���zvҔq�Mq\�^s�{�\�Q�F��0��e\�TF�>|E%=x�\0,`�+X�\�k_j4\�[\��ܺ��_s[�}��c(\�\�~~�\Z+���\�Ɲ��9�!�`8!\0d|g��\0\�}�\�\�&\�\�0�Y/rx\�\�/���B�=F���H�.9X\�.W\�jwN�\�n$�ZK�/�¸(\��>��\�/���[J���\����&�uҨ��Ӷ\���dmܘ�\�QV=��Q��zY\�כ�Q\��N\�p�z�\�T7\�.�\�q\�,\�\�Ói�~\�:E�.w\�*�0)8W\'�[�h6?�`6\�m�\�^I5P@PB@M\n�\'��o=��^��ܛ�u��,�\�e\�\�~�+t���$�\�\�h=o~3�J˭���\�q{\�/6�\0V\�e\�\�km\�I\0w\��=@����ΝH��块\�~����9\�Q���ݖwK\�q\�>\�I~+\�\�0� ��\����Gӄ/s]r���\�\�\�R�֬�%�\Z�\�e�4�י=�Z�\���\n	_�\��\0ε\�\�W�\n\�\�P�ϝ\�c\�9UJ\�֭.�Ic\���p4��Q�9R\�@Z�F��sW\�:\��\0MbO�ط8¤*(=�BY�\�ն��(\�jՔ��\�b��O�\�\�m���\�ͣ4{yW틫1�\�3��\\�Wٴ�\�5I�ͣ\"���Kܛ\�\��m�\�b$V�\�fKM6���$a }\0�<\�\"��.dx��%�\�\�hr[��%	䞂�a�#�N�\�\"Tk\"\\\��\�H.*1\��IKp�_\�֘\�\"\�\���ֺ�+�2�-�J��}�]\�~]\\\�_I8\�*\'�Z��23z�\n�Yf\�\�}\�\�4\�.���R��V\n�(\'\0�K5=(�*k=��h}�X��\��\��\0\Z0	��!��\�j�07r��S�\�I���P�z\�-&\\�ISy��\rz\"\�a2�\�K\\^}@��\0�]���;yB�s,��\�\\\��]N�\�%t��(�\�\�\�\��\����#�J�E(	\0����\�\����N�\�J���?s\����kg_ݴY\�]I\�|v��\���\0(c�=\�\�Z\�D��\�\�\����\�\�T\�}\�2����כ)�\��(�چ;��:)��\�A}\�\�I��k�--m⹎�T�<}R\��\0R�\"�\�\�\�\Z�x\�ǈ/\��\0�u�\�ph�B\�ޣڋS��o��w\\\�^X�s�\�	����@B=g���p\�u\��\�(��7�-��z��\0��rk�J$6y2\�]A�I�\0�C\�\�\�\�ی���(c�VR<\�p�d�\\$\�㠪Լ��\�4�iiD�6Q\�^\�$���\�O.i\�:U�vZ�\n�!A�ҷ\�Q\�o��08g)m\�X8$yP�\���!\\P_	-�AjD������蓕?\�P\�%;-n��Q�*�RS�)\'�A���z�\r&ދ!�i\��)\�Nx�@��TC\��Z\�̍\�x\��\\����_OcV\�T.B\�\��d�}+׶�J�T�~Ŏ���\�PD��\�2�\����<�U^��m\ZT�ZK	~��\��ЫV3��O?���;o�\�\�÷]�,�,�WMV��\���9����\r!�Ƶd��kW5\�\�i֗��d��1�o�ܖ\\i\�\�\�N$�hX\�TB>`�PS};\Z�pnU\�o�|nYJ�[Y�,(�A�\�\��)�!m\�\�6�q�\�\�SXYm\�$ �\�(z(����r~�	�&\�T5���\�0\�y2\�$��F�jS�4N�\�\�-�BV$���Ò���\�\��i䧁7p��\�\�!����	m=Nx�]BT�|\�}Gުpk\�m\\4�1�%\�\�\�R��:>\�ǅ$G�d}\�@M��E�bJ ���M��%`��~E�\n\�\Z\�ӨOIR~F�����J���\�x\���\'�\0\�=E`\�$��;gy\�\��ӺJ\�t^n1\�\�ZHi.��@y�*\�>��\�\�N�JI�KM~y=!\�l�4\�\�i�\�b\�Ŏ\��ChHJG\�V\�}\0P\0\�\�\'g�/�\�⛛\'vmcݣ$���W�џʯ��\�M\�\�}M�\�^\���muX�t�	���|Я\�W_l��Uq�\� y\nz\�\�ZT�}\r�WHa�ǜ�=�$!��D.0�*HIG�z�R~H6�W\Z\�$͉!sЦ\�\�LJ����$	\�\0�)\0��~u_$#S~}�>�\�\�\�!ax��Aa�՜\�u����F\�d;3\�7j;\�#i�{��&�Bf]���hG�����d���\�V�\�+c���;+\�\�\�\Z`[��a*\��iL\�\�\���a��|#\�Tz\�<�@@\�\�nԖ�6ˬ&.�(\�ލ%��->\�\Zv�\�)r��]�\0nP�\�\�2�lJ%rX�\�?\�S��\�=9PV�Ӯ�\�ۈQBд���pAȃ\�h̥\��\�6\�պE�֠\�a\�W���\0��p�\0�9�\�ԭ�8�4�8.�\�\\]_�k~4c�ӥdHp��?\���\�\�ƙ�э=�m�R\�\�g�\�n��\�1b�m\0{�\r@64@@@@Gnҽ����G�t�\�M\�$�\�\�ynII���ǧ1\�\�PI�0\�Hۼt��\�29��\�ŭ	υ\����c�0W�ɑ@t{g;5Y�\�qn�y\�]T\�D�\�0�c�b�I\��\0d�U`�O*\0�\n\0�\n\0�\n\0�\n\0�\n��+@@@�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\portatillnovo.jpg',0,1),(12,'prueba222','dfkshjdfdfksdfd',0,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\Z \"\"\Z�\�\0C\r\r��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0A\0\0\0\0\0\0!1Q\"Aaq2���	$B�#3��\�%RSTdr���\���\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\01\0\0\0\0\0\0\0!1AQaq��\"2���#\�3BS\���\�\0\0\0?\0\�\�\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�+ޮ��\�\�\�K�\�,�)���\�q�\�J�\�W��V��~9\�	Q�\�qDZ�\0h�L\�a2���\"�}��S��\��� p�x\�\��\���\�\�?\�6���@4[�U�r\�p\�P,\�?�*[���\�\��]\�L\rq��v\r]XQ��\�i�s�qN\�\�\�O�.�c�4V~���@@@��\�{`�\�f�mɁy��>�Iq��G�۬����Ql�\�\��JԦA�ϼHP=��l\�\'��\�F�\�/i\��$��\��<x,\�+\'r�ī�1��jeuG�9N\n\�\�͎\�i\�\�B���ȏ%\����_\�\�$\���#�\'\��G#�\�\�\��Y\\mjg\�\�4YRrx<�\�/�tO��ͥ�X�\�sV��7Ku^�˗A�\r�\�T���#\�\�=\�\'��f��E�\�\�\�~�\�=k�{��*\�z\Zg\�	-6טw!\\�\�I\�\�zťv�\�\�\�*J��@@\�\�/\���}\�B\�Dy	R��\r�\�\�Ct�� \�%�9�k�\"$�y���\�RR�\�\n��ʡ\�S\�\�,Qx�\r�6$���m��\��V�u̌�ҳ�	��83O�:3\�ĸ\�\�\�\�\n[#z�ܐS�x\�\�槇�K]�ɏ�O�s\'�\�\�_;Йv�dw\"\\\�S\�(,�RBAU\�~\�ھ���rE\�6=>\nR]\�?Q�E\�}<�B�.K\�}\�m\'\�@9kZ����\0>�\��eQTz��B#\�\Z\�\�Ovߴ:�\0\nB���>�Ǣr��?\��\0+ϽJI�h��\�&�@@@xL�\�ز\�jDg�P\�O -I\�\nO}h\nOY�A\�6�.��6�D�L�3�)�A�\�\��\�^\�6�-��P\�FJc]Y-+\�淐\n�\"�cXt��\Z�x\��\�\�2a�&��Ԗ�>�*Tg,0�\�B�j9���\�\�\�;\�yp�>Z�\nA\�`\�c�\��\n�1\\3����0���]l�-M6\�Ȗ\�O<�b�-�@�\�?*\�6g�\�7Jr�>Mꍊ���hè��\���ڵ������\�p~I5�z\�\�\�}\r�(�(�(�(��(B�����N0>�\ZwM�N\�.w�/\��*:\�@/;���@\'zp��8g���u��}�\\�I�\�\'ۥ\��]�\�f6V����oJ�\�@J�d�־�J�˺.�.�4\�+m*J[a�H\�*R�\��O=\�\r��\n\0�\n\0�\n\"\�\�6\0M\��m��\�˔\�_\�\"�[�u�@]\�\�Z�j\�\\�\������@�\���2\\uU�Υ�}\�U��^���~怯��Vt��?PB�|isd��\�\nm�J	\�v��\�\�Nu�G\�\�d��}\��!��\r�\�\\ۀ@YHX}\�*bL�\0�T-\�V\�#\�O��\�\�Ac.��`\�\�b�L\�/2-Ǐ)�\�\��6��{�6�F3Ae�BB���\�-�~�]�1-�7y\�\�KH\�{\r\� g�����\�ŕ\�,�r��Ң�\�ec)I^2q\� ���W�\�zn3�Z�\�C�fJ#m��!y_\�R�@?�1\�\ng_��WQWjS��rl���\�f8\�\�ܦ�)M��±��9�W�lq���μ<�\\X�.�\'�y�q\��\�2\�L�SNG�\r��\�vu\�X|+At\�;~\'�=�qd�f\�mr���y厓\\ɶ����\�qX\�^�k\�_��ѭ\�%-�}\�\�j<w6���e_w�\���#�I\�r��7�<ܘeӯME���_~�^n�\�\�\�#IdG�&m\�!\�8	J\\)O�R��\�w�W�\�\�Z�T�\�͒n+>�M��ܗr\�P.�qۊ\�8fCĸ\�T�i	\'b\\\�Nw(qްˋ`��m��W��rds\�iy��K5\n<��%q\�w\�B�	�9\�y \� �\�>�\�j����\�z�wmDI\�)u\�\�Q�i=\�~<c=�ڍ��\��\0�-VH\�Wk���`�p\�I=�\n�\�3F��d�\�]�\�KɊȐ������\�X䏖sPj{P\Ze\�]\�lX�s�_�\�)&\�\�\���(R7a��({�HQ9\��j\�\'��Rf^\�2\�2l\�,\�\�%)\�W)8/\�).��uIH\�H\�\�\�O��9�`X�Ro\��cZ]\�1Z-q��\�o�Q،\�J�\�\�\���%	\'8	$w\�W�LOu~�\�y\�\�tuY{��B#~\��Jٚ[w*XJ�NB>��tQFˍ\��\���\�CN\��*BݾG\�ܦ��>е��F<�W���\�S\�k[\�,\��I���V��ī�\�\�Xsa��\�p{3 ��6\�\'q\�)A\\�|\�\�\�#>\�+���]]�\�N��\�y\�\�.wr�)CiB�\0�}ϥ`�<\�\��2�\�V�mtĴh9\�fͺ�\�\�\�\�[|\���\��%)O+\'�Ҷ\�1�<4 �v߆��\�\�5��ml�\�\�E�ŵ\r\�r\r\�\�3�n\r3jG9(�{\��\�\�*���ò�\�3IN.\����:\��\�JX\�V����U�� \�X���9�	\�$��\�\�TzbJ�e\�f\�d���b<:Z�\�#K�\�[cڢ(�\�|��}r�Q�t�NU\'\�΍�dv.8��[�PJ	$�\0�9G\�\�d\�Q��y�7\�o\�yE��T\�q��-�JDsܜ�P̦\�Ѷc.K_\�ZW�\�p��ڬ���\�;��{��LQ�\�Q\�M(G�9�0�y�.e\�c�\0ҁ󧡬|\�\��\r�b��ho-\�G���²�1\�>\�G\�QO�\�2�Z\��\�jѻ+�WjlICE-�?�	O��\�\�-��\"sN�6�\0<\�S��n\�\�\�*M\�kL�,3�:\�@��+\�+\�\�\���υ\�\�+��\�F3U\�0Z/�o�		�&Z#\�@R�����$\'�A%i\�\�\\�\��K\�/D\�\�g,�EMc{Օ�\\f*(Tx�R\�%�3+~]u[Ք�e^�\'\�\�s��JL�M_*\�Fm����F2\������[Kg\� ��U��?�ͮ\'���R�;����t=�ͦt�{S\�Oډ�n��bd-e\�=ӻ��\�j)E.\�}YHJw���zz.�\��g�G�u���\�l\�/3\�YRI�\�a�ʜNr�2��A�5\\\�\�c��\�oOz\�\� ���F�\�7�TI\���6#��)�\�[JRH3�\����-n2�Yq��\�[�!E\�\�Yˋܲq�x\�=V�X���QU\�z����wD\�\�O�l#\�\�����\r⨍�\�{�\�\�h�lJFHq)�B�#;~ \Z��4�kiN\�K���8Z�0�RZ@Q*m��甤��\�\��qU��\0\�\�Ǔ\"I��^,�:6\�\�\�l���8\�\�Jgw��3�\���\�VѴ�:3\�\�\�9�\�N\�M\��\�v�\"cǕ\rl�1�K>[�=��pv6\�8 g�]�fe�i\�D�_\�\�\�nغ\�]A\��m\�\�U\�\�F3\�$7�\�y\\��y\���ŒR�c��7�ߌ\�$\�ܛ\�\�\���_a�11\�\�G�R���o	\nNH8*\nVq�U�\���\�\�^�c���oZ��\�\�\�\�\�~�w\�\�)1������\�@\�\�D�v|���F�v�\�Z�\�\��å\"̷�L9�\�Q�mhq\�\�T�\���08\�e,�\�qN\�p˖W�]z�\�I\�\���Ϩ]\�\�\"\�hzS齨\��iH��`��_�\��ج�\�u\�,WC}*��@)\\:]�n��\�3k[�(�kҕ(��I态�\��\��\0���2G�*�E:�\ZN�RZ�1/\�ɟ��H\�\�\����H��\�}3>n�����[?Ê��i��s-��6J�)Ԕ�ǼG\�Sb�F\��\�t��\���K\�/\�\�k)\�\�T3��#�V�\�O�\�\�1i�o*n3�\�r�n\�\�ϩ��U��x�Ys��:\nb�\�k�!E\�}\0wR!)c�H4\�Q!ӎ�j��j��[\'Z���̙6*\�K\r\�\�\��#\�\���\�D�GH\�\�b\����CQ\�B[m�$%)H\0��*���PX(�(�(�(�0(�P\0P�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\teclado-gamer-esca-gxt-853.jpg',0,1),(13,'producto333','kshdjsgfjfsf',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n�\�\0C\0�\�\0C��\0\0h\0h\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0=\0\0\0\0\0\0\0!1	Q�\n\"Aaq�2���\��\�#RrB�����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0 \0\0\0\0\0\0\0\0\0\0\0\01Q�!q�����\�\0\0\0?\0��)�&ȏ�r���MK\�\��}�ף���\�Q\�>\�.�\���9\�\�\���:�(w(d@��m@SH\��\0\�?}U0\�:\�3��:�\�ϗ�]I�\�\�\��x�:I\�#�\��\0�?}C�K?p��\0�g��\�MU)J �\�\��\�\�\�2u<�7r�����(y{�\0����\��\�\�ش�k��{,��\�Z\�u<<\�I�$���.����\�U�Mc\"\ngT�6���p)Ja\�>��/��\"\�P���\0\0z\�ÿ\��\0^�\�\�f�W�\��ܺB���\�({`ڕ�jhH&6\�ިzF��k\�\�bf���=F�t\�$�sX\�\�AB�@\�m\�\��2N$�gFZ�\�ԀQ���>w�#P\�J��p���Y\�p\�\�ϐ\�\�<S��[s\�	\�c�0=@|C\\���\�՘7	#���\\W\��\�G\�*\�u\�R%�7K<1�9�����P��\���\�.�ە5\Z\�}yG1D�D\�3E�즖�U�z!W*�E�tL�g \�Q�\�4�\"��q0��\0ox�P�\�ƭ��-\n�ʮ�y�\n��\� s\�N��\�\�F�p{�\�u�ݕc~.Mot-�E���l�\�w(�\�B\�M8�n1,��H�+��Hx�޼m����P�*�.\\տ�-�N6ۛ\�|\�~RI7$��m��ʎ-���!Y��9S\0�$\�Q)\�Ծ\�3\�y��k ^@ͼ��\�1��>�L\�\�VQ\0����#\�\�\�=1��s�51�\��R\�M�!\0\0��\0t��\�<\��\�G\����\�)p�~?��\0`\0ݨ\�\�&wk\�\�\�iݟ��\�E\�>��i�\�%�?x�n�n��JF�bdĦT\�K�\�\� >\�4\�p�u\�\�\�T\nҔ\�8\�Uyq�8���\�C�R3QU=C�\����醋���ҘpC\�\��v\�	P]��\�9�*\�S\�u\�h\�uM\�\�5\�o)\�1\�|�b������L\n\'\�VJ\�EBa6_���\�O~�.u�\�(M�v}\�:�p�\"ǯ~*�iYS�\�������٫�<ۋ)\�Ӕ�H@-\�U\�\�4Ѥ���؈6ZE���\\�\�g/K\�eJ\�Jb�\�\���@B�3�F\��\�	O����*�懆X�T\�:�\\\�\�\�zK�\�\�Y\���Ȉ�w$IA\�P�Z��\�9DAD�N�\Z�E?�ݚE�8��\�:\�&�@Dy5\��Δ��m��}�mo\�}�J\���\� pW�\�Z���t\�\�S6���\�84�B�TZ\�\"@\�S��!��;=\��\�U���M�l\�B\�\�\�*\'EɮM\�\\�\�V\��(��^i�*��\0V�\r���*\��?}S\�z�qdGa\���g�\0\0\0Z��]\�[��<c���||>�:h\�+�`-���\�q\�\�\�9@�Z4D�\���j��y����!\�?\��\�堁>����\rU\�\0��?\�t�2rbc�JI�A�tsG/�9T�7dŚ*9x\�u� D�j\�%WUC��c\�^\�#ov\�[\�7�^�\�6�j��$\��\�OP\nᑮQ\\����Y4\�\�J�\�\nV�E�T*�\"C������9�=\�\�`\�=���z\�\�´v����t\ZhDZ�t\�~@��x�ȁ@���\�C��9\�]�G�oѤ\�\��\Zn.��\�+\�*��T+�\�8�WZ\�v\�5�\�\nm�\�:\� t��T��3T-ͼ{�ѷ�\�H3��wAy\����T�]%\�&%\�\�JR�\�H��Vl>�m4��H�B�\\2\�1>�j流�{p\�\�ղl\�V�\�얻�t�P*g*\�Z��}�H	�GRoBŠ�Y\�\�Ɍ9Z�>Ej*��0�R�9c\"�\�P�9j���@��\�\���lp��Q\�Z\nf���\�\�9�%�R\�\�[t�\�\"���\�\�I\�5��\�D���0���\�,D�*$#���䧡j)\�-/M�Dp\nROU(8�g\�\0\0d\�`\�/\�\0\0���/(�IQU��\�Jk\�\\/\�u\�`�����=US\nf8�@q\�%\��\�>_�\�MLn�_O~:��K���!Hje\�T)NC\0\�r��r�R��)�!\�@� !\�@CF�\\��ޒ�\\\� D�1\� \"\0�\0�\0��h2�y����<��ξz\�\�\�\�u}\�?��m\Z4h5�t[���A�5����R1\��Ad	�\�C)#PNGS�P��)\\6R^fZbQ�V�\�Y \n\�\�,�F�M���/iM�\�	��V�\�\�NT�ꈄ���9\�i�*jJ��~\�f\�z�I9�\�(8���\�pw��i�YS5T\�~v\���e��d�;)+wZ�nWmAu#\�af#\\�?Uғ�����)�Dє��fn񳴻�	:`\�\�7뷁\�3\�y�+�p\"l勸���\�\�}J\�\�\�,�QG�\�d�ռiQ������\�h٨D)�Qu,�g������B\�ѓۍ��\���\�f4����\�D�J��n]H�ٛ\�xZ\�\��sh\�\�\�x�\�ws�\�r*�) �zbp��wKhl/g�UE\\z=�\�\r\�L#f)\�#C�ZN��\�5�\�,%ն)؊�!ʱH�\Z���\\聛�\�\�\�.\�G���\���oS��\�\�N\�jZ��cj�zU�Y����a\"a\�Ц\���j�^S��\�\�,\�\�<�fL��uu%iih��﹥Ӷ��Ϫ�\�\�Xji\�e��\�\�I[�Q\�2�(�\�_SO\�4\�*\�Gp�4L\�iH\�M�G}�\�.L��h���t=?gҧ�r�ʙp\�=Fn\�i+ \��,�A��+�	�\n�\n\�;jCT\��j\�ʆ�z6mmjv&��\0N�w4��ky;��,�3h�-�|�CkXB6�M��j1�mLP/$�8��V@#��Q6��㟬\�M.Y[Ͷ�i��Z~��t�\�m\����B\�7M\�c\�N5�d\nb\�\�C,�S1�\�ފ]عU�\�7m*�\�z���mߦiS2�WHQ4\�EF)X\�CD�M�n\�d�����1^�{\�.\�\�hf\�\n�r�M\�\�<_�|�\�R\�c�\�\�O.��<\�]3�Ê�\�!\�s�tH\��\0w\�F��E\�s\�8��\��X�(�9$��p\0�\��΍N?O?\�u}\�?��~�^C��\���thԼe�p8dp?�|s�\0\�8\rj\�\�\�\�\���\�\�\�ɸ+[B�R�+���#\\̐R\�XşI�\�!\�PQ�a\�\�@\0GA���r�y����`����O,0ƛE�OJ7av\�G\���~\�ەd\�V��$\r4w\�\�l\�\�Q��\�\��\0�;rޕ����\�\�\�Kwl,tJ�t���3�ƦE\�a��Fˀ`\�:R\�B��\0�A\�\�bn��3\�ѐ�\�}.��c\0\�DUt�f\�1�\�O\�!I]\�LvIn*��\�\�\�&�;\�ڶ���\�;�*\�CL�E��LR7�B�������#\�Ļm6��\�$\��\�EM�~\��\�\�-y�-\�>�X\�H[v��B��Z.z\r�$f\�DxD%��Å{�16\�/\��ێ\�\�\�(\�\�\�;����-*�m�SB��d\�O,�\�	IS��lt��\�\�4{\�]�\�\������W��\�P\��}#UHۈJ��eJN� ���2\�~E��\�[;�M\�\�\"dܘ{�!\�2��\�&�DP�6{r%\�AM\�\�\� �GGv�ȡj����l\�\�,a��gL!²\�1L,z�6r\�\�\�j>��\�\�\�\�\�غx�:\�N�|��\"�B�\�\�Me�A�\�*�TL\�SLG�D7k����n�\�[3�[��e[\"\�Bj\"��%*J�a��UI��\naø\����;\�+���M\�WA�p\�\"<�0?��\���Ρ�xϷw�R\�0�Zܫ\�g^3�M�-�������H�HP\�\�\\ZNb%eS�����e��d\nR�[�C��3�\�\�\�J�\�4eyf\���2�\�;J���TPF�!\'��OT�-V`U�?��Ö.ەF��l\�&�@�5\�2.)id��*o�\�P@\�PR\08�xC�|dq\�Jb��F����$S�:W�l	���Kݤ\0<g\�7�!\�\"\��h0�\��#n��ej\�\�tU�-)J-O�3H��<��\�YQFRt\�+ɽ��l���\��������n��R�ڰj�\�C�\�\�q\�_�U\�\�,�\�W��48�&\��E^\n� �*�\�!�=G)�\�60ʹ:� �T�\�\�A�\r�[}\�\�����^!\�\�Y��䌔{\r-/Ṉ�i\�ȩ6\"ͤ!&��H7�v��~\�\�5�@\�k�=yh\�d\��\0��u�P\�,\�R*�%0�08%)i<�xG�\�8�\�t	��;�\�otM,�ݺ����\\W:\�\�\'G�J\� ���\�j\�\�\"�\0LV(\�\�1\�%��^���oOT\�E��%$U0�Vޛ��+\�\�J\'����(\�s�\�b �2ʨ �	C\Ztk\��\�m\�\��\0��\�����\n�Y\�+&@\�R�\�DTQ@\0�2\��\" \06K�j�\�v�[�c�]�ѷ�\r���d\�Y\�^� \�\�n\�:�hQ��q^F\���!�v�\�\�3�da5r�\�e\�\�\�Tܼ��\�SRu�\����%E0�m��\�\�]*-R�\0\'\0\�I\�h~��g�K\�r-M׹E\����w���\�A��HhjH�t#�*Q\0BJ&,��#��\ZL�wtݞwvb\n\�vsC\�U�`z���\�\�X�\�\�\�\�\�%dz~\"y����\�PP��>!8�\�-�\�\�/\�؞�Gm\�@�Jj��B��\�H2F8��	F	:��\�2)!V\�+�%1߁\�Jb�\�9\Z��\��\�\�Z��f\�?V���Y\"�M�fT��7E�(D9;B\�\�sPğ�\�~�G\�\�v���n)(k����I=Rqg���9$-T\�t�]L�p��\"���m����\rl]����|���\�tXQpN15;�\�Ȥle��������	r�y��[M�z0\�Z�	\Z�\�=pHRY\�\\���PC1�i�A@$ <$�BH�Ϸ\�c�1��$\rKR.\�\�Y�\��\�\�nEW3�����$��qw!M\Zje\�\�P\�c)=Q��1�\�(qiTldj.\�œD) �4K�&SX�\�-Qj��L�-A�\�i��\�J�8\�K���VOc[U\�\�[H�]fh�}i���(8�\0h\�w�jݫx�Pq\�\�\�p|B<\�lPA���dRn�e��	�HP\�\nD�)(\0R����k�V,\r$�|�\�5ut\�\�RZB��D���Uq\0:��/����g 9���*D\�Ӕ6˵��\�۷�[p�tͩ�\�|����v5&�\�L��M\�OT2*\n�\�ӄ�n��\�\�\����\"\�j�H�a�{��A��Q��\�3�\��\�A�n���Ȏ=I|�3�\�0c \�\�C�A�5� 4\�\�Wk�@�\�厼�h21\� d���`<�<t\�<3\�\�9�\�s\�T��́�î�\Z��lB\�\"�v\�\�!)D�˧�\0:j\�{Bђ���\n	�\'I����w=\Z4�kkVJ�w���JI�\�\�nb8u�YQ+Ü\�;\�g8\�WD��t��x�b�t\0T\�\Z�����\�a(\0`\nRC�\0-\Z4-�!#Jn�tA0\�b&�\0�\�\08Ǘ-xV���ș\�<���\0\�z|<4h\�|���\�p\�]\r�aa~#�\�\�:�[�A\�\�1\��\0���?�>?��\Z\n\�\�*\rA�\�q\��\���\��:�}5\�V\�\�I .B��U�q�W��2 n���  \r\Z4�\�\�\�hɠJn=\��Ma\"ep@)\�Hl\�xy�0\�f�\Z�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',0,1),(14,'h','jdhdjd',0,_binary '�\��\�\0JFIF\0\0%\0%\0\0�\�\0C\0	\n\n			\n\n		\r\r\n�\�\0C	��\0\0h\0`\0�\�\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0<\0\0\0\0\0\0!1AQV�\�	\"a2BRq�#3br�S����\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1AQa\"q��2�\�\����B�\�\0\0\0?\0�z5O\�\��[���\n����Uy�\�\�\��MS��*�\�\�\�hB���}�^kq�4�ST�>ʯ5��\ZЩ�eW�\�}\r\0\�T\�?���\�n>��t*j�\�\�U\�C@:5O\�\��[���\n����Uy�\�\�\��MS��*�\�\�\�hB���}�^kq�4\�\�\n@(\0��P\n@(\�/1m�\�l$\�f\�[i\��\�+B\�~�$ݸ\�<�M�Xo[#\�<U��A�=!\������BR\n��<��U��T�\'\Zqm���\"�\�\�P��Y$�\��^��y�\�C\�()I �\"�-?thύ{eGb��\�w+�\"���1a���B\�Q\�+b	\0���J9)T�]��\�D�ϋ��s�\0Y1W��:qc����\Z\�cnS���~%\�/m\�AYJ8��T�\�\�\�~o\�}\�pV�\�$����f��U��F\�|\��\��ǋ �ra�\�\�\�m<�d� $}[\�OuS9q��\�Ⱥ\�Yg��q�$�\0����A\nɄ-(\�����mG�^[���\�Bw\�Sj\�$�����j\�1���5W�Ȫ�����v�+4�{\�\�\��P嬩�\�|F+r��TU��G\�$�uת�\�9���9I\��yzZP�)ƕ\Zj1Zf��~�v׎��T��\�!Y��!q�A;\�\�\�O�\�D]C�w\�.�%hC\�\��\"\�J��s�\�%�e�\0Ӗv\�3\�,-\�\�\�E�)��Ry�) q\r�*��~�\�k\�zL\���e5\�.5pƧ\�=m\�\�\�6#��\�d��C�T���\�\�eb��ۍǑ-\�y+I�\�>9\�}\'����ޢH�\�\�X�b{\�Q�,\�\�\�7����\��\�WO\�\��\�\�`�0\�y��l��\0:\�/po�iΥ���T?�\�P\n@(\n�\�:�x\�\�\�\��\�.\�\�w&\��\��q\�T�\�۱\nPQ\��*\�?��eS^(\�茏×%��\�$�\�߶�-&\�7��a\���|B]�C\�|t�P\�\\C�RAW_>[ur�&�=\�Zv͛m�<��/�\�L&[h �Cd���\0eAĺB?(X�\rs����3\�!\�\�\�r\��f�\�\�\�{(�7[i=�m\�y��،�s�-�n�muJJ�<$o�w\�;7�4C�(H�B[\�+o\��ܖ�0��_Byl\�@ �\�\�\�l��c\�J�\�\�\�ݵ\�\�����930m\�z��\�\�M���P\n\�\�`^m��H�ɇ5�ǐ˃t�\�\�R��\�$Q<�h\�I���Z�\�[��3�冚m\�Z�W\�Y�(Z\�\���t�w\�M/�h\���\0\�\��œ\�j\�/��O\�#t��7\�؁\�TI��\��d�a��̶\�㉰!�\�\�D��7\�\�$))�p\n�;��P\�\�۩��ɜY;��ag�\�\���\�m�\�S��\�)��\"���\�.\�g�Z�\�2��\�q����Y;ʤ\�]\�EZǥ�w�?� \�6��\�N�߼vK\�RU�\��\�:�\�7gf\���\�JRվO��r�\�\�8\�\�\�)8\�h�N�\�7��i���pDTB\��q\�τ�d�8\�<E�\�^\�r��Voĥ�º�b�H\�eϱ\r\�\�U0x�N����~]\�+Ү|Z��V\\y\�}�n̎E�h��`W%\�n\�\�\�U%�@(Y�\�4g\�NH�d�\�XU.\\-�)�\�7���x�7�%=�8_\���\�\�5\�\�ūL�\�n\n��)mgm�\�cP\�R\�w\�̥gY�\0����\�\�5$up�\n\�+q}|\�;%;r�ηm\�ݚX��m��Vө�\��䫁��d�Z�ߡ\"Z�$���\��\�Vɓl\�G\�**W!n3 �����@P\�;��>`��\�Gtp\�)7�\\3Z]��\\�{;{1��-�A\�l�\�b\�\�ş\�cI	\�8N U�\�\�\�\�\�w�\�i;J��\�	\0\�;JPk�8��	Y��II)\�\�\�\�]9\�\�\�30\��\�QvY\�\�\�H�En[����u_�W^�\�jݳ\"�qt׊6~_�\����2�$lw<��\�\�\�6Gɧ,gK\�\�\�h��pc\��I���\�ۮ$�!c���+�W.ޝ��}U���M�ٝ7v6\�\�\�xz�<?\��F���H\�\�\�\0��\�\�i�Pf��\�\Z�\�\�1qɌ{�숳w\��~��Ƒܢ;*\�x�Ԯ>���\�r:f\�誂\��8\Z%\��`��\�{\�\r������th�ٲ䱴\�g\�\�\�GRf����j\�\'��\�I~�3\�~��/bǋX2\�/�pg\��g�(�W\'ޜ�\�Vk\�7��\�\�{���\'\Z9��g\�ȉ�\�Odvxȼ\�\�K[\��ٵ8\�\�BV�\�\�H��o���ֽʜ�H<��>��gNwO\���^ua,Qb�&u�\r�\�\�a2\�\�t4B�\�\�֓׽u͛�8\\f2�\�d�\�y\\\�;Gw�8:\�0��^�\\�u�Vݪ6\�3\�9\�f�1��o\�\�-\�\�I<\�\�۶��\�ۘ|e%�þ+\�\�+rFɻ��\�W\\6\�.w\�\�c\��nL\�\r>\�\�\�w��[F���Q\�KSIIB�Զ�n{��\�\���P\n@E��\�+F�2������o\�-�T71� \��\0M�S��5(IE\�FBqm[S	o\�a�\�\rp\�6Y��23�n����9\Z��j�:\�\����*�J�.���ȳN\�&lv\�e\�/��N0��6c8�G\�nI\���\�]R��l�B5\\�WY<\�\�s\n���\�ZT�s�vy��\�U\��\�\�٥{��<m�[S�\�\�Y�\�?\�^܆é#}�<\�h����ٜc�#�z�\�\��\�[\"\r\�\�9k\�vE\�˼S�\09��#/�J\�ܱdK�nwv\�$%H��l6�\�o\�Z�\�}\�Z\��Z��-\�t���4���\'�\�\�A��I>h�0�r\�5�bFz[\�X\r���\�\�:\�)7da��ͱІL\�rk#c\�\�-.=\��)WW\�l�\�R�Сخ�Ggݕ�%���P\n2}�ZjgF\���y\�qO$>\�\�;~`8{\�{\�Ϟק\�\�g\��3��^b}�8�K��úy\�փ�ߘ\�\�\�U��C�X-ݤ>�\�<\�3��P\�1\�\�)�\�\�c�n\"d5Zy8ÊR\�U�\0�U�w@\����\�[6\�:\�s�罖\�\�!�=kSkJ�{Jv߬\�jY\��:��\�.F仌\�\�\�Qnl�E\�\��\�=\�\���\0\Z�Œ�m�ԇ��L\�Qh��P\n�\�x*���>\��D4ʵޢ9Kd~\r��r�؃\�@�FN4FQ\�Y7�\�?\�-?\�\\��\���o�Cs���:�߷%\�+3�\r֌\�%\�g�8ksfq	z!R���?�T	��\0E\ZV\����m��\�kv�In\\�+l�/�\n\nK-\����\�n{�..96�\"�<�5�HP\n@(\0��\�3[%�\�;,#\�F�v�\�+a\�n�\��&\�N\�A�Ƿz�f\�nD%+�\"\\\��\�v\r�&\�\��uR\�f\�5N��� /\�z�j8>(��{��%5\�&\��\�X{]�\�d�ͮ\�o�\nt�4\�v\�m�=�#��JNo9]�F*+(�U`Ƞ�\�n��S�*��\�\�M^���^Uq�\���T�ʯ*��\�\�W�\0\�W�\\}u\0\�\�?�r�ʮ>��t\�\��9U\�W]@:j�O\��򫏮�5z��UyU\�\�P��S�*��\�\�M^���^Uq�\���T�ʯ*��\�\�W�\0\�W�\\}u�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\momoria64.jpg',0,1),(15,'ghh','sdsds',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n�\�\0C\0�\�\0C��\0\0h\0h\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0=\0\0\0\0\0\0\0!1	Q�\n\"Aaq�2���\��\�#RrB�����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0 \0\0\0\0\0\0\0\0\0\0\0\01Q�!q�����\�\0\0\0?\0��)�&ȏ�r���MK\�\��}�ף���\�Q\�>\�.�\���9\�\�\���:�(w(d@��m@SH\��\0\�?}U0\�:\�3��:�\�ϗ�]I�\�\�\��x�:I\�#�\��\0�?}C�K?p��\0�g��\�MU)J �\�\��\�\�\�2u<�7r�����(y{�\0����\��\�\�ش�k��{,��\�Z\�u<<\�I�$���.����\�U�Mc\"\ngT�6���p)Ja\�>��/��\"\�P���\0\0z\�ÿ\��\0^�\�\�f�W�\��ܺB���\�({`ڕ�jhH&6\�ިzF��k\�\�bf���=F�t\�$�sX\�\�AB�@\�m\�\��2N$�gFZ�\�ԀQ���>w�#P\�J��p���Y\�p\�\�ϐ\�\�<S��[s\�	\�c�0=@|C\\���\�՘7	#���\\W\��\�G\�*\�u\�R%�7K<1�9�����P��\���\�.�ە5\Z\�}yG1D�D\�3E�즖�U�z!W*�E�tL�g \�Q�\�4�\"��q0��\0ox�P�\�ƭ��-\n�ʮ�y�\n��\� s\�N��\�\�F�p{�\�u�ݕc~.Mot-�E���l�\�w(�\�B\�M8�n1,��H�+��Hx�޼m����P�*�.\\տ�-�N6ۛ\�|\�~RI7$��m��ʎ-���!Y��9S\0�$\�Q)\�Ծ\�3\�y��k ^@ͼ��\�1��>�L\�\�VQ\0����#\�\�\�=1��s�51�\��R\�M�!\0\0��\0t��\�<\��\�G\����\�)p�~?��\0`\0ݨ\�\�&wk\�\�\�iݟ��\�E\�>��i�\�%�?x�n�n��JF�bdĦT\�K�\�\� >\�4\�p�u\�\�\�T\nҔ\�8\�Uyq�8���\�C�R3QU=C�\����醋���ҘpC\�\��v\�	P]��\�9�*\�S\�u\�h\�uM\�\�5\�o)\�1\�|�b������L\n\'\�VJ\�EBa6_���\�O~�.u�\�(M�v}\�:�p�\"ǯ~*�iYS�\�������٫�<ۋ)\�Ӕ�H@-\�U\�\�4Ѥ���؈6ZE���\\�\�g/K\�eJ\�Jb�\�\���@B�3�F\��\�	O����*�懆X�T\�:�\\\�\�\�zK�\�\�Y\���Ȉ�w$IA\�P�Z��\�9DAD�N�\Z�E?�ݚE�8��\�:\�&�@Dy5\��Δ��m��}�mo\�}�J\���\� pW�\�Z���t\�\�S6���\�84�B�TZ\�\"@\�S��!��;=\��\�U���M�l\�B\�\�\�*\'EɮM\�\\�\�V\��(��^i�*��\0V�\r���*\��?}S\�z�qdGa\���g�\0\0\0Z��]\�[��<c���||>�:h\�+�`-���\�q\�\�\�9@�Z4D�\���j��y����!\�?\��\�堁>����\rU\�\0��?\�t�2rbc�JI�A�tsG/�9T�7dŚ*9x\�u� D�j\�%WUC��c\�^\�#ov\�[\�7�^�\�6�j��$\��\�OP\nᑮQ\\����Y4\�\�J�\�\nV�E�T*�\"C������9�=\�\�`\�=���z\�\�´v����t\ZhDZ�t\�~@��x�ȁ@���\�C��9\�]�G�oѤ\�\��\Zn.��\�+\�*��T+�\�8�WZ\�v\�5�\�\nm�\�:\� t��T��3T-ͼ{�ѷ�\�H3��wAy\����T�]%\�&%\�\�JR�\�H��Vl>�m4��H�B�\\2\�1>�j流�{p\�\�ղl\�V�\�얻�t�P*g*\�Z��}�H	�GRoBŠ�Y\�\�Ɍ9Z�>Ej*��0�R�9c\"�\�P�9j���@��\�\���lp��Q\�Z\nf���\�\�9�%�R\�\�[t�\�\"���\�\�I\�5��\�D���0���\�,D�*$#���䧡j)\�-/M�Dp\nROU(8�g\�\0\0d\�`\�/\�\0\0���/(�IQU��\�Jk\�\\/\�u\�`�����=US\nf8�@q\�%\��\�>_�\�MLn�_O~:��K���!Hje\�T)NC\0\�r��r�R��)�!\�@� !\�@CF�\\��ޒ�\\\� D�1\� \"\0�\0�\0��h2�y����<��ξz\�\�\�\�u}\�?��m\Z4h5�t[���A�5����R1\��Ad	�\�C)#PNGS�P��)\\6R^fZbQ�V�\�Y \n\�\�,�F�M���/iM�\�	��V�\�\�NT�ꈄ���9\�i�*jJ��~\�f\�z�I9�\�(8���\�pw��i�YS5T\�~v\���e��d�;)+wZ�nWmAu#\�af#\\�?Uғ�����)�Dє��fn񳴻�	:`\�\�7뷁\�3\�y�+�p\"l勸���\�\�}J\�\�\�,�QG�\�d�ռiQ������\�h٨D)�Qu,�g������B\�ѓۍ��\���\�f4����\�D�J��n]H�ٛ\�xZ\�\��sh\�\�\�x�\�ws�\�r*�) �zbp��wKhl/g�UE\\z=�\�\r\�L#f)\�#C�ZN��\�5�\�,%ն)؊�!ʱH�\Z���\\聛�\�\�\�.\�G���\���oS��\�\�N\�jZ��cj�zU�Y����a\"a\�Ц\���j�^S��\�\�,\�\�<�fL��uu%iih��﹥Ӷ��Ϫ�\�\�Xji\�e��\�\�I[�Q\�2�(�\�_SO\�4\�*\�Gp�4L\�iH\�M�G}�\�.L��h���t=?gҧ�r�ʙp\�=Fn\�i+ \��,�A��+�	�\n�\n\�;jCT\��j\�ʆ�z6mmjv&��\0N�w4��ky;��,�3h�-�|�CkXB6�M��j1�mLP/$�8��V@#��Q6��㟬\�M.Y[Ͷ�i��Z~��t�\�m\����B\�7M\�c\�N5�d\nb\�\�C,�S1�\�ފ]عU�\�7m*�\�z���mߦiS2�WHQ4\�EF)X\�CD�M�n\�d�����1^�{\�.\�\�hf\�\n�r�M\�\�<_�|�\�R\�c�\�\�O.��<\�]3�Ê�\�!\�s�tH\��\0w\�F��E\�s\�8��\��X�(�9$��p\0�\��΍N?O?\�u}\�?��~�^C��\���thԼe�p8dp?�|s�\0\�8\rj\�\�\�\�\���\�\�\�ɸ+[B�R�+���#\\̐R\�XşI�\�!\�PQ�a\�\�@\0GA���r�y����`����O,0ƛE�OJ7av\�G\���~\�ەd\�V��$\r4w\�\�l\�\�Q��\�\��\0�;rޕ����\�\�\�Kwl,tJ�t���3�ƦE\�a��Fˀ`\�:R\�B��\0�A\�\�bn��3\�ѐ�\�}.��c\0\�DUt�f\�1�\�O\�!I]\�LvIn*��\�\�\�&�;\�ڶ���\�;�*\�CL�E��LR7�B�������#\�Ļm6��\�$\��\�EM�~\��\�\�-y�-\�>�X\�H[v��B��Z.z\r�$f\�DxD%��Å{�16\�/\��ێ\�\�\�(\�\�\�;����-*�m�SB��d\�O,�\�	IS��lt��\�\�4{\�]�\�\������W��\�P\��}#UHۈJ��eJN� ���2\�~E��\�[;�M\�\�\"dܘ{�!\�2��\�&�DP�6{r%\�AM\�\�\� �GGv�ȡj����l\�\�,a��gL!²\�1L,z�6r\�\�\�j>��\�\�\�\�\�غx�:\�N�|��\"�B�\�\�Me�A�\�*�TL\�SLG�D7k����n�\�[3�[��e[\"\�Bj\"��%*J�a��UI��\naø\����;\�+���M\�WA�p\�\"<�0?��\���Ρ�xϷw�R\�0�Zܫ\�g^3�M�-�������H�HP\�\�\\ZNb%eS�����e��d\nR�[�C��3�\�\�\�J�\�4eyf\���2�\�;J���TPF�!\'��OT�-V`U�?��Ö.ەF��l\�&�@�5\�2.)id��*o�\�P@\�PR\08�xC�|dq\�Jb��F����$S�:W�l	���Kݤ\0<g\�7�!\�\"\��h0�\��#n��ej\�\�tU�-)J-O�3H��<��\�YQFRt\�+ɽ��l���\��������n��R�ڰj�\�C�\�\�q\�_�U\�\�,�\�W��48�&\��E^\n� �*�\�!�=G)�\�60ʹ:� �T�\�\�A�\r�[}\�\�����^!\�\�Y��䌔{\r-/Ṉ�i\�ȩ6\"ͤ!&��H7�v��~\�\�5�@\�k�=yh\�d\��\0��u�P\�,\�R*�%0�08%)i<�xG�\�8�\�t	��;�\�otM,�ݺ����\\W:\�\�\'G�J\� ���\�j\�\�\"�\0LV(\�\�1\�%��^���oOT\�E��%$U0�Vޛ��+\�\�J\'����(\�s�\�b �2ʨ �	C\Ztk\��\�m\�\��\0��\�����\n�Y\�+&@\�R�\�DTQ@\0�2\��\" \06K�j�\�v�[�c�]�ѷ�\r���d\�Y\�^� \�\�n\�:�hQ��q^F\���!�v�\�\�3�da5r�\�e\�\�\�Tܼ��\�SRu�\����%E0�m��\�\�]*-R�\0\'\0\�I\�h~��g�K\�r-M׹E\����w���\�A��HhjH�t#�*Q\0BJ&,��#��\ZL�wtݞwvb\n\�vsC\�U�`z���\�\�X�\�\�\�\�\�%dz~\"y����\�PP��>!8�\�-�\�\�/\�؞�Gm\�@�Jj��B��\�H2F8��	F	:��\�2)!V\�+�%1߁\�Jb�\�9\Z��\��\�\�Z��f\�?V���Y\"�M�fT��7E�(D9;B\�\�sPğ�\�~�G\�\�v���n)(k����I=Rqg���9$-T\�t�]L�p��\"���m����\rl]����|���\�tXQpN15;�\�Ȥle��������	r�y��[M�z0\�Z�	\Z�\�=pHRY\�\\���PC1�i�A@$ <$�BH�Ϸ\�c�1��$\rKR.\�\�Y�\��\�\�nEW3�����$��qw!M\Zje\�\�P\�c)=Q��1�\�(qiTldj.\�œD) �4K�&SX�\�-Qj��L�-A�\�i��\�J�8\�K���VOc[U\�\�[H�]fh�}i���(8�\0h\�w�jݫx�Pq\�\�\�p|B<\�lPA���dRn�e��	�HP\�\nD�)(\0R����k�V,\r$�|�\�5ut\�\�RZB��D���Uq\0:��/����g 9���*D\�Ӕ6˵��\�۷�[p�tͩ�\�|����v5&�\�L��M\�OT2*\n�\�ӄ�n��\�\�\����\"\�j�H�a�{��A��Q��\�3�\��\�A�n���Ȏ=I|�3�\�0c \�\�C�A�5� 4\�\�Wk�@�\�厼�h21\� d���`<�<t\�<3\�\�9�\�s\�T��́�î�\Z��lB\�\"�v\�\�!)D�˧�\0:j\�{Bђ���\n	�\'I����w=\Z4�kkVJ�w���JI�\�\�nb8u�YQ+Ü\�;\�g8\�WD��t��x�b�t\0T\�\Z�����\�a(\0`\nRC�\0-\Z4-�!#Jn�tA0\�b&�\0�\�\08Ǘ-xV���ș\�<���\0\�z|<4h\�|���\�p\�]\r�aa~#�\�\�:�[�A\�\�1\��\0���?�>?��\Z\n\�\�*\rA�\�q\��\���\��:�}5\�V\�\�I .B��U�q�W��2 n���  \r\Z4�\�\�\�hɠJn=\��Ma\"ep@)\�Hl\�xy�0\�f�\Z�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',0,1),(16,'fgf','asasas',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\n�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0A\0\r\0\0\0\0\0!\"1AQ	a�2Bqbr�$��%3CRcs������\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\00\0\0\0\0\0\0\0!1AQ\"aq����#2R\�B���\�\0\0\0?\0\�\0P\0PJ\0�+@@@@@@A��~�^6�b4�\r9w�e�\�/m�Ɂ%l:a\nq\�)+� \��\�gN\�ݧ\Z\�Qn)\�v�T��.V���-iRB�)�/%$k@\�=ee�\�{�\�\�a���\�zԴڵ��\�\�\����:�\�&�\�m��\�8�	U\�ʴ\�\��\�2H\��\��a�隔��Z�r�\0%�{�2bU��EuN/{�\���ٽ\�Z\�;�f�1x	�)O�i\�*?`k\�1�(#@V�(�(�(�(4|i7���i= ˥l\�,\�0\�3\�/\�p���\�ހR�X\�\�%\�I[m\�i33jq\�rI=\0ǹ�OZ��\�:=\�;�\�\�\�&��\�O�MG�/v��]cih\�b2�\��+h)i\�\�O�S\�\��{g�Y�]\Z��r\�~�|��+�s�6\��\0d&\��\�\�M\rI6sRз��Jz��C�޴\�PZ\�\\~��i��{�T�k:P\�l\�\�m-\�\�B��Ƶ�ń�?\������ܒ�\��2��\�S~����L\�\0	T\�#\��\�Zp���M@&\��K�r�-/U�JNp�����d�\0�M�\�	/e�[u\�Znnp�D�o�\�\��)$��\��\0�\n\0�(|�\�;�\�\�Yݪ�3P!\��cxve�c\��!��\�N6ȣ\�ͮ�i�`��/�D������!)\n\nH\'\�y�Es�S\�м��\�c�-t�Z��\�zF�uEU�E\�2{?8\�\�\�K=U�\�\�\�.ʸ����J���\n��$�\��͞�JW�%�����j\��k�6\�Uk4�\�[\����\�un����\�E\�p-.\��Q\�q��\��5\�t?NԵ�ج�m��K�\\T���S�O�>ޫR\�\�r2�6\�vBz��\�]\'K[ҍz^�v|;R	�����\�R\�\��YH��ⲏ\�>uf�c/\�D>�|��}\�Vk}l�\�\Z�[��la�8�2\�\�kQ@<TR�\'�;\�ŭҧ�,�gXj\�\n\0�\n�\Z�\�Me��XBl��S\�U\�\�R�>\�	z\�\�\�=)\�^|�\�\�Y[�R��D\��&�ؿ\r�%ܢ؝���W\�C��Po\� \�\�\��\�j.j��\�f}\�\���zvҔq�Mq\�^s�{�\�Q�F��0��e\�TF�>|E%=x�\0,`�+X�\�k_j4\�[\��ܺ��_s[�}��c(\�\�~~�\Z+���\�Ɲ��9�!�`8!\0d|g��\0\�}�\�\�&\�\�0�Y/rx\�\�/���B�=F���H�.9X\�.W\�jwN�\�n$�ZK�/�¸(\��>��\�/���[J���\����&�uҨ��Ӷ\���dmܘ�\�QV=��Q��zY\�כ�Q\��N\�p�z�\�T7\�.�\�q\�,\�\�Ói�~\�:E�.w\�*�0)8W\'�[�h6?�`6\�m�\�^I5P@PB@M\n�\'��o=��^��ܛ�u��,�\�e\�\�~�+t���$�\�\�h=o~3�J˭���\�q{\�/6�\0V\�e\�\�km\�I\0w\��=@����ΝH��块\�~����9\�Q���ݖwK\�q\�>\�I~+\�\�0� ��\����Gӄ/s]r���\�\�\�R�֬�%�\Z�\�e�4�י=�Z�\���\n	_�\��\0ε\�\�W�\n\�\�P�ϝ\�c\�9UJ\�֭.�Ic\���p4��Q�9R\�@Z�F��sW\�:\��\0MbO�ط8¤*(=�BY�\�ն��(\�jՔ��\�b��O�\�\�m���\�ͣ4{yW틫1�\�3��\\�Wٴ�\�5I�ͣ\"���Kܛ\�\��m�\�b$V�\�fKM6���$a }\0�<\�\"��.dx��%�\�\�hr[��%	䞂�a�#�N�\�\"Tk\"\\\��\�H.*1\��IKp�_\�֘\�\"\�\���ֺ�+�2�-�J��}�]\�~]\\\�_I8\�*\'�Z��23z�\n�Yf\�\�}\�\�4\�.���R��V\n�(\'\0�K5=(�*k=��h}�X��\��\��\0\Z0	��!��\�j�07r��S�\�I���P�z\�-&\\�ISy��\rz\"\�a2�\�K\\^}@��\0�]���;yB�s,��\�\\\��]N�\�%t��(�\�\�\�\��\����#�J�E(	\0����\�\����N�\�J���?s\����kg_ݴY\�]I\�|v��\���\0(c�=\�\�Z\�D��\�\�\����\�\�T\�}\�2����כ)�\��(�چ;��:)��\�A}\�\�I��k�--m⹎�T�<}R\��\0R�\"�\�\�\�\Z�x\�ǈ/\��\0�u�\�ph�B\�ޣڋS��o��w\\\�^X�s�\�	����@B=g���p\�u\��\�(��7�-��z��\0��rk�J$6y2\�]A�I�\0�C\�\�\�\�ی���(c�VR<\�p�d�\\$\�㠪Լ��\�4�iiD�6Q\�^\�$���\�O.i\�:U�vZ�\n�!A�ҷ\�Q\�o��08g)m\�X8$yP�\���!\\P_	-�AjD������蓕?\�P\�%;-n��Q�*�RS�)\'�A���z�\r&ދ!�i\��)\�Nx�@��TC\��Z\�̍\�x\��\\����_OcV\�T.B\�\��d�}+׶�J�T�~Ŏ���\�PD��\�2�\����<�U^��m\ZT�ZK	~��\��ЫV3��O?���;o�\�\�÷]�,�,�WMV��\���9����\r!�Ƶd��kW5\�\�i֗��d��1�o�ܖ\\i\�\�\�N$�hX\�TB>`�PS};\Z�pnU\�o�|nYJ�[Y�,(�A�\�\��)�!m\�\�6�q�\�\�SXYm\�$ �\�(z(����r~�	�&\�T5���\�0\�y2\�$��F�jS�4N�\�\�-�BV$���Ò���\�\��i䧁7p��\�\�!����	m=Nx�]BT�|\�}Gުpk\�m\\4�1�%\�\�\�R��:>\�ǅ$G�d}\�@M��E�bJ ���M��%`��~E�\n\�\Z\�ӨOIR~F�����J���\�x\���\'�\0\�=E`\�$��;gy\�\��ӺJ\�t^n1\�\�ZHi.��@y�*\�>��\�\�N�JI�KM~y=!\�l�4\�\�i�\�b\�Ŏ\��ChHJG\�V\�}\0P\0\�\�\'g�/�\�⛛\'vmcݣ$���W�џʯ��\�M\�\�}M�\�^\���muX�t�	���|Я\�W_l��Uq�\� y\nz\�\�ZT�}\r�WHa�ǜ�=�$!��D.0�*HIG�z�R~H6�W\Z\�$͉!sЦ\�\�LJ����$	\�\0�)\0��~u_$#S~}�>�\�\�\�!ax��Aa�՜\�u����F\�d;3\�7j;\�#i�{��&�Bf]���hG�����d���\�V�\�+c���;+\�\�\�\Z`[��a*\��iL\�\�\���a��|#\�Tz\�<�@@\�\�nԖ�6ˬ&.�(\�ލ%��->\�\Zv�\�)r��]�\0nP�\�\�2�lJ%rX�\�?\�S��\�=9PV�Ӯ�\�ۈQBд���pAȃ\�h̥\��\�6\�պE�֠\�a\�W���\0��p�\0�9�\�ԭ�8�4�8.�\�\\]_�k~4c�ӥdHp��?\���\�\�ƙ�э=�m�R\�\�g�\�n��\�1b�m\0{�\r@64@@@@Gnҽ����G�t�\�M\�$�\�\�ynII���ǧ1\�\�PI�0\�Hۼt��\�29��\�ŭ	υ\����c�0W�ɑ@t{g;5Y�\�qn�y\�]T\�D�\�0�c�b�I\��\0d�U`�O*\0�\n\0�\n\0�\n\0�\n\0�\n��+@@@�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\portatillnovo.jpg',0,1),(17,'dgfgf','dfdfdfd',0,NULL,NULL,0,1),(18,'asa','sdsdsd',0,NULL,NULL,0,1),(19,'aassd','aasas',0,NULL,NULL,0,1),(20,'asdsf','sdsfsff',0,NULL,NULL,0,1),(21,'portacelular','jshdjsd',0,_binary '�\��\�\0JFIF\0\0`\0`\0\0��\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\n�\�\0C\0�\�\0C��\0\0h\0h\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0=\0\0\0\0\0\0\0!1	Q�\n\"Aaq�2���\��\�#RrB�����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0 \0\0\0\0\0\0\0\0\0\0\0\01Q�!q�����\�\0\0\0?\0��)�&ȏ�r���MK\�\��}�ף���\�Q\�>\�.�\���9\�\�\���:�(w(d@��m@SH\��\0\�?}U0\�:\�3��:�\�ϗ�]I�\�\�\��x�:I\�#�\��\0�?}C�K?p��\0�g��\�MU)J �\�\��\�\�\�2u<�7r�����(y{�\0����\��\�\�ش�k��{,��\�Z\�u<<\�I�$���.����\�U�Mc\"\ngT�6���p)Ja\�>��/��\"\�P���\0\0z\�ÿ\��\0^�\�\�f�W�\��ܺB���\�({`ڕ�jhH&6\�ިzF��k\�\�bf���=F�t\�$�sX\�\�AB�@\�m\�\��2N$�gFZ�\�ԀQ���>w�#P\�J��p���Y\�p\�\�ϐ\�\�<S��[s\�	\�c�0=@|C\\���\�՘7	#���\\W\��\�G\�*\�u\�R%�7K<1�9�����P��\���\�.�ە5\Z\�}yG1D�D\�3E�즖�U�z!W*�E�tL�g \�Q�\�4�\"��q0��\0ox�P�\�ƭ��-\n�ʮ�y�\n��\� s\�N��\�\�F�p{�\�u�ݕc~.Mot-�E���l�\�w(�\�B\�M8�n1,��H�+��Hx�޼m����P�*�.\\տ�-�N6ۛ\�|\�~RI7$��m��ʎ-���!Y��9S\0�$\�Q)\�Ծ\�3\�y��k ^@ͼ��\�1��>�L\�\�VQ\0����#\�\�\�=1��s�51�\��R\�M�!\0\0��\0t��\�<\��\�G\����\�)p�~?��\0`\0ݨ\�\�&wk\�\�\�iݟ��\�E\�>��i�\�%�?x�n�n��JF�bdĦT\�K�\�\� >\�4\�p�u\�\�\�T\nҔ\�8\�Uyq�8���\�C�R3QU=C�\����醋���ҘpC\�\��v\�	P]��\�9�*\�S\�u\�h\�uM\�\�5\�o)\�1\�|�b������L\n\'\�VJ\�EBa6_���\�O~�.u�\�(M�v}\�:�p�\"ǯ~*�iYS�\�������٫�<ۋ)\�Ӕ�H@-\�U\�\�4Ѥ���؈6ZE���\\�\�g/K\�eJ\�Jb�\�\���@B�3�F\��\�	O����*�懆X�T\�:�\\\�\�\�zK�\�\�Y\���Ȉ�w$IA\�P�Z��\�9DAD�N�\Z�E?�ݚE�8��\�:\�&�@Dy5\��Δ��m��}�mo\�}�J\���\� pW�\�Z���t\�\�S6���\�84�B�TZ\�\"@\�S��!��;=\��\�U���M�l\�B\�\�\�*\'EɮM\�\\�\�V\��(��^i�*��\0V�\r���*\��?}S\�z�qdGa\���g�\0\0\0Z��]\�[��<c���||>�:h\�+�`-���\�q\�\�\�9@�Z4D�\���j��y����!\�?\��\�堁>����\rU\�\0��?\�t�2rbc�JI�A�tsG/�9T�7dŚ*9x\�u� D�j\�%WUC��c\�^\�#ov\�[\�7�^�\�6�j��$\��\�OP\nᑮQ\\����Y4\�\�J�\�\nV�E�T*�\"C������9�=\�\�`\�=���z\�\�´v����t\ZhDZ�t\�~@��x�ȁ@���\�C��9\�]�G�oѤ\�\��\Zn.��\�+\�*��T+�\�8�WZ\�v\�5�\�\nm�\�:\� t��T��3T-ͼ{�ѷ�\�H3��wAy\����T�]%\�&%\�\�JR�\�H��Vl>�m4��H�B�\\2\�1>�j流�{p\�\�ղl\�V�\�얻�t�P*g*\�Z��}�H	�GRoBŠ�Y\�\�Ɍ9Z�>Ej*��0�R�9c\"�\�P�9j���@��\�\���lp��Q\�Z\nf���\�\�9�%�R\�\�[t�\�\"���\�\�I\�5��\�D���0���\�,D�*$#���䧡j)\�-/M�Dp\nROU(8�g\�\0\0d\�`\�/\�\0\0���/(�IQU��\�Jk\�\\/\�u\�`�����=US\nf8�@q\�%\��\�>_�\�MLn�_O~:��K���!Hje\�T)NC\0\�r��r�R��)�!\�@� !\�@CF�\\��ޒ�\\\� D�1\� \"\0�\0�\0��h2�y����<��ξz\�\�\�\�u}\�?��m\Z4h5�t[���A�5����R1\��Ad	�\�C)#PNGS�P��)\\6R^fZbQ�V�\�Y \n\�\�,�F�M���/iM�\�	��V�\�\�NT�ꈄ���9\�i�*jJ��~\�f\�z�I9�\�(8���\�pw��i�YS5T\�~v\���e��d�;)+wZ�nWmAu#\�af#\\�?Uғ�����)�Dє��fn񳴻�	:`\�\�7뷁\�3\�y�+�p\"l勸���\�\�}J\�\�\�,�QG�\�d�ռiQ������\�h٨D)�Qu,�g������B\�ѓۍ��\���\�f4����\�D�J��n]H�ٛ\�xZ\�\��sh\�\�\�x�\�ws�\�r*�) �zbp��wKhl/g�UE\\z=�\�\r\�L#f)\�#C�ZN��\�5�\�,%ն)؊�!ʱH�\Z���\\聛�\�\�\�.\�G���\���oS��\�\�N\�jZ��cj�zU�Y����a\"a\�Ц\���j�^S��\�\�,\�\�<�fL��uu%iih��﹥Ӷ��Ϫ�\�\�Xji\�e��\�\�I[�Q\�2�(�\�_SO\�4\�*\�Gp�4L\�iH\�M�G}�\�.L��h���t=?gҧ�r�ʙp\�=Fn\�i+ \��,�A��+�	�\n�\n\�;jCT\��j\�ʆ�z6mmjv&��\0N�w4��ky;��,�3h�-�|�CkXB6�M��j1�mLP/$�8��V@#��Q6��㟬\�M.Y[Ͷ�i��Z~��t�\�m\����B\�7M\�c\�N5�d\nb\�\�C,�S1�\�ފ]عU�\�7m*�\�z���mߦiS2�WHQ4\�EF)X\�CD�M�n\�d�����1^�{\�.\�\�hf\�\n�r�M\�\�<_�|�\�R\�c�\�\�O.��<\�]3�Ê�\�!\�s�tH\��\0w\�F��E\�s\�8��\��X�(�9$��p\0�\��΍N?O?\�u}\�?��~�^C��\���thԼe�p8dp?�|s�\0\�8\rj\�\�\�\�\���\�\�\�ɸ+[B�R�+���#\\̐R\�XşI�\�!\�PQ�a\�\�@\0GA���r�y����`����O,0ƛE�OJ7av\�G\���~\�ەd\�V��$\r4w\�\�l\�\�Q��\�\��\0�;rޕ����\�\�\�Kwl,tJ�t���3�ƦE\�a��Fˀ`\�:R\�B��\0�A\�\�bn��3\�ѐ�\�}.��c\0\�DUt�f\�1�\�O\�!I]\�LvIn*��\�\�\�&�;\�ڶ���\�;�*\�CL�E��LR7�B�������#\�Ļm6��\�$\��\�EM�~\��\�\�-y�-\�>�X\�H[v��B��Z.z\r�$f\�DxD%��Å{�16\�/\��ێ\�\�\�(\�\�\�;����-*�m�SB��d\�O,�\�	IS��lt��\�\�4{\�]�\�\������W��\�P\��}#UHۈJ��eJN� ���2\�~E��\�[;�M\�\�\"dܘ{�!\�2��\�&�DP�6{r%\�AM\�\�\� �GGv�ȡj����l\�\�,a��gL!²\�1L,z�6r\�\�\�j>��\�\�\�\�\�غx�:\�N�|��\"�B�\�\�Me�A�\�*�TL\�SLG�D7k����n�\�[3�[��e[\"\�Bj\"��%*J�a��UI��\naø\����;\�+���M\�WA�p\�\"<�0?��\���Ρ�xϷw�R\�0�Zܫ\�g^3�M�-�������H�HP\�\�\\ZNb%eS�����e��d\nR�[�C��3�\�\�\�J�\�4eyf\���2�\�;J���TPF�!\'��OT�-V`U�?��Ö.ەF��l\�&�@�5\�2.)id��*o�\�P@\�PR\08�xC�|dq\�Jb��F����$S�:W�l	���Kݤ\0<g\�7�!\�\"\��h0�\��#n��ej\�\�tU�-)J-O�3H��<��\�YQFRt\�+ɽ��l���\��������n��R�ڰj�\�C�\�\�q\�_�U\�\�,�\�W��48�&\��E^\n� �*�\�!�=G)�\�60ʹ:� �T�\�\�A�\r�[}\�\�����^!\�\�Y��䌔{\r-/Ṉ�i\�ȩ6\"ͤ!&��H7�v��~\�\�5�@\�k�=yh\�d\��\0��u�P\�,\�R*�%0�08%)i<�xG�\�8�\�t	��;�\�otM,�ݺ����\\W:\�\�\'G�J\� ���\�j\�\�\"�\0LV(\�\�1\�%��^���oOT\�E��%$U0�Vޛ��+\�\�J\'����(\�s�\�b �2ʨ �	C\Ztk\��\�m\�\��\0��\�����\n�Y\�+&@\�R�\�DTQ@\0�2\��\" \06K�j�\�v�[�c�]�ѷ�\r���d\�Y\�^� \�\�n\�:�hQ��q^F\���!�v�\�\�3�da5r�\�e\�\�\�Tܼ��\�SRu�\����%E0�m��\�\�]*-R�\0\'\0\�I\�h~��g�K\�r-M׹E\����w���\�A��HhjH�t#�*Q\0BJ&,��#��\ZL�wtݞwvb\n\�vsC\�U�`z���\�\�X�\�\�\�\�\�%dz~\"y����\�PP��>!8�\�-�\�\�/\�؞�Gm\�@�Jj��B��\�H2F8��	F	:��\�2)!V\�+�%1߁\�Jb�\�9\Z��\��\�\�Z��f\�?V���Y\"�M�fT��7E�(D9;B\�\�sPğ�\�~�G\�\�v���n)(k����I=Rqg���9$-T\�t�]L�p��\"���m����\rl]����|���\�tXQpN15;�\�Ȥle��������	r�y��[M�z0\�Z�	\Z�\�=pHRY\�\\���PC1�i�A@$ <$�BH�Ϸ\�c�1��$\rKR.\�\�Y�\��\�\�nEW3�����$��qw!M\Zje\�\�P\�c)=Q��1�\�(qiTldj.\�œD) �4K�&SX�\�-Qj��L�-A�\�i��\�J�8\�K���VOc[U\�\�[H�]fh�}i���(8�\0h\�w�jݫx�Pq\�\�\�p|B<\�lPA���dRn�e��	�HP\�\nD�)(\0R����k�V,\r$�|�\�5ut\�\�RZB��D���Uq\0:��/����g 9���*D\�Ӕ6˵��\�۷�[p�tͩ�\�|����v5&�\�L��M\�OT2*\n�\�ӄ�n��\�\�\����\"\�j�H�a�{��A��Q��\�3�\��\�A�n���Ȏ=I|�3�\�0c \�\�C�A�5� 4\�\�Wk�@�\�厼�h21\� d���`<�<t\�<3\�\�9�\�s\�T��́�î�\Z��lB\�\"�v\�\�!)D�˧�\0:j\�{Bђ���\n	�\'I����w=\Z4�kkVJ�w���JI�\�\�nb8u�YQ+Ü\�;\�g8\�WD��t��x�b�t\0T\�\Z�����\�a(\0`\nRC�\0-\Z4-�!#Jn�tA0\�b&�\0�\�\08Ǘ-xV���ș\�<���\0\�z|<4h\�|���\�p\�]\r�aa~#�\�\�:�[�A\�\�1\��\0���?�>?��\Z\n\�\�*\rA�\�q\��\���\��:�}5\�V\�\�I .B��U�q�W��2 n���  \r\Z4�\�\�\�hɠJn=\��Ma\"ep@)\�Hl\�xy�0\�f�\Z�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\porta-celular.jpg',0,1),(22,'teclado','teclado inalambrico negro oscuro',0,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\Z \"\"\Z�\�\0C\r\r��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0A\0\0\0\0\0\0!1Q\"Aaq2���	$B�#3��\�%RSTdr���\���\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\01\0\0\0\0\0\0\0!1AQaq��\"2���#\�3BS\���\�\0\0\0?\0\�\�\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�\n\0�+ޮ��\�\�\�K�\�,�)���\�q�\�J�\�W��V��~9\�	Q�\�qDZ�\0h�L\�a2���\"�}��S��\��� p�x\�\��\���\�\�?\�6���@4[�U�r\�p\�P,\�?�*[���\�\��]\�L\rq��v\r]XQ��\�i�s�qN\�\�\�O�.�c�4V~���@@@��\�{`�\�f�mɁy��>�Iq��G�۬����Ql�\�\��JԦA�ϼHP=��l\�\'��\�F�\�/i\��$��\��<x,\�+\'r�ī�1��jeuG�9N\n\�\�͎\�i\�\�B���ȏ%\����_\�\�$\���#�\'\��G#�\�\�\��Y\\mjg\�\�4YRrx<�\�/�tO��ͥ�X�\�sV��7Ku^�˗A�\r�\�T���#\�\�=\�\'��f��E�\�\�\�~�\�=k�{��*\�z\Zg\�	-6טw!\\�\�I\�\�zťv�\�\�\�*J��@@\�\�/\���}\�B\�Dy	R��\r�\�\�Ct�� \�%�9�k�\"$�y���\�RR�\�\n��ʡ\�S\�\�,Qx�\r�6$���m��\��V�u̌�ҳ�	��83O�:3\�ĸ\�\�\�\�\n[#z�ܐS�x\�\�槇�K]�ɏ�O�s\'�\�\�_;Йv�dw\"\\\�S\�(,�RBAU\�~\�ھ���rE\�6=>\nR]\�?Q�E\�}<�B�.K\�}\�m\'\�@9kZ����\0>�\��eQTz��B#\�\Z\�\�Ovߴ:�\0\nB���>�Ǣr��?\��\0+ϽJI�h��\�&�@@@xL�\�ز\�jDg�P\�O -I\�\nO}h\nOY�A\�6�.��6�D�L�3�)�A�\�\��\�^\�6�-��P\�FJc]Y-+\�淐\n�\"�cXt��\Z�x\��\�\�2a�&��Ԗ�>�*Tg,0�\�B�j9���\�\�\�;\�yp�>Z�\nA\�`\�c�\��\n�1\\3����0���]l�-M6\�Ȗ\�O<�b�-�@�\�?*\�6g�\�7Jr�>Mꍊ���hè��\���ڵ������\�p~I5�z\�\�\�}\r�(�(�(�(��(B�����N0>�\ZwM�N\�.w�/\��*:\�@/;���@\'zp��8g���u��}�\\�I�\�\'ۥ\��]�\�f6V����oJ�\�@J�d�־�J�˺.�.�4\�+m*J[a�H\�*R�\��O=\�\r��\n\0�\n\0�\n\"\�\�6\0M\��m��\�˔\�_\�\"�[�u�@]\�\�Z�j\�\\�\������@�\���2\\uU�Υ�}\�U��^���~怯��Vt��?PB�|isd��\�\nm�J	\�v��\�\�Nu�G\�\�d��}\��!��\r�\�\\ۀ@YHX}\�*bL�\0�T-\�V\�#\�O��\�\�Ac.��`\�\�b�L\�/2-Ǐ)�\�\��6��{�6�F3Ae�BB���\�-�~�]�1-�7y\�\�KH\�{\r\� g�����\�ŕ\�,�r��Ң�\�ec)I^2q\� ���W�\�zn3�Z�\�C�fJ#m��!y_\�R�@?�1\�\ng_��WQWjS��rl���\�f8\�\�ܦ�)M��±��9�W�lq���μ<�\\X�.�\'�y�q\��\�2\�L�SNG�\r��\�vu\�X|+At\�;~\'�=�qd�f\�mr���y厓\\ɶ����\�qX\�^�k\�_��ѭ\�%-�}\�\�j<w6���e_w�\���#�I\�r��7�<ܘeӯME���_~�^n�\�\�\�#IdG�&m\�!\�8	J\\)O�R��\�w�W�\�\�Z�T�\�͒n+>�M��ܗr\�P.�qۊ\�8fCĸ\�T�i	\'b\\\�Nw(qްˋ`��m��W��rds\�iy��K5\n<��%q\�w\�B�	�9\�y \� �\�>�\�j����\�z�wmDI\�)u\�\�Q�i=\�~<c=�ڍ��\��\0�-VH\�Wk���`�p\�I=�\n�\�3F��d�\�]�\�KɊȐ������\�X䏖sPj{P\Ze\�]\�lX�s�_�\�)&\�\�\���(R7a��({�HQ9\��j\�\'��Rf^\�2\�2l\�,\�\�%)\�W)8/\�).��uIH\�H\�\�\�O��9�`X�Ro\��cZ]\�1Z-q��\�o�Q،\�J�\�\�\���%	\'8	$w\�W�LOu~�\�y\�\�tuY{��B#~\��Jٚ[w*XJ�NB>��tQFˍ\��\���\�CN\��*BݾG\�ܦ��>е��F<�W���\�S\�k[\�,\��I���V��ī�\�\�Xsa��\�p{3 ��6\�\'q\�)A\\�|\�\�\�#>\�+���]]�\�N��\�y\�\�.wr�)CiB�\0�}ϥ`�<\�\��2�\�V�mtĴh9\�fͺ�\�\�\�\�[|\���\��%)O+\'�Ҷ\�1�<4 �v߆��\�\�5��ml�\�\�E�ŵ\r\�r\r\�\�3�n\r3jG9(�{\��\�\�*���ò�\�3IN.\����:\��\�JX\�V����U�� \�X���9�	\�$��\�\�TzbJ�e\�f\�d���b<:Z�\�#K�\�[cڢ(�\�|��}r�Q�t�NU\'\�΍�dv.8��[�PJ	$�\0�9G\�\�d\�Q��y�7\�o\�yE��T\�q��-�JDsܜ�P̦\�Ѷc.K_\�ZW�\�p��ڬ���\�;��{��LQ�\�Q\�M(G�9�0�y�.e\�c�\0ҁ󧡬|\�\��\r�b��ho-\�G���²�1\�>\�G\�QO�\�2�Z\��\�jѻ+�WjlICE-�?�	O��\�\�-��\"sN�6�\0<\�S��n\�\�\�*M\�kL�,3�:\�@��+\�+\�\�\���υ\�\�+��\�F3U\�0Z/�o�		�&Z#\�@R�����$\'�A%i\�\�\\�\��K\�/D\�\�g,�EMc{Օ�\\f*(Tx�R\�%�3+~]u[Ք�e^�\'\�\�s��JL�M_*\�Fm����F2\������[Kg\� ��U��?�ͮ\'���R�;����t=�ͦt�{S\�Oډ�n��bd-e\�=ӻ��\�j)E.\�}YHJw���zz.�\��g�G�u���\�l\�/3\�YRI�\�a�ʜNr�2��A�5\\\�\�c��\�oOz\�\� ���F�\�7�TI\���6#��)�\�[JRH3�\����-n2�Yq��\�[�!E\�\�Yˋܲq�x\�=V�X���QU\�z����wD\�\�O�l#\�\�����\r⨍�\�{�\�\�h�lJFHq)�B�#;~ \Z��4�kiN\�K���8Z�0�RZ@Q*m��甤��\�\��qU��\0\�\�Ǔ\"I��^,�:6\�\�\�l���8\�\�Jgw��3�\���\�VѴ�:3\�\�\�9�\�N\�M\��\�v�\"cǕ\rl�1�K>[�=��pv6\�8 g�]�fe�i\�D�_\�\�\�nغ\�]A\��m\�\�U\�\�F3\�$7�\�y\\��y\���ŒR�c��7�ߌ\�$\�ܛ\�\�\���_a�11\�\�G�R���o	\nNH8*\nVq�U�\���\�\�^�c���oZ��\�\�\�\�\�~�w\�\�)1������\�@\�\�D�v|���F�v�\�Z�\�\��å\"̷�L9�\�Q�mhq\�\�T�\���08\�e,�\�qN\�p˖W�]z�\�I\�\���Ϩ]\�\�\"\�hzS齨\��iH��`��_�\��ج�\�u\�,WC}*��@)\\:]�n��\�3k[�(�kҕ(��I态�\��\��\0���2G�*�E:�\ZN�RZ�1/\�ɟ��H\�\�\����H��\�}3>n�����[?Ê��i��s-��6J�)Ԕ�ǼG\�Sb�F\��\�t��\���K\�/\�\�k)\�\�T3��#�V�\�O�\�\�1i�o*n3�\�r�n\�\�ϩ��U��x�Ys��:\nb�\�k�!E\�}\0wR!)c�H4\�Q!ӎ�j��j��[\'Z���̙6*\�K\r\�\�\��#\�\���\�D�GH\�\�b\����CQ\�B[m�$%)H\0��*���PX(�(�(�(�0(�P\0P�\�','C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\target\\classes\\producto\\teclado-gamer-esca-gxt-853.jpg',0,1),(23,'teclado inalabrico','hola,teclado',0,NULL,NULL,0,1),(24,'jolsjsh','hdhdjdjd',0,NULL,NULL,0,1),(25,'akdjskfjasf','ksdispdjfidfk			',0,NULL,NULL,0,1),(26,'teclado','gfghjj',0,NULL,NULL,0,1),(27,'ksksjdj','jdhddd',0,NULL,NULL,0,1);
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
INSERT INTO `usuario` VALUES (2222,'Cédula de ciudadanía','ana',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','123',1),(107780,'Cédula de ciudadanía','Eliza',1,'31456','hsjshdd',2,'medranosur','2023-10-17','admin','12345',1),(134560,'Cédula de ciudadanía','Camila',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','1111',1),(1077345,'Cédula de ciudadanía','marcelaaaaa',1,'3333','hsjshdd',2,'medranosur','2023-10-17','admin','1010',0);
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
