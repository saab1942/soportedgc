-- MySQL Script generated by MySQL Workbench
-- 09/09/15 14:06:20
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema soporteDGC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema soporteDGC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soporteDGC` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `soporteDGC` ;

-- -----------------------------------------------------
-- Table `soporteDGC`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Estado` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idEstado`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Dispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Dispositivo` (
  `idDispositivo` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `orden` VARCHAR(45) NULL COMMENT '',
  `serie` VARCHAR(45) NULL COMMENT '',
  `marca` VARCHAR(45) NULL COMMENT '',
  `modelo` VARCHAR(45) NULL COMMENT '',
  `observaciones` VARCHAR(250) NULL COMMENT '',
  `Posicion_idPosicion` INT NOT NULL COMMENT '',
  `Estado_idEstado` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idDispositivo`)  COMMENT '',
  INDEX `fk_Dispositivo_Estado1_idx` (`Estado_idEstado` ASC)  COMMENT '',
  CONSTRAINT `fk_Dispositivo_Estado1`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `soporteDGC`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`modelotonner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`modelotonner` (
  `idmodelotonner` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `modeloT` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idmodelotonner`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Impresora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Impresora` (
  `tipo` ENUM('laser', 'tinta', 'matricial') NOT NULL DEFAULT 'laser' COMMENT '',
  `ip` VARCHAR(45) NULL COMMENT '',
  `Dispositivo_idDispositivo` INT NOT NULL COMMENT '',
  `modelotonner_idmodelotonner` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Dispositivo_idDispositivo`)  COMMENT '',
  INDEX `fk_Impresora_Dispositivo1_idx` (`Dispositivo_idDispositivo` ASC)  COMMENT '',
  INDEX `fk_Impresora_modelotonner1_idx` (`modelotonner_idmodelotonner` ASC)  COMMENT '',
  CONSTRAINT `fk_Impresora_Dispositivo1`
    FOREIGN KEY (`Dispositivo_idDispositivo`)
    REFERENCES `soporteDGC`.`Dispositivo` (`idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Impresora_modelotonner1`
    FOREIGN KEY (`modelotonner_idmodelotonner`)
    REFERENCES `soporteDGC`.`modelotonner` (`idmodelotonner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Tonner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Tonner` (
  `idTonner` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `codigo` VARCHAR(20) NOT NULL COMMENT '',
  `tipo` ENUM('original','alternativo') NOT NULL DEFAULT 'original' COMMENT '',
  `observaciones` VARCHAR(250) NULL COMMENT '',
  `modelotonner_idmodelotonner` INT NOT NULL COMMENT '',
  `Estado_idEstado` INT NOT NULL COMMENT '',
  `carga` ENUM('vacio', 'cargado') NULL DEFAULT 'cargado' COMMENT '',
  PRIMARY KEY (`idTonner`)  COMMENT '',
  INDEX `fk_Tonner_modelotonner1_idx` (`modelotonner_idmodelotonner` ASC)  COMMENT '',
  INDEX `fk_Tonner_Estado1_idx` (`Estado_idEstado` ASC)  COMMENT '',
  CONSTRAINT `fk_Tonner_modelotonner1`
    FOREIGN KEY (`modelotonner_idmodelotonner`)
    REFERENCES `soporteDGC`.`modelotonner` (`idmodelotonner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tonner_Estado1`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `soporteDGC`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`procesador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`procesador` (
  `idprocesador` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `frecuencia` VARCHAR(45) NULL COMMENT '',
  `Dispositivo_idDispositivo` INT NULL COMMENT '',
  PRIMARY KEY (`idprocesador`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`memoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`memoria` (
  `idmemoria` INT NOT NULL COMMENT '',
  `capacidad` VARCHAR(45) NULL COMMENT '',
  `tipo` VARCHAR(45) NULL COMMENT '',
  `Dispositivo_idDispositivo` INT NULL COMMENT '',
  PRIMARY KEY (`idmemoria`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`disco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`disco` (
  `capacidad` VARCHAR(45) NULL COMMENT '',
  `iddisco` INT NOT NULL COMMENT '',
  `Dispositivo_idDispositivo` INT NULL COMMENT '',
  PRIMARY KEY (`iddisco`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`CPU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`CPU` (
  `identificador` VARCHAR(45) NULL COMMENT '',
  `tipo` ENUM('desktop', 'notebook', 'servidor') NULL COMMENT '',
  `Dispositivo_idDispositivo` INT NOT NULL COMMENT '',
  `procesador_idprocesador` INT NOT NULL COMMENT '',
  `memoria_idmemoria` INT NOT NULL COMMENT '',
  `disco_iddisco` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Dispositivo_idDispositivo`, `procesador_idprocesador`, `memoria_idmemoria`, `disco_iddisco`)  COMMENT '',
  INDEX `fk_CPU_procesador1_idx` (`procesador_idprocesador` ASC)  COMMENT '',
  INDEX `fk_CPU_memoria1_idx` (`memoria_idmemoria` ASC)  COMMENT '',
  INDEX `fk_CPU_disco1_idx` (`disco_iddisco` ASC)  COMMENT '',
  CONSTRAINT `fk_CPU_Dispositivo1`
    FOREIGN KEY (`Dispositivo_idDispositivo`)
    REFERENCES `soporteDGC`.`Dispositivo` (`idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CPU_procesador1`
    FOREIGN KEY (`procesador_idprocesador`)
    REFERENCES `soporteDGC`.`procesador` (`idprocesador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CPU_memoria1`
    FOREIGN KEY (`memoria_idmemoria`)
    REFERENCES `soporteDGC`.`memoria` (`idmemoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CPU_disco1`
    FOREIGN KEY (`disco_iddisco`)
    REFERENCES `soporteDGC`.`disco` (`iddisco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Posicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Posicion` (
  `idPosicion` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `puesto` INT(11) NOT NULL DEFAULT 0 COMMENT '',
  `usuario` VARCHAR(45) NULL COMMENT '',
  `nombreRed` VARCHAR(50) NULL COMMENT '',
  `grupoRed` VARCHAR(45) NULL COMMENT '',
  `ip` VARCHAR(30) NULL COMMENT '',
  `observaciones` VARCHAR(250) NULL COMMENT '',
  `internet` ENUM('s', 'n') NULL DEFAULT 'n' COMMENT '',
  `area_idarea` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idPosicion`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Monitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Monitor` (
  `pulgadas` VARCHAR(10) NULL COMMENT '',
  `tipo` ENUM('CRT', 'LCD', 'LED') NULL COMMENT '',
  `Dispositivo_idDispositivo` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Dispositivo_idDispositivo`)  COMMENT '',
  CONSTRAINT `fk_Monitor_Dispositivo1`
    FOREIGN KEY (`Dispositivo_idDispositivo`)
    REFERENCES `soporteDGC`.`Dispositivo` (`idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`estabilizador/UPS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`estabilizador/UPS` (
  `potencia` VARCHAR(10) NULL COMMENT '',
  `Dispositivo_idDispositivo` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Dispositivo_idDispositivo`)  COMMENT '',
  CONSTRAINT `fk_estabilizador/UPS_Dispositivo1`
    FOREIGN KEY (`Dispositivo_idDispositivo`)
    REFERENCES `soporteDGC`.`Dispositivo` (`idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Movimiento` (
  `idmovimiento` INT NOT NULL COMMENT '',
  `movFechInicio` DATE NOT NULL COMMENT '',
  `movFechFin` DATE NULL COMMENT '',
  `movDescripcion` VARCHAR(250) NULL COMMENT '',
  `movSolucion` VARCHAR(250) NULL COMMENT '',
  `movEstado` ENUM('solucionado','proceso','pendiente') NULL COMMENT '',
  PRIMARY KEY (`idmovimiento`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Recarga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Recarga` (
  `idRecarga` INT NOT NULL COMMENT '',
  `rProveedor` VARCHAR(45) NULL COMMENT '',
  `rFechaEnvio` DATE NOT NULL COMMENT '',
  `rFechaRecepcion` DATE NULL COMMENT '',
  `rNombLleva` VARCHAR(30) NOT NULL COMMENT '',
  `rNombTrae` VARCHAR(30) NOT NULL COMMENT '',
  `Tonner_idTonner` INT NOT NULL COMMENT '',
  `rRendidoFech` DATE NULL COMMENT '',
  `rObservaciones` VARCHAR(150) NULL COMMENT '',
  PRIMARY KEY (`idRecarga`, `Tonner_idTonner`)  COMMENT '',
  INDEX `fk_Recarga_Tonner1_idx` (`Tonner_idTonner` ASC)  COMMENT '',
  CONSTRAINT `fk_Recarga_Tonner1`
    FOREIGN KEY (`Tonner_idTonner`)
    REFERENCES `soporteDGC`.`Tonner` (`idTonner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`tipo` (
  `idtipo` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idtipo`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`otro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`otro` (
  `Dispositivo_idDispositivo` INT NOT NULL COMMENT '',
  `tipo_idtipo` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Dispositivo_idDispositivo`, `tipo_idtipo`)  COMMENT '',
  INDEX `fk_otro_tipo1_idx` (`tipo_idtipo` ASC)  COMMENT '',
  CONSTRAINT `fk_otro_Dispositivo1`
    FOREIGN KEY (`Dispositivo_idDispositivo`)
    REFERENCES `soporteDGC`.`Dispositivo` (`idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_otro_tipo1`
    FOREIGN KEY (`tipo_idtipo`)
    REFERENCES `soporteDGC`.`tipo` (`idtipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`Impresora_has_Tonner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`Impresora_has_Tonner` (
  `contadorimpresora` INT NULL COMMENT '',
  `contadortonner` INT NULL COMMENT '',
  `fecha` DATE NOT NULL COMMENT '',
  `observaciones` VARCHAR(45) NULL COMMENT '',
  `Impresora_Dispositivo_idDispositivo` INT NULL COMMENT '',
  `Tonner_idTonner` INT NULL COMMENT '',
  `idiht` INT NOT NULL AUTO_INCREMENT COMMENT '',
  INDEX `fk_Impresora_has_Tonner_Tonner1_idx` (`Tonner_idTonner` ASC)  COMMENT '',
  INDEX `fk_Impresora_has_Tonner_Impresora1_idx` (`Impresora_Dispositivo_idDispositivo` ASC)  COMMENT '',
  PRIMARY KEY (`idiht`)  COMMENT '',
  CONSTRAINT `fk_Impresora_has_Tonner_Impresora1`
    FOREIGN KEY (`Impresora_Dispositivo_idDispositivo`)
    REFERENCES `soporteDGC`.`Impresora` (`Dispositivo_idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Impresora_has_Tonner_Tonner1`
    FOREIGN KEY (`Tonner_idTonner`)
    REFERENCES `soporteDGC`.`Tonner` (`idTonner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soporteDGC`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`area` (
  `idarea` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `area` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idarea`)  COMMENT '')
ENGINE = InnoDB;

USE `soporteDGC` ;

-- -----------------------------------------------------
-- Placeholder table for view `soporteDGC`.`cambiartonner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`cambiartonner` (`idDispositivo` INT, `marca` INT, `modelo` INT, `area` INT, `puesto` INT);

-- -----------------------------------------------------
-- Placeholder table for view `soporteDGC`.`listarcambios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`listarcambios` (`idDispositivo` INT, `marca` INT, `modelo` INT, `fecha` INT, `contadorimpresora` INT, `contadortonner` INT, `observaciones` INT, `modelot` INT, `codigo` INT, `idiht` INT);

-- -----------------------------------------------------
-- Placeholder table for view `soporteDGC`.`tonnervw`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soporteDGC`.`tonnervw` (`idmodelotonner` INT, `modeloT` INT, `idEstado` INT, `Estado` INT);

-- -----------------------------------------------------
-- View `soporteDGC`.`cambiartonner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `soporteDGC`.`cambiartonner`;
USE `soporteDGC`;
CREATE  OR REPLACE VIEW `cambiartonner` AS
    SELECT 
        idDispositivo,
        Dispositivo.marca,
        Dispositivo.modelo,
        area,
        puesto
        
        
        
    FROM
        Dispositivo
            INNER JOIN
        impresora ON idDispositivo = Dispositivo_idDispositivo
            INNER JOIN
        posicion ON idPosicion = Posicion_idPosicion
            INNER JOIN
        area ON idarea = area_idarea
        
        
            
;

-- -----------------------------------------------------
-- View `soporteDGC`.`listarcambios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `soporteDGC`.`listarcambios`;
USE `soporteDGC`;
CREATE  OR REPLACE VIEW `listarcambios` AS
select idDispositivo,marca,modelo,fecha,contadorimpresora,contadortonner, impresora_has_tonner.observaciones,modelot,codigo,idiht from dispositivo inner join impresora on idDispositivo=impresora.Dispositivo_idDispositivo inner join impresora_has_tonner on Dispositivo_idDispositivo = Impresora_Dispositivo_idDispositivo
inner join tonner
on tonner_idtonner = idtonner
inner join modelotonner on tonner.modelotonner_idmodelotonner=idmodelotonner
;

-- -----------------------------------------------------
-- View `soporteDGC`.`tonnervw`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `soporteDGC`.`tonnervw`;
USE `soporteDGC`;
CREATE  OR REPLACE VIEW `tonnervw` AS
    SELECT 
        *
    FROM
        tonner
            INNER JOIN
        modelotonner ON idmodelotonner = modelotonner_idmodelotonner
            INNER JOIN
        Estado ON idEstado = Estado_idEstado

;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
