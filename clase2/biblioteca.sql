-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca`;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autores` (
  `idautores` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idautores`))
;


-- -----------------------------------------------------
-- Table `biblioteca`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libro` (
  `idlibro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idlibro`))
;


-- -----------------------------------------------------
-- Table `biblioteca`.`libroautor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libroautor` (
  `idlibroautor` INT NOT NULL,
  `libro` INT NULL DEFAULT NULL,
  `autor` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idlibroautor`),
  INDEX `libro_idx` (`libro` ASC) VISIBLE,
  INDEX `autor_idx` (`autor` ASC) VISIBLE,
  CONSTRAINT `autor`
    FOREIGN KEY (`autor`)
    REFERENCES `biblioteca`.`autores` (`idautores`),
  CONSTRAINT `libro`
    FOREIGN KEY (`libro`)
    REFERENCES `biblioteca`.`libro` (`idlibro`))
;


-- -----------------------------------------------------
-- Table `biblioteca`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idpersona`))
;


-- -----------------------------------------------------
-- Table `biblioteca`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`prestamos` (
  `idprestamos` INT NOT NULL,
  `persona` INT NOT NULL,
  `libro` INT NOT NULL,
  `fechaPrestamo` DATE NULL DEFAULT NULL,
  `fechaDevolucion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idprestamos`),
  INDEX `persona_idx` (`persona` ASC) VISIBLE,
  INDEX `libro_idx` (`libro` ASC) VISIBLE,
  INDEX `libroprestar_idx` (`libro` ASC) VISIBLE,
  CONSTRAINT `libro_prestar`
    FOREIGN KEY (`libro`)
    REFERENCES `biblioteca`.`libro` (`idlibro`),
  CONSTRAINT `persona`
    FOREIGN KEY (`persona`)
    REFERENCES `biblioteca`.`persona` (`idpersona`))
;

