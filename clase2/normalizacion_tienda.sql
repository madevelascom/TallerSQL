CREATE TABLE `departamento` (
  `iddepartamento` int NOT NULL,
  `nombredepartamento` varchar(45) NOT NULL,
  `supervisor` int DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`),
  CONSTRAINT `supervisordpto` FOREIGN KEY (`iddepartamento`) REFERENCES `vendedores` (`ID_Vendedor`)
);


ALTER TABLE `vendedores` 
ADD COLUMN `departamento` INT NULL AFTER `Nombres`;

CREATE TABLE `producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT,
  `itemnombre` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`idproducto`));

CREATE TABLE `pedido` (
  `idpedido` INT NOT NULL,
  `pedidoPor` INT NOT NULL,
  `fechapedido` DATE NOT NULL,
  PRIMARY KEY (`idpedido`),
  INDEX `pedidoPor_idx` (`pedidoPor` ASC) VISIBLE,
  CONSTRAINT `pedidoPor`
    FOREIGN KEY (`pedidoPor`)
    REFERENCES `vendedores` (`ID_Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `pedidoproductos` (
  `idpedidoProductos` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `Cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`idpedidoProductos`, `idProducto`),
  INDEX `ordenProducto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `ordenPedido`
    FOREIGN KEY (`idpedidoProductos`)
    REFERENCES `pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ordenProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `tienda`.`factura` (
  `idfactura` INT NOT NULL AUTO_INCREMENT,
  `compradoPor` INT NOT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`idfactura`),
  INDEX `facturaDe_idx` (`compradoPor` ASC) VISIBLE,
  CONSTRAINT `facturaDe`
    FOREIGN KEY (`compradoPor`)
    REFERENCES `tienda`.`clientes` (`ID_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `tienda`.`facturaproductos` (
  `idfacturaproductos` INT NOT NULL,
  `idproducto` INT NOT NULL,
  `cantidad` FLOAT NOT NULL,
  PRIMARY KEY (`idfacturaproductos`, `idproducto`),
  INDEX `productoFact_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `facturaNo`
    FOREIGN KEY (`idfacturaproductos`)
    REFERENCES `tienda`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productoFact`
    FOREIGN KEY (`idproducto`)
    REFERENCES `tienda`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);