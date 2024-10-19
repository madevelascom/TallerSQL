CREATE DATABASE  IF NOT EXISTS `tienda`;
USE `tienda`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Fecha_Registro` date NOT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Andrés Gallego','afgallego@gmail.com','2019-01-15'),(2,'Hector Lopez','hlopez@outlook.es','2019-01-15'),(3,'Andrea Ramos','chiramos@gmail.com','2019-01-15'),(4,'Lupe Rojas','luperojas@hotmail.com','2019-01-16'),(5,'Monica Bermudez','mbermudez@gmail.com','2020-05-10'),(6,'Miriam Yanez','myanez@gmail.com','2020-04-12'),(7,'Andrés Yépez','ayepez@gmail.com','2020-04-12'),(8,'Gabriel León','gleon@hotmail.com','2020-10-15'),(9,'Julia Toala','jtoala@abc.com','2020-11-15'),(10,'Cristina Velez','cvelez@hotmail.com','2021-01-30'),(11,'Cristina Escobar','cescobar@hotmail.com','2021-01-30'),(12,'Guillermo Mendoza','gmendoza@gmail.com','2021-03-24'),(13,'Carlos Alvarado','calvarado@gmail.com','2021-03-30'),(14,'Juan García','jgarcia@gmail.com','2021-06-30'),(15,'Luis Peñafiel','lpenafiel@abc.com','2021-07-01'),(16,'Andrés Flores','aflores@abc.es','2021-08-18');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `iddepartamento` int NOT NULL AUTO_INCREMENT,
  `nombredepartamento` varchar(45) NOT NULL,
  `supervisor` int NOT NULL,
  PRIMARY KEY (`iddepartamento`),
  KEY `jefeDpto_idx` (`supervisor`),
  CONSTRAINT `jefeDpto` FOREIGN KEY (`supervisor`) REFERENCES `vendedores` (`ID_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Bodega',11),(2,'Ventas',13);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `compradoPor` int NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `facturaDe_idx` (`compradoPor`),
  CONSTRAINT `facturaDe` FOREIGN KEY (`compradoPor`) REFERENCES `clientes` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,'2019-01-15'),(2,1,'2020-10-07'),(3,2,'2019-01-31'),(4,5,'2020-05-15'),(5,7,'2020-05-10'),(6,9,'2021-01-10'),(7,14,'2022-06-30'),(8,15,'2022-07-01'),(9,16,'2021-08-18');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaproductos`
--

DROP TABLE IF EXISTS `facturaproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaproductos` (
  `idfacturaproductos` int NOT NULL AUTO_INCREMENT,
  `idproducto` int NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`idfacturaproductos`,`idproducto`),
  KEY `facturaProducto_idx` (`idproducto`),
  CONSTRAINT `facturaNo` FOREIGN KEY (`idfacturaproductos`) REFERENCES `factura` (`idfactura`),
  CONSTRAINT `facturaProducto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaproductos`
--

LOCK TABLES `facturaproductos` WRITE;
/*!40000 ALTER TABLE `facturaproductos` DISABLE KEYS */;
INSERT INTO `facturaproductos` VALUES (1,1,2),(1,2,1),(2,4,1),(2,5,1),(2,19,1),(3,11,1),(3,12,8.7),(3,13,5.5),(3,14,1),(4,19,2),(5,3,1),(5,9,1),(6,7,1),(6,8,2),(6,20,1),(7,1,3),(7,2,1),(7,4,3),(8,19,3),(9,11,5),(9,14,5);
/*!40000 ALTER TABLE `facturaproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechastrabajo_vendedores`
--

DROP TABLE IF EXISTS `fechastrabajo_vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fechastrabajo_vendedores` (
  `ID_FechaTrabajo` int NOT NULL AUTO_INCREMENT,
  `ID_Vendedor` int NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  PRIMARY KEY (`ID_FechaTrabajo`),
  KEY `fechastrabajo_vendedores_ibfk_1` (`ID_Vendedor`),
  CONSTRAINT `fechastrabajo_vendedores_ibfk_1` FOREIGN KEY (`ID_Vendedor`) REFERENCES `vendedores` (`ID_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechastrabajo_vendedores`
--

LOCK TABLES `fechastrabajo_vendedores` WRITE;
/*!40000 ALTER TABLE `fechastrabajo_vendedores` DISABLE KEYS */;
INSERT INTO `fechastrabajo_vendedores` VALUES (3,11,'2019-01-01','2019-12-31'),(4,11,'2020-06-15','2020-11-30'),(7,12,'2019-05-15','2021-04-12'),(8,13,'2018-10-16','2024-10-18'),(9,14,'2020-01-06','2020-03-15'),(10,15,'2020-01-06','2020-02-29'),(11,15,'2021-04-01','2021-11-30'),(12,16,'2021-04-01','2021-04-15'),(13,17,'2021-04-01','2023-12-31'),(14,18,'2021-05-15','2021-10-31'),(15,18,'2022-02-01','2022-05-20'),(16,18,'2022-10-01','2022-12-15'),(17,19,'2022-05-01','2024-10-18'),(18,20,'2023-07-01','2024-10-18');
/*!40000 ALTER TABLE `fechastrabajo_vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `pedidoPor` int NOT NULL,
  `fechapedido` date NOT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `pedidoPor_idx` (`pedidoPor`),
  CONSTRAINT `pedidoPor` FOREIGN KEY (`pedidoPor`) REFERENCES `vendedores` (`ID_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,11,'2021-10-30'),(2,11,'2021-12-03'),(3,13,'2022-10-10'),(4,13,'2024-03-17'),(5,13,'2024-04-10'),(6,13,'2024-04-22'),(7,20,'2024-01-17');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoproductos`
--

DROP TABLE IF EXISTS `pedidoproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoproductos` (
  `idpedidoProductos` int NOT NULL,
  `idProducto` int NOT NULL,
  `Cantidad` float NOT NULL,
  PRIMARY KEY (`idpedidoProductos`,`idProducto`),
  KEY `pedidoProducto_idx` (`idProducto`),
  CONSTRAINT `pedido` FOREIGN KEY (`idpedidoProductos`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `pedidoProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoproductos`
--

LOCK TABLES `pedidoproductos` WRITE;
/*!40000 ALTER TABLE `pedidoproductos` DISABLE KEYS */;
INSERT INTO `pedidoproductos` VALUES (1,1,25),(1,3,5),(1,7,6),(1,8,6),(2,10,15),(2,11,15),(3,5,200),(3,19,14),(4,6,10),(4,9,10),(4,12,125),(4,13,135),(5,18,20),(6,16,145),(6,17,123),(6,20,17),(7,2,70);
/*!40000 ALTER TABLE `pedidoproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `cantidad` float NOT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Lapiz HB','Faber Castell',100),(2,'Borrador','Stabilo',50),(3,'Temperas 12 colores','Faber Castell',20),(4,'Cuaderno 100h 1 linea','Estilo',300),(5,'Bolígrafo azul','Bic',100),(6,'Sacapuntas metálico','NN',30),(7,'Resaltador amarillo','Faber Castell',20),(8,'Resaltador naranja','Faber Castell',20),(9,'Papel cometa surtido','NN',30),(10,'Marcador de pizarra negro','Bester',45),(11,'Pegamento escolar','Bester',30),(12,'Purpurina blanca (gr)','NN',355.5),(13,'Purpurina azul (gr)','NN',145.3),(14,'Tijera','Lancer',15),(15,'Compás metálico','Lancer',10),(16,'Baterías AA x2','Energizer',200),(17,'Baterías AAA x2','Energizer',100),(18,'Caja de lapices de colores x12','Staedler',30),(19,'Lápiz Corrector','Bic',35),(20,'Resaltador azul','Carioca',13);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos_vendedores`
--

DROP TABLE IF EXISTS `telefonos_vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonos_vendedores` (
  `ID_Telefono` int NOT NULL AUTO_INCREMENT,
  `ID_Vendedor` int NOT NULL,
  `Numero_Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Telefono`),
  KEY `telefonos_vendedores_ibfk_1` (`ID_Vendedor`),
  CONSTRAINT `telefonos_vendedores_ibfk_1` FOREIGN KEY (`ID_Vendedor`) REFERENCES `vendedores` (`ID_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos_vendedores`
--

LOCK TABLES `telefonos_vendedores` WRITE;
/*!40000 ALTER TABLE `telefonos_vendedores` DISABLE KEYS */;
INSERT INTO `telefonos_vendedores` VALUES (1,11,'0985554422'),(2,11,'0974442365'),(3,11,'0991231234'),(4,11,'0947895544'),(5,12,'0985233333'),(6,14,'0961232222'),(7,14,'0987774141'),(8,15,'0962338989'),(9,19,'0975654848'),(10,20,'0981114567');
/*!40000 ALTER TABLE `telefonos_vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `ID_Vendedor` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(100) NOT NULL,
  `departamento` int NOT NULL,
  PRIMARY KEY (`ID_Vendedor`),
  KEY `vendedorDpto_idx` (`departamento`),
  CONSTRAINT `vendedorDpto` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`iddepartamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (11,'Ricardo Aspiazu',1),(12,'Vanessa Flores',2),(13,'Jamile Vasquez',2),(14,'Rosa Martinez',2),(15,'Xavier Rendón',1),(16,'Alberto Pin',1),(17,'Raymundo León',1),(18,'Benjamín Bautista',2),(19,'Manuel Pérez',2),(20,'Marcia Logroño',1);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

