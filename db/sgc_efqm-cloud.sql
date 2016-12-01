-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dbc109a5c2d0164d93bc7ca6be01867c08
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`;
USE `dbc109a5c2d0164d93bc7ca6be01867c08`;
-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`answer` (
  `idanswer` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idanswer`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`criteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`criteria` (
  `idcriteria` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(150) NOT NULL,
  `type` INT(11) NOT NULL,
  PRIMARY KEY (`idcriteria`),
  INDEX `fk_criteria_type1_idx` (`type` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`period`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`period` (
  `idperiod` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(125) NOT NULL,
  `period_processed` INT(11) NOT NULL,
  PRIMARY KEY (`idperiod`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`period_criteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`period_criteria` (
  `idpc` INT(11) NOT NULL AUTO_INCREMENT,
  `criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  `point_efqm` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idpc`, `period`),
  INDEX `fk_period_criteria_criteria1_idx` (`criteria` ASC),
  INDEX `fk_period_criteria_period1_idx` (`period` ASC),
  CONSTRAINT `fk_period_criteria_criteria1`
    FOREIGN KEY (`criteria`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`criteria` (`idcriteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_period_criteria_period1`
    FOREIGN KEY (`period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`period` (`idperiod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_criteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_criteria` (
  `idaverage_criteria` INT(11) NOT NULL AUTO_INCREMENT,
  `period_criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  `value` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idaverage_criteria`),
  INDEX `fk_average_criteria_poll_criteria1_idx` (`period_criteria` ASC, `period` ASC),
  CONSTRAINT `fk_average_criteria_poll_criteria1`
    FOREIGN KEY (`period_criteria` , `period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`period_criteria` (`idpc` , `period`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 63
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`subcriteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`subcriteria` (
  `idsubcriteria` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idsubcriteria`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`pc_subcriteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`pc_subcriteria` (
  `idpcs` INT(11) NOT NULL AUTO_INCREMENT,
  `subcriteria` INT(11) NOT NULL,
  `period_criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  `adjustment` DECIMAL(5,2) NULL DEFAULT NULL,
  `percentage` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idpcs`, `period_criteria`, `period`),
  INDEX `fk_pc_subcriteria_subcriteria1_idx` (`subcriteria` ASC),
  INDEX `fk_pc_subcriteria_period_criteria1_idx` (`period_criteria` ASC, `period` ASC),
  CONSTRAINT `fk_pc_subcriteria_period_criteria1`
    FOREIGN KEY (`period_criteria` , `period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`period_criteria` (`idpc` , `period`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pc_subcriteria_subcriteria1`
    FOREIGN KEY (`subcriteria`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`subcriteria` (`idsubcriteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 80
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`process` (
  `idprocess` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idprocess`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`pcs_process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`pcs_process` (
  `idpcsp` INT(11) NOT NULL AUTO_INCREMENT,
  `process` INT(11) NOT NULL,
  `pc_subcriteria` INT(11) NOT NULL,
  `period_criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  PRIMARY KEY (`idpcsp`, `pc_subcriteria`, `period_criteria`, `period`),
  INDEX `fk_pcs_process_process1_idx` (`process` ASC),
  INDEX `fk_pcs_process_pc_subcriteria1_idx` (`pc_subcriteria` ASC, `period_criteria` ASC, `period` ASC),
  CONSTRAINT `fk_pcs_process_pc_subcriteria1`
    FOREIGN KEY (`pc_subcriteria` , `period_criteria` , `period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`pc_subcriteria` (`idpcs` , `period_criteria` , `period`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pcs_process_process1`
    FOREIGN KEY (`process`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`process` (`idprocess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 112
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_process`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_process` (
  `idag` INT(11) NOT NULL AUTO_INCREMENT,
  `pcs_process` INT(11) NOT NULL,
  `pc_subcriteria` INT(11) NOT NULL,
  `period_criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  `min` DECIMAL(5,2) NOT NULL,
  `max` DECIMAL(5,2) NOT NULL,
  `consensus` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idag`),
  INDEX `fk_average_process_pcs_process1_idx` (`pcs_process` ASC, `pc_subcriteria` ASC, `period_criteria` ASC, `period` ASC),
  CONSTRAINT `fk_average_process_pcs_process1`
    FOREIGN KEY (`pcs_process` , `pc_subcriteria` , `period_criteria` , `period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`pcs_process` (`idpcsp` , `pc_subcriteria` , `period_criteria` , `period`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 152
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_responses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_responses` (
  `idar` INT(11) NOT NULL AUTO_INCREMENT,
  `criteria` INT(11) NOT NULL,
  `subcriteria` INT(11) NOT NULL,
  `process` INT(11) NOT NULL,
  `value` DECIMAL(5,2) NOT NULL,
  `period` INT(11) NOT NULL,
  PRIMARY KEY (`idar`),
  INDEX `fk_average_responses_poll1_idx` (`period` ASC),
  CONSTRAINT `fk_average_responses_poll1`
    FOREIGN KEY (`period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`period` (`idperiod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1051
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_subcriteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`average_subcriteria` (
  `idas` INT(11) NOT NULL AUTO_INCREMENT,
  `pc_subcriteria` INT(11) NOT NULL,
  `period_criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  `partial` DECIMAL(5,2) NULL DEFAULT NULL,
  `total` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idas`),
  INDEX `fk_average_subcriteria_pc_subcriteria1_idx` (`pc_subcriteria` ASC, `period_criteria` ASC, `period` ASC),
  CONSTRAINT `fk_average_subcriteria_pc_subcriteria1`
    FOREIGN KEY (`pc_subcriteria` , `period_criteria` , `period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`pc_subcriteria` (`idpcs` , `period_criteria` , `period`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 119
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`priority`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`priority` (
  `idpriority` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idpriority`),
  UNIQUE INDEX `idpriority_UNIQUE` (`idpriority` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`status` (
  `idstatus` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idstatus`),
  UNIQUE INDEX `idstatus_UNIQUE` (`idstatus` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`improvements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`improvements` (
  `idimprovements` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `period` INT(11) NOT NULL,
  `priority` INT(11) NOT NULL,
  `status` INT(11) NOT NULL,
  PRIMARY KEY (`idimprovements`),
  UNIQUE INDEX `idimprovements_UNIQUE` (`idimprovements` ASC),
  INDEX `fk_improvements_period1_idx` (`period` ASC),
  INDEX `fk_improvements_priority1_idx` (`priority` ASC),
  INDEX `fk_improvements_status1_idx` (`status` ASC),
  CONSTRAINT `fk_improvements_period1`
    FOREIGN KEY (`period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`period` (`idperiod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_improvements_priority1`
    FOREIGN KEY (`priority`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`priority` (`idpriority`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_improvements_status1`
    FOREIGN KEY (`status`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`status` (`idstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`logs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dated` DATE NOT NULL,
  `logger` VARCHAR(50) NOT NULL,
  `level` VARCHAR(45) NOT NULL,
  `message` VARCHAR(1000) NOT NULL,
  `THROWABLE` VARCHAR(255) NOT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`questions` (
  `idquestions` INT(11) NOT NULL AUTO_INCREMENT,
  `question` TEXT NOT NULL,
  PRIMARY KEY (`idquestions`))
ENGINE = InnoDB
AUTO_INCREMENT = 244
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`pcsp_questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`pcsp_questions` (
  `idpcspq` INT(11) NOT NULL AUTO_INCREMENT,
  `questions_idquestions` INT(11) NOT NULL,
  `pcs_process` INT(11) NOT NULL,
  `pc_subcriteria` INT(11) NOT NULL,
  `period_criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  PRIMARY KEY (`idpcspq`, `pcs_process`, `pc_subcriteria`, `period_criteria`, `period`),
  INDEX `fk_pcsp_questions_questions1_idx` (`questions_idquestions` ASC),
  INDEX `fk_pcsp_questions_pcs_process1_idx` (`pcs_process` ASC, `pc_subcriteria` ASC, `period_criteria` ASC, `period` ASC),
  CONSTRAINT `fk_pcsp_questions_pcs_process1`
    FOREIGN KEY (`pcs_process` , `pc_subcriteria` , `period_criteria` , `period`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`pcs_process` (`idpcsp` , `pc_subcriteria` , `period_criteria` , `period`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pcsp_questions_questions1`
    FOREIGN KEY (`questions_idquestions`)
    REFERENCES `dbc109a5c2d0164d93bc7ca6be01867c08`.`questions` (`idquestions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 237
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`responses_people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`responses_people` (
  `idresppeo` INT(11) NOT NULL AUTO_INCREMENT,
  `hash` VARCHAR(45) NOT NULL,
  `pcsp_questions` INT(11) NOT NULL,
  `pcs_process` INT(11) NOT NULL,
  `pc_subcriteria` INT(11) NOT NULL,
  `period_criteria` INT(11) NOT NULL,
  `period` INT(11) NOT NULL,
  `type_answer` INT(11) NOT NULL,
  `evidence` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idresppeo`),
  INDEX `fk_responses_people_pcsp_questions1_idx` (`pcsp_questions` ASC, `pcs_process` ASC, `pc_subcriteria` ASC, `period_criteria` ASC, `period` ASC),
  INDEX `fk_responses_people_type_answer1_idx` (`type_answer` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1894
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`type` (
  `idtype` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`idtype`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`type_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`type_answer` (
  `idta` INT(11) NOT NULL AUTO_INCREMENT,
  `type` INT(11) NOT NULL,
  `answer` INT(11) NOT NULL,
  `value` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idta`),
  INDEX `fk_type_answer_type1_idx` (`type` ASC),
  INDEX `fk_type_answer_answer1_idx` (`answer` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `dbc109a5c2d0164d93bc7ca6be01867c08`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbc109a5c2d0164d93bc7ca6be01867c08`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Volcado de datos
-- -----------------------------------------------------

INSERT INTO `answer` (`idanswer`, `description`) VALUES
(1, 'NADA'),
(2, 'POCO'),
(3, 'BASTANTE'),
(4, 'MUCHO'),
(5, 'TOTALMENTE');

INSERT INTO `type` (`idtype`, `description`) VALUES
(1, 'Group 1'),
(2, 'Group 2'),
(3, 'Group 3');

INSERT INTO `status` (`idstatus`, `description`) VALUES
(1, 'Sin tratar'),
(2, 'En progreso'),
(3, 'Finalizado');

INSERT INTO `type_answer` (`idta`, `type`, `answer`, `value`) VALUES
(1, 1, 1, '0.00'),
(2, 1, 2, '25.00'),
(3, 1, 3, '50.00'),
(4, 1, 4, '75.00'),
(5, 1, 5, '100.00'),
(6, 2, 1, '0.00'),
(7, 2, 2, '37.00'),
(8, 2, 3, '75.00'),
(9, 2, 4, '112.00'),
(10, 2, 5, '150.00'),
(11, 3, 1, '0.00'),
(12, 3, 2, '22.00'),
(13, 3, 3, '45.00'),
(14, 3, 4, '67.00'),
(15, 3, 5, '90.00');

INSERT INTO `subcriteria` (`idsubcriteria`, `description`) VALUES
(1, '1a'),
(2, '1b'),
(3, '1c'),
(4, '1d'),
(5, '1e'),
(6, '2a'),
(7, '2b'),
(8, '2c'),
(9, '2d'),
(10, '3a'),
(11, '3b'),
(12, '3c'),
(13, '3d'),
(14, '3e'),
(15, '4a'),
(16, '4b'),
(17, '4c'),
(18, '4d'),
(19, '4e'),
(20, '5a'),
(21, '5b'),
(22, '5c'),
(23, '5d'),
(24, '5e'),
(25, '6a'),
(26, '6b'),
(27, '7a'),
(28, '7b'),
(29, '8a'),
(30, '8b'),
(31, '9a'),
(32, '9b');

INSERT INTO `period` (`idperiod`, `description`, `period_processed`) VALUES
(1, '2012', 1),
(3, '2015', 1),
(7, '2016', 1);

INSERT INTO `criteria` (`idcriteria`, `description`, `type`) VALUES
(1, 'Liderazgo', 1),
(2, 'Estrategia', 1),
(3, 'Personas', 1),
(4, 'Alianzas y Recursos', 1),
(5, 'Procesos, Productos y Servicios', 1),
(6, 'Resultados en los Clientes', 2),
(7, 'Resultados en las Personas', 3),
(8, 'Resultados en la Sociedad', 1),
(9, 'Resultados Clave', 2);

INSERT INTO `period_criteria` (`idpc`, `criteria`, `period`, `point_efqm`) VALUES
(10, 1, 1, '100.00'),
(11, 2, 1, '100.00'),
(12, 3, 1, '100.00'),
(13, 4, 1, '100.00'),
(14, 5, 1, '100.00'),
(15, 6, 1, '150.00'),
(16, 7, 1, '100.00'),
(17, 8, 1, '100.00'),
(18, 9, 1, '150.00'),
(19, 1, 3, '100.00'),
(20, 2, 3, '100.00'),
(21, 3, 3, '100.00'),
(22, 4, 3, '100.00'),
(23, 5, 3, '100.00'),
(24, 6, 3, '150.00'),
(25, 7, 3, '100.00'),
(26, 8, 3, '100.00'),
(27, 9, 3, '150.00');

INSERT INTO `questions` (`idquestions`, `question`) VALUES
(12, '¿Han sido definidos por parte del Equipo Directivo la Misión, la Visión, los Principios Éticos y Valores que conforman la "Cultura" de la Universidad, y han sido convenientemente divulgados a todos los Grupos de Interés (profesores, alumnos, Personal de Administración y Servicios (PAS), Consejo Social, etc.)?'),
(13, '¿Incluyen dichos valores conceptos tales como calidad y aprendizaje? '),
(14, 'El comportamiento del Equipo Directivo ¿es coherente con dichos valores?'),
(15, '¿Impulsa la Gerencia el desarrollo e implantación de un Sistema de Gestión por Procesos que permita traducir la Estrategia/Presupuesto a objetivos cuantificables que, medidos de forma periódica, sirvan para mejorar los resultados globales?'),
(16, '¿Se relaciona el Equipo Directivo con los profesores, alumnos, socios y representantes de la sociedad para conocer sus necesidades y expectativas?'),
(17, '¿Se implican y apoyan actividades de mejora, protección medioambiental o de contribución a la sociedad?'),
(18, '¿Mantiene el Equipo Directivo una comunicación fluida y bidireccional con sus empleados?'),
(19, '¿Aprovechan dicha comunicación para transmitir los Valores y las Estrategias de la Universidad? '),
(20, '¿Escuchan las aportaciones y/o quejas de sus empleados?'),
(21, '¿Apoya el Equipo Directivo a sus empleados y les ayudan si es necesario para conseguir sus objetivos? '),
(22, '¿Les animan y facilitan la participación en equipos/actividades de mejora? '),
(23, '¿Reconocen adecuadamente a individuos o equipos por su contribución a dichas actividades?'),
(24, '¿Define e impulsa el Equipo Directivo los cambios necesarios para adecuar la Universidad? '),
(25, '¿Garantizan la inversión, los recursos y el apoyo necesarios para desarrollar dichos cambios? '),
(26, '¿Una vez producidos los cambios, se mide la eficacia de los mismos y se comunican a los Grupos de Interés?'),
(27, 'En la definición del Plan Operativo/Presupuesto Anual de la Unidad Organizativa, ¿se recogen y consideran las Necesidades y Expectativas de los diferentes Grupos de Interés (empleados de la propia Unidad, estudiantes, potenciales estudiantes, PDI, PAS, centros, departamentos, órganos de gobierno, Admones. Públicas e instituciones conveniadas), así como datos sobre el comportamiento del sistema universitario y unidades similares?'),
(28, 'En la definición del Plan Operativo/Presupuesto Anual de la Unidad Organizativa, ¿se recogen y consideran los resultados de las mediciones anteriores, tanto propios como de unidades similares, y se analizan los impactos de la legislación aplicable, la innovación tecnológica, y los indicadores socioeconómicos y demográficos a corto y largo plazo?'),
(29, 'En la definición del Plan Operativo/Presupuesto Anual de la Unidad Organizativa, ¿se tienen en cuenta: Coherencia con los Principios Éticos y Valores que conforman su "Cultura"?'),
(30, 'En la definición del Plan Operativo/Presupuesto Anual de la Unidad Organizativa, ¿se tienen en cuenta: Atención equilibrada de necesidades y expectativas de los Grupos de Interés.?'),
(31, 'En la definición del Plan Operativo/Presupuesto Anual de la Unidad Organizativa, ¿se tienen en cuenta: Análisis de Riesgos y Plazos e identificación de los Factores Críticos de Éxito?'),
(32, '¿Se identifican los Procesos Clave de la Unidad Organizativa y se despliega el Plan Operativo a través de ellos? '),
(33, '¿Se descomponen los Objetivos y Metas de la Unidad Organizativa a través de los distintos niveles, llegando hasta la definición y seguimiento de los objetivos individuales o de equipo?'),
(34, '¿Se evalúa el nivel de conocimiento y sensibilización de los Grupos de Interés sobre los aspectos fundamentales de la Estrategia, Plan Operativo y Presupuesto, según sea apropiado?'),
(35, '¿Existe un Plan específico de Personal de Administración y Servicios, respetuoso con la legislación vigente y la igualdad de oportunidades, alineado con la Estrategia y el Plan Operativo de la Universidad, y se revisa conjuntamente con ellos? '),
(36, '¿Se tienen en cuenta las opiniones del Personal de Administración y Servicios en la definición de dicho Plan?'),
(37, '¿Se preocupa el Equipo Directivo del desarrollo personal y profesional del Personal de Administración y Servicios, procurando la adecuación de sus conocimientos y experiencia a las necesidades derivadas de su responsabilidad? '),
(38, '¿Se desarrollan e implantan planes de formación que faciliten dicha adecuación? '),
(39, '¿Se asigna al Personal de Administración y Servicios objetivos individuales y de equipo, y se evalúa su rendimiento?'),
(40, '¿Estimula el Equipo Directivo la implicación del PAS hacia la consecución de sus objetivos, mediante la motivación y el reconocimiento? '),
(41, '¿Promueve y facilita el Equipo Directivo la participación del PAS en acciones de mejora?'),
(42, '¿Impulsa y motiva al PAS hacia la innovación y la creatividad, siendo receptiva a sus aportaciones y sugerencias de mejora?'),
(43, '¿Se preocupa el Equipo Directivo de establecer una buena comunicación con/entre sus empleados?'),
(44, '¿Se han desarrollado cauces de comunicación verticales y horizontales y se utilizan eficientemente? '),
(45, '¿Se aprovechan dichos canales de comunicación para difundir el conocimiento y las buenas prácticas?'),
(46, '¿Se asegura el Equipo directivo del alineamiento de sus políticas de remuneración, movilidad, etc., con el Plan Operativo y Presupuesto? '),
(47, '¿Existe una política de reconocimiento hacia el PAS y fomento de la concienciación en temas medioambientales y de seguridad e higiene? '),
(48, '¿Se proporciona al PAS unas instalaciones y servicios de alta calidad? '),
(49, '¿Existe sensibilidad ante necesidades personales/clientes?'),
(50, '¿Identifica la Unidad Organizativa aquellas Organizaciones clave con las que se relaciona (Universidades, administraciones públicas, proveedores, etc.)?'),
(51, '¿Desarrolla con ellas acuerdos de colaboración, fomentando la transferencia de conocimientos y el aprovechamiento de sinergias?'),
(52, '¿Se ha definido e implantado una estrategia económico-financiera, alineada con la Estrategia/Plan Operativo de la Unidad Organizativa y traducida en un Presupuesto Anual? '),
(53, '¿Contempla dicha estrategia tanto las inversiones previstas, como los recursos necesarios para la financiación de las actividades de la Unidad Organizativa?'),
(54, '¿Contempla una adecuada gestión del riesgo financiero, gestión de cobros (cuando proceda), etc.?'),
(55, '¿Se asegura la Unidad Organizativa del adecuado funcionamiento, conservación y seguridad de sus edificios e instalaciones? '),
(56, '¿Se optimizan recursos, inventarios y se reducen consumos de suministros y energías (principalmente, los no renovables)? '),
(57, '¿Se cuidan adecuadamente los aspectos medioambientales y de reciclado de residuos?'),
(58, '¿Identifica la Unidad Organizativa las tecnologías e instalaciones más adecuadas para cubrir sus necesidades y las de sus clientes? '),
(59, '¿Gestiona adecuadamente las tecnologías existentes y se preocupa de su actualización y renovación?'),
(60, '¿Recoge y gestiona adecuadamente la Unidad Organizativa toda la información pertinente para el cumplimiento de sus fines? '),
(61, '¿Facilita a sus Grupos de Interés el acceso a las informaciones que son de su interés?'),
(62, '¿Protege adecuadamente la información sensible, tanto para la gestión como para las personas?'),
(63, '¿La Facultad dispone y aplica una metodología de procesos orientada a la identificación, diseño y documentación de sus Procesos Clave, que son aquéllos considerados imprescindibles para desplegar y desarrollar la Estrategia y Plan Operativo? '),
(64, '¿Dicha metodología de procesos se corresponde con alguna estandarización del tipo ISO 9000 propia de la Universidad o similar?'),
(65, '¿Disponen los Procesos, y en especial los denominados Clave, de unos sistemas de medición o indicadores, que permitan establecer sus objetivos de rendimiento y evaluar los resultados obtenidos? '),
(66, '¿Se han identificado aquellas áreas de los procesos que son comunes con otras unidades y a agentes externos a éste (proveedores, administración, etc.)?'),
(67, '¿Se revisa regularmente la eficiencia de los Procesos y se modifican apropiadamente en función de dichas revisiones, así como en función de las informaciones procedentes de sugerencias de mejora, actividades de aprendizaje, propuestas de innovación, etc.? '),
(68, 'La implantación de los cambios en los Procesos, ¿se realiza mediante un análisis previo (piloto) y una adecuada comunicación/formación a todos los implicados?'),
(69, '¿Se recogen informaciones procedentes de estudios de mercado y competencia, necesidades y expectativas de clientes, sugerencias innovadoras y creativas..., ?'),
(70, '¿se tiene en cuenta esta informacion a la hora de definir los nuevos Productos, Servicios y actividades de la Unidad organizativa?'),
(71, '¿Se investigan las necesidades y expectativas, así como el grado de satisfacción de los clientes con los Productos y Servicios, y se utiliza dicha información para la modificación y mejora de los mismos?'),
(72, '¿Se asegura la Unidad organizativa de que las características y prestaciones de los Productos y Servicios que proporciona a sus clientes responden a las especificaciones de su diseño? '),
(73, '¿Comunica veraz y adecuadamente la Unidad organizativa las condiciones de prestación de sus Productos y Servicios a sus potenciales clientes? '),
(74, '¿Establece niveles de compromiso y es consecuente con los mismos?'),
(75, '¿Desarrolla la Unidad organizativa actividades encaminadas a identificar necesidades y expectativas de sus clientes? '),
(76, '¿Dispone la Unidad organizativa de cauces de comunicación para la recepción de quejas y reclamaciones de sus clientes? '),
(77, '¿Tramita las mismas de forma sistemática y utiliza dicha información para la mejora permanente de sus servicios?'),
(78, '¿Identifica la Universidad cuáles son los aspectos más significativos y que más aprecian sus clientes? '),
(79, '¿El método que se utiliza para identificar dichos aspectos es fiable, se revisa de forma periódica y permite segmentar los resultados en función de los diferentes grupos de clientes?'),
(80, '¿Obtiene periódicamente los Servicios de la Universidad información directa del grado de satisfacción de los diferentes grupos de clientes respecto a dichos aspectos más significativos, así como de los servicios recibidos, y el nivel de satisfacción global?'),
(81, 'Sobre los indicadores del grado de satisfacción de clientes, ¿se marcan objetivos y se miden los resultados obtenidos? '),
(82, '¿La tendencia de dichos indicadores es positiva? '),
(83, 'Si en alguno no lo fuera, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(84, '¿Se comparan los índices de satisfacción de clientes con los de los Servicios en otras Universidades? '),
(85, 'Respecto a dichos indicadores, ¿en qué situación competitiva situamos a la Universidad?'),
(86, 'Teniendo en cuenta cuáles son los aspectos más valorados por los clientes, ¿ha identificado la Universidad con qué procesos están relacionados y con qué indicadores de dichos procesos puede existir una correspondencia?'),
(87, 'Sobre los indicadores de dichos procesos, que inciden directamente en la satisfacción de los clientes, ¿se marcan objetivos y se miden los resultados obtenidos? '),
(88, '¿La tendencia de dichos indicadores es positiva? '),
(89, 'Si en alguno no lo fuera, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(90, '¿Se comparan los resultados de dichos indicadores con los de otras Universidades o el propio sector? '),
(91, 'Respecto a dichos indicadores, ¿en qué situación competitiva situamos a los Servicios de la Universidad?'),
(92, '¿Obtiene periódicamente la Facultad información directa del grado de satisfacción de los diferentes grupos de empleados respecto a aquellos aspectos que les son más significativos, así como del nivel de satisfacción global?'),
(93, 'Sobre los indicadores del grado de satisfacción de los empleados, ¿se marcan objetivos y se miden los resultados obtenidos? '),
(94, '¿La tendencia de dichos indicadores es positiva? '),
(95, 'Si en alguno no lo fuera, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(96, '¿Se comparan los índices de satisfacción de los empleados con los de otras Unidades o Universidades? '),
(97, 'Respecto a dichos indicadores, ¿en qué situación competitiva situamos a la Unidad Organizativa?'),
(98, '¿Ha identificado la Facultad con qué procesos están relacionados los índices de satisfacción de los empleados, y con qué indicadores de dichos procesos puede existir una correspondencia?'),
(99, 'Sobre los indicadores de dichos procesos, que inciden directamente en la satisfacción de los empleados, ¿se marcan objetivos y se miden los resultados obtenidos? '),
(100, '¿La tendencia de dichos indicadores es positiva? '),
(101, 'Si en alguno no lo fuera, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(102, '¿Se comparan los resultados de dichos indicadores con los de otras unidades de la propia Universidad y/o Universidades? '),
(103, 'Respecto a dichos indicadores, ¿en qué situación situamos a la Unidad Organizativa?'),
(104, '¿Identifica y mide la Unidad Organizativa el nivel de percepción que tiene la Sociedad respecto a aquellos aspectos de especial sensibilidad social en su esfera de influencia? '),
(105, '¿La tendencia de dichos indicadores es positiva? '),
(106, 'Si en alguno no lo fuera, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(107, '¿Ha identificado la Unidad Organizativa con qué procesos están relacionados los índices de percepción social, y con qué indicadores de dichos procesos puede existir una correspondencia? '),
(108, '¿Se marcan objetivos sobre dichos indicadores y se miden los resultados obtenidos? '),
(109, '¿La tendencia de dichos indicadores es positiva? '),
(110, 'Si en alguno no lo fuera, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(111, '¿Se comparan los índices de percepción social de la Unidad Organizativa con los de otras Unidades de la propia Universidad o con Unidades Organizativas similares y de Universidades líderes? '),
(112, 'Respecto a dichos indicadores, ¿en qué situación competitiva situamos a la Unidad Organizativa?'),
(113, '¿Define objetivos y mide la Unidad Organizativa de forma periódica y sistemática sus Resultados Clave, y especialmente los económico-financieros?'),
(114, '¿Los objetivos son cada vez más exigentes y los resultados muestran una tendencia positiva? '),
(115, 'Si alguno de los Resultados Clave no reflejara una tendencia positiva, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(116, '¿Se comparan los Resultados Clave con los de otras unidades organizativas o  universidades? '),
(117, 'Respecto a dichos indicadores de Resultados Clave, ¿en qué situación competitiva situamos a la Unidad Organizativa?'),
(118, 'Además de dichos Resultados Clave, ¿define objetivos y mide la Facultadde forma periódica y sistemática otros resultados correspondientes a procesos de soporte, que contribuyen de manera sustancial a la consecución de los anteriores?'),
(119, 'Los objetivos de dichos indicadores correspondientes a procesos de soporte, ¿son cada vez más exigentes y los resultados muestran una tendencia positiva?'),
(120, 'Si alguno de los resultados no reflejara una tendencia positiva, ¿se han averiguado las causas y establecido las acciones de mejora adecuadas?'),
(121, '¿Se comparan los resultados de los indicadores de procesos de soporte con los de otras Unidades Organizativas o Universidades? '),
(122, 'Respecto a dichos indicadores, ¿en qué situación competitiva situamos a la Unidad Organizativa?');

INSERT INTO `priority` (`idpriority`, `description`) VALUES
(1, 'Baja'),
(2, 'Media'),
(3, 'Alta');

INSERT INTO `process` (`idprocess`, `description`) VALUES
(1, 'P1'),
(2, 'P2'),
(3, 'P3'),
(4, 'P4'),
(5, 'P5'),
(6, 'P6'),
(7, 'P7');

INSERT INTO `pc_subcriteria` (`idpcs`, `subcriteria`, `period_criteria`, `period`, `adjustment`, `percentage`) VALUES
(8, 1, 10, 1, '1.00', '0.00'),
(9, 2, 10, 1, '0.50', '0.00'),
(10, 3, 10, 1, '1.00', '0.00'),
(11, 4, 10, 1, '1.00', '0.00'),
(12, 5, 10, 1, '0.75', '0.00'),
(13, 6, 11, 1, '0.75', '0.00'),
(14, 7, 11, 1, '1.00', '0.00'),
(15, 8, 11, 1, '1.00', '0.00'),
(16, 9, 11, 1, '1.00', '0.00'),
(17, 10, 12, 1, '1.00', '0.00'),
(18, 11, 12, 1, '0.50', '0.00'),
(19, 12, 12, 1, '0.25', '0.00'),
(20, 13, 12, 1, '0.50', '0.00'),
(21, 14, 12, 1, '0.25', '0.00'),
(22, 15, 13, 1, '1.00', '0.00'),
(23, 16, 13, 1, '1.00', '0.00'),
(24, 17, 13, 1, '1.00', '0.00'),
(25, 18, 13, 1, '1.00', '0.00'),
(26, 19, 13, 1, '0.50', '0.00'),
(27, 20, 14, 1, '1.00', '0.00'),
(28, 21, 14, 1, '1.00', '0.00'),
(29, 22, 14, 1, '1.00', '0.00'),
(30, 23, 14, 1, '0.75', '0.00'),
(31, 24, 14, 1, '0.75', '0.00'),
(32, 25, 15, 1, '0.50', '0.75'),
(33, 26, 15, 1, '0.75', '0.25'),
(34, 27, 16, 1, '1.00', '0.75'),
(35, 28, 16, 1, '1.00', '0.25'),
(36, 29, 17, 1, '0.50', '0.50'),
(37, 30, 17, 1, '0.50', '0.50'),
(38, 31, 18, 1, '0.50', '0.50'),
(39, 32, 18, 1, '1.00', '0.50'),
(40, 1, 19, 3, '1.00', '0.00'),
(41, 2, 19, 3, '0.50', '0.00'),
(42, 3, 19, 3, '1.00', '0.00'),
(43, 4, 19, 3, '1.00', '0.00'),
(44, 5, 19, 3, '0.75', '0.00'),
(45, 6, 20, 3, '0.75', '0.00'),
(46, 7, 20, 3, '1.00', '0.00'),
(47, 8, 20, 3, '1.00', '0.00'),
(48, 9, 20, 3, '1.00', '0.00'),
(49, 10, 21, 3, '1.00', '0.00'),
(50, 11, 21, 3, '0.50', '0.00'),
(51, 12, 21, 3, '0.25', '0.00'),
(52, 13, 21, 3, '0.50', '0.00'),
(53, 14, 21, 3, '0.25', '0.00'),
(54, 15, 22, 3, '1.00', '0.00'),
(55, 16, 22, 3, '1.00', '0.00'),
(56, 17, 22, 3, '1.00', '0.00'),
(57, 18, 22, 3, '1.00', '0.00'),
(58, 19, 22, 3, '0.50', '0.00'),
(59, 20, 23, 3, '1.00', '0.00'),
(60, 21, 23, 3, '1.00', '0.00'),
(61, 22, 23, 3, '1.00', '0.00'),
(62, 23, 23, 3, '0.75', '0.00'),
(63, 24, 23, 3, '0.75', '0.00'),
(64, 25, 24, 3, '0.50', '0.75'),
(65, 26, 24, 3, '0.75', '0.25'),
(66, 27, 25, 3, '1.00', '0.75'),
(67, 28, 25, 3, '1.00', '0.25'),
(68, 29, 26, 3, '0.50', '0.50'),
(69, 30, 26, 3, '0.50', '0.50'),
(70, 31, 27, 3, '0.50', '0.50'),
(71, 32, 27, 3, '1.00', '0.50');

INSERT INTO `pcs_process` (`idpcsp`, `process`, `pc_subcriteria`, `period_criteria`, `period`) VALUES
(8, 1, 8, 10, 1),
(14, 1, 13, 11, 1),
(18, 1, 17, 12, 1),
(23, 1, 22, 13, 1),
(28, 1, 27, 14, 1),
(35, 1, 32, 15, 1),
(42, 1, 34, 16, 1),
(48, 1, 36, 17, 1),
(51, 1, 38, 18, 1),
(58, 1, 40, 19, 3),
(64, 1, 45, 20, 3),
(68, 1, 49, 21, 3),
(73, 1, 54, 22, 3),
(78, 1, 59, 23, 3),
(85, 1, 64, 24, 3),
(92, 1, 66, 25, 3),
(98, 1, 68, 26, 3),
(101, 1, 70, 27, 3),
(9, 2, 9, 10, 1),
(15, 2, 14, 11, 1),
(19, 2, 18, 12, 1),
(24, 2, 23, 13, 1),
(29, 2, 27, 14, 1),
(36, 2, 32, 15, 1),
(43, 2, 34, 16, 1),
(49, 2, 37, 17, 1),
(52, 2, 38, 18, 1),
(59, 2, 41, 19, 3),
(65, 2, 46, 20, 3),
(69, 2, 50, 21, 3),
(74, 2, 55, 22, 3),
(79, 2, 59, 23, 3),
(86, 2, 64, 24, 3),
(93, 2, 66, 25, 3),
(99, 2, 69, 26, 3),
(102, 2, 70, 27, 3),
(10, 3, 10, 10, 1),
(16, 3, 15, 11, 1),
(20, 3, 19, 12, 1),
(25, 3, 24, 13, 1),
(30, 3, 28, 14, 1),
(37, 3, 32, 15, 1),
(44, 3, 34, 16, 1),
(50, 3, 37, 17, 1),
(53, 3, 38, 18, 1),
(60, 3, 42, 19, 3),
(66, 3, 47, 20, 3),
(70, 3, 51, 21, 3),
(75, 3, 56, 22, 3),
(80, 3, 60, 23, 3),
(87, 3, 64, 24, 3),
(94, 3, 66, 25, 3),
(100, 3, 69, 26, 3),
(103, 3, 70, 27, 3),
(11, 4, 11, 10, 1),
(17, 4, 16, 11, 1),
(21, 4, 20, 12, 1),
(26, 4, 25, 13, 1),
(31, 4, 29, 14, 1),
(38, 4, 32, 15, 1),
(45, 4, 35, 16, 1),
(54, 4, 39, 18, 1),
(61, 4, 43, 19, 3),
(67, 4, 48, 20, 3),
(71, 4, 52, 21, 3),
(76, 4, 57, 22, 3),
(81, 4, 61, 23, 3),
(88, 4, 64, 24, 3),
(95, 4, 67, 25, 3),
(104, 4, 71, 27, 3),
(12, 5, 11, 10, 1),
(22, 5, 21, 12, 1),
(27, 5, 26, 13, 1),
(32, 5, 29, 14, 1),
(39, 5, 33, 15, 1),
(46, 5, 35, 16, 1),
(55, 5, 39, 18, 1),
(62, 5, 43, 19, 3),
(72, 5, 53, 21, 3),
(77, 5, 58, 22, 3),
(82, 5, 61, 23, 3),
(89, 5, 65, 24, 3),
(96, 5, 67, 25, 3),
(105, 5, 71, 27, 3),
(13, 6, 12, 10, 1),
(33, 6, 30, 14, 1),
(40, 6, 33, 15, 1),
(47, 6, 35, 16, 1),
(56, 6, 39, 18, 1),
(63, 6, 44, 19, 3),
(83, 6, 62, 23, 3),
(90, 6, 65, 24, 3),
(97, 6, 67, 25, 3),
(106, 6, 71, 27, 3),
(34, 7, 31, 14, 1),
(41, 7, 33, 15, 1),
(57, 7, 39, 18, 1),
(84, 7, 63, 23, 3),
(91, 7, 65, 24, 3),
(107, 7, 71, 27, 3);

INSERT INTO `pcsp_questions` (`idpcspq`, `questions_idquestions`, `pcs_process`, `pc_subcriteria`, `period_criteria`, `period`) VALUES
(10, 12, 8, 8, 10, 1),
(11, 13, 8, 8, 10, 1),
(12, 14, 8, 8, 10, 1),
(13, 15, 9, 9, 10, 1),
(14, 16, 10, 10, 10, 1),
(15, 17, 10, 10, 10, 1),
(16, 18, 11, 11, 10, 1),
(17, 19, 11, 11, 10, 1),
(18, 20, 11, 11, 10, 1),
(19, 21, 12, 11, 10, 1),
(20, 22, 12, 11, 10, 1),
(21, 23, 12, 11, 10, 1),
(22, 24, 13, 12, 10, 1),
(23, 25, 13, 12, 10, 1),
(24, 26, 13, 12, 10, 1),
(25, 27, 14, 13, 11, 1),
(26, 28, 15, 14, 11, 1),
(27, 29, 16, 15, 11, 1),
(28, 30, 16, 15, 11, 1),
(29, 31, 16, 15, 11, 1),
(30, 32, 17, 16, 11, 1),
(31, 33, 17, 16, 11, 1),
(32, 34, 17, 16, 11, 1),
(33, 35, 18, 17, 12, 1),
(34, 36, 18, 17, 12, 1),
(35, 37, 19, 18, 12, 1),
(36, 38, 19, 18, 12, 1),
(37, 39, 19, 18, 12, 1),
(38, 40, 20, 19, 12, 1),
(39, 41, 20, 19, 12, 1),
(40, 42, 20, 19, 12, 1),
(41, 43, 21, 20, 12, 1),
(42, 44, 21, 20, 12, 1),
(43, 45, 21, 20, 12, 1),
(44, 46, 22, 21, 12, 1),
(45, 47, 22, 21, 12, 1),
(46, 48, 22, 21, 12, 1),
(47, 49, 22, 21, 12, 1),
(48, 50, 23, 22, 13, 1),
(49, 51, 23, 22, 13, 1),
(50, 52, 24, 23, 13, 1),
(51, 53, 24, 23, 13, 1),
(52, 54, 24, 23, 13, 1),
(53, 55, 25, 24, 13, 1),
(54, 56, 25, 24, 13, 1),
(55, 57, 25, 24, 13, 1),
(56, 58, 26, 25, 13, 1),
(57, 59, 26, 25, 13, 1),
(58, 60, 27, 26, 13, 1),
(59, 61, 27, 26, 13, 1),
(60, 62, 27, 26, 13, 1),
(61, 63, 28, 27, 14, 1),
(62, 64, 28, 27, 14, 1),
(63, 65, 29, 27, 14, 1),
(64, 66, 29, 27, 14, 1),
(65, 67, 30, 28, 14, 1),
(66, 68, 30, 28, 14, 1),
(67, 69, 31, 29, 14, 1),
(68, 70, 31, 29, 14, 1),
(69, 71, 32, 29, 14, 1),
(70, 72, 33, 30, 14, 1),
(71, 73, 33, 30, 14, 1),
(72, 74, 33, 30, 14, 1),
(73, 75, 34, 31, 14, 1),
(74, 76, 34, 31, 14, 1),
(75, 77, 34, 31, 14, 1),
(76, 78, 35, 32, 15, 1),
(77, 79, 35, 32, 15, 1),
(78, 80, 36, 32, 15, 1),
(79, 81, 37, 32, 15, 1),
(80, 82, 37, 32, 15, 1),
(81, 83, 37, 32, 15, 1),
(82, 84, 38, 32, 15, 1),
(83, 85, 38, 32, 15, 1),
(84, 86, 39, 33, 15, 1),
(85, 87, 40, 33, 15, 1),
(86, 88, 40, 33, 15, 1),
(87, 89, 40, 33, 15, 1),
(88, 90, 41, 33, 15, 1),
(89, 91, 41, 33, 15, 1),
(90, 92, 42, 34, 16, 1),
(91, 93, 43, 34, 16, 1),
(92, 94, 43, 34, 16, 1),
(93, 95, 43, 34, 16, 1),
(94, 96, 44, 34, 16, 1),
(95, 97, 44, 34, 16, 1),
(96, 98, 45, 35, 16, 1),
(97, 99, 46, 35, 16, 1),
(98, 100, 46, 35, 16, 1),
(99, 101, 46, 35, 16, 1),
(100, 102, 47, 35, 16, 1),
(101, 103, 47, 35, 16, 1),
(102, 104, 48, 36, 17, 1),
(103, 105, 48, 36, 17, 1),
(104, 106, 48, 36, 17, 1),
(105, 107, 49, 37, 17, 1),
(106, 108, 49, 37, 17, 1),
(107, 109, 49, 37, 17, 1),
(108, 110, 49, 37, 17, 1),
(109, 111, 50, 37, 17, 1),
(110, 112, 50, 37, 17, 1),
(111, 113, 51, 38, 18, 1),
(112, 114, 52, 38, 18, 1),
(113, 115, 52, 38, 18, 1),
(114, 116, 53, 38, 18, 1),
(115, 117, 53, 38, 18, 1),
(116, 118, 54, 39, 18, 1),
(117, 119, 55, 39, 18, 1),
(118, 120, 56, 39, 18, 1),
(119, 121, 57, 39, 18, 1),
(120, 122, 57, 39, 18, 1),
(121, 12, 58, 40, 19, 3),
(122, 13, 58, 40, 19, 3),
(123, 14, 58, 40, 19, 3),
(124, 15, 59, 41, 19, 3),
(125, 16, 60, 42, 19, 3),
(126, 17, 60, 42, 19, 3),
(127, 18, 61, 43, 19, 3),
(128, 19, 61, 43, 19, 3),
(129, 20, 61, 43, 19, 3),
(130, 21, 62, 43, 19, 3),
(131, 22, 62, 43, 19, 3),
(132, 23, 62, 43, 19, 3),
(133, 24, 63, 44, 19, 3),
(134, 25, 63, 44, 19, 3),
(135, 26, 63, 44, 19, 3),
(136, 27, 64, 45, 20, 3),
(137, 28, 65, 46, 20, 3),
(138, 29, 66, 47, 20, 3),
(139, 30, 66, 47, 20, 3),
(140, 31, 66, 47, 20, 3),
(141, 32, 67, 48, 20, 3),
(142, 33, 67, 48, 20, 3),
(143, 34, 67, 48, 20, 3),
(144, 35, 68, 49, 21, 3),
(145, 36, 68, 49, 21, 3),
(146, 37, 69, 50, 21, 3),
(147, 38, 69, 50, 21, 3),
(148, 39, 69, 50, 21, 3),
(149, 40, 70, 51, 21, 3),
(150, 41, 70, 51, 21, 3),
(151, 42, 70, 51, 21, 3),
(152, 43, 71, 52, 21, 3),
(153, 44, 71, 52, 21, 3),
(154, 45, 71, 52, 21, 3),
(155, 46, 72, 53, 21, 3),
(156, 47, 72, 53, 21, 3),
(157, 48, 72, 53, 21, 3),
(158, 49, 72, 53, 21, 3),
(159, 50, 73, 54, 22, 3),
(160, 51, 73, 54, 22, 3),
(161, 52, 74, 55, 22, 3),
(162, 53, 74, 55, 22, 3),
(163, 54, 74, 55, 22, 3),
(164, 55, 75, 56, 22, 3),
(165, 56, 75, 56, 22, 3),
(166, 57, 75, 56, 22, 3),
(167, 58, 76, 57, 22, 3),
(168, 59, 76, 57, 22, 3),
(169, 60, 77, 58, 22, 3),
(170, 61, 77, 58, 22, 3),
(171, 62, 77, 58, 22, 3),
(172, 63, 78, 59, 23, 3),
(173, 64, 78, 59, 23, 3),
(174, 65, 79, 59, 23, 3),
(175, 66, 79, 59, 23, 3),
(176, 67, 80, 60, 23, 3),
(177, 68, 80, 60, 23, 3),
(178, 69, 81, 61, 23, 3),
(179, 70, 81, 61, 23, 3),
(180, 71, 82, 61, 23, 3),
(181, 72, 83, 62, 23, 3),
(182, 73, 83, 62, 23, 3),
(183, 74, 83, 62, 23, 3),
(184, 75, 84, 63, 23, 3),
(185, 76, 84, 63, 23, 3),
(186, 77, 84, 63, 23, 3),
(187, 78, 85, 64, 24, 3),
(188, 79, 85, 64, 24, 3),
(189, 80, 86, 64, 24, 3),
(190, 81, 87, 64, 24, 3),
(191, 82, 87, 64, 24, 3),
(192, 83, 87, 64, 24, 3),
(193, 84, 88, 64, 24, 3),
(194, 85, 88, 64, 24, 3),
(195, 86, 89, 65, 24, 3),
(196, 87, 90, 65, 24, 3),
(197, 88, 90, 65, 24, 3),
(198, 89, 90, 65, 24, 3),
(199, 90, 91, 65, 24, 3),
(200, 91, 91, 65, 24, 3),
(201, 92, 92, 66, 25, 3),
(202, 93, 93, 66, 25, 3),
(203, 94, 93, 66, 25, 3),
(204, 95, 93, 66, 25, 3),
(205, 96, 94, 66, 25, 3),
(206, 97, 94, 66, 25, 3),
(207, 98, 95, 67, 25, 3),
(208, 99, 96, 67, 25, 3),
(209, 100, 96, 67, 25, 3),
(210, 101, 96, 67, 25, 3),
(211, 102, 97, 67, 25, 3),
(212, 103, 97, 67, 25, 3),
(213, 104, 98, 68, 26, 3),
(214, 105, 98, 68, 26, 3),
(215, 106, 98, 68, 26, 3),
(216, 107, 99, 69, 26, 3),
(217, 108, 99, 69, 26, 3),
(218, 109, 99, 69, 26, 3),
(219, 110, 99, 69, 26, 3),
(220, 111, 100, 69, 26, 3),
(221, 112, 100, 69, 26, 3),
(222, 113, 101, 70, 27, 3),
(223, 114, 102, 70, 27, 3),
(224, 115, 102, 70, 27, 3),
(225, 116, 103, 70, 27, 3),
(226, 117, 103, 70, 27, 3),
(227, 118, 104, 71, 27, 3),
(228, 119, 105, 71, 27, 3),
(229, 120, 106, 71, 27, 3),
(230, 121, 107, 71, 27, 3),
(231, 122, 107, 71, 27, 3);

INSERT INTO `average_criteria` (`idaverage_criteria`, `period_criteria`, `period`, `value`) VALUES
(15, 10, 1, '39.43'),
(16, 11, 1, '22.20'),
(17, 12, 1, '16.69'),
(18, 13, 1, '30.00'),
(19, 14, 1, '22.19'),
(22, 15, 1, '18.64'),
(23, 16, 1, '11.21'),
(24, 17, 1, '9.47'),
(25, 18, 1, '16.06'),
(51, 19, 3, '43.54'),
(52, 20, 3, '44.73'),
(53, 21, 3, '18.81'),
(54, 22, 3, '37.81'),
(55, 23, 3, '31.72'),
(58, 24, 3, '8.93'),
(59, 25, 3, '10.50'),
(60, 26, 3, '6.56'),
(61, 27, 3, '17.06');

INSERT INTO `average_process` (`idag`, `pcs_process`, `pc_subcriteria`, `period_criteria`, `period`, `min`, `max`, `consensus`) VALUES
(1, 8, 8, 10, 1, '33.33', '66.67', '46.88'),
(2, 9, 9, 10, 1, '0.00', '50.00', '28.13'),
(3, 10, 10, 10, 1, '25.00', '75.00', '43.75'),
(4, 11, 11, 10, 1, '33.33', '66.67', '48.96'),
(5, 12, 11, 10, 1, '33.33', '83.33', '59.37'),
(6, 13, 12, 10, 1, '33.33', '75.00', '51.04'),
(7, 14, 13, 11, 1, '0.00', '50.00', '28.13'),
(8, 15, 14, 11, 1, '0.00', '25.00', '12.50'),
(9, 16, 15, 11, 1, '0.00', '58.33', '31.25'),
(10, 17, 16, 11, 1, '8.33', '41.67', '23.96'),
(11, 18, 17, 12, 1, '12.50', '37.50', '29.69'),
(12, 19, 18, 12, 1, '25.00', '41.67', '36.46'),
(13, 20, 19, 12, 1, '8.33', '58.33', '34.37'),
(14, 21, 20, 12, 1, '25.00', '58.33', '37.50'),
(15, 22, 21, 12, 1, '12.50', '62.50', '32.81'),
(16, 23, 22, 13, 1, '25.00', '75.00', '53.13'),
(17, 24, 23, 13, 1, '0.00', '50.00', '13.54'),
(18, 25, 24, 13, 1, '8.33', '50.00', '21.88'),
(19, 26, 25, 13, 1, '25.00', '62.50', '42.19'),
(20, 27, 26, 13, 1, '16.67', '50.00', '38.54'),
(21, 28, 27, 14, 1, '0.00', '25.00', '9.38'),
(22, 29, 27, 14, 1, '0.00', '25.00', '7.81'),
(23, 30, 28, 14, 1, '0.00', '37.50', '14.06'),
(24, 31, 29, 14, 1, '0.00', '50.00', '28.13'),
(25, 32, 29, 14, 1, '25.00', '75.00', '34.38'),
(26, 33, 30, 14, 1, '33.33', '41.67', '38.54'),
(27, 34, 31, 14, 1, '16.67', '75.00', '37.50'),
(28, 35, 32, 15, 1, '18.50', '93.50', '51.31'),
(29, 36, 32, 15, 1, '37.00', '75.00', '41.75'),
(30, 37, 32, 15, 1, '0.00', '62.00', '20.17'),
(31, 38, 32, 15, 1, '0.00', '93.50', '28.06'),
(32, 39, 33, 15, 1, '0.00', '37.00', '18.50'),
(33, 40, 33, 15, 1, '0.00', '87.33', '37.33'),
(34, 41, 33, 15, 1, '0.00', '75.00', '30.38'),
(35, 42, 34, 16, 1, '0.00', '45.00', '22.25'),
(36, 43, 34, 16, 1, '0.00', '44.67', '12.04'),
(37, 44, 34, 16, 1, '0.00', '33.50', '4.19'),
(38, 45, 35, 16, 1, '0.00', '22.00', '2.75'),
(39, 46, 35, 16, 1, '0.00', '52.33', '12.13'),
(40, 47, 35, 16, 1, '0.00', '33.50', '4.19'),
(41, 48, 36, 17, 1, '0.00', '58.33', '25.00'),
(42, 49, 37, 17, 1, '0.00', '56.25', '11.72'),
(43, 50, 37, 17, 1, '0.00', '62.50', '14.06'),
(44, 51, 38, 18, 1, '0.00', '112.00', '51.25'),
(45, 52, 38, 18, 1, '56.00', '112.00', '77.13'),
(46, 53, 38, 18, 1, '0.00', '56.00', '25.63'),
(47, 54, 39, 18, 1, '0.00', '37.00', '4.63'),
(48, 55, 39, 18, 1, '0.00', '75.00', '9.38'),
(49, 56, 39, 18, 1, '0.00', '75.00', '9.38'),
(50, 57, 39, 18, 1, '0.00', '18.50', '2.31'),
(51, 58, 40, 19, 3, '0.00', '100.00', '54.17'),
(52, 59, 41, 19, 3, '0.00', '100.00', '50.00'),
(53, 60, 42, 19, 3, '0.00', '100.00', '54.69'),
(54, 61, 43, 19, 3, '0.00', '100.00', '53.12'),
(55, 62, 43, 19, 3, '0.00', '100.00', '48.96'),
(56, 63, 44, 19, 3, '0.00', '100.00', '43.75'),
(57, 64, 45, 20, 3, '0.00', '100.00', '46.88'),
(58, 65, 46, 20, 3, '0.00', '100.00', '43.75'),
(59, 66, 47, 20, 3, '0.00', '100.00', '58.34'),
(60, 67, 48, 20, 3, '0.00', '75.00', '41.67'),
(61, 68, 49, 21, 3, '0.00', '100.00', '39.06'),
(62, 69, 50, 21, 3, '0.00', '83.33', '36.46'),
(63, 70, 51, 21, 3, '0.00', '91.67', '34.37'),
(64, 71, 52, 21, 3, '0.00', '91.67', '39.58'),
(65, 72, 53, 21, 3, '0.00', '68.75', '33.59'),
(66, 73, 54, 22, 3, '0.00', '100.00', '48.44'),
(67, 74, 55, 22, 3, '0.00', '100.00', '44.79'),
(68, 75, 56, 22, 3, '0.00', '91.67', '31.25'),
(69, 76, 57, 22, 3, '0.00', '87.50', '42.19'),
(70, 77, 58, 22, 3, '0.00', '83.33', '44.79'),
(71, 78, 59, 23, 3, '0.00', '100.00', '35.94'),
(72, 79, 59, 23, 3, '0.00', '75.00', '23.44'),
(73, 80, 60, 23, 3, '0.00', '75.00', '34.38'),
(74, 81, 61, 23, 3, '0.00', '62.50', '29.69'),
(75, 82, 61, 23, 3, '0.00', '75.00', '34.38'),
(76, 83, 62, 23, 3, '0.00', '91.67', '43.75'),
(77, 84, 63, 23, 3, '0.00', '91.67', '39.58'),
(78, 85, 64, 24, 3, '0.00', '112.00', '53.69'),
(79, 86, 64, 24, 3, '0.00', '112.00', '42.00'),
(80, 87, 64, 24, 3, '0.00', '99.67', '17.08'),
(81, 88, 64, 24, 3, '0.00', '93.50', '21.00'),
(82, 89, 65, 24, 3, '0.00', '112.00', '23.38'),
(83, 90, 65, 24, 3, '0.00', '112.00', '35.83'),
(84, 91, 65, 24, 3, '0.00', '93.50', '25.69'),
(85, 92, 66, 25, 3, '0.00', '67.00', '30.75'),
(86, 93, 66, 25, 3, '0.00', '67.33', '21.46'),
(87, 94, 66, 25, 3, '0.00', '67.00', '15.38'),
(88, 95, 67, 25, 3, '0.00', '45.00', '16.88'),
(89, 96, 67, 25, 3, '0.00', '59.67', '14.00'),
(90, 97, 67, 25, 3, '0.00', '78.50', '18.19'),
(91, 98, 68, 26, 3, '0.00', '91.67', '30.21'),
(92, 99, 69, 26, 3, '0.00', '75.00', '19.53'),
(93, 100, 69, 26, 3, '0.00', '87.50', '25.00'),
(94, 101, 70, 27, 3, '0.00', '150.00', '60.75'),
(95, 102, 70, 27, 3, '0.00', '150.00', '72.56'),
(96, 103, 70, 27, 3, '0.00', '150.00', '51.44'),
(97, 104, 71, 27, 3, '0.00', '150.00', '37.50'),
(98, 105, 71, 27, 3, '0.00', '112.00', '42.00'),
(99, 106, 71, 27, 3, '0.00', '112.00', '37.38'),
(100, 107, 71, 27, 3, '0.00', '150.00', '32.75'),
(101, 58, 40, 19, 3, '0.00', '100.00', '54.17'),
(102, 59, 41, 19, 3, '0.00', '100.00', '50.00'),
(103, 60, 42, 19, 3, '0.00', '100.00', '54.69'),
(104, 61, 43, 19, 3, '0.00', '100.00', '53.12'),
(105, 62, 43, 19, 3, '0.00', '100.00', '48.96'),
(106, 63, 44, 19, 3, '0.00', '100.00', '43.75'),
(107, 64, 45, 20, 3, '0.00', '100.00', '46.88'),
(108, 65, 46, 20, 3, '0.00', '100.00', '43.75'),
(109, 66, 47, 20, 3, '0.00', '100.00', '58.34'),
(110, 67, 48, 20, 3, '0.00', '75.00', '41.67'),
(111, 68, 49, 21, 3, '0.00', '100.00', '39.06'),
(112, 69, 50, 21, 3, '0.00', '83.33', '36.46'),
(113, 70, 51, 21, 3, '0.00', '91.67', '34.37'),
(114, 71, 52, 21, 3, '0.00', '91.67', '39.58'),
(115, 72, 53, 21, 3, '0.00', '68.75', '33.59'),
(116, 73, 54, 22, 3, '0.00', '100.00', '48.44'),
(117, 74, 55, 22, 3, '0.00', '100.00', '44.79'),
(118, 75, 56, 22, 3, '0.00', '91.67', '31.25'),
(119, 76, 57, 22, 3, '0.00', '87.50', '42.19'),
(120, 77, 58, 22, 3, '0.00', '83.33', '44.79'),
(121, 78, 59, 23, 3, '0.00', '100.00', '35.94'),
(122, 79, 59, 23, 3, '0.00', '75.00', '23.44'),
(123, 80, 60, 23, 3, '0.00', '75.00', '34.38'),
(124, 81, 61, 23, 3, '0.00', '62.50', '29.69'),
(125, 82, 61, 23, 3, '0.00', '75.00', '34.38'),
(126, 83, 62, 23, 3, '0.00', '91.67', '43.75'),
(127, 84, 63, 23, 3, '0.00', '91.67', '39.58'),
(128, 85, 64, 24, 3, '0.00', '112.00', '53.69'),
(129, 86, 64, 24, 3, '0.00', '112.00', '42.00'),
(130, 87, 64, 24, 3, '0.00', '99.67', '17.08'),
(131, 88, 64, 24, 3, '0.00', '93.50', '21.00'),
(132, 89, 65, 24, 3, '0.00', '112.00', '23.38'),
(133, 90, 65, 24, 3, '0.00', '112.00', '35.83'),
(134, 91, 65, 24, 3, '0.00', '93.50', '25.69'),
(135, 92, 66, 25, 3, '0.00', '67.00', '30.75'),
(136, 93, 66, 25, 3, '0.00', '67.33', '21.46'),
(137, 94, 66, 25, 3, '0.00', '67.00', '15.38'),
(138, 95, 67, 25, 3, '0.00', '45.00', '16.88'),
(139, 96, 67, 25, 3, '0.00', '59.67', '14.00'),
(140, 97, 67, 25, 3, '0.00', '78.50', '18.19'),
(141, 98, 68, 26, 3, '0.00', '91.67', '30.21'),
(142, 99, 69, 26, 3, '0.00', '75.00', '19.53'),
(143, 100, 69, 26, 3, '0.00', '87.50', '25.00'),
(144, 101, 70, 27, 3, '0.00', '150.00', '60.75'),
(145, 102, 70, 27, 3, '0.00', '150.00', '72.56'),
(146, 103, 70, 27, 3, '0.00', '150.00', '51.44'),
(147, 104, 71, 27, 3, '0.00', '150.00', '37.50'),
(148, 105, 71, 27, 3, '0.00', '112.00', '42.00'),
(149, 106, 71, 27, 3, '0.00', '112.00', '37.38'),
(150, 107, 71, 27, 3, '0.00', '150.00', '32.75');

INSERT INTO `average_responses` (`idar`, `criteria`, `subcriteria`, `process`, `value`, `period`) VALUES
(64, 10, 8, 8, '66.67', 1),
(65, 10, 9, 9, '25.00', 1),
(66, 10, 10, 10, '37.50', 1),
(67, 10, 11, 11, '41.67', 1),
(68, 10, 11, 12, '58.33', 1),
(69, 10, 12, 13, '50.00', 1),
(70, 11, 13, 14, '25.00', 1),
(71, 11, 14, 15, '0.00', 1),
(72, 11, 15, 16, '25.00', 1),
(73, 11, 16, 17, '8.33', 1),
(74, 12, 17, 18, '25.00', 1),
(75, 12, 18, 19, '25.00', 1),
(76, 12, 19, 20, '8.33', 1),
(77, 12, 20, 21, '41.67', 1),
(78, 12, 21, 22, '12.50', 1),
(79, 13, 22, 23, '25.00', 1),
(80, 13, 23, 24, '0.00', 1),
(81, 13, 24, 25, '16.67', 1),
(82, 13, 25, 26, '25.00', 1),
(83, 13, 26, 27, '33.33', 1),
(84, 14, 27, 28, '12.50', 1),
(85, 14, 27, 29, '0.00', 1),
(86, 14, 28, 30, '0.00', 1),
(87, 14, 29, 31, '0.00', 1),
(88, 14, 29, 32, '25.00', 1),
(89, 14, 30, 33, '41.67', 1),
(90, 14, 31, 34, '25.00', 1),
(91, 15, 32, 35, '18.50', 1),
(92, 15, 32, 36, '37.00', 1),
(93, 15, 32, 37, '0.00', 1),
(94, 15, 32, 38, '0.00', 1),
(95, 15, 33, 39, '37.00', 1),
(96, 15, 33, 40, '0.00', 1),
(97, 15, 33, 41, '0.00', 1),
(98, 16, 34, 42, '22.00', 1),
(99, 16, 34, 43, '0.00', 1),
(100, 16, 34, 44, '0.00', 1),
(101, 16, 35, 45, '0.00', 1),
(102, 16, 35, 46, '0.00', 1),
(103, 16, 35, 47, '0.00', 1),
(104, 17, 36, 48, '8.33', 1),
(105, 17, 37, 49, '0.00', 1),
(106, 17, 37, 50, '0.00', 1),
(107, 18, 38, 51, '37.00', 1),
(108, 18, 38, 52, '56.00', 1),
(109, 18, 38, 53, '56.00', 1),
(110, 18, 39, 54, '0.00', 1),
(111, 18, 39, 55, '0.00', 1),
(112, 18, 39, 56, '0.00', 1),
(113, 18, 39, 57, '0.00', 1),
(127, 10, 8, 8, '41.67', 1),
(128, 10, 9, 9, '25.00', 1),
(129, 10, 10, 10, '25.00', 1),
(130, 10, 11, 11, '41.67', 1),
(131, 10, 11, 12, '58.33', 1),
(132, 10, 12, 13, '33.33', 1),
(133, 11, 13, 14, '0.00', 1),
(134, 11, 14, 15, '0.00', 1),
(135, 11, 15, 16, '0.00', 1),
(136, 11, 16, 17, '41.67', 1),
(137, 12, 17, 18, '37.50', 1),
(138, 12, 18, 19, '33.33', 1),
(139, 12, 19, 20, '33.33', 1),
(140, 12, 20, 21, '25.00', 1),
(141, 12, 21, 22, '18.75', 1),
(142, 13, 22, 23, '37.50', 1),
(143, 13, 23, 24, '0.00', 1),
(144, 13, 24, 25, '25.00', 1),
(145, 13, 25, 26, '37.50', 1),
(146, 13, 26, 27, '16.67', 1),
(147, 14, 27, 28, '0.00', 1),
(148, 14, 27, 29, '0.00', 1),
(149, 14, 28, 30, '0.00', 1),
(150, 14, 29, 31, '37.50', 1),
(151, 14, 29, 32, '25.00', 1),
(152, 14, 30, 33, '33.33', 1),
(153, 14, 31, 34, '41.67', 1),
(154, 15, 32, 35, '18.50', 1),
(155, 15, 32, 36, '37.00', 1),
(156, 15, 32, 37, '0.00', 1),
(157, 15, 32, 38, '0.00', 1),
(158, 15, 33, 39, '0.00', 1),
(159, 15, 33, 40, '0.00', 1),
(160, 15, 33, 41, '0.00', 1),
(161, 16, 34, 42, '22.00', 1),
(162, 16, 34, 43, '0.00', 1),
(163, 16, 34, 44, '0.00', 1),
(164, 16, 35, 45, '0.00', 1),
(165, 16, 35, 46, '0.00', 1),
(166, 16, 35, 47, '0.00', 1),
(167, 17, 36, 48, '0.00', 1),
(168, 17, 37, 49, '0.00', 1),
(169, 17, 37, 50, '0.00', 1),
(170, 18, 38, 51, '37.00', 1),
(171, 18, 38, 52, '93.50', 1),
(172, 18, 38, 53, '0.00', 1),
(173, 18, 39, 54, '0.00', 1),
(174, 18, 39, 55, '0.00', 1),
(175, 18, 39, 56, '0.00', 1),
(176, 18, 39, 57, '0.00', 1),
(190, 10, 8, 8, '66.67', 1),
(191, 10, 9, 9, '25.00', 1),
(192, 10, 10, 10, '50.00', 1),
(193, 10, 11, 11, '58.33', 1),
(194, 10, 11, 12, '58.33', 1),
(195, 10, 12, 13, '66.67', 1),
(196, 11, 13, 14, '50.00', 1),
(197, 11, 14, 15, '0.00', 1),
(198, 11, 15, 16, '41.67', 1),
(199, 11, 16, 17, '33.33', 1),
(200, 12, 17, 18, '37.50', 1),
(201, 12, 18, 19, '33.33', 1),
(202, 12, 19, 20, '25.00', 1),
(203, 12, 20, 21, '41.67', 1),
(204, 12, 21, 22, '50.00', 1),
(205, 13, 22, 23, '37.50', 1),
(206, 13, 23, 24, '0.00', 1),
(207, 13, 24, 25, '25.00', 1),
(208, 13, 25, 26, '37.50', 1),
(209, 13, 26, 27, '16.67', 1),
(210, 14, 27, 28, '12.50', 1),
(211, 14, 27, 29, '25.00', 1),
(212, 14, 28, 30, '25.00', 1),
(213, 14, 29, 31, '25.00', 1),
(214, 14, 29, 32, '25.00', 1),
(215, 14, 30, 33, '41.67', 1),
(216, 14, 31, 34, '33.33', 1),
(217, 15, 32, 35, '56.00', 1),
(218, 15, 32, 36, '37.00', 1),
(219, 15, 32, 37, '49.67', 1),
(220, 15, 32, 38, '56.00', 1),
(221, 15, 33, 39, '37.00', 1),
(222, 15, 33, 40, '49.67', 1),
(223, 15, 33, 41, '56.00', 1),
(224, 16, 34, 42, '45.00', 1),
(225, 16, 34, 43, '22.00', 1),
(226, 16, 34, 44, '0.00', 1),
(227, 16, 35, 45, '0.00', 1),
(228, 16, 35, 46, '0.00', 1),
(229, 16, 35, 47, '0.00', 1),
(230, 17, 36, 48, '0.00', 1),
(231, 17, 37, 49, '0.00', 1),
(232, 17, 37, 50, '0.00', 1),
(233, 18, 38, 51, '75.00', 1),
(234, 18, 38, 52, '93.50', 1),
(235, 18, 38, 53, '0.00', 1),
(236, 18, 39, 54, '37.00', 1),
(237, 18, 39, 55, '75.00', 1),
(238, 18, 39, 56, '75.00', 1),
(239, 18, 39, 57, '18.50', 1),
(253, 10, 8, 8, '33.33', 1),
(254, 10, 9, 9, '25.00', 1),
(255, 10, 10, 10, '37.50', 1),
(256, 10, 11, 11, '33.33', 1),
(257, 10, 11, 12, '33.33', 1),
(258, 10, 12, 13, '41.67', 1),
(259, 11, 13, 14, '50.00', 1),
(260, 11, 14, 15, '25.00', 1),
(261, 11, 15, 16, '41.67', 1),
(262, 11, 16, 17, '25.00', 1),
(263, 12, 17, 18, '37.50', 1),
(264, 12, 18, 19, '41.67', 1),
(265, 12, 19, 20, '25.00', 1),
(266, 12, 20, 21, '25.00', 1),
(267, 12, 21, 22, '31.25', 1),
(268, 13, 22, 23, '75.00', 1),
(269, 13, 23, 24, '25.00', 1),
(270, 13, 24, 25, '8.33', 1),
(271, 13, 25, 26, '25.00', 1),
(272, 13, 26, 27, '50.00', 1),
(273, 14, 27, 28, '12.50', 1),
(274, 14, 27, 29, '12.50', 1),
(275, 14, 28, 30, '37.50', 1),
(276, 14, 29, 31, '37.50', 1),
(277, 14, 29, 32, '50.00', 1),
(278, 14, 30, 33, '41.67', 1),
(279, 14, 31, 34, '33.33', 1),
(280, 15, 32, 35, '56.00', 1),
(281, 15, 32, 36, '37.00', 1),
(282, 15, 32, 37, '0.00', 1),
(283, 15, 32, 38, '0.00', 1),
(284, 15, 33, 39, '0.00', 1),
(285, 15, 33, 40, '37.00', 1),
(286, 15, 33, 41, '0.00', 1),
(287, 16, 34, 42, '0.00', 1),
(288, 16, 34, 43, '0.00', 1),
(289, 16, 34, 44, '0.00', 1),
(290, 16, 35, 45, '0.00', 1),
(291, 16, 35, 46, '0.00', 1),
(292, 16, 35, 47, '0.00', 1),
(293, 17, 36, 48, '41.67', 1),
(294, 17, 37, 49, '37.50', 1),
(295, 17, 37, 50, '50.00', 1),
(296, 18, 38, 51, '37.00', 1),
(297, 18, 38, 52, '75.00', 1),
(298, 18, 38, 53, '56.00', 1),
(299, 18, 39, 54, '0.00', 1),
(300, 18, 39, 55, '0.00', 1),
(301, 18, 39, 56, '0.00', 1),
(302, 18, 39, 57, '0.00', 1),
(316, 10, 8, 8, '50.00', 1),
(317, 10, 9, 9, '50.00', 1),
(318, 10, 10, 10, '25.00', 1),
(319, 10, 11, 11, '66.67', 1),
(320, 10, 11, 12, '83.33', 1),
(321, 10, 12, 13, '50.00', 1),
(322, 11, 13, 14, '25.00', 1),
(323, 11, 14, 15, '25.00', 1),
(324, 11, 15, 16, '58.33', 1),
(325, 11, 16, 17, '33.33', 1),
(326, 12, 17, 18, '37.50', 1),
(327, 12, 18, 19, '41.67', 1),
(328, 12, 19, 20, '33.33', 1),
(329, 12, 20, 21, '58.33', 1),
(330, 12, 21, 22, '62.50', 1),
(331, 13, 22, 23, '75.00', 1),
(332, 13, 23, 24, '50.00', 1),
(333, 13, 24, 25, '50.00', 1),
(334, 13, 25, 26, '50.00', 1),
(335, 13, 26, 27, '50.00', 1),
(336, 14, 27, 28, '12.50', 1),
(337, 14, 27, 29, '12.50', 1),
(338, 14, 28, 30, '25.00', 1),
(339, 14, 29, 31, '50.00', 1),
(340, 14, 29, 32, '75.00', 1),
(341, 14, 30, 33, '41.67', 1),
(342, 14, 31, 34, '75.00', 1),
(343, 15, 32, 35, '93.50', 1),
(344, 15, 32, 36, '37.00', 1),
(345, 15, 32, 37, '62.00', 1),
(346, 15, 32, 38, '93.50', 1),
(347, 15, 33, 39, '37.00', 1),
(348, 15, 33, 40, '62.33', 1),
(349, 15, 33, 41, '56.00', 1),
(350, 16, 34, 42, '45.00', 1),
(351, 16, 34, 43, '44.67', 1),
(352, 16, 34, 44, '0.00', 1),
(353, 16, 35, 45, '0.00', 1),
(354, 16, 35, 46, '52.33', 1),
(355, 16, 35, 47, '0.00', 1),
(356, 17, 36, 48, '58.33', 1),
(357, 17, 37, 49, '56.25', 1),
(358, 17, 37, 50, '62.50', 1),
(359, 18, 38, 51, '112.00', 1),
(360, 18, 38, 52, '112.00', 1),
(361, 18, 38, 53, '0.00', 1),
(362, 18, 39, 54, '0.00', 1),
(363, 18, 39, 55, '0.00', 1),
(364, 18, 39, 56, '0.00', 1),
(365, 18, 39, 57, '0.00', 1),
(379, 10, 8, 8, '33.33', 1),
(380, 10, 9, 9, '50.00', 1),
(381, 10, 10, 10, '62.50', 1),
(382, 10, 11, 11, '66.67', 1),
(383, 10, 11, 12, '75.00', 1),
(384, 10, 12, 13, '75.00', 1),
(385, 11, 13, 14, '25.00', 1),
(386, 11, 14, 15, '25.00', 1),
(387, 11, 15, 16, '8.33', 1),
(388, 11, 16, 17, '16.67', 1),
(389, 12, 17, 18, '25.00', 1),
(390, 12, 18, 19, '41.67', 1),
(391, 12, 19, 20, '58.33', 1),
(392, 12, 20, 21, '50.00', 1),
(393, 12, 21, 22, '31.25', 1),
(394, 13, 22, 23, '75.00', 1),
(395, 13, 23, 24, '0.00', 1),
(396, 13, 24, 25, '16.67', 1),
(397, 13, 25, 26, '62.50', 1),
(398, 13, 26, 27, '50.00', 1),
(399, 14, 27, 28, '0.00', 1),
(400, 14, 27, 29, '0.00', 1),
(401, 14, 28, 30, '0.00', 1),
(402, 14, 29, 31, '25.00', 1),
(403, 14, 29, 32, '25.00', 1),
(404, 14, 30, 33, '41.67', 1),
(405, 14, 31, 34, '16.67', 1),
(406, 15, 32, 35, '74.50', 1),
(407, 15, 32, 36, '75.00', 1),
(408, 15, 32, 37, '49.67', 1),
(409, 15, 32, 38, '75.00', 1),
(410, 15, 33, 39, '37.00', 1),
(411, 15, 33, 40, '62.33', 1),
(412, 15, 33, 41, '75.00', 1),
(413, 16, 34, 42, '22.00', 1),
(414, 16, 34, 43, '0.00', 1),
(415, 16, 34, 44, '33.50', 1),
(416, 16, 35, 45, '22.00', 1),
(417, 16, 35, 46, '44.67', 1),
(418, 16, 35, 47, '33.50', 1),
(419, 17, 36, 48, '33.33', 1),
(420, 17, 37, 49, '0.00', 1),
(421, 17, 37, 50, '0.00', 1),
(422, 18, 38, 51, '75.00', 1),
(423, 18, 38, 52, '56.00', 1),
(424, 18, 38, 53, '37.00', 1),
(425, 18, 39, 54, '0.00', 1),
(426, 18, 39, 55, '0.00', 1),
(427, 18, 39, 56, '0.00', 1),
(428, 18, 39, 57, '0.00', 1),
(442, 10, 8, 8, '41.67', 1),
(443, 10, 9, 9, '25.00', 1),
(444, 10, 10, 10, '75.00', 1),
(445, 10, 11, 11, '50.00', 1),
(446, 10, 11, 12, '58.33', 1),
(447, 10, 12, 13, '58.33', 1),
(448, 11, 13, 14, '25.00', 1),
(449, 11, 14, 15, '25.00', 1),
(450, 11, 15, 16, '58.33', 1),
(451, 11, 16, 17, '25.00', 1),
(452, 12, 17, 18, '25.00', 1),
(453, 12, 18, 19, '41.67', 1),
(454, 12, 19, 20, '50.00', 1),
(455, 12, 20, 21, '33.33', 1),
(456, 12, 21, 22, '37.50', 1),
(457, 13, 22, 23, '50.00', 1),
(458, 13, 23, 24, '33.33', 1),
(459, 13, 24, 25, '25.00', 1),
(460, 13, 25, 26, '50.00', 1),
(461, 13, 26, 27, '50.00', 1),
(462, 14, 27, 28, '25.00', 1),
(463, 14, 27, 29, '12.50', 1),
(464, 14, 28, 30, '25.00', 1),
(465, 14, 29, 31, '25.00', 1),
(466, 14, 29, 32, '25.00', 1),
(467, 14, 30, 33, '33.33', 1),
(468, 14, 31, 34, '50.00', 1),
(469, 15, 32, 35, '56.00', 1),
(470, 15, 32, 36, '37.00', 1),
(471, 15, 32, 37, '0.00', 1),
(472, 15, 32, 38, '0.00', 1),
(473, 15, 33, 39, '0.00', 1),
(474, 15, 33, 40, '87.33', 1),
(475, 15, 33, 41, '56.00', 1),
(476, 16, 34, 42, '22.00', 1),
(477, 16, 34, 43, '29.67', 1),
(478, 16, 34, 44, '0.00', 1),
(479, 16, 35, 45, '0.00', 1),
(480, 16, 35, 46, '0.00', 1),
(481, 16, 35, 47, '0.00', 1),
(482, 17, 36, 48, '41.67', 1),
(483, 17, 37, 49, '0.00', 1),
(484, 17, 37, 50, '0.00', 1),
(485, 18, 38, 51, '0.00', 1),
(486, 18, 38, 52, '56.00', 1),
(487, 18, 38, 53, '56.00', 1),
(488, 18, 39, 54, '0.00', 1),
(489, 18, 39, 55, '0.00', 1),
(490, 18, 39, 56, '0.00', 1),
(491, 18, 39, 57, '0.00', 1),
(505, 10, 8, 8, '41.67', 1),
(506, 10, 9, 9, '0.00', 1),
(507, 10, 10, 10, '37.50', 1),
(508, 10, 11, 11, '33.33', 1),
(509, 10, 11, 12, '50.00', 1),
(510, 10, 12, 13, '33.33', 1),
(511, 11, 13, 14, '25.00', 1),
(512, 11, 14, 15, '0.00', 1),
(513, 11, 15, 16, '16.67', 1),
(514, 11, 16, 17, '8.33', 1),
(515, 12, 17, 18, '12.50', 1),
(516, 12, 18, 19, '33.33', 1),
(517, 12, 19, 20, '41.67', 1),
(518, 12, 20, 21, '25.00', 1),
(519, 12, 21, 22, '18.75', 1),
(520, 13, 22, 23, '50.00', 1),
(521, 13, 23, 24, '0.00', 1),
(522, 13, 24, 25, '8.33', 1),
(523, 13, 25, 26, '50.00', 1),
(524, 13, 26, 27, '41.67', 1),
(525, 14, 27, 28, '0.00', 1),
(526, 14, 27, 29, '0.00', 1),
(527, 14, 28, 30, '0.00', 1),
(528, 14, 29, 31, '25.00', 1),
(529, 14, 29, 32, '25.00', 1),
(530, 14, 30, 33, '33.33', 1),
(531, 14, 31, 34, '25.00', 1),
(532, 15, 32, 35, '37.50', 1),
(533, 15, 32, 36, '37.00', 1),
(534, 15, 32, 37, '0.00', 1),
(535, 15, 32, 38, '0.00', 1),
(536, 15, 33, 39, '0.00', 1),
(537, 15, 33, 40, '0.00', 1),
(538, 15, 33, 41, '0.00', 1),
(539, 16, 34, 42, '0.00', 1),
(540, 16, 34, 43, '0.00', 1),
(541, 16, 34, 44, '0.00', 1),
(542, 16, 35, 45, '0.00', 1),
(543, 16, 35, 46, '0.00', 1),
(544, 16, 35, 47, '0.00', 1),
(545, 17, 36, 48, '16.67', 1),
(546, 17, 37, 49, '0.00', 1),
(547, 17, 37, 50, '0.00', 1),
(548, 18, 38, 51, '37.00', 1),
(549, 18, 38, 52, '75.00', 1),
(550, 18, 38, 53, '0.00', 1),
(551, 18, 39, 54, '0.00', 1),
(552, 18, 39, 55, '0.00', 1),
(553, 18, 39, 56, '0.00', 1),
(554, 18, 39, 57, '0.00', 1),
(555, 19, 40, 58, '66.67', 3),
(556, 19, 41, 59, '50.00', 3),
(557, 19, 42, 60, '50.00', 3),
(558, 19, 43, 61, '58.33', 3),
(559, 19, 43, 62, '41.67', 3),
(560, 19, 44, 63, '50.00', 3),
(561, 20, 45, 64, '25.00', 3),
(562, 20, 46, 65, '25.00', 3),
(563, 20, 47, 66, '66.67', 3),
(564, 20, 48, 67, '58.33', 3),
(565, 21, 49, 68, '50.00', 3),
(566, 21, 50, 69, '41.67', 3),
(567, 21, 51, 70, '33.33', 3),
(568, 21, 52, 71, '41.67', 3),
(569, 21, 53, 72, '62.50', 3),
(570, 22, 54, 73, '75.00', 3),
(571, 22, 55, 74, '66.67', 3),
(572, 22, 56, 75, '41.67', 3),
(573, 22, 57, 76, '75.00', 3),
(574, 22, 58, 77, '75.00', 3),
(575, 23, 59, 78, '50.00', 3),
(576, 23, 59, 79, '25.00', 3),
(577, 23, 60, 80, '37.50', 3),
(578, 23, 61, 81, '37.50', 3),
(579, 23, 61, 82, '50.00', 3),
(580, 23, 62, 83, '91.67', 3),
(581, 23, 63, 84, '58.33', 3),
(582, 24, 64, 85, '93.50', 3),
(583, 24, 64, 86, '75.00', 3),
(584, 24, 64, 87, '24.67', 3),
(585, 24, 64, 88, '74.50', 3),
(586, 24, 65, 89, '112.00', 3),
(587, 24, 65, 90, '87.33', 3),
(588, 24, 65, 91, '56.00', 3),
(589, 25, 66, 92, '45.00', 3),
(590, 25, 66, 93, '15.00', 3),
(591, 25, 66, 94, '0.00', 3),
(592, 25, 67, 95, '45.00', 3),
(593, 25, 67, 96, '0.00', 3),
(594, 25, 67, 97, '0.00', 3),
(595, 26, 68, 98, '41.67', 3),
(596, 26, 69, 99, '12.50', 3),
(597, 26, 69, 100, '62.50', 3),
(598, 27, 70, 101, '112.00', 3),
(599, 27, 70, 102, '93.50', 3),
(600, 27, 70, 103, '93.50', 3),
(601, 27, 71, 104, '75.00', 3),
(602, 27, 71, 105, '112.00', 3),
(603, 27, 71, 106, '112.00', 3),
(604, 27, 71, 107, '0.00', 3),
(618, 19, 40, 58, '100.00', 3),
(619, 19, 41, 59, '100.00', 3),
(620, 19, 42, 60, '100.00', 3),
(621, 19, 43, 61, '100.00', 3),
(622, 19, 43, 62, '100.00', 3),
(623, 19, 44, 63, '100.00', 3),
(624, 20, 45, 64, '100.00', 3),
(625, 20, 46, 65, '75.00', 3),
(626, 20, 47, 66, '100.00', 3),
(627, 20, 48, 67, '75.00', 3),
(628, 21, 49, 68, '0.00', 3),
(629, 21, 50, 69, '0.00', 3),
(630, 21, 51, 70, '0.00', 3),
(631, 21, 52, 71, '0.00', 3),
(632, 21, 53, 72, '0.00', 3),
(633, 22, 54, 73, '0.00', 3),
(634, 22, 55, 74, '0.00', 3),
(635, 22, 56, 75, '0.00', 3),
(636, 22, 57, 76, '0.00', 3),
(637, 22, 58, 77, '0.00', 3),
(638, 23, 59, 78, '0.00', 3),
(639, 23, 59, 79, '0.00', 3),
(640, 23, 60, 80, '0.00', 3),
(641, 23, 61, 81, '0.00', 3),
(642, 23, 61, 82, '0.00', 3),
(643, 23, 62, 83, '0.00', 3),
(644, 23, 63, 84, '0.00', 3),
(645, 24, 64, 85, '18.50', 3),
(646, 24, 64, 86, '0.00', 3),
(647, 24, 64, 87, '0.00', 3),
(648, 24, 64, 88, '0.00', 3),
(649, 24, 65, 89, '0.00', 3),
(650, 24, 65, 90, '0.00', 3),
(651, 24, 65, 91, '0.00', 3),
(652, 25, 66, 92, '0.00', 3),
(653, 25, 66, 93, '0.00', 3),
(654, 25, 66, 94, '0.00', 3),
(655, 25, 67, 95, '0.00', 3),
(656, 25, 67, 96, '0.00', 3),
(657, 25, 67, 97, '0.00', 3),
(658, 26, 68, 98, '0.00', 3),
(659, 26, 69, 99, '0.00', 3),
(660, 26, 69, 100, '0.00', 3),
(661, 27, 70, 101, '0.00', 3),
(662, 27, 70, 102, '56.00', 3),
(663, 27, 70, 103, '0.00', 3),
(664, 27, 71, 104, '0.00', 3),
(665, 27, 71, 105, '0.00', 3),
(666, 27, 71, 106, '0.00', 3),
(667, 27, 71, 107, '0.00', 3),
(681, 19, 40, 58, '66.67', 3),
(682, 19, 41, 59, '50.00', 3),
(683, 19, 42, 60, '87.50', 3),
(684, 19, 43, 61, '100.00', 3),
(685, 19, 43, 62, '58.33', 3),
(686, 19, 44, 63, '50.00', 3),
(687, 20, 45, 64, '75.00', 3),
(688, 20, 46, 65, '75.00', 3),
(689, 20, 47, 66, '66.67', 3),
(690, 20, 48, 67, '58.33', 3),
(691, 21, 49, 68, '100.00', 3),
(692, 21, 50, 69, '83.33', 3),
(693, 21, 51, 70, '91.67', 3),
(694, 21, 52, 71, '91.67', 3),
(695, 21, 53, 72, '43.75', 3),
(696, 22, 54, 73, '100.00', 3),
(697, 22, 55, 74, '100.00', 3),
(698, 22, 56, 75, '25.00', 3),
(699, 22, 57, 76, '62.50', 3),
(700, 22, 58, 77, '83.33', 3),
(701, 23, 59, 78, '100.00', 3),
(702, 23, 59, 79, '25.00', 3),
(703, 23, 60, 80, '75.00', 3),
(704, 23, 61, 81, '50.00', 3),
(705, 23, 61, 82, '75.00', 3),
(706, 23, 62, 83, '91.67', 3),
(707, 23, 63, 84, '91.67', 3),
(708, 24, 64, 85, '112.00', 3),
(709, 24, 64, 86, '75.00', 3),
(710, 24, 64, 87, '0.00', 3),
(711, 24, 64, 88, '0.00', 3),
(712, 24, 65, 89, '0.00', 3),
(713, 24, 65, 90, '0.00', 3),
(714, 24, 65, 91, '0.00', 3),
(715, 25, 66, 92, '67.00', 3),
(716, 25, 66, 93, '0.00', 3),
(717, 25, 66, 94, '0.00', 3),
(718, 25, 67, 95, '0.00', 3),
(719, 25, 67, 96, '0.00', 3),
(720, 25, 67, 97, '0.00', 3),
(721, 26, 68, 98, '0.00', 3),
(722, 26, 69, 99, '0.00', 3),
(723, 26, 69, 100, '0.00', 3),
(724, 27, 70, 101, '112.00', 3),
(725, 27, 70, 102, '112.50', 3),
(726, 27, 70, 103, '37.00', 3),
(727, 27, 71, 104, '0.00', 3),
(728, 27, 71, 105, '0.00', 3),
(729, 27, 71, 106, '0.00', 3),
(730, 27, 71, 107, '0.00', 3),
(744, 19, 40, 58, '50.00', 3),
(745, 19, 41, 59, '75.00', 3),
(746, 19, 42, 60, '62.50', 3),
(747, 19, 43, 61, '58.33', 3),
(748, 19, 43, 62, '66.67', 3),
(749, 19, 44, 63, '41.67', 3),
(750, 20, 45, 64, '75.00', 3),
(751, 20, 46, 65, '100.00', 3),
(752, 20, 47, 66, '91.67', 3),
(753, 20, 48, 67, '75.00', 3),
(754, 21, 49, 68, '87.50', 3),
(755, 21, 50, 69, '50.00', 3),
(756, 21, 51, 70, '33.33', 3),
(757, 21, 52, 71, '83.33', 3),
(758, 21, 53, 72, '56.25', 3),
(759, 22, 54, 73, '100.00', 3),
(760, 22, 55, 74, '83.33', 3),
(761, 22, 56, 75, '91.67', 3),
(762, 22, 57, 76, '87.50', 3),
(763, 22, 58, 77, '83.33', 3),
(764, 23, 59, 78, '62.50', 3),
(765, 23, 59, 79, '75.00', 3),
(766, 23, 60, 80, '75.00', 3),
(767, 23, 61, 81, '62.50', 3),
(768, 23, 61, 82, '75.00', 3),
(769, 23, 62, 83, '75.00', 3),
(770, 23, 63, 84, '58.33', 3),
(771, 24, 64, 85, '56.00', 3),
(772, 24, 64, 86, '37.00', 3),
(773, 24, 64, 87, '12.33', 3),
(774, 24, 64, 88, '0.00', 3),
(775, 24, 65, 89, '0.00', 3),
(776, 24, 65, 90, '0.00', 3),
(777, 24, 65, 91, '0.00', 3),
(778, 25, 66, 92, '67.00', 3),
(779, 25, 66, 93, '67.33', 3),
(780, 25, 66, 94, '67.00', 3),
(781, 25, 67, 95, '45.00', 3),
(782, 25, 67, 96, '52.33', 3),
(783, 25, 67, 97, '67.00', 3),
(784, 26, 68, 98, '91.67', 3),
(785, 26, 69, 99, '75.00', 3),
(786, 26, 69, 100, '87.50', 3),
(787, 27, 70, 101, '150.00', 3),
(788, 27, 70, 102, '150.00', 3),
(789, 27, 70, 103, '150.00', 3),
(790, 27, 71, 104, '150.00', 3),
(791, 27, 71, 105, '112.00', 3),
(792, 27, 71, 106, '112.00', 3),
(793, 27, 71, 107, '150.00', 3),
(807, 19, 40, 58, '75.00', 3),
(808, 19, 41, 59, '75.00', 3),
(809, 19, 42, 60, '75.00', 3),
(810, 19, 43, 61, '58.33', 3),
(811, 19, 43, 62, '66.67', 3),
(812, 19, 44, 63, '50.00', 3),
(813, 20, 45, 64, '50.00', 3),
(814, 20, 46, 65, '50.00', 3),
(815, 20, 47, 66, '66.67', 3),
(816, 20, 48, 67, '66.67', 3),
(817, 21, 49, 68, '50.00', 3),
(818, 21, 50, 69, '66.67', 3),
(819, 21, 51, 70, '58.33', 3),
(820, 21, 52, 71, '66.67', 3),
(821, 21, 53, 72, '68.75', 3),
(822, 22, 54, 73, '62.50', 3),
(823, 22, 55, 74, '75.00', 3),
(824, 22, 56, 75, '66.67', 3),
(825, 22, 57, 76, '62.50', 3),
(826, 22, 58, 77, '66.67', 3),
(827, 23, 59, 78, '50.00', 3),
(828, 23, 59, 79, '50.00', 3),
(829, 23, 60, 80, '62.50', 3),
(830, 23, 61, 81, '62.50', 3),
(831, 23, 61, 82, '50.00', 3),
(832, 23, 62, 83, '58.33', 3),
(833, 23, 63, 84, '58.33', 3),
(834, 24, 64, 85, '93.50', 3),
(835, 24, 64, 86, '112.00', 3),
(836, 24, 64, 87, '99.67', 3),
(837, 24, 64, 88, '93.50', 3),
(838, 24, 65, 89, '75.00', 3),
(839, 24, 65, 90, '112.00', 3),
(840, 24, 65, 91, '93.50', 3),
(841, 25, 66, 92, '45.00', 3),
(842, 25, 66, 93, '59.67', 3),
(843, 25, 66, 94, '56.00', 3),
(844, 25, 67, 95, '45.00', 3),
(845, 25, 67, 96, '59.67', 3),
(846, 25, 67, 97, '78.50', 3),
(847, 26, 68, 98, '66.67', 3),
(848, 26, 69, 99, '68.75', 3),
(849, 26, 69, 100, '50.00', 3),
(850, 27, 70, 101, '112.00', 3),
(851, 27, 70, 102, '112.50', 3),
(852, 27, 70, 103, '75.00', 3),
(853, 27, 71, 104, '75.00', 3),
(854, 27, 71, 105, '112.00', 3),
(855, 27, 71, 106, '75.00', 3),
(856, 27, 71, 107, '112.00', 3),
(870, 19, 40, 58, '75.00', 3),
(871, 19, 41, 59, '50.00', 3),
(872, 19, 42, 60, '62.50', 3),
(873, 19, 43, 61, '50.00', 3),
(874, 19, 43, 62, '58.33', 3),
(875, 19, 44, 63, '58.33', 3),
(876, 20, 45, 64, '50.00', 3),
(877, 20, 46, 65, '25.00', 3),
(878, 20, 47, 66, '75.00', 3),
(879, 20, 48, 67, '0.00', 3),
(880, 21, 49, 68, '25.00', 3),
(881, 21, 50, 69, '50.00', 3),
(882, 21, 51, 70, '50.00', 3),
(883, 21, 52, 71, '33.33', 3),
(884, 21, 53, 72, '37.50', 3),
(885, 22, 54, 73, '50.00', 3),
(886, 22, 55, 74, '33.33', 3),
(887, 22, 56, 75, '25.00', 3),
(888, 22, 57, 76, '50.00', 3),
(889, 22, 58, 77, '50.00', 3),
(890, 23, 59, 78, '25.00', 3),
(891, 23, 59, 79, '12.50', 3),
(892, 23, 60, 80, '25.00', 3),
(893, 23, 61, 81, '25.00', 3),
(894, 23, 61, 82, '25.00', 3),
(895, 23, 62, 83, '33.33', 3),
(896, 23, 63, 84, '50.00', 3),
(897, 24, 64, 85, '56.00', 3),
(898, 24, 64, 86, '37.00', 3),
(899, 24, 64, 87, '0.00', 3),
(900, 24, 64, 88, '0.00', 3),
(901, 24, 65, 89, '0.00', 3),
(902, 24, 65, 90, '87.33', 3),
(903, 24, 65, 91, '56.00', 3),
(904, 25, 66, 92, '22.00', 3),
(905, 25, 66, 93, '29.67', 3),
(906, 25, 66, 94, '0.00', 3),
(907, 25, 67, 95, '0.00', 3),
(908, 25, 67, 96, '0.00', 3),
(909, 25, 67, 97, '0.00', 3),
(910, 26, 68, 98, '41.67', 3),
(911, 26, 69, 99, '0.00', 3),
(912, 26, 69, 100, '0.00', 3),
(913, 27, 70, 101, '0.00', 3),
(914, 27, 70, 102, '56.00', 3),
(915, 27, 70, 103, '56.00', 3),
(916, 27, 71, 104, '0.00', 3),
(917, 27, 71, 105, '0.00', 3),
(918, 27, 71, 106, '0.00', 3),
(919, 27, 71, 107, '0.00', 3),
(933, 19, 40, 58, '0.00', 3),
(934, 19, 41, 59, '0.00', 3),
(935, 19, 42, 60, '0.00', 3),
(936, 19, 43, 61, '0.00', 3),
(937, 19, 43, 62, '0.00', 3),
(938, 19, 44, 63, '0.00', 3),
(939, 20, 45, 64, '0.00', 3),
(940, 20, 46, 65, '0.00', 3),
(941, 20, 47, 66, '0.00', 3),
(942, 20, 48, 67, '0.00', 3),
(943, 21, 49, 68, '0.00', 3),
(944, 21, 50, 69, '0.00', 3),
(945, 21, 51, 70, '8.33', 3),
(946, 21, 52, 71, '0.00', 3),
(947, 21, 53, 72, '0.00', 3),
(948, 22, 54, 73, '0.00', 3),
(949, 22, 55, 74, '0.00', 3),
(950, 22, 56, 75, '0.00', 3),
(951, 22, 57, 76, '0.00', 3),
(952, 22, 58, 77, '0.00', 3),
(953, 23, 59, 78, '0.00', 3),
(954, 23, 59, 79, '0.00', 3),
(955, 23, 60, 80, '0.00', 3),
(956, 23, 61, 81, '0.00', 3),
(957, 23, 61, 82, '0.00', 3),
(958, 23, 62, 83, '0.00', 3),
(959, 23, 63, 84, '0.00', 3),
(960, 24, 64, 85, '0.00', 3),
(961, 24, 64, 86, '0.00', 3),
(962, 24, 64, 87, '0.00', 3),
(963, 24, 64, 88, '0.00', 3),
(964, 24, 65, 89, '0.00', 3),
(965, 24, 65, 90, '0.00', 3),
(966, 24, 65, 91, '0.00', 3),
(967, 25, 66, 92, '0.00', 3),
(968, 25, 66, 93, '0.00', 3),
(969, 25, 66, 94, '0.00', 3),
(970, 25, 67, 95, '0.00', 3),
(971, 25, 67, 96, '0.00', 3),
(972, 25, 67, 97, '0.00', 3),
(973, 26, 68, 98, '0.00', 3),
(974, 26, 69, 99, '0.00', 3),
(975, 26, 69, 100, '0.00', 3),
(976, 27, 70, 101, '0.00', 3),
(977, 27, 70, 102, '0.00', 3),
(978, 27, 70, 103, '0.00', 3),
(979, 27, 71, 104, '0.00', 3),
(980, 27, 71, 105, '0.00', 3),
(981, 27, 71, 106, '0.00', 3),
(982, 27, 71, 107, '0.00', 3),
(996, 19, 40, 58, '0.00', 3),
(997, 19, 41, 59, '0.00', 3),
(998, 19, 42, 60, '0.00', 3),
(999, 19, 43, 61, '0.00', 3),
(1000, 19, 43, 62, '0.00', 3),
(1001, 19, 44, 63, '0.00', 3),
(1002, 20, 45, 64, '0.00', 3),
(1003, 20, 46, 65, '0.00', 3),
(1004, 20, 47, 66, '0.00', 3),
(1005, 20, 48, 67, '0.00', 3),
(1006, 21, 49, 68, '0.00', 3),
(1007, 21, 50, 69, '0.00', 3),
(1008, 21, 51, 70, '0.00', 3),
(1009, 21, 52, 71, '0.00', 3),
(1010, 21, 53, 72, '0.00', 3),
(1011, 22, 54, 73, '0.00', 3),
(1012, 22, 55, 74, '0.00', 3),
(1013, 22, 56, 75, '0.00', 3),
(1014, 22, 57, 76, '0.00', 3),
(1015, 22, 58, 77, '0.00', 3),
(1016, 23, 59, 78, '0.00', 3),
(1017, 23, 59, 79, '0.00', 3),
(1018, 23, 60, 80, '0.00', 3),
(1019, 23, 61, 81, '0.00', 3),
(1020, 23, 61, 82, '0.00', 3),
(1021, 23, 62, 83, '0.00', 3),
(1022, 23, 63, 84, '0.00', 3),
(1023, 24, 64, 85, '0.00', 3),
(1024, 24, 64, 86, '0.00', 3),
(1025, 24, 64, 87, '0.00', 3),
(1026, 24, 64, 88, '0.00', 3),
(1027, 24, 65, 89, '0.00', 3),
(1028, 24, 65, 90, '0.00', 3),
(1029, 24, 65, 91, '0.00', 3),
(1030, 25, 66, 92, '0.00', 3),
(1031, 25, 66, 93, '0.00', 3),
(1032, 25, 66, 94, '0.00', 3),
(1033, 25, 67, 95, '0.00', 3),
(1034, 25, 67, 96, '0.00', 3),
(1035, 25, 67, 97, '0.00', 3),
(1036, 26, 68, 98, '0.00', 3),
(1037, 26, 69, 99, '0.00', 3),
(1038, 26, 69, 100, '0.00', 3),
(1039, 27, 70, 101, '0.00', 3),
(1040, 27, 70, 102, '0.00', 3),
(1041, 27, 70, 103, '0.00', 3),
(1042, 27, 71, 104, '0.00', 3),
(1043, 27, 71, 105, '0.00', 3),
(1044, 27, 71, 106, '0.00', 3),
(1045, 27, 71, 107, '0.00', 3);

INSERT INTO `average_subcriteria` (`idas`, `pc_subcriteria`, `period_criteria`, `period`, `partial`, `total`) VALUES
(1, 8, 10, 1, NULL, '46.88'),
(2, 9, 10, 1, NULL, '14.07'),
(3, 10, 10, 1, NULL, '43.75'),
(4, 11, 10, 1, NULL, '54.17'),
(5, 12, 10, 1, NULL, '38.28'),
(6, 13, 11, 1, NULL, '21.10'),
(7, 14, 11, 1, NULL, '12.50'),
(8, 15, 11, 1, NULL, '31.25'),
(9, 16, 11, 1, NULL, '23.96'),
(10, 17, 12, 1, NULL, '29.69'),
(11, 18, 12, 1, NULL, '18.23'),
(12, 19, 12, 1, NULL, '8.59'),
(13, 20, 12, 1, NULL, '18.75'),
(14, 21, 12, 1, NULL, '8.20'),
(15, 22, 13, 1, NULL, '53.13'),
(16, 23, 13, 1, NULL, '13.54'),
(17, 24, 13, 1, NULL, '21.88'),
(18, 25, 13, 1, NULL, '42.19'),
(19, 26, 13, 1, NULL, '19.27'),
(20, 27, 14, 1, NULL, '8.60'),
(21, 28, 14, 1, NULL, '14.06'),
(22, 29, 14, 1, NULL, '31.26'),
(23, 30, 14, 1, NULL, '28.91'),
(24, 31, 14, 1, NULL, '28.13'),
(32, 32, 15, 1, '35.32', '13.25'),
(33, 33, 15, 1, '28.74', '5.39'),
(34, 34, 16, 1, '12.83', '9.62'),
(35, 35, 16, 1, '6.36', '1.59'),
(36, 36, 17, 1, '25.00', '6.25'),
(37, 37, 17, 1, '12.89', '3.22'),
(38, 38, 18, 1, '51.34', '12.84'),
(39, 39, 18, 1, '6.43', '3.22'),
(40, 40, 19, 3, NULL, '54.17'),
(41, 41, 19, 3, NULL, '25.00'),
(42, 42, 19, 3, NULL, '54.69'),
(43, 43, 19, 3, NULL, '51.04'),
(44, 44, 19, 3, NULL, '32.81'),
(45, 45, 20, 3, NULL, '35.16'),
(46, 46, 20, 3, NULL, '43.75'),
(47, 47, 20, 3, NULL, '58.34'),
(48, 48, 20, 3, NULL, '41.67'),
(49, 49, 21, 3, NULL, '39.06'),
(50, 50, 21, 3, NULL, '18.23'),
(51, 51, 21, 3, NULL, '8.59'),
(52, 52, 21, 3, NULL, '19.79'),
(53, 53, 21, 3, NULL, '8.40'),
(54, 54, 22, 3, NULL, '48.44'),
(55, 55, 22, 3, NULL, '44.79'),
(56, 56, 22, 3, NULL, '31.25'),
(57, 57, 22, 3, NULL, '42.19'),
(58, 58, 22, 3, NULL, '22.40'),
(59, 59, 23, 3, NULL, '29.69'),
(60, 60, 23, 3, NULL, '34.38'),
(61, 61, 23, 3, NULL, '32.04'),
(62, 62, 23, 3, NULL, '32.81'),
(63, 63, 23, 3, NULL, '29.69'),
(71, 64, 24, 3, '33.44', '12.54'),
(72, 65, 24, 3, '28.30', '5.31'),
(73, 66, 25, 3, '22.53', '16.90'),
(74, 67, 25, 3, '16.36', '4.09'),
(75, 68, 26, 3, '30.21', '7.55'),
(76, 69, 26, 3, '22.27', '5.57'),
(77, 70, 27, 3, '61.58', '15.40'),
(78, 71, 27, 3, '37.41', '18.71'),
(79, 40, 19, 3, NULL, '54.17'),
(80, 41, 19, 3, NULL, '25.00'),
(81, 42, 19, 3, NULL, '54.69'),
(82, 43, 19, 3, NULL, '51.04'),
(83, 44, 19, 3, NULL, '32.81'),
(84, 45, 20, 3, NULL, '35.16'),
(85, 46, 20, 3, NULL, '43.75'),
(86, 47, 20, 3, NULL, '58.34'),
(87, 48, 20, 3, NULL, '41.67'),
(88, 49, 21, 3, NULL, '39.06'),
(89, 50, 21, 3, NULL, '18.23'),
(90, 51, 21, 3, NULL, '8.59'),
(91, 52, 21, 3, NULL, '19.79'),
(92, 53, 21, 3, NULL, '8.40'),
(93, 54, 22, 3, NULL, '48.44'),
(94, 55, 22, 3, NULL, '44.79'),
(95, 56, 22, 3, NULL, '31.25'),
(96, 57, 22, 3, NULL, '42.19'),
(97, 58, 22, 3, NULL, '22.40'),
(98, 59, 23, 3, NULL, '29.69'),
(99, 60, 23, 3, NULL, '34.38'),
(100, 61, 23, 3, NULL, '32.04'),
(101, 62, 23, 3, NULL, '32.81'),
(102, 63, 23, 3, NULL, '29.69'),
(110, 64, 24, 3, '33.44', '12.54'),
(111, 65, 24, 3, '28.30', '5.31'),
(112, 66, 25, 3, '22.53', '16.90'),
(113, 67, 25, 3, '16.36', '4.09'),
(114, 68, 26, 3, '30.21', '7.55'),
(115, 69, 26, 3, '22.27', '5.57'),
(116, 70, 27, 3, '61.58', '15.40'),
(117, 71, 27, 3, '37.41', '18.71');

INSERT INTO `responses_people` (`idresppeo`, `hash`, `pcsp_questions`, `pcs_process`, `pc_subcriteria`, `period_criteria`, `period`, `type_answer`) VALUES
(112, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 10, 8, 8, 10, 1, 4),
(113, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 11, 8, 8, 10, 1, 4),
(114, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 12, 8, 8, 10, 1, 3),
(115, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 13, 9, 9, 10, 1, 2),
(116, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 14, 10, 10, 10, 1, 3),
(117, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 15, 10, 10, 10, 1, 2),
(118, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 16, 11, 11, 10, 1, 3),
(119, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 17, 11, 11, 10, 1, 2),
(120, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 18, 11, 11, 10, 1, 3),
(121, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 19, 12, 11, 10, 1, 4),
(122, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 20, 12, 11, 10, 1, 4),
(123, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 21, 12, 11, 10, 1, 2),
(124, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 22, 13, 12, 10, 1, 4),
(125, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 23, 13, 12, 10, 1, 3),
(126, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 24, 13, 12, 10, 1, 2),
(127, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 25, 14, 13, 11, 1, 2),
(128, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 26, 15, 14, 11, 1, 1),
(129, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 27, 16, 15, 11, 1, 2),
(130, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 28, 16, 15, 11, 1, 2),
(131, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 29, 16, 15, 11, 1, 2),
(132, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 30, 17, 16, 11, 1, 2),
(133, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 31, 17, 16, 11, 1, 1),
(134, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 32, 17, 16, 11, 1, 1),
(135, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 33, 18, 17, 12, 1, 3),
(136, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 34, 18, 17, 12, 1, 1),
(137, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 35, 19, 18, 12, 1, 2),
(138, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 36, 19, 18, 12, 1, 2),
(139, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 37, 19, 18, 12, 1, 2),
(140, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 38, 20, 19, 12, 1, 2),
(141, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 39, 20, 19, 12, 1, 1),
(142, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 40, 20, 19, 12, 1, 1),
(143, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 41, 21, 20, 12, 1, 3),
(144, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 42, 21, 20, 12, 1, 3),
(145, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 43, 21, 20, 12, 1, 2),
(146, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 44, 22, 21, 12, 1, 1),
(147, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 45, 22, 21, 12, 1, 1),
(148, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 46, 22, 21, 12, 1, 2),
(149, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 47, 22, 21, 12, 1, 2),
(150, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 48, 23, 22, 13, 1, 2),
(151, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 49, 23, 22, 13, 1, 2),
(152, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 50, 24, 23, 13, 1, 1),
(153, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 51, 24, 23, 13, 1, 1),
(154, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 52, 24, 23, 13, 1, 1),
(155, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 53, 25, 24, 13, 1, 2),
(156, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 54, 25, 24, 13, 1, 2),
(157, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 55, 25, 24, 13, 1, 1),
(158, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 56, 26, 25, 13, 1, 2),
(159, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 57, 26, 25, 13, 1, 2),
(160, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 58, 27, 26, 13, 1, 2),
(161, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 59, 27, 26, 13, 1, 2),
(162, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 60, 27, 26, 13, 1, 3),
(163, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 61, 28, 27, 14, 1, 2),
(164, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 62, 28, 27, 14, 1, 1),
(165, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 63, 29, 27, 14, 1, 1),
(166, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 64, 29, 27, 14, 1, 1),
(167, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 65, 30, 28, 14, 1, 1),
(168, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 66, 30, 28, 14, 1, 1),
(169, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 67, 31, 29, 14, 1, 1),
(170, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 68, 31, 29, 14, 1, 1),
(171, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 69, 32, 29, 14, 1, 2),
(172, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 70, 33, 30, 14, 1, 3),
(173, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 71, 33, 30, 14, 1, 3),
(174, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 72, 33, 30, 14, 1, 2),
(175, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 73, 34, 31, 14, 1, 2),
(176, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 74, 34, 31, 14, 1, 2),
(177, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 75, 34, 31, 14, 1, 2),
(178, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 76, 35, 32, 15, 1, 7),
(179, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 77, 35, 32, 15, 1, 6),
(180, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 78, 36, 32, 15, 1, 7),
(181, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 79, 37, 32, 15, 1, 6),
(182, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 80, 37, 32, 15, 1, 6),
(183, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 81, 37, 32, 15, 1, 6),
(184, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 82, 38, 32, 15, 1, 6),
(185, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 83, 38, 32, 15, 1, 6),
(186, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 84, 39, 33, 15, 1, 7),
(187, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 85, 40, 33, 15, 1, 6),
(188, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 86, 40, 33, 15, 1, 6),
(189, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 87, 40, 33, 15, 1, 6),
(190, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 88, 41, 33, 15, 1, 6),
(191, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 89, 41, 33, 15, 1, 6),
(192, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 90, 42, 34, 16, 1, 12),
(193, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 91, 43, 34, 16, 1, 11),
(194, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 92, 43, 34, 16, 1, 11),
(195, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 93, 43, 34, 16, 1, 11),
(196, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 94, 44, 34, 16, 1, 11),
(197, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 95, 44, 34, 16, 1, 11),
(198, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 96, 45, 35, 16, 1, 11),
(199, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 97, 46, 35, 16, 1, 11),
(200, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 98, 46, 35, 16, 1, 11),
(201, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 99, 46, 35, 16, 1, 11),
(202, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 100, 47, 35, 16, 1, 11),
(203, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 101, 47, 35, 16, 1, 11),
(204, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 102, 48, 36, 17, 1, 2),
(205, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 103, 48, 36, 17, 1, 1),
(206, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 104, 48, 36, 17, 1, 1),
(207, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 105, 49, 37, 17, 1, 1),
(208, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 106, 49, 37, 17, 1, 1),
(209, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 107, 49, 37, 17, 1, 1),
(210, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 108, 49, 37, 17, 1, 1),
(211, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 109, 50, 37, 17, 1, 1),
(212, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 110, 50, 37, 17, 1, 1),
(213, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 111, 51, 38, 18, 1, 7),
(214, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 112, 52, 38, 18, 1, 7),
(215, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 113, 52, 38, 18, 1, 8),
(216, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 114, 53, 38, 18, 1, 7),
(217, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 115, 53, 38, 18, 1, 8),
(218, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 116, 54, 39, 18, 1, 6),
(219, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 117, 55, 39, 18, 1, 6),
(220, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 118, 56, 39, 18, 1, 6),
(221, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 119, 57, 39, 18, 1, 6),
(222, 'd12862b5-e5a8-424e-abd4-dda410b247f0', 120, 57, 39, 18, 1, 6),
(223, '72741fb4-0721-49ff-9774-2fd93fd83934', 10, 8, 8, 10, 1, 2),
(224, '72741fb4-0721-49ff-9774-2fd93fd83934', 11, 8, 8, 10, 1, 3),
(225, '72741fb4-0721-49ff-9774-2fd93fd83934', 12, 8, 8, 10, 1, 3),
(226, '72741fb4-0721-49ff-9774-2fd93fd83934', 13, 9, 9, 10, 1, 2),
(227, '72741fb4-0721-49ff-9774-2fd93fd83934', 14, 10, 10, 10, 1, 2),
(228, '72741fb4-0721-49ff-9774-2fd93fd83934', 15, 10, 10, 10, 1, 2),
(229, '72741fb4-0721-49ff-9774-2fd93fd83934', 16, 11, 11, 10, 1, 3),
(230, '72741fb4-0721-49ff-9774-2fd93fd83934', 17, 11, 11, 10, 1, 3),
(231, '72741fb4-0721-49ff-9774-2fd93fd83934', 18, 11, 11, 10, 1, 2),
(232, '72741fb4-0721-49ff-9774-2fd93fd83934', 19, 12, 11, 10, 1, 3),
(233, '72741fb4-0721-49ff-9774-2fd93fd83934', 20, 12, 11, 10, 1, 4),
(234, '72741fb4-0721-49ff-9774-2fd93fd83934', 21, 12, 11, 10, 1, 3),
(235, '72741fb4-0721-49ff-9774-2fd93fd83934', 22, 13, 12, 10, 1, 3),
(236, '72741fb4-0721-49ff-9774-2fd93fd83934', 23, 13, 12, 10, 1, 3),
(237, '72741fb4-0721-49ff-9774-2fd93fd83934', 24, 13, 12, 10, 1, 1),
(238, '72741fb4-0721-49ff-9774-2fd93fd83934', 25, 14, 13, 11, 1, 1),
(239, '72741fb4-0721-49ff-9774-2fd93fd83934', 26, 15, 14, 11, 1, 1),
(240, '72741fb4-0721-49ff-9774-2fd93fd83934', 27, 16, 15, 11, 1, 1),
(241, '72741fb4-0721-49ff-9774-2fd93fd83934', 28, 16, 15, 11, 1, 1),
(242, '72741fb4-0721-49ff-9774-2fd93fd83934', 29, 16, 15, 11, 1, 1),
(243, '72741fb4-0721-49ff-9774-2fd93fd83934', 30, 17, 16, 11, 1, 2),
(244, '72741fb4-0721-49ff-9774-2fd93fd83934', 31, 17, 16, 11, 1, 3),
(245, '72741fb4-0721-49ff-9774-2fd93fd83934', 32, 17, 16, 11, 1, 3),
(246, '72741fb4-0721-49ff-9774-2fd93fd83934', 33, 18, 17, 12, 1, 3),
(247, '72741fb4-0721-49ff-9774-2fd93fd83934', 34, 18, 17, 12, 1, 2),
(248, '72741fb4-0721-49ff-9774-2fd93fd83934', 35, 19, 18, 12, 1, 3),
(249, '72741fb4-0721-49ff-9774-2fd93fd83934', 36, 19, 18, 12, 1, 2),
(250, '72741fb4-0721-49ff-9774-2fd93fd83934', 37, 19, 18, 12, 1, 2),
(251, '72741fb4-0721-49ff-9774-2fd93fd83934', 38, 20, 19, 12, 1, 2),
(252, '72741fb4-0721-49ff-9774-2fd93fd83934', 39, 20, 19, 12, 1, 3),
(253, '72741fb4-0721-49ff-9774-2fd93fd83934', 40, 20, 19, 12, 1, 2),
(254, '72741fb4-0721-49ff-9774-2fd93fd83934', 41, 21, 20, 12, 1, 2),
(255, '72741fb4-0721-49ff-9774-2fd93fd83934', 42, 21, 20, 12, 1, 2),
(256, '72741fb4-0721-49ff-9774-2fd93fd83934', 43, 21, 20, 12, 1, 2),
(257, '72741fb4-0721-49ff-9774-2fd93fd83934', 44, 22, 21, 12, 1, 1),
(258, '72741fb4-0721-49ff-9774-2fd93fd83934', 45, 22, 21, 12, 1, 1),
(259, '72741fb4-0721-49ff-9774-2fd93fd83934', 46, 22, 21, 12, 1, 2),
(260, '72741fb4-0721-49ff-9774-2fd93fd83934', 47, 22, 21, 12, 1, 3),
(261, '72741fb4-0721-49ff-9774-2fd93fd83934', 48, 23, 22, 13, 1, 3),
(262, '72741fb4-0721-49ff-9774-2fd93fd83934', 49, 23, 22, 13, 1, 2),
(263, '72741fb4-0721-49ff-9774-2fd93fd83934', 50, 24, 23, 13, 1, 1),
(264, '72741fb4-0721-49ff-9774-2fd93fd83934', 51, 24, 23, 13, 1, 1),
(265, '72741fb4-0721-49ff-9774-2fd93fd83934', 52, 24, 23, 13, 1, 1),
(266, '72741fb4-0721-49ff-9774-2fd93fd83934', 53, 25, 24, 13, 1, 2),
(267, '72741fb4-0721-49ff-9774-2fd93fd83934', 54, 25, 24, 13, 1, 2),
(268, '72741fb4-0721-49ff-9774-2fd93fd83934', 55, 25, 24, 13, 1, 2),
(269, '72741fb4-0721-49ff-9774-2fd93fd83934', 56, 26, 25, 13, 1, 2),
(270, '72741fb4-0721-49ff-9774-2fd93fd83934', 57, 26, 25, 13, 1, 3),
(271, '72741fb4-0721-49ff-9774-2fd93fd83934', 58, 27, 26, 13, 1, 2),
(272, '72741fb4-0721-49ff-9774-2fd93fd83934', 59, 27, 26, 13, 1, 2),
(273, '72741fb4-0721-49ff-9774-2fd93fd83934', 60, 27, 26, 13, 1, 1),
(274, '72741fb4-0721-49ff-9774-2fd93fd83934', 61, 28, 27, 14, 1, 1),
(275, '72741fb4-0721-49ff-9774-2fd93fd83934', 62, 28, 27, 14, 1, 1),
(276, '72741fb4-0721-49ff-9774-2fd93fd83934', 63, 29, 27, 14, 1, 1),
(277, '72741fb4-0721-49ff-9774-2fd93fd83934', 64, 29, 27, 14, 1, 1),
(278, '72741fb4-0721-49ff-9774-2fd93fd83934', 65, 30, 28, 14, 1, 1),
(279, '72741fb4-0721-49ff-9774-2fd93fd83934', 66, 30, 28, 14, 1, 1),
(280, '72741fb4-0721-49ff-9774-2fd93fd83934', 67, 31, 29, 14, 1, 2),
(281, '72741fb4-0721-49ff-9774-2fd93fd83934', 68, 31, 29, 14, 1, 3),
(282, '72741fb4-0721-49ff-9774-2fd93fd83934', 69, 32, 29, 14, 1, 2),
(283, '72741fb4-0721-49ff-9774-2fd93fd83934', 70, 33, 30, 14, 1, 2),
(284, '72741fb4-0721-49ff-9774-2fd93fd83934', 71, 33, 30, 14, 1, 2),
(285, '72741fb4-0721-49ff-9774-2fd93fd83934', 72, 33, 30, 14, 1, 3),
(286, '72741fb4-0721-49ff-9774-2fd93fd83934', 73, 34, 31, 14, 1, 2),
(287, '72741fb4-0721-49ff-9774-2fd93fd83934', 74, 34, 31, 14, 1, 2),
(288, '72741fb4-0721-49ff-9774-2fd93fd83934', 75, 34, 31, 14, 1, 4),
(289, '72741fb4-0721-49ff-9774-2fd93fd83934', 76, 35, 32, 15, 1, 7),
(290, '72741fb4-0721-49ff-9774-2fd93fd83934', 77, 35, 32, 15, 1, 6),
(291, '72741fb4-0721-49ff-9774-2fd93fd83934', 78, 36, 32, 15, 1, 7),
(292, '72741fb4-0721-49ff-9774-2fd93fd83934', 79, 37, 32, 15, 1, 6),
(293, '72741fb4-0721-49ff-9774-2fd93fd83934', 80, 37, 32, 15, 1, 6),
(294, '72741fb4-0721-49ff-9774-2fd93fd83934', 81, 37, 32, 15, 1, 6),
(295, '72741fb4-0721-49ff-9774-2fd93fd83934', 82, 38, 32, 15, 1, 6),
(296, '72741fb4-0721-49ff-9774-2fd93fd83934', 83, 38, 32, 15, 1, 6),
(297, '72741fb4-0721-49ff-9774-2fd93fd83934', 84, 39, 33, 15, 1, 6),
(298, '72741fb4-0721-49ff-9774-2fd93fd83934', 85, 40, 33, 15, 1, 6),
(299, '72741fb4-0721-49ff-9774-2fd93fd83934', 86, 40, 33, 15, 1, 6),
(300, '72741fb4-0721-49ff-9774-2fd93fd83934', 87, 40, 33, 15, 1, 6),
(301, '72741fb4-0721-49ff-9774-2fd93fd83934', 88, 41, 33, 15, 1, 6),
(302, '72741fb4-0721-49ff-9774-2fd93fd83934', 89, 41, 33, 15, 1, 6),
(303, '72741fb4-0721-49ff-9774-2fd93fd83934', 90, 42, 34, 16, 1, 12),
(304, '72741fb4-0721-49ff-9774-2fd93fd83934', 91, 43, 34, 16, 1, 11),
(305, '72741fb4-0721-49ff-9774-2fd93fd83934', 92, 43, 34, 16, 1, 11),
(306, '72741fb4-0721-49ff-9774-2fd93fd83934', 93, 43, 34, 16, 1, 11),
(307, '72741fb4-0721-49ff-9774-2fd93fd83934', 94, 44, 34, 16, 1, 11),
(308, '72741fb4-0721-49ff-9774-2fd93fd83934', 95, 44, 34, 16, 1, 11),
(309, '72741fb4-0721-49ff-9774-2fd93fd83934', 96, 45, 35, 16, 1, 11),
(310, '72741fb4-0721-49ff-9774-2fd93fd83934', 97, 46, 35, 16, 1, 11),
(311, '72741fb4-0721-49ff-9774-2fd93fd83934', 98, 46, 35, 16, 1, 11),
(312, '72741fb4-0721-49ff-9774-2fd93fd83934', 99, 46, 35, 16, 1, 11),
(313, '72741fb4-0721-49ff-9774-2fd93fd83934', 100, 47, 35, 16, 1, 11),
(314, '72741fb4-0721-49ff-9774-2fd93fd83934', 101, 47, 35, 16, 1, 11),
(315, '72741fb4-0721-49ff-9774-2fd93fd83934', 102, 48, 36, 17, 1, 1),
(316, '72741fb4-0721-49ff-9774-2fd93fd83934', 103, 48, 36, 17, 1, 1),
(317, '72741fb4-0721-49ff-9774-2fd93fd83934', 104, 48, 36, 17, 1, 1),
(318, '72741fb4-0721-49ff-9774-2fd93fd83934', 105, 49, 37, 17, 1, 1),
(319, '72741fb4-0721-49ff-9774-2fd93fd83934', 106, 49, 37, 17, 1, 1),
(320, '72741fb4-0721-49ff-9774-2fd93fd83934', 107, 49, 37, 17, 1, 1),
(321, '72741fb4-0721-49ff-9774-2fd93fd83934', 108, 49, 37, 17, 1, 1),
(322, '72741fb4-0721-49ff-9774-2fd93fd83934', 109, 50, 37, 17, 1, 1),
(323, '72741fb4-0721-49ff-9774-2fd93fd83934', 110, 50, 37, 17, 1, 1),
(324, '72741fb4-0721-49ff-9774-2fd93fd83934', 111, 51, 38, 18, 1, 7),
(325, '72741fb4-0721-49ff-9774-2fd93fd83934', 112, 52, 38, 18, 1, 8),
(326, '72741fb4-0721-49ff-9774-2fd93fd83934', 113, 52, 38, 18, 1, 9),
(327, '72741fb4-0721-49ff-9774-2fd93fd83934', 114, 53, 38, 18, 1, 6),
(328, '72741fb4-0721-49ff-9774-2fd93fd83934', 115, 53, 38, 18, 1, 6),
(329, '72741fb4-0721-49ff-9774-2fd93fd83934', 116, 54, 39, 18, 1, 6),
(330, '72741fb4-0721-49ff-9774-2fd93fd83934', 117, 55, 39, 18, 1, 6),
(331, '72741fb4-0721-49ff-9774-2fd93fd83934', 118, 56, 39, 18, 1, 6),
(332, '72741fb4-0721-49ff-9774-2fd93fd83934', 119, 57, 39, 18, 1, 6),
(333, '72741fb4-0721-49ff-9774-2fd93fd83934', 120, 57, 39, 18, 1, 6),
(334, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 10, 8, 8, 10, 1, 4),
(335, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 11, 8, 8, 10, 1, 3),
(336, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 12, 8, 8, 10, 1, 4),
(337, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 13, 9, 9, 10, 1, 2),
(338, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 14, 10, 10, 10, 1, 3),
(339, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 15, 10, 10, 10, 1, 3),
(340, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 16, 11, 11, 10, 1, 4),
(341, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 17, 11, 11, 10, 1, 3),
(342, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 18, 11, 11, 10, 1, 3),
(343, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 19, 12, 11, 10, 1, 3),
(344, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 20, 12, 11, 10, 1, 3),
(345, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 21, 12, 11, 10, 1, 4),
(346, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 22, 13, 12, 10, 1, 4),
(347, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 23, 13, 12, 10, 1, 3),
(348, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 24, 13, 12, 10, 1, 4),
(349, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 25, 14, 13, 11, 1, 3),
(350, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 26, 15, 14, 11, 1, 1),
(351, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 27, 16, 15, 11, 1, 3),
(352, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 28, 16, 15, 11, 1, 3),
(353, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 29, 16, 15, 11, 1, 2),
(354, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 30, 17, 16, 11, 1, 3),
(355, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 31, 17, 16, 11, 1, 2),
(356, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 32, 17, 16, 11, 1, 2),
(357, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 33, 18, 17, 12, 1, 2),
(358, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 34, 18, 17, 12, 1, 3),
(359, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 35, 19, 18, 12, 1, 3),
(360, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 36, 19, 18, 12, 1, 2),
(361, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 37, 19, 18, 12, 1, 2),
(362, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 38, 20, 19, 12, 1, 2),
(363, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 39, 20, 19, 12, 1, 2),
(364, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 40, 20, 19, 12, 1, 2),
(365, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 41, 21, 20, 12, 1, 4),
(366, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 42, 21, 20, 12, 1, 2),
(367, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 43, 21, 20, 12, 1, 2),
(368, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 44, 22, 21, 12, 1, 3),
(369, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 45, 22, 21, 12, 1, 2),
(370, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 46, 22, 21, 12, 1, 2),
(371, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 47, 22, 21, 12, 1, 5),
(372, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 48, 23, 22, 13, 1, 3),
(373, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 49, 23, 22, 13, 1, 2),
(374, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 50, 24, 23, 13, 1, 1),
(375, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 51, 24, 23, 13, 1, 1),
(376, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 52, 24, 23, 13, 1, 1),
(377, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 53, 25, 24, 13, 1, 2),
(378, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 54, 25, 24, 13, 1, 2),
(379, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 55, 25, 24, 13, 1, 2),
(380, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 56, 26, 25, 13, 1, 2),
(381, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 57, 26, 25, 13, 1, 3),
(382, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 58, 27, 26, 13, 1, 2),
(383, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 59, 27, 26, 13, 1, 2),
(384, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 60, 27, 26, 13, 1, 1),
(385, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 61, 28, 27, 14, 1, 2),
(386, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 62, 28, 27, 14, 1, 1),
(387, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 63, 29, 27, 14, 1, 2),
(388, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 64, 29, 27, 14, 1, 2),
(389, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 65, 30, 28, 14, 1, 2),
(390, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 66, 30, 28, 14, 1, 2),
(391, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 67, 31, 29, 14, 1, 2),
(392, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 68, 31, 29, 14, 1, 2),
(393, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 69, 32, 29, 14, 1, 2),
(394, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 70, 33, 30, 14, 1, 3),
(395, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 71, 33, 30, 14, 1, 2),
(396, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 72, 33, 30, 14, 1, 3),
(397, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 73, 34, 31, 14, 1, 3),
(398, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 74, 34, 31, 14, 1, 2),
(399, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 75, 34, 31, 14, 1, 2),
(400, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 76, 35, 32, 15, 1, 8),
(401, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 77, 35, 32, 15, 1, 7),
(402, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 78, 36, 32, 15, 1, 7),
(403, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 79, 37, 32, 15, 1, 7),
(404, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 80, 37, 32, 15, 1, 7),
(405, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 81, 37, 32, 15, 1, 8),
(406, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 82, 38, 32, 15, 1, 7),
(407, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 83, 38, 32, 15, 1, 8),
(408, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 84, 39, 33, 15, 1, 7),
(409, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 85, 40, 33, 15, 1, 7),
(410, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 86, 40, 33, 15, 1, 7),
(411, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 87, 40, 33, 15, 1, 8),
(412, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 88, 41, 33, 15, 1, 7),
(413, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 89, 41, 33, 15, 1, 8),
(414, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 90, 42, 34, 16, 1, 13),
(415, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 91, 43, 34, 16, 1, 12),
(416, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 92, 43, 34, 16, 1, 12),
(417, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 93, 43, 34, 16, 1, 12),
(418, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 94, 44, 34, 16, 1, 11),
(419, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 95, 44, 34, 16, 1, 11),
(420, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 96, 45, 35, 16, 1, 11),
(421, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 97, 46, 35, 16, 1, 11),
(422, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 98, 46, 35, 16, 1, 11),
(423, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 99, 46, 35, 16, 1, 11),
(424, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 100, 47, 35, 16, 1, 11),
(425, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 101, 47, 35, 16, 1, 11),
(426, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 102, 48, 36, 17, 1, 1),
(427, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 103, 48, 36, 17, 1, 1),
(428, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 104, 48, 36, 17, 1, 1),
(429, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 105, 49, 37, 17, 1, 1),
(430, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 106, 49, 37, 17, 1, 1),
(431, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 107, 49, 37, 17, 1, 1),
(432, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 108, 49, 37, 17, 1, 1),
(433, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 109, 50, 37, 17, 1, 1),
(434, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 110, 50, 37, 17, 1, 1),
(435, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 111, 51, 38, 18, 1, 8),
(436, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 112, 52, 38, 18, 1, 8),
(437, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 113, 52, 38, 18, 1, 9),
(438, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 114, 53, 38, 18, 1, 6),
(439, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 115, 53, 38, 18, 1, 6),
(440, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 116, 54, 39, 18, 1, 7),
(441, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 117, 55, 39, 18, 1, 8),
(442, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 118, 56, 39, 18, 1, 8),
(443, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 119, 57, 39, 18, 1, 7),
(444, '4952cd1d-e9cb-4599-8178-a2d4c26efefc', 120, 57, 39, 18, 1, 6),
(445, '7ce93322-b63f-4fc2-9928-bb99b175705d', 10, 8, 8, 10, 1, 3),
(446, '7ce93322-b63f-4fc2-9928-bb99b175705d', 11, 8, 8, 10, 1, 2),
(447, '7ce93322-b63f-4fc2-9928-bb99b175705d', 12, 8, 8, 10, 1, 2),
(448, '7ce93322-b63f-4fc2-9928-bb99b175705d', 13, 9, 9, 10, 1, 2),
(449, '7ce93322-b63f-4fc2-9928-bb99b175705d', 14, 10, 10, 10, 1, 3),
(450, '7ce93322-b63f-4fc2-9928-bb99b175705d', 15, 10, 10, 10, 1, 2),
(451, '7ce93322-b63f-4fc2-9928-bb99b175705d', 16, 11, 11, 10, 1, 2),
(452, '7ce93322-b63f-4fc2-9928-bb99b175705d', 17, 11, 11, 10, 1, 2),
(453, '7ce93322-b63f-4fc2-9928-bb99b175705d', 18, 11, 11, 10, 1, 3),
(454, '7ce93322-b63f-4fc2-9928-bb99b175705d', 19, 12, 11, 10, 1, 2),
(455, '7ce93322-b63f-4fc2-9928-bb99b175705d', 20, 12, 11, 10, 1, 2),
(456, '7ce93322-b63f-4fc2-9928-bb99b175705d', 21, 12, 11, 10, 1, 3),
(457, '7ce93322-b63f-4fc2-9928-bb99b175705d', 22, 13, 12, 10, 1, 3),
(458, '7ce93322-b63f-4fc2-9928-bb99b175705d', 23, 13, 12, 10, 1, 3),
(459, '7ce93322-b63f-4fc2-9928-bb99b175705d', 24, 13, 12, 10, 1, 2),
(460, '7ce93322-b63f-4fc2-9928-bb99b175705d', 25, 14, 13, 11, 1, 3),
(461, '7ce93322-b63f-4fc2-9928-bb99b175705d', 26, 15, 14, 11, 1, 2),
(462, '7ce93322-b63f-4fc2-9928-bb99b175705d', 27, 16, 15, 11, 1, 2),
(463, '7ce93322-b63f-4fc2-9928-bb99b175705d', 28, 16, 15, 11, 1, 3),
(464, '7ce93322-b63f-4fc2-9928-bb99b175705d', 29, 16, 15, 11, 1, 3),
(465, '7ce93322-b63f-4fc2-9928-bb99b175705d', 30, 17, 16, 11, 1, 2),
(466, '7ce93322-b63f-4fc2-9928-bb99b175705d', 31, 17, 16, 11, 1, 2),
(467, '7ce93322-b63f-4fc2-9928-bb99b175705d', 32, 17, 16, 11, 1, 2),
(468, '7ce93322-b63f-4fc2-9928-bb99b175705d', 33, 18, 17, 12, 1, 2),
(469, '7ce93322-b63f-4fc2-9928-bb99b175705d', 34, 18, 17, 12, 1, 3),
(470, '7ce93322-b63f-4fc2-9928-bb99b175705d', 35, 19, 18, 12, 1, 2),
(471, '7ce93322-b63f-4fc2-9928-bb99b175705d', 36, 19, 18, 12, 1, 3),
(472, '7ce93322-b63f-4fc2-9928-bb99b175705d', 37, 19, 18, 12, 1, 3),
(473, '7ce93322-b63f-4fc2-9928-bb99b175705d', 38, 20, 19, 12, 1, 2),
(474, '7ce93322-b63f-4fc2-9928-bb99b175705d', 39, 20, 19, 12, 1, 2),
(475, '7ce93322-b63f-4fc2-9928-bb99b175705d', 40, 20, 19, 12, 1, 2),
(476, '7ce93322-b63f-4fc2-9928-bb99b175705d', 41, 21, 20, 12, 1, 2),
(477, '7ce93322-b63f-4fc2-9928-bb99b175705d', 42, 21, 20, 12, 1, 2),
(478, '7ce93322-b63f-4fc2-9928-bb99b175705d', 43, 21, 20, 12, 1, 2),
(479, '7ce93322-b63f-4fc2-9928-bb99b175705d', 44, 22, 21, 12, 1, 2),
(480, '7ce93322-b63f-4fc2-9928-bb99b175705d', 45, 22, 21, 12, 1, 2),
(481, '7ce93322-b63f-4fc2-9928-bb99b175705d', 46, 22, 21, 12, 1, 2),
(482, '7ce93322-b63f-4fc2-9928-bb99b175705d', 47, 22, 21, 12, 1, 3),
(483, '7ce93322-b63f-4fc2-9928-bb99b175705d', 48, 23, 22, 13, 1, 4),
(484, '7ce93322-b63f-4fc2-9928-bb99b175705d', 49, 23, 22, 13, 1, 4),
(485, '7ce93322-b63f-4fc2-9928-bb99b175705d', 50, 24, 23, 13, 1, 2),
(486, '7ce93322-b63f-4fc2-9928-bb99b175705d', 51, 24, 23, 13, 1, 2),
(487, '7ce93322-b63f-4fc2-9928-bb99b175705d', 52, 24, 23, 13, 1, 2),
(488, '7ce93322-b63f-4fc2-9928-bb99b175705d', 53, 25, 24, 13, 1, 2),
(489, '7ce93322-b63f-4fc2-9928-bb99b175705d', 54, 25, 24, 13, 1, 1),
(490, '7ce93322-b63f-4fc2-9928-bb99b175705d', 55, 25, 24, 13, 1, 1),
(491, '7ce93322-b63f-4fc2-9928-bb99b175705d', 56, 26, 25, 13, 1, 2),
(492, '7ce93322-b63f-4fc2-9928-bb99b175705d', 57, 26, 25, 13, 1, 2),
(493, '7ce93322-b63f-4fc2-9928-bb99b175705d', 58, 27, 26, 13, 1, 3),
(494, '7ce93322-b63f-4fc2-9928-bb99b175705d', 59, 27, 26, 13, 1, 3),
(495, '7ce93322-b63f-4fc2-9928-bb99b175705d', 60, 27, 26, 13, 1, 3),
(496, '7ce93322-b63f-4fc2-9928-bb99b175705d', 61, 28, 27, 14, 1, 2),
(497, '7ce93322-b63f-4fc2-9928-bb99b175705d', 62, 28, 27, 14, 1, 1),
(498, '7ce93322-b63f-4fc2-9928-bb99b175705d', 63, 29, 27, 14, 1, 1),
(499, '7ce93322-b63f-4fc2-9928-bb99b175705d', 64, 29, 27, 14, 1, 2),
(500, '7ce93322-b63f-4fc2-9928-bb99b175705d', 65, 30, 28, 14, 1, 3),
(501, '7ce93322-b63f-4fc2-9928-bb99b175705d', 66, 30, 28, 14, 1, 2),
(502, '7ce93322-b63f-4fc2-9928-bb99b175705d', 67, 31, 29, 14, 1, 2),
(503, '7ce93322-b63f-4fc2-9928-bb99b175705d', 68, 31, 29, 14, 1, 3),
(504, '7ce93322-b63f-4fc2-9928-bb99b175705d', 69, 32, 29, 14, 1, 3),
(505, '7ce93322-b63f-4fc2-9928-bb99b175705d', 70, 33, 30, 14, 1, 3),
(506, '7ce93322-b63f-4fc2-9928-bb99b175705d', 71, 33, 30, 14, 1, 2),
(507, '7ce93322-b63f-4fc2-9928-bb99b175705d', 72, 33, 30, 14, 1, 3),
(508, '7ce93322-b63f-4fc2-9928-bb99b175705d', 73, 34, 31, 14, 1, 2),
(509, '7ce93322-b63f-4fc2-9928-bb99b175705d', 74, 34, 31, 14, 1, 3),
(510, '7ce93322-b63f-4fc2-9928-bb99b175705d', 75, 34, 31, 14, 1, 2),
(511, '7ce93322-b63f-4fc2-9928-bb99b175705d', 76, 35, 32, 15, 1, 8),
(512, '7ce93322-b63f-4fc2-9928-bb99b175705d', 77, 35, 32, 15, 1, 7),
(513, '7ce93322-b63f-4fc2-9928-bb99b175705d', 78, 36, 32, 15, 1, 7),
(514, '7ce93322-b63f-4fc2-9928-bb99b175705d', 79, 37, 32, 15, 1, 6),
(515, '7ce93322-b63f-4fc2-9928-bb99b175705d', 80, 37, 32, 15, 1, 6),
(516, '7ce93322-b63f-4fc2-9928-bb99b175705d', 81, 37, 32, 15, 1, 6),
(517, '7ce93322-b63f-4fc2-9928-bb99b175705d', 82, 38, 32, 15, 1, 6),
(518, '7ce93322-b63f-4fc2-9928-bb99b175705d', 83, 38, 32, 15, 1, 6),
(519, '7ce93322-b63f-4fc2-9928-bb99b175705d', 84, 39, 33, 15, 1, 6),
(520, '7ce93322-b63f-4fc2-9928-bb99b175705d', 85, 40, 33, 15, 1, 7),
(521, '7ce93322-b63f-4fc2-9928-bb99b175705d', 86, 40, 33, 15, 1, 7),
(522, '7ce93322-b63f-4fc2-9928-bb99b175705d', 87, 40, 33, 15, 1, 7),
(523, '7ce93322-b63f-4fc2-9928-bb99b175705d', 88, 41, 33, 15, 1, 6),
(524, '7ce93322-b63f-4fc2-9928-bb99b175705d', 89, 41, 33, 15, 1, 6),
(525, '7ce93322-b63f-4fc2-9928-bb99b175705d', 90, 42, 34, 16, 1, 11),
(526, '7ce93322-b63f-4fc2-9928-bb99b175705d', 91, 43, 34, 16, 1, 11),
(527, '7ce93322-b63f-4fc2-9928-bb99b175705d', 92, 43, 34, 16, 1, 11),
(528, '7ce93322-b63f-4fc2-9928-bb99b175705d', 93, 43, 34, 16, 1, 11),
(529, '7ce93322-b63f-4fc2-9928-bb99b175705d', 94, 44, 34, 16, 1, 11),
(530, '7ce93322-b63f-4fc2-9928-bb99b175705d', 95, 44, 34, 16, 1, 11),
(531, '7ce93322-b63f-4fc2-9928-bb99b175705d', 96, 45, 35, 16, 1, 11),
(532, '7ce93322-b63f-4fc2-9928-bb99b175705d', 97, 46, 35, 16, 1, 11),
(533, '7ce93322-b63f-4fc2-9928-bb99b175705d', 98, 46, 35, 16, 1, 11),
(534, '7ce93322-b63f-4fc2-9928-bb99b175705d', 99, 46, 35, 16, 1, 11),
(535, '7ce93322-b63f-4fc2-9928-bb99b175705d', 100, 47, 35, 16, 1, 11),
(536, '7ce93322-b63f-4fc2-9928-bb99b175705d', 101, 47, 35, 16, 1, 11),
(537, '7ce93322-b63f-4fc2-9928-bb99b175705d', 102, 48, 36, 17, 1, 3),
(538, '7ce93322-b63f-4fc2-9928-bb99b175705d', 103, 48, 36, 17, 1, 3),
(539, '7ce93322-b63f-4fc2-9928-bb99b175705d', 104, 48, 36, 17, 1, 2),
(540, '7ce93322-b63f-4fc2-9928-bb99b175705d', 105, 49, 37, 17, 1, 3),
(541, '7ce93322-b63f-4fc2-9928-bb99b175705d', 106, 49, 37, 17, 1, 2),
(542, '7ce93322-b63f-4fc2-9928-bb99b175705d', 107, 49, 37, 17, 1, 3),
(543, '7ce93322-b63f-4fc2-9928-bb99b175705d', 108, 49, 37, 17, 1, 2),
(544, '7ce93322-b63f-4fc2-9928-bb99b175705d', 109, 50, 37, 17, 1, 3),
(545, '7ce93322-b63f-4fc2-9928-bb99b175705d', 110, 50, 37, 17, 1, 3),
(546, '7ce93322-b63f-4fc2-9928-bb99b175705d', 111, 51, 38, 18, 1, 7),
(547, '7ce93322-b63f-4fc2-9928-bb99b175705d', 112, 52, 38, 18, 1, 8),
(548, '7ce93322-b63f-4fc2-9928-bb99b175705d', 113, 52, 38, 18, 1, 8),
(549, '7ce93322-b63f-4fc2-9928-bb99b175705d', 114, 53, 38, 18, 1, 7),
(550, '7ce93322-b63f-4fc2-9928-bb99b175705d', 115, 53, 38, 18, 1, 8),
(551, '7ce93322-b63f-4fc2-9928-bb99b175705d', 116, 54, 39, 18, 1, 6),
(552, '7ce93322-b63f-4fc2-9928-bb99b175705d', 117, 55, 39, 18, 1, 6),
(553, '7ce93322-b63f-4fc2-9928-bb99b175705d', 118, 56, 39, 18, 1, 6),
(554, '7ce93322-b63f-4fc2-9928-bb99b175705d', 119, 57, 39, 18, 1, 6),
(555, '7ce93322-b63f-4fc2-9928-bb99b175705d', 120, 57, 39, 18, 1, 6),
(556, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 10, 8, 8, 10, 1, 2),
(557, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 11, 8, 8, 10, 1, 3),
(558, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 12, 8, 8, 10, 1, 4),
(559, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 13, 9, 9, 10, 1, 3),
(560, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 14, 10, 10, 10, 1, 2),
(561, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 15, 10, 10, 10, 1, 2),
(562, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 16, 11, 11, 10, 1, 4),
(563, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 17, 11, 11, 10, 1, 3),
(564, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 18, 11, 11, 10, 1, 4),
(565, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 19, 12, 11, 10, 1, 5),
(566, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 20, 12, 11, 10, 1, 4),
(567, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 21, 12, 11, 10, 1, 4),
(568, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 22, 13, 12, 10, 1, 4),
(569, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 23, 13, 12, 10, 1, 3),
(570, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 24, 13, 12, 10, 1, 2),
(571, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 25, 14, 13, 11, 1, 2),
(572, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 26, 15, 14, 11, 1, 2),
(573, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 27, 16, 15, 11, 1, 3),
(574, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 28, 16, 15, 11, 1, 3),
(575, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 29, 16, 15, 11, 1, 4),
(576, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 30, 17, 16, 11, 1, 3),
(577, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 31, 17, 16, 11, 1, 2),
(578, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 32, 17, 16, 11, 1, 2),
(579, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 33, 18, 17, 12, 1, 3),
(580, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 34, 18, 17, 12, 1, 2),
(581, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 35, 19, 18, 12, 1, 3),
(582, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 36, 19, 18, 12, 1, 3),
(583, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 37, 19, 18, 12, 1, 2),
(584, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 38, 20, 19, 12, 1, 2),
(585, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 39, 20, 19, 12, 1, 3),
(586, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 40, 20, 19, 12, 1, 2),
(587, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 41, 21, 20, 12, 1, 3),
(588, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 42, 21, 20, 12, 1, 3),
(589, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 43, 21, 20, 12, 1, 4),
(590, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 44, 22, 21, 12, 1, 3),
(591, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 45, 22, 21, 12, 1, 2),
(592, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 46, 22, 21, 12, 1, 4),
(593, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 47, 22, 21, 12, 1, 5),
(594, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 48, 23, 22, 13, 1, 4),
(595, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 49, 23, 22, 13, 1, 4),
(596, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 50, 24, 23, 13, 1, 3),
(597, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 51, 24, 23, 13, 1, 3),
(598, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 52, 24, 23, 13, 1, 3),
(599, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 53, 25, 24, 13, 1, 4),
(600, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 54, 25, 24, 13, 1, 3),
(601, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 55, 25, 24, 13, 1, 2),
(602, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 56, 26, 25, 13, 1, 3),
(603, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 57, 26, 25, 13, 1, 3),
(604, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 58, 27, 26, 13, 1, 3),
(605, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 59, 27, 26, 13, 1, 3),
(606, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 60, 27, 26, 13, 1, 3),
(607, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 61, 28, 27, 14, 1, 2),
(608, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 62, 28, 27, 14, 1, 1),
(609, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 63, 29, 27, 14, 1, 2),
(610, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 64, 29, 27, 14, 1, 1),
(611, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 65, 30, 28, 14, 1, 2),
(612, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 66, 30, 28, 14, 1, 2),
(613, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 67, 31, 29, 14, 1, 3),
(614, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 68, 31, 29, 14, 1, 3),
(615, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 69, 32, 29, 14, 1, 4),
(616, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 70, 33, 30, 14, 1, 2),
(617, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 71, 33, 30, 14, 1, 2),
(618, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 72, 33, 30, 14, 1, 4),
(619, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 73, 34, 31, 14, 1, 4),
(620, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 74, 34, 31, 14, 1, 4),
(621, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 75, 34, 31, 14, 1, 4),
(622, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 76, 35, 32, 15, 1, 9),
(623, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 77, 35, 32, 15, 1, 8),
(624, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 78, 36, 32, 15, 1, 7),
(625, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 79, 37, 32, 15, 1, 7),
(626, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 80, 37, 32, 15, 1, 7),
(627, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 81, 37, 32, 15, 1, 9),
(628, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 82, 38, 32, 15, 1, 8),
(629, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 83, 38, 32, 15, 1, 9),
(630, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 84, 39, 33, 15, 1, 7),
(631, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 85, 40, 33, 15, 1, 7),
(632, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 86, 40, 33, 15, 1, 8),
(633, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 87, 40, 33, 15, 1, 8),
(634, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 88, 41, 33, 15, 1, 7),
(635, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 89, 41, 33, 15, 1, 8),
(636, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 90, 42, 34, 16, 1, 13),
(637, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 91, 43, 34, 16, 1, 12),
(638, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 92, 43, 34, 16, 1, 14),
(639, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 93, 43, 34, 16, 1, 13),
(640, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 94, 44, 34, 16, 1, 11),
(641, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 95, 44, 34, 16, 1, 11),
(642, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 96, 45, 35, 16, 1, 11),
(643, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 97, 46, 35, 16, 1, 13),
(644, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 98, 46, 35, 16, 1, 14),
(645, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 99, 46, 35, 16, 1, 13),
(646, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 100, 47, 35, 16, 1, 11),
(647, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 101, 47, 35, 16, 1, 11),
(648, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 102, 48, 36, 17, 1, 3),
(649, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 103, 48, 36, 17, 1, 3),
(650, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 104, 48, 36, 17, 1, 4),
(651, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 105, 49, 37, 17, 1, 3),
(652, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 106, 49, 37, 17, 1, 3),
(653, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 107, 49, 37, 17, 1, 3),
(654, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 108, 49, 37, 17, 1, 4),
(655, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 109, 50, 37, 17, 1, 3),
(656, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 110, 50, 37, 17, 1, 4),
(657, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 111, 51, 38, 18, 1, 9),
(658, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 112, 52, 38, 18, 1, 9),
(659, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 113, 52, 38, 18, 1, 9),
(660, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 114, 53, 38, 18, 1, 6),
(661, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 115, 53, 38, 18, 1, 6),
(662, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 116, 54, 39, 18, 1, 6),
(663, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 117, 55, 39, 18, 1, 6),
(664, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 118, 56, 39, 18, 1, 6),
(665, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 119, 57, 39, 18, 1, 6),
(666, '7d6bf51b-e3c7-46c8-b28f-c3ef3d34c868', 120, 57, 39, 18, 1, 6),
(667, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 10, 8, 8, 10, 1, 2),
(668, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 11, 8, 8, 10, 1, 2),
(669, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 12, 8, 8, 10, 1, 3),
(670, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 13, 9, 9, 10, 1, 3),
(671, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 14, 10, 10, 10, 1, 4),
(672, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 15, 10, 10, 10, 1, 3),
(673, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 16, 11, 11, 10, 1, 3),
(674, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 17, 11, 11, 10, 1, 3),
(675, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 18, 11, 11, 10, 1, 5),
(676, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 19, 12, 11, 10, 1, 4),
(677, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 20, 12, 11, 10, 1, 4),
(678, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 21, 12, 11, 10, 1, 4),
(679, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 22, 13, 12, 10, 1, 4),
(680, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 23, 13, 12, 10, 1, 5),
(681, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 24, 13, 12, 10, 1, 3),
(682, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 25, 14, 13, 11, 1, 2),
(683, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 26, 15, 14, 11, 1, 2),
(684, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 27, 16, 15, 11, 1, 2),
(685, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 28, 16, 15, 11, 1, 1),
(686, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 29, 16, 15, 11, 1, 1),
(687, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 30, 17, 16, 11, 1, 1),
(688, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 31, 17, 16, 11, 1, 2),
(689, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 32, 17, 16, 11, 1, 2),
(690, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 33, 18, 17, 12, 1, 3),
(691, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 34, 18, 17, 12, 1, 1),
(692, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 35, 19, 18, 12, 1, 3),
(693, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 36, 19, 18, 12, 1, 2),
(694, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 37, 19, 18, 12, 1, 3),
(695, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 38, 20, 19, 12, 1, 3),
(696, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 39, 20, 19, 12, 1, 4),
(697, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 40, 20, 19, 12, 1, 3),
(698, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 41, 21, 20, 12, 1, 4),
(699, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 42, 21, 20, 12, 1, 2),
(700, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 43, 21, 20, 12, 1, 3),
(701, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 44, 22, 21, 12, 1, 1),
(702, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 45, 22, 21, 12, 1, 1),
(703, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 46, 22, 21, 12, 1, 3),
(704, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 47, 22, 21, 12, 1, 4),
(705, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 48, 23, 22, 13, 1, 4),
(706, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 49, 23, 22, 13, 1, 4),
(707, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 50, 24, 23, 13, 1, 1),
(708, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 51, 24, 23, 13, 1, 1),
(709, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 52, 24, 23, 13, 1, 1),
(710, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 53, 25, 24, 13, 1, 3),
(711, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 54, 25, 24, 13, 1, 1),
(712, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 55, 25, 24, 13, 1, 1),
(713, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 56, 26, 25, 13, 1, 3),
(714, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 57, 26, 25, 13, 1, 4),
(715, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 58, 27, 26, 13, 1, 3),
(716, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 59, 27, 26, 13, 1, 3),
(717, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 60, 27, 26, 13, 1, 3),
(718, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 61, 28, 27, 14, 1, 1),
(719, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 62, 28, 27, 14, 1, 1),
(720, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 63, 29, 27, 14, 1, 1),
(721, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 64, 29, 27, 14, 1, 1),
(722, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 65, 30, 28, 14, 1, 1),
(723, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 66, 30, 28, 14, 1, 1),
(724, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 67, 31, 29, 14, 1, 2),
(725, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 68, 31, 29, 14, 1, 2),
(726, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 69, 32, 29, 14, 1, 2),
(727, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 70, 33, 30, 14, 1, 2),
(728, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 71, 33, 30, 14, 1, 2),
(729, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 72, 33, 30, 14, 1, 4),
(730, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 73, 34, 31, 14, 1, 3),
(731, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 74, 34, 31, 14, 1, 1),
(732, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 75, 34, 31, 14, 1, 1),
(733, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 76, 35, 32, 15, 1, 9),
(734, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 77, 35, 32, 15, 1, 7),
(735, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 78, 36, 32, 15, 1, 8),
(736, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 79, 37, 32, 15, 1, 7),
(737, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 80, 37, 32, 15, 1, 7),
(738, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 81, 37, 32, 15, 1, 8),
(739, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 82, 38, 32, 15, 1, 8),
(740, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 83, 38, 32, 15, 1, 8),
(741, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 84, 39, 33, 15, 1, 7),
(742, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 85, 40, 33, 15, 1, 7),
(743, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 86, 40, 33, 15, 1, 8),
(744, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 87, 40, 33, 15, 1, 8),
(745, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 88, 41, 33, 15, 1, 8),
(746, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 89, 41, 33, 15, 1, 8),
(747, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 90, 42, 34, 16, 1, 12),
(748, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 91, 43, 34, 16, 1, 11),
(749, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 92, 43, 34, 16, 1, 11),
(750, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 93, 43, 34, 16, 1, 11),
(751, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 94, 44, 34, 16, 1, 12),
(752, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 95, 44, 34, 16, 1, 13),
(753, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 96, 45, 35, 16, 1, 12),
(754, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 97, 46, 35, 16, 1, 13),
(755, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 98, 46, 35, 16, 1, 12),
(756, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 99, 46, 35, 16, 1, 14),
(757, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 100, 47, 35, 16, 1, 12),
(758, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 101, 47, 35, 16, 1, 13),
(759, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 102, 48, 36, 17, 1, 2),
(760, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 103, 48, 36, 17, 1, 3),
(761, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 104, 48, 36, 17, 1, 2),
(762, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 105, 49, 37, 17, 1, 1),
(763, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 106, 49, 37, 17, 1, 1),
(764, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 107, 49, 37, 17, 1, 1),
(765, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 108, 49, 37, 17, 1, 1),
(766, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 109, 50, 37, 17, 1, 1),
(767, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 110, 50, 37, 17, 1, 1),
(768, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 111, 51, 38, 18, 1, 8),
(769, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 112, 52, 38, 18, 1, 8),
(770, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 113, 52, 38, 18, 1, 7),
(771, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 114, 53, 38, 18, 1, 7),
(772, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 115, 53, 38, 18, 1, 7),
(773, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 116, 54, 39, 18, 1, 6),
(774, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 117, 55, 39, 18, 1, 6),
(775, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 118, 56, 39, 18, 1, 6),
(776, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 119, 57, 39, 18, 1, 6),
(777, '4eb0dedb-002b-4344-ba8d-41e0d60fd12b', 120, 57, 39, 18, 1, 6),
(778, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 10, 8, 8, 10, 1, 3),
(779, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 11, 8, 8, 10, 1, 3),
(780, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 12, 8, 8, 10, 1, 2),
(781, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 13, 9, 9, 10, 1, 2),
(782, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 14, 10, 10, 10, 1, 4),
(783, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 15, 10, 10, 10, 1, 4),
(784, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 16, 11, 11, 10, 1, 2),
(785, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 17, 11, 11, 10, 1, 3),
(786, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 18, 11, 11, 10, 1, 4),
(787, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 19, 12, 11, 10, 1, 4),
(788, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 20, 12, 11, 10, 1, 3),
(789, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 21, 12, 11, 10, 1, 3),
(790, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 22, 13, 12, 10, 1, 3),
(791, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 23, 13, 12, 10, 1, 4),
(792, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 24, 13, 12, 10, 1, 3),
(793, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 25, 14, 13, 11, 1, 2),
(794, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 26, 15, 14, 11, 1, 2),
(795, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 27, 16, 15, 11, 1, 3),
(796, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 28, 16, 15, 11, 1, 3),
(797, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 29, 16, 15, 11, 1, 4),
(798, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 30, 17, 16, 11, 1, 2),
(799, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 31, 17, 16, 11, 1, 2),
(800, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 32, 17, 16, 11, 1, 2),
(801, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 33, 18, 17, 12, 1, 2),
(802, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 34, 18, 17, 12, 1, 2),
(803, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 35, 19, 18, 12, 1, 3),
(804, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 36, 19, 18, 12, 1, 2),
(805, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 37, 19, 18, 12, 1, 3),
(806, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 38, 20, 19, 12, 1, 4),
(807, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 39, 20, 19, 12, 1, 3),
(808, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 40, 20, 19, 12, 1, 2),
(809, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 41, 21, 20, 12, 1, 3),
(810, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 42, 21, 20, 12, 1, 2),
(811, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 43, 21, 20, 12, 1, 2),
(812, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 44, 22, 21, 12, 1, 2),
(813, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 45, 22, 21, 12, 1, 3),
(814, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 46, 22, 21, 12, 1, 2),
(815, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 47, 22, 21, 12, 1, 3),
(816, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 48, 23, 22, 13, 1, 3),
(817, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 49, 23, 22, 13, 1, 3),
(818, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 50, 24, 23, 13, 1, 2),
(819, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 51, 24, 23, 13, 1, 2),
(820, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 52, 24, 23, 13, 1, 3),
(821, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 53, 25, 24, 13, 1, 2),
(822, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 54, 25, 24, 13, 1, 2),
(823, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 55, 25, 24, 13, 1, 2),
(824, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 56, 26, 25, 13, 1, 3),
(825, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 57, 26, 25, 13, 1, 3),
(826, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 58, 27, 26, 13, 1, 3),
(827, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 59, 27, 26, 13, 1, 2),
(828, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 60, 27, 26, 13, 1, 4),
(829, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 61, 28, 27, 14, 1, 2),
(830, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 62, 28, 27, 14, 1, 2),
(831, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 63, 29, 27, 14, 1, 2),
(832, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 64, 29, 27, 14, 1, 1),
(833, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 65, 30, 28, 14, 1, 2),
(834, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 66, 30, 28, 14, 1, 2),
(835, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 67, 31, 29, 14, 1, 2),
(836, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 68, 31, 29, 14, 1, 2),
(837, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 69, 32, 29, 14, 1, 2),
(838, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 70, 33, 30, 14, 1, 2),
(839, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 71, 33, 30, 14, 1, 2),
(840, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 72, 33, 30, 14, 1, 3),
(841, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 73, 34, 31, 14, 1, 3),
(842, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 74, 34, 31, 14, 1, 3),
(843, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 75, 34, 31, 14, 1, 3),
(844, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 76, 35, 32, 15, 1, 8),
(845, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 77, 35, 32, 15, 1, 7),
(846, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 78, 36, 32, 15, 1, 7),
(847, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 79, 37, 32, 15, 1, 6),
(848, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 80, 37, 32, 15, 1, 6),
(849, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 81, 37, 32, 15, 1, 6),
(850, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 82, 38, 32, 15, 1, 6),
(851, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 83, 38, 32, 15, 1, 6),
(852, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 84, 39, 33, 15, 1, 6);
INSERT INTO `responses_people` (`idresppeo`, `hash`, `pcsp_questions`, `pcs_process`, `pc_subcriteria`, `period_criteria`, `period`, `type_answer`) VALUES
(853, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 85, 40, 33, 15, 1, 8),
(854, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 86, 40, 33, 15, 1, 9),
(855, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 87, 40, 33, 15, 1, 8),
(856, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 88, 41, 33, 15, 1, 7),
(857, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 89, 41, 33, 15, 1, 8),
(858, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 90, 42, 34, 16, 1, 12),
(859, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 91, 43, 34, 16, 1, 12),
(860, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 92, 43, 34, 16, 1, 12),
(861, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 93, 43, 34, 16, 1, 13),
(862, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 94, 44, 34, 16, 1, 11),
(863, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 95, 44, 34, 16, 1, 11),
(864, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 96, 45, 35, 16, 1, 11),
(865, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 97, 46, 35, 16, 1, 11),
(866, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 98, 46, 35, 16, 1, 11),
(867, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 99, 46, 35, 16, 1, 11),
(868, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 100, 47, 35, 16, 1, 11),
(869, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 101, 47, 35, 16, 1, 11),
(870, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 102, 48, 36, 17, 1, 2),
(871, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 103, 48, 36, 17, 1, 3),
(872, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 104, 48, 36, 17, 1, 3),
(873, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 105, 49, 37, 17, 1, 1),
(874, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 106, 49, 37, 17, 1, 1),
(875, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 107, 49, 37, 17, 1, 1),
(876, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 108, 49, 37, 17, 1, 1),
(877, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 109, 50, 37, 17, 1, 1),
(878, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 110, 50, 37, 17, 1, 1),
(879, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 111, 51, 38, 18, 1, 6),
(880, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 112, 52, 38, 18, 1, 7),
(881, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 113, 52, 38, 18, 1, 8),
(882, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 114, 53, 38, 18, 1, 7),
(883, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 115, 53, 38, 18, 1, 8),
(884, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 116, 54, 39, 18, 1, 6),
(885, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 117, 55, 39, 18, 1, 6),
(886, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 118, 56, 39, 18, 1, 6),
(887, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 119, 57, 39, 18, 1, 6),
(888, '960df720-23e9-4b9b-9e4b-e1f88dfd0f27', 120, 57, 39, 18, 1, 6),
(889, 'ac11bf2f-867e-4797-aa60-02af2287f558', 10, 8, 8, 10, 1, 2),
(890, 'ac11bf2f-867e-4797-aa60-02af2287f558', 11, 8, 8, 10, 1, 3),
(891, 'ac11bf2f-867e-4797-aa60-02af2287f558', 12, 8, 8, 10, 1, 3),
(892, 'ac11bf2f-867e-4797-aa60-02af2287f558', 13, 9, 9, 10, 1, 1),
(893, 'ac11bf2f-867e-4797-aa60-02af2287f558', 14, 10, 10, 10, 1, 3),
(894, 'ac11bf2f-867e-4797-aa60-02af2287f558', 15, 10, 10, 10, 1, 2),
(895, 'ac11bf2f-867e-4797-aa60-02af2287f558', 16, 11, 11, 10, 1, 3),
(896, 'ac11bf2f-867e-4797-aa60-02af2287f558', 17, 11, 11, 10, 1, 2),
(897, 'ac11bf2f-867e-4797-aa60-02af2287f558', 18, 11, 11, 10, 1, 2),
(898, 'ac11bf2f-867e-4797-aa60-02af2287f558', 19, 12, 11, 10, 1, 3),
(899, 'ac11bf2f-867e-4797-aa60-02af2287f558', 20, 12, 11, 10, 1, 3),
(900, 'ac11bf2f-867e-4797-aa60-02af2287f558', 21, 12, 11, 10, 1, 3),
(901, 'ac11bf2f-867e-4797-aa60-02af2287f558', 22, 13, 12, 10, 1, 3),
(902, 'ac11bf2f-867e-4797-aa60-02af2287f558', 23, 13, 12, 10, 1, 3),
(903, 'ac11bf2f-867e-4797-aa60-02af2287f558', 24, 13, 12, 10, 1, 1),
(904, 'ac11bf2f-867e-4797-aa60-02af2287f558', 25, 14, 13, 11, 1, 2),
(905, 'ac11bf2f-867e-4797-aa60-02af2287f558', 26, 15, 14, 11, 1, 1),
(906, 'ac11bf2f-867e-4797-aa60-02af2287f558', 27, 16, 15, 11, 1, 2),
(907, 'ac11bf2f-867e-4797-aa60-02af2287f558', 28, 16, 15, 11, 1, 2),
(908, 'ac11bf2f-867e-4797-aa60-02af2287f558', 29, 16, 15, 11, 1, 1),
(909, 'ac11bf2f-867e-4797-aa60-02af2287f558', 30, 17, 16, 11, 1, 1),
(910, 'ac11bf2f-867e-4797-aa60-02af2287f558', 31, 17, 16, 11, 1, 2),
(911, 'ac11bf2f-867e-4797-aa60-02af2287f558', 32, 17, 16, 11, 1, 1),
(912, 'ac11bf2f-867e-4797-aa60-02af2287f558', 33, 18, 17, 12, 1, 2),
(913, 'ac11bf2f-867e-4797-aa60-02af2287f558', 34, 18, 17, 12, 1, 1),
(914, 'ac11bf2f-867e-4797-aa60-02af2287f558', 35, 19, 18, 12, 1, 3),
(915, 'ac11bf2f-867e-4797-aa60-02af2287f558', 36, 19, 18, 12, 1, 2),
(916, 'ac11bf2f-867e-4797-aa60-02af2287f558', 37, 19, 18, 12, 1, 2),
(917, 'ac11bf2f-867e-4797-aa60-02af2287f558', 38, 20, 19, 12, 1, 3),
(918, 'ac11bf2f-867e-4797-aa60-02af2287f558', 39, 20, 19, 12, 1, 3),
(919, 'ac11bf2f-867e-4797-aa60-02af2287f558', 40, 20, 19, 12, 1, 2),
(920, 'ac11bf2f-867e-4797-aa60-02af2287f558', 41, 21, 20, 12, 1, 3),
(921, 'ac11bf2f-867e-4797-aa60-02af2287f558', 42, 21, 20, 12, 1, 2),
(922, 'ac11bf2f-867e-4797-aa60-02af2287f558', 43, 21, 20, 12, 1, 1),
(923, 'ac11bf2f-867e-4797-aa60-02af2287f558', 44, 22, 21, 12, 1, 2),
(924, 'ac11bf2f-867e-4797-aa60-02af2287f558', 45, 22, 21, 12, 1, 1),
(925, 'ac11bf2f-867e-4797-aa60-02af2287f558', 46, 22, 21, 12, 1, 2),
(926, 'ac11bf2f-867e-4797-aa60-02af2287f558', 47, 22, 21, 12, 1, 2),
(927, 'ac11bf2f-867e-4797-aa60-02af2287f558', 48, 23, 22, 13, 1, 3),
(928, 'ac11bf2f-867e-4797-aa60-02af2287f558', 49, 23, 22, 13, 1, 3),
(929, 'ac11bf2f-867e-4797-aa60-02af2287f558', 50, 24, 23, 13, 1, 1),
(930, 'ac11bf2f-867e-4797-aa60-02af2287f558', 51, 24, 23, 13, 1, 1),
(931, 'ac11bf2f-867e-4797-aa60-02af2287f558', 52, 24, 23, 13, 1, 1),
(932, 'ac11bf2f-867e-4797-aa60-02af2287f558', 53, 25, 24, 13, 1, 2),
(933, 'ac11bf2f-867e-4797-aa60-02af2287f558', 54, 25, 24, 13, 1, 1),
(934, 'ac11bf2f-867e-4797-aa60-02af2287f558', 55, 25, 24, 13, 1, 1),
(935, 'ac11bf2f-867e-4797-aa60-02af2287f558', 56, 26, 25, 13, 1, 3),
(936, 'ac11bf2f-867e-4797-aa60-02af2287f558', 57, 26, 25, 13, 1, 3),
(937, 'ac11bf2f-867e-4797-aa60-02af2287f558', 58, 27, 26, 13, 1, 2),
(938, 'ac11bf2f-867e-4797-aa60-02af2287f558', 59, 27, 26, 13, 1, 3),
(939, 'ac11bf2f-867e-4797-aa60-02af2287f558', 60, 27, 26, 13, 1, 3),
(940, 'ac11bf2f-867e-4797-aa60-02af2287f558', 61, 28, 27, 14, 1, 1),
(941, 'ac11bf2f-867e-4797-aa60-02af2287f558', 62, 28, 27, 14, 1, 1),
(942, 'ac11bf2f-867e-4797-aa60-02af2287f558', 63, 29, 27, 14, 1, 1),
(943, 'ac11bf2f-867e-4797-aa60-02af2287f558', 64, 29, 27, 14, 1, 1),
(944, 'ac11bf2f-867e-4797-aa60-02af2287f558', 65, 30, 28, 14, 1, 1),
(945, 'ac11bf2f-867e-4797-aa60-02af2287f558', 66, 30, 28, 14, 1, 1),
(946, 'ac11bf2f-867e-4797-aa60-02af2287f558', 67, 31, 29, 14, 1, 2),
(947, 'ac11bf2f-867e-4797-aa60-02af2287f558', 68, 31, 29, 14, 1, 2),
(948, 'ac11bf2f-867e-4797-aa60-02af2287f558', 69, 32, 29, 14, 1, 2),
(949, 'ac11bf2f-867e-4797-aa60-02af2287f558', 70, 33, 30, 14, 1, 2),
(950, 'ac11bf2f-867e-4797-aa60-02af2287f558', 71, 33, 30, 14, 1, 2),
(951, 'ac11bf2f-867e-4797-aa60-02af2287f558', 72, 33, 30, 14, 1, 3),
(952, 'ac11bf2f-867e-4797-aa60-02af2287f558', 73, 34, 31, 14, 1, 2),
(953, 'ac11bf2f-867e-4797-aa60-02af2287f558', 74, 34, 31, 14, 1, 3),
(954, 'ac11bf2f-867e-4797-aa60-02af2287f558', 75, 34, 31, 14, 1, 1),
(955, 'ac11bf2f-867e-4797-aa60-02af2287f558', 76, 35, 32, 15, 1, 8),
(956, 'ac11bf2f-867e-4797-aa60-02af2287f558', 77, 35, 32, 15, 1, 6),
(957, 'ac11bf2f-867e-4797-aa60-02af2287f558', 78, 36, 32, 15, 1, 7),
(958, 'ac11bf2f-867e-4797-aa60-02af2287f558', 79, 37, 32, 15, 1, 6),
(959, 'ac11bf2f-867e-4797-aa60-02af2287f558', 80, 37, 32, 15, 1, 6),
(960, 'ac11bf2f-867e-4797-aa60-02af2287f558', 81, 37, 32, 15, 1, 6),
(961, 'ac11bf2f-867e-4797-aa60-02af2287f558', 82, 38, 32, 15, 1, 6),
(962, 'ac11bf2f-867e-4797-aa60-02af2287f558', 83, 38, 32, 15, 1, 6),
(963, 'ac11bf2f-867e-4797-aa60-02af2287f558', 84, 39, 33, 15, 1, 6),
(964, 'ac11bf2f-867e-4797-aa60-02af2287f558', 85, 40, 33, 15, 1, 6),
(965, 'ac11bf2f-867e-4797-aa60-02af2287f558', 86, 40, 33, 15, 1, 6),
(966, 'ac11bf2f-867e-4797-aa60-02af2287f558', 87, 40, 33, 15, 1, 6),
(967, 'ac11bf2f-867e-4797-aa60-02af2287f558', 88, 41, 33, 15, 1, 6),
(968, 'ac11bf2f-867e-4797-aa60-02af2287f558', 89, 41, 33, 15, 1, 6),
(969, 'ac11bf2f-867e-4797-aa60-02af2287f558', 90, 42, 34, 16, 1, 11),
(970, 'ac11bf2f-867e-4797-aa60-02af2287f558', 91, 43, 34, 16, 1, 11),
(971, 'ac11bf2f-867e-4797-aa60-02af2287f558', 92, 43, 34, 16, 1, 11),
(972, 'ac11bf2f-867e-4797-aa60-02af2287f558', 93, 43, 34, 16, 1, 11),
(973, 'ac11bf2f-867e-4797-aa60-02af2287f558', 94, 44, 34, 16, 1, 11),
(974, 'ac11bf2f-867e-4797-aa60-02af2287f558', 95, 44, 34, 16, 1, 11),
(975, 'ac11bf2f-867e-4797-aa60-02af2287f558', 96, 45, 35, 16, 1, 11),
(976, 'ac11bf2f-867e-4797-aa60-02af2287f558', 97, 46, 35, 16, 1, 11),
(977, 'ac11bf2f-867e-4797-aa60-02af2287f558', 98, 46, 35, 16, 1, 11),
(978, 'ac11bf2f-867e-4797-aa60-02af2287f558', 99, 46, 35, 16, 1, 11),
(979, 'ac11bf2f-867e-4797-aa60-02af2287f558', 100, 47, 35, 16, 1, 11),
(980, 'ac11bf2f-867e-4797-aa60-02af2287f558', 101, 47, 35, 16, 1, 11),
(981, 'ac11bf2f-867e-4797-aa60-02af2287f558', 102, 48, 36, 17, 1, 2),
(982, 'ac11bf2f-867e-4797-aa60-02af2287f558', 103, 48, 36, 17, 1, 2),
(983, 'ac11bf2f-867e-4797-aa60-02af2287f558', 104, 48, 36, 17, 1, 1),
(984, 'ac11bf2f-867e-4797-aa60-02af2287f558', 105, 49, 37, 17, 1, 1),
(985, 'ac11bf2f-867e-4797-aa60-02af2287f558', 106, 49, 37, 17, 1, 1),
(986, 'ac11bf2f-867e-4797-aa60-02af2287f558', 107, 49, 37, 17, 1, 1),
(987, 'ac11bf2f-867e-4797-aa60-02af2287f558', 108, 49, 37, 17, 1, 1),
(988, 'ac11bf2f-867e-4797-aa60-02af2287f558', 109, 50, 37, 17, 1, 1),
(989, 'ac11bf2f-867e-4797-aa60-02af2287f558', 110, 50, 37, 17, 1, 1),
(990, 'ac11bf2f-867e-4797-aa60-02af2287f558', 111, 51, 38, 18, 1, 7),
(991, 'ac11bf2f-867e-4797-aa60-02af2287f558', 112, 52, 38, 18, 1, 8),
(992, 'ac11bf2f-867e-4797-aa60-02af2287f558', 113, 52, 38, 18, 1, 8),
(993, 'ac11bf2f-867e-4797-aa60-02af2287f558', 114, 53, 38, 18, 1, 6),
(994, 'ac11bf2f-867e-4797-aa60-02af2287f558', 115, 53, 38, 18, 1, 6),
(995, 'ac11bf2f-867e-4797-aa60-02af2287f558', 116, 54, 39, 18, 1, 6),
(996, 'ac11bf2f-867e-4797-aa60-02af2287f558', 117, 55, 39, 18, 1, 6),
(997, 'ac11bf2f-867e-4797-aa60-02af2287f558', 118, 56, 39, 18, 1, 6),
(998, 'ac11bf2f-867e-4797-aa60-02af2287f558', 119, 57, 39, 18, 1, 6),
(999, 'ac11bf2f-867e-4797-aa60-02af2287f558', 120, 57, 39, 18, 1, 6),
(1000, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 121, 58, 40, 19, 3, 4),
(1001, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 122, 58, 40, 19, 3, 4),
(1002, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 123, 58, 40, 19, 3, 3),
(1003, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 124, 59, 41, 19, 3, 3),
(1004, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 125, 60, 42, 19, 3, 3),
(1005, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 126, 60, 42, 19, 3, 3),
(1006, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 127, 61, 43, 19, 3, 4),
(1007, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 128, 61, 43, 19, 3, 3),
(1008, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 129, 61, 43, 19, 3, 3),
(1009, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 130, 62, 43, 19, 3, 3),
(1010, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 131, 62, 43, 19, 3, 2),
(1011, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 132, 62, 43, 19, 3, 3),
(1012, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 133, 63, 44, 19, 3, 4),
(1013, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 134, 63, 44, 19, 3, 3),
(1014, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 135, 63, 44, 19, 3, 2),
(1015, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 136, 64, 45, 20, 3, 2),
(1016, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 137, 65, 46, 20, 3, 2),
(1017, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 138, 66, 47, 20, 3, 4),
(1018, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 139, 66, 47, 20, 3, 4),
(1019, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 140, 66, 47, 20, 3, 3),
(1020, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 141, 67, 48, 20, 3, 4),
(1021, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 142, 67, 48, 20, 3, 3),
(1022, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 143, 67, 48, 20, 3, 3),
(1023, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 144, 68, 49, 21, 3, 3),
(1024, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 145, 68, 49, 21, 3, 3),
(1025, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 146, 69, 50, 21, 3, 3),
(1026, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 147, 69, 50, 21, 3, 3),
(1027, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 148, 69, 50, 21, 3, 2),
(1028, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 149, 70, 51, 21, 3, 2),
(1029, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 150, 70, 51, 21, 3, 3),
(1030, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 151, 70, 51, 21, 3, 2),
(1031, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 152, 71, 52, 21, 3, 3),
(1032, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 153, 71, 52, 21, 3, 3),
(1033, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 154, 71, 52, 21, 3, 2),
(1034, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 155, 72, 53, 21, 3, 4),
(1035, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 156, 72, 53, 21, 3, 3),
(1036, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 157, 72, 53, 21, 3, 3),
(1037, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 158, 72, 53, 21, 3, 4),
(1038, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 159, 73, 54, 22, 3, 4),
(1039, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 160, 73, 54, 22, 3, 4),
(1040, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 161, 74, 55, 22, 3, 4),
(1041, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 162, 74, 55, 22, 3, 4),
(1042, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 163, 74, 55, 22, 3, 3),
(1043, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 164, 75, 56, 22, 3, 3),
(1044, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 165, 75, 56, 22, 3, 3),
(1045, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 166, 75, 56, 22, 3, 2),
(1046, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 167, 76, 57, 22, 3, 4),
(1047, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 168, 76, 57, 22, 3, 4),
(1048, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 169, 77, 58, 22, 3, 4),
(1049, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 170, 77, 58, 22, 3, 3),
(1050, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 171, 77, 58, 22, 3, 5),
(1051, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 172, 78, 59, 23, 3, 3),
(1052, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 173, 78, 59, 23, 3, 3),
(1053, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 174, 79, 59, 23, 3, 2),
(1054, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 175, 79, 59, 23, 3, 2),
(1055, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 176, 80, 60, 23, 3, 2),
(1056, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 177, 80, 60, 23, 3, 3),
(1057, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 178, 81, 61, 23, 3, 2),
(1058, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 179, 81, 61, 23, 3, 3),
(1059, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 180, 82, 61, 23, 3, 3),
(1060, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 181, 83, 62, 23, 3, 4),
(1061, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 182, 83, 62, 23, 3, 5),
(1062, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 183, 83, 62, 23, 3, 5),
(1063, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 184, 84, 63, 23, 3, 4),
(1064, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 185, 84, 63, 23, 3, 3),
(1065, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 186, 84, 63, 23, 3, 3),
(1066, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 187, 85, 64, 24, 3, 9),
(1067, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 188, 85, 64, 24, 3, 8),
(1068, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 189, 86, 64, 24, 3, 8),
(1069, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 190, 87, 64, 24, 3, 7),
(1070, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 191, 87, 64, 24, 3, 7),
(1071, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 192, 87, 64, 24, 3, 6),
(1072, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 193, 88, 64, 24, 3, 7),
(1073, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 194, 88, 64, 24, 3, 9),
(1074, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 195, 89, 65, 24, 3, 9),
(1075, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 196, 90, 65, 24, 3, 8),
(1076, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 197, 90, 65, 24, 3, 9),
(1077, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 198, 90, 65, 24, 3, 8),
(1078, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 199, 91, 65, 24, 3, 7),
(1079, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 200, 91, 65, 24, 3, 8),
(1080, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 201, 92, 66, 25, 3, 13),
(1081, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 202, 93, 66, 25, 3, 13),
(1082, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 203, 93, 66, 25, 3, 11),
(1083, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 204, 93, 66, 25, 3, 11),
(1084, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 205, 94, 66, 25, 3, 11),
(1085, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 206, 94, 66, 25, 3, 11),
(1086, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 207, 95, 67, 25, 3, 13),
(1087, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 208, 96, 67, 25, 3, 11),
(1088, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 209, 96, 67, 25, 3, 11),
(1089, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 210, 96, 67, 25, 3, 11),
(1090, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 211, 97, 67, 25, 3, 11),
(1091, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 212, 97, 67, 25, 3, 11),
(1092, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 213, 98, 68, 26, 3, 4),
(1093, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 214, 98, 68, 26, 3, 1),
(1094, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 215, 98, 68, 26, 3, 3),
(1095, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 216, 99, 69, 26, 3, 3),
(1096, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 217, 99, 69, 26, 3, 1),
(1097, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 218, 99, 69, 26, 3, 1),
(1098, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 219, 99, 69, 26, 3, 1),
(1099, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 220, 100, 69, 26, 3, 3),
(1100, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 221, 100, 69, 26, 3, 4),
(1101, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 222, 101, 70, 27, 3, 9),
(1102, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 223, 102, 70, 27, 3, 8),
(1103, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 224, 102, 70, 27, 3, 9),
(1104, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 225, 103, 70, 27, 3, 8),
(1105, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 226, 103, 70, 27, 3, 9),
(1106, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 227, 104, 71, 27, 3, 8),
(1107, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 228, 105, 71, 27, 3, 9),
(1108, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 229, 106, 71, 27, 3, 9),
(1109, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 230, 107, 71, 27, 3, 6),
(1110, '12cda48d-47c0-4ba3-93f3-04d9660f2ceb', 231, 107, 71, 27, 3, 6),
(1111, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 121, 58, 40, 19, 3, 5),
(1112, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 122, 58, 40, 19, 3, 5),
(1113, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 123, 58, 40, 19, 3, 5),
(1114, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 124, 59, 41, 19, 3, 5),
(1115, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 125, 60, 42, 19, 3, 5),
(1116, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 126, 60, 42, 19, 3, 5),
(1117, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 127, 61, 43, 19, 3, 5),
(1118, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 128, 61, 43, 19, 3, 5),
(1119, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 129, 61, 43, 19, 3, 5),
(1120, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 130, 62, 43, 19, 3, 5),
(1121, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 131, 62, 43, 19, 3, 5),
(1122, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 132, 62, 43, 19, 3, 5),
(1123, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 133, 63, 44, 19, 3, 5),
(1124, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 134, 63, 44, 19, 3, 5),
(1125, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 135, 63, 44, 19, 3, 5),
(1126, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 136, 64, 45, 20, 3, 5),
(1127, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 137, 65, 46, 20, 3, 4),
(1128, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 138, 66, 47, 20, 3, 5),
(1129, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 139, 66, 47, 20, 3, 5),
(1130, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 140, 66, 47, 20, 3, 5),
(1131, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 141, 67, 48, 20, 3, 5),
(1132, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 142, 67, 48, 20, 3, 3),
(1133, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 143, 67, 48, 20, 3, 4),
(1134, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 144, 68, 49, 21, 3, 1),
(1135, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 145, 68, 49, 21, 3, 1),
(1136, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 146, 69, 50, 21, 3, 1),
(1137, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 147, 69, 50, 21, 3, 1),
(1138, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 148, 69, 50, 21, 3, 1),
(1139, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 149, 70, 51, 21, 3, 1),
(1140, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 150, 70, 51, 21, 3, 1),
(1141, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 151, 70, 51, 21, 3, 1),
(1142, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 152, 71, 52, 21, 3, 1),
(1143, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 153, 71, 52, 21, 3, 1),
(1144, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 154, 71, 52, 21, 3, 1),
(1145, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 155, 72, 53, 21, 3, 1),
(1146, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 156, 72, 53, 21, 3, 1),
(1147, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 157, 72, 53, 21, 3, 1),
(1148, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 158, 72, 53, 21, 3, 1),
(1149, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 159, 73, 54, 22, 3, 1),
(1150, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 160, 73, 54, 22, 3, 1),
(1151, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 161, 74, 55, 22, 3, 1),
(1152, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 162, 74, 55, 22, 3, 1),
(1153, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 163, 74, 55, 22, 3, 1),
(1154, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 164, 75, 56, 22, 3, 1),
(1155, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 165, 75, 56, 22, 3, 1),
(1156, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 166, 75, 56, 22, 3, 1),
(1157, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 167, 76, 57, 22, 3, 1),
(1158, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 168, 76, 57, 22, 3, 1),
(1159, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 169, 77, 58, 22, 3, 1),
(1160, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 170, 77, 58, 22, 3, 1),
(1161, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 171, 77, 58, 22, 3, 1),
(1162, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 172, 78, 59, 23, 3, 1),
(1163, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 173, 78, 59, 23, 3, 1),
(1164, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 174, 79, 59, 23, 3, 1),
(1165, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 175, 79, 59, 23, 3, 1),
(1166, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 176, 80, 60, 23, 3, 1),
(1167, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 177, 80, 60, 23, 3, 1),
(1168, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 178, 81, 61, 23, 3, 1),
(1169, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 179, 81, 61, 23, 3, 1),
(1170, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 180, 82, 61, 23, 3, 1),
(1171, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 181, 83, 62, 23, 3, 1),
(1172, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 182, 83, 62, 23, 3, 1),
(1173, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 183, 83, 62, 23, 3, 1),
(1174, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 184, 84, 63, 23, 3, 1),
(1175, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 185, 84, 63, 23, 3, 1),
(1176, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 186, 84, 63, 23, 3, 1),
(1177, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 187, 85, 64, 24, 3, 7),
(1178, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 188, 85, 64, 24, 3, 6),
(1179, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 189, 86, 64, 24, 3, 6),
(1180, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 190, 87, 64, 24, 3, 6),
(1181, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 191, 87, 64, 24, 3, 6),
(1182, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 192, 87, 64, 24, 3, 6),
(1183, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 193, 88, 64, 24, 3, 6),
(1184, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 194, 88, 64, 24, 3, 6),
(1185, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 195, 89, 65, 24, 3, 6),
(1186, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 196, 90, 65, 24, 3, 6),
(1187, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 197, 90, 65, 24, 3, 6),
(1188, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 198, 90, 65, 24, 3, 6),
(1189, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 199, 91, 65, 24, 3, 6),
(1190, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 200, 91, 65, 24, 3, 6),
(1191, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 201, 92, 66, 25, 3, 11),
(1192, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 202, 93, 66, 25, 3, 11),
(1193, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 203, 93, 66, 25, 3, 11),
(1194, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 204, 93, 66, 25, 3, 11),
(1195, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 205, 94, 66, 25, 3, 11),
(1196, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 206, 94, 66, 25, 3, 11),
(1197, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 207, 95, 67, 25, 3, 11),
(1198, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 208, 96, 67, 25, 3, 11),
(1199, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 209, 96, 67, 25, 3, 11),
(1200, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 210, 96, 67, 25, 3, 11),
(1201, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 211, 97, 67, 25, 3, 11),
(1202, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 212, 97, 67, 25, 3, 11),
(1203, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 213, 98, 68, 26, 3, 1),
(1204, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 214, 98, 68, 26, 3, 1),
(1205, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 215, 98, 68, 26, 3, 1),
(1206, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 216, 99, 69, 26, 3, 1),
(1207, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 217, 99, 69, 26, 3, 1),
(1208, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 218, 99, 69, 26, 3, 1),
(1209, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 219, 99, 69, 26, 3, 1),
(1210, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 220, 100, 69, 26, 3, 1),
(1211, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 221, 100, 69, 26, 3, 1),
(1212, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 222, 101, 70, 27, 3, 6),
(1213, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 223, 102, 70, 27, 3, 6),
(1214, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 224, 102, 70, 27, 3, 9),
(1215, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 225, 103, 70, 27, 3, 6),
(1216, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 226, 103, 70, 27, 3, 6),
(1217, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 227, 104, 71, 27, 3, 6),
(1218, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 228, 105, 71, 27, 3, 6),
(1219, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 229, 106, 71, 27, 3, 6),
(1220, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 230, 107, 71, 27, 3, 6),
(1221, '9d305eb4-6dc4-4bed-89d8-24ee31d589c4', 231, 107, 71, 27, 3, 6),
(1222, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 121, 58, 40, 19, 3, 4),
(1223, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 122, 58, 40, 19, 3, 4),
(1224, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 123, 58, 40, 19, 3, 3),
(1225, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 124, 59, 41, 19, 3, 3),
(1226, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 125, 60, 42, 19, 3, 5),
(1227, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 126, 60, 42, 19, 3, 4),
(1228, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 127, 61, 43, 19, 3, 5),
(1229, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 128, 61, 43, 19, 3, 5),
(1230, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 129, 61, 43, 19, 3, 5),
(1231, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 130, 62, 43, 19, 3, 3),
(1232, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 131, 62, 43, 19, 3, 5),
(1233, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 132, 62, 43, 19, 3, 2),
(1234, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 133, 63, 44, 19, 3, 4),
(1235, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 134, 63, 44, 19, 3, 4),
(1236, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 135, 63, 44, 19, 3, 1),
(1237, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 136, 64, 45, 20, 3, 4),
(1238, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 137, 65, 46, 20, 3, 4),
(1239, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 138, 66, 47, 20, 3, 3),
(1240, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 139, 66, 47, 20, 3, 4),
(1241, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 140, 66, 47, 20, 3, 4),
(1242, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 141, 67, 48, 20, 3, 4),
(1243, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 142, 67, 48, 20, 3, 4),
(1244, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 143, 67, 48, 20, 3, 2),
(1245, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 144, 68, 49, 21, 3, 5),
(1246, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 145, 68, 49, 21, 3, 5),
(1247, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 146, 69, 50, 21, 3, 4),
(1248, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 147, 69, 50, 21, 3, 5),
(1249, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 148, 69, 50, 21, 3, 4),
(1250, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 149, 70, 51, 21, 3, 5),
(1251, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 150, 70, 51, 21, 3, 5),
(1252, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 151, 70, 51, 21, 3, 4),
(1253, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 152, 71, 52, 21, 3, 4),
(1254, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 153, 71, 52, 21, 3, 5),
(1255, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 154, 71, 52, 21, 3, 5),
(1256, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 155, 72, 53, 21, 3, 4),
(1257, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 156, 72, 53, 21, 3, 1),
(1258, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 157, 72, 53, 21, 3, 2),
(1259, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 158, 72, 53, 21, 3, 4),
(1260, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 159, 73, 54, 22, 3, 5),
(1261, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 160, 73, 54, 22, 3, 5),
(1262, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 161, 74, 55, 22, 3, 5),
(1263, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 162, 74, 55, 22, 3, 5),
(1264, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 163, 74, 55, 22, 3, 5),
(1265, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 164, 75, 56, 22, 3, 3),
(1266, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 165, 75, 56, 22, 3, 2),
(1267, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 166, 75, 56, 22, 3, 1),
(1268, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 167, 76, 57, 22, 3, 3),
(1269, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 168, 76, 57, 22, 3, 4),
(1270, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 169, 77, 58, 22, 3, 5),
(1271, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 170, 77, 58, 22, 3, 4),
(1272, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 171, 77, 58, 22, 3, 4),
(1273, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 172, 78, 59, 23, 3, 5),
(1274, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 173, 78, 59, 23, 3, 5),
(1275, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 174, 79, 59, 23, 3, 1),
(1276, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 175, 79, 59, 23, 3, 3),
(1277, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 176, 80, 60, 23, 3, 4),
(1278, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 177, 80, 60, 23, 3, 4),
(1279, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 178, 81, 61, 23, 3, 4),
(1280, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 179, 81, 61, 23, 3, 2),
(1281, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 180, 82, 61, 23, 3, 4),
(1282, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 181, 83, 62, 23, 3, 4),
(1283, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 182, 83, 62, 23, 3, 5),
(1284, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 183, 83, 62, 23, 3, 5),
(1285, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 184, 84, 63, 23, 3, 5),
(1286, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 185, 84, 63, 23, 3, 5),
(1287, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 186, 84, 63, 23, 3, 4),
(1288, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 187, 85, 64, 24, 3, 9),
(1289, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 188, 85, 64, 24, 3, 9),
(1290, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 189, 86, 64, 24, 3, 8),
(1291, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 190, 87, 64, 24, 3, 6),
(1292, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 191, 87, 64, 24, 3, 6),
(1293, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 192, 87, 64, 24, 3, 6),
(1294, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 193, 88, 64, 24, 3, 6),
(1295, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 194, 88, 64, 24, 3, 6),
(1296, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 195, 89, 65, 24, 3, 6),
(1297, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 196, 90, 65, 24, 3, 6),
(1298, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 197, 90, 65, 24, 3, 6),
(1299, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 198, 90, 65, 24, 3, 6),
(1300, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 199, 91, 65, 24, 3, 6),
(1301, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 200, 91, 65, 24, 3, 6),
(1302, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 201, 92, 66, 25, 3, 14),
(1303, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 202, 93, 66, 25, 3, 11),
(1304, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 203, 93, 66, 25, 3, 11),
(1305, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 204, 93, 66, 25, 3, 11),
(1306, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 205, 94, 66, 25, 3, 11),
(1307, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 206, 94, 66, 25, 3, 11),
(1308, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 207, 95, 67, 25, 3, 11),
(1309, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 208, 96, 67, 25, 3, 11),
(1310, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 209, 96, 67, 25, 3, 11),
(1311, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 210, 96, 67, 25, 3, 11),
(1312, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 211, 97, 67, 25, 3, 11),
(1313, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 212, 97, 67, 25, 3, 11),
(1314, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 213, 98, 68, 26, 3, 1),
(1315, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 214, 98, 68, 26, 3, 1),
(1316, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 215, 98, 68, 26, 3, 1),
(1317, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 216, 99, 69, 26, 3, 1),
(1318, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 217, 99, 69, 26, 3, 1),
(1319, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 218, 99, 69, 26, 3, 1),
(1320, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 219, 99, 69, 26, 3, 1),
(1321, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 220, 100, 69, 26, 3, 1),
(1322, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 221, 100, 69, 26, 3, 1),
(1323, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 222, 101, 70, 27, 3, 9),
(1324, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 223, 102, 70, 27, 3, 10),
(1325, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 224, 102, 70, 27, 3, 8),
(1326, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 225, 103, 70, 27, 3, 7),
(1327, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 226, 103, 70, 27, 3, 7),
(1328, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 227, 104, 71, 27, 3, 6),
(1329, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 228, 105, 71, 27, 3, 6),
(1330, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 229, 106, 71, 27, 3, 6),
(1331, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 230, 107, 71, 27, 3, 6),
(1332, '5ae5a4c5-7c26-4659-ba0c-d07253ecc515', 231, 107, 71, 27, 3, 6),
(1333, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 121, 58, 40, 19, 3, 2),
(1334, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 122, 58, 40, 19, 3, 3),
(1335, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 123, 58, 40, 19, 3, 4),
(1336, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 124, 59, 41, 19, 3, 4),
(1337, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 125, 60, 42, 19, 3, 4),
(1338, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 126, 60, 42, 19, 3, 3),
(1339, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 127, 61, 43, 19, 3, 3),
(1340, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 128, 61, 43, 19, 3, 3),
(1341, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 129, 61, 43, 19, 3, 4),
(1342, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 130, 62, 43, 19, 3, 4),
(1343, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 131, 62, 43, 19, 3, 4),
(1344, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 132, 62, 43, 19, 3, 3),
(1345, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 133, 63, 44, 19, 3, 3),
(1346, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 134, 63, 44, 19, 3, 3),
(1347, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 135, 63, 44, 19, 3, 2),
(1348, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 136, 64, 45, 20, 3, 4),
(1349, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 137, 65, 46, 20, 3, 5),
(1350, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 138, 66, 47, 20, 3, 5),
(1351, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 139, 66, 47, 20, 3, 4),
(1352, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 140, 66, 47, 20, 3, 5),
(1353, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 141, 67, 48, 20, 3, 4),
(1354, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 142, 67, 48, 20, 3, 4),
(1355, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 143, 67, 48, 20, 3, 4),
(1356, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 144, 68, 49, 21, 3, 5),
(1357, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 145, 68, 49, 21, 3, 4),
(1358, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 146, 69, 50, 21, 3, 4),
(1359, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 147, 69, 50, 21, 3, 3),
(1360, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 148, 69, 50, 21, 3, 2),
(1361, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 149, 70, 51, 21, 3, 2),
(1362, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 150, 70, 51, 21, 3, 3),
(1363, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 151, 70, 51, 21, 3, 2),
(1364, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 152, 71, 52, 21, 3, 5),
(1365, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 153, 71, 52, 21, 3, 4),
(1366, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 154, 71, 52, 21, 3, 4),
(1367, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 155, 72, 53, 21, 3, 5),
(1368, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 156, 72, 53, 21, 3, 2),
(1369, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 157, 72, 53, 21, 3, 2),
(1370, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 158, 72, 53, 21, 3, 4),
(1371, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 159, 73, 54, 22, 3, 5),
(1372, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 160, 73, 54, 22, 3, 5),
(1373, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 161, 74, 55, 22, 3, 5),
(1374, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 162, 74, 55, 22, 3, 4),
(1375, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 163, 74, 55, 22, 3, 4),
(1376, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 164, 75, 56, 22, 3, 4),
(1377, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 165, 75, 56, 22, 3, 5),
(1378, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 166, 75, 56, 22, 3, 5),
(1379, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 167, 76, 57, 22, 3, 4),
(1380, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 168, 76, 57, 22, 3, 5),
(1381, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 169, 77, 58, 22, 3, 5),
(1382, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 170, 77, 58, 22, 3, 4),
(1383, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 171, 77, 58, 22, 3, 4),
(1384, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 172, 78, 59, 23, 3, 4),
(1385, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 173, 78, 59, 23, 3, 3),
(1386, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 174, 79, 59, 23, 3, 4),
(1387, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 175, 79, 59, 23, 3, 4),
(1388, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 176, 80, 60, 23, 3, 4),
(1389, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 177, 80, 60, 23, 3, 4),
(1390, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 178, 81, 61, 23, 3, 3),
(1391, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 179, 81, 61, 23, 3, 4),
(1392, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 180, 82, 61, 23, 3, 4),
(1393, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 181, 83, 62, 23, 3, 4),
(1394, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 182, 83, 62, 23, 3, 4),
(1395, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 183, 83, 62, 23, 3, 4),
(1396, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 184, 84, 63, 23, 3, 4),
(1397, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 185, 84, 63, 23, 3, 2),
(1398, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 186, 84, 63, 23, 3, 4),
(1399, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 187, 85, 64, 24, 3, 8),
(1400, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 188, 85, 64, 24, 3, 7),
(1401, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 189, 86, 64, 24, 3, 7),
(1402, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 190, 87, 64, 24, 3, 7),
(1403, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 191, 87, 64, 24, 3, 6),
(1404, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 192, 87, 64, 24, 3, 6),
(1405, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 193, 88, 64, 24, 3, 6),
(1406, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 194, 88, 64, 24, 3, 6),
(1407, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 195, 89, 65, 24, 3, 6),
(1408, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 196, 90, 65, 24, 3, 6),
(1409, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 197, 90, 65, 24, 3, 6),
(1410, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 198, 90, 65, 24, 3, 6),
(1411, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 199, 91, 65, 24, 3, 6),
(1412, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 200, 91, 65, 24, 3, 6),
(1413, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 201, 92, 66, 25, 3, 14),
(1414, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 202, 93, 66, 25, 3, 13),
(1415, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 203, 93, 66, 25, 3, 14),
(1416, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 204, 93, 66, 25, 3, 15),
(1417, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 205, 94, 66, 25, 3, 14),
(1418, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 206, 94, 66, 25, 3, 14),
(1419, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 207, 95, 67, 25, 3, 13),
(1420, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 208, 96, 67, 25, 3, 13),
(1421, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 209, 96, 67, 25, 3, 13),
(1422, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 210, 96, 67, 25, 3, 14),
(1423, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 211, 97, 67, 25, 3, 14),
(1424, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 212, 97, 67, 25, 3, 14),
(1425, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 213, 98, 68, 26, 3, 4),
(1426, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 214, 98, 68, 26, 3, 5),
(1427, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 215, 98, 68, 26, 3, 5),
(1428, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 216, 99, 69, 26, 3, 4),
(1429, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 217, 99, 69, 26, 3, 4),
(1430, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 218, 99, 69, 26, 3, 4),
(1431, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 219, 99, 69, 26, 3, 4),
(1432, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 220, 100, 69, 26, 3, 5),
(1433, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 221, 100, 69, 26, 3, 4),
(1434, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 222, 101, 70, 27, 3, 10),
(1435, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 223, 102, 70, 27, 3, 10),
(1436, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 224, 102, 70, 27, 3, 10),
(1437, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 225, 103, 70, 27, 3, 10),
(1438, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 226, 103, 70, 27, 3, 10),
(1439, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 227, 104, 71, 27, 3, 10),
(1440, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 228, 105, 71, 27, 3, 9),
(1441, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 229, 106, 71, 27, 3, 9),
(1442, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 230, 107, 71, 27, 3, 10),
(1443, '027f95fc-d93c-4084-9c3d-b143dbc6ef05', 231, 107, 71, 27, 3, 10),
(1444, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 121, 58, 40, 19, 3, 4),
(1445, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 122, 58, 40, 19, 3, 4),
(1446, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 123, 58, 40, 19, 3, 4),
(1447, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 124, 59, 41, 19, 3, 4),
(1448, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 125, 60, 42, 19, 3, 3),
(1449, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 126, 60, 42, 19, 3, 5),
(1450, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 127, 61, 43, 19, 3, 3),
(1451, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 128, 61, 43, 19, 3, 4),
(1452, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 129, 61, 43, 19, 3, 3),
(1453, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 130, 62, 43, 19, 3, 4),
(1454, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 131, 62, 43, 19, 3, 4),
(1455, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 132, 62, 43, 19, 3, 3),
(1456, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 133, 63, 44, 19, 3, 3),
(1457, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 134, 63, 44, 19, 3, 3),
(1458, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 135, 63, 44, 19, 3, 3),
(1459, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 136, 64, 45, 20, 3, 3),
(1460, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 137, 65, 46, 20, 3, 3),
(1461, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 138, 66, 47, 20, 3, 4),
(1462, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 139, 66, 47, 20, 3, 4),
(1463, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 140, 66, 47, 20, 3, 3),
(1464, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 141, 67, 48, 20, 3, 4),
(1465, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 142, 67, 48, 20, 3, 3),
(1466, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 143, 67, 48, 20, 3, 4),
(1467, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 144, 68, 49, 21, 3, 3),
(1468, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 145, 68, 49, 21, 3, 3),
(1469, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 146, 69, 50, 21, 3, 4),
(1470, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 147, 69, 50, 21, 3, 4),
(1471, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 148, 69, 50, 21, 3, 3),
(1472, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 149, 70, 51, 21, 3, 3),
(1473, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 150, 70, 51, 21, 3, 4),
(1474, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 151, 70, 51, 21, 3, 3),
(1475, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 152, 71, 52, 21, 3, 4),
(1476, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 153, 71, 52, 21, 3, 3),
(1477, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 154, 71, 52, 21, 3, 4),
(1478, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 155, 72, 53, 21, 3, 4),
(1479, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 156, 72, 53, 21, 3, 4),
(1480, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 157, 72, 53, 21, 3, 3),
(1481, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 158, 72, 53, 21, 3, 4),
(1482, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 159, 73, 54, 22, 3, 4),
(1483, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 160, 73, 54, 22, 3, 3),
(1484, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 161, 74, 55, 22, 3, 4),
(1485, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 162, 74, 55, 22, 3, 4),
(1486, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 163, 74, 55, 22, 3, 4),
(1487, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 164, 75, 56, 22, 3, 3),
(1488, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 165, 75, 56, 22, 3, 4),
(1489, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 166, 75, 56, 22, 3, 4),
(1490, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 167, 76, 57, 22, 3, 3),
(1491, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 168, 76, 57, 22, 3, 4),
(1492, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 169, 77, 58, 22, 3, 3),
(1493, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 170, 77, 58, 22, 3, 4),
(1494, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 171, 77, 58, 22, 3, 4),
(1495, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 172, 78, 59, 23, 3, 3),
(1496, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 173, 78, 59, 23, 3, 3),
(1497, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 174, 79, 59, 23, 3, 3),
(1498, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 175, 79, 59, 23, 3, 3),
(1499, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 176, 80, 60, 23, 3, 4),
(1500, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 177, 80, 60, 23, 3, 3),
(1501, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 178, 81, 61, 23, 3, 3),
(1502, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 179, 81, 61, 23, 3, 4),
(1503, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 180, 82, 61, 23, 3, 3),
(1504, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 181, 83, 62, 23, 3, 3),
(1505, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 182, 83, 62, 23, 3, 3),
(1506, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 183, 83, 62, 23, 3, 4),
(1507, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 184, 84, 63, 23, 3, 3),
(1508, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 185, 84, 63, 23, 3, 3),
(1509, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 186, 84, 63, 23, 3, 4),
(1510, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 187, 85, 64, 24, 3, 9),
(1511, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 188, 85, 64, 24, 3, 8),
(1512, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 189, 86, 64, 24, 3, 9),
(1513, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 190, 87, 64, 24, 3, 9),
(1514, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 191, 87, 64, 24, 3, 9),
(1515, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 192, 87, 64, 24, 3, 8),
(1516, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 193, 88, 64, 24, 3, 8),
(1517, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 194, 88, 64, 24, 3, 9),
(1518, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 195, 89, 65, 24, 3, 8),
(1519, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 196, 90, 65, 24, 3, 9),
(1520, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 197, 90, 65, 24, 3, 9),
(1521, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 198, 90, 65, 24, 3, 9),
(1522, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 199, 91, 65, 24, 3, 8),
(1523, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 200, 91, 65, 24, 3, 9),
(1524, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 201, 92, 66, 25, 3, 13),
(1525, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 202, 93, 66, 25, 3, 14),
(1526, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 203, 93, 66, 25, 3, 14),
(1527, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 204, 93, 66, 25, 3, 13),
(1528, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 205, 94, 66, 25, 3, 13),
(1529, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 206, 94, 66, 25, 3, 14),
(1530, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 207, 95, 67, 25, 3, 13),
(1531, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 208, 96, 67, 25, 3, 13),
(1532, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 209, 96, 67, 25, 3, 14),
(1533, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 210, 96, 67, 25, 3, 14),
(1534, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 211, 97, 67, 25, 3, 15),
(1535, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 212, 97, 67, 25, 3, 14),
(1536, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 213, 98, 68, 26, 3, 4),
(1537, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 214, 98, 68, 26, 3, 4),
(1538, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 215, 98, 68, 26, 3, 3),
(1539, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 216, 99, 69, 26, 3, 4),
(1540, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 217, 99, 69, 26, 3, 4),
(1541, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 218, 99, 69, 26, 3, 4),
(1542, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 219, 99, 69, 26, 3, 3),
(1543, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 220, 100, 69, 26, 3, 3),
(1544, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 221, 100, 69, 26, 3, 3),
(1545, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 222, 101, 70, 27, 3, 9),
(1546, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 223, 102, 70, 27, 3, 10),
(1547, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 224, 102, 70, 27, 3, 8),
(1548, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 225, 103, 70, 27, 3, 8),
(1549, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 226, 103, 70, 27, 3, 8),
(1550, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 227, 104, 71, 27, 3, 8),
(1551, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 228, 105, 71, 27, 3, 9),
(1552, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 229, 106, 71, 27, 3, 8),
(1553, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 230, 107, 71, 27, 3, 9),
(1554, '629e47ed-6afb-4dfe-ba79-5aa1f2c1738d', 231, 107, 71, 27, 3, 9),
(1555, 'e0493171-6421-4dfa-9df7-10546002ff0c', 121, 58, 40, 19, 3, 4),
(1556, 'e0493171-6421-4dfa-9df7-10546002ff0c', 122, 58, 40, 19, 3, 4),
(1557, 'e0493171-6421-4dfa-9df7-10546002ff0c', 123, 58, 40, 19, 3, 4),
(1558, 'e0493171-6421-4dfa-9df7-10546002ff0c', 124, 59, 41, 19, 3, 3),
(1559, 'e0493171-6421-4dfa-9df7-10546002ff0c', 125, 60, 42, 19, 3, 3),
(1560, 'e0493171-6421-4dfa-9df7-10546002ff0c', 126, 60, 42, 19, 3, 4),
(1561, 'e0493171-6421-4dfa-9df7-10546002ff0c', 127, 61, 43, 19, 3, 2),
(1562, 'e0493171-6421-4dfa-9df7-10546002ff0c', 128, 61, 43, 19, 3, 3),
(1563, 'e0493171-6421-4dfa-9df7-10546002ff0c', 129, 61, 43, 19, 3, 4),
(1564, 'e0493171-6421-4dfa-9df7-10546002ff0c', 130, 62, 43, 19, 3, 4),
(1565, 'e0493171-6421-4dfa-9df7-10546002ff0c', 131, 62, 43, 19, 3, 3),
(1566, 'e0493171-6421-4dfa-9df7-10546002ff0c', 132, 62, 43, 19, 3, 3),
(1567, 'e0493171-6421-4dfa-9df7-10546002ff0c', 133, 63, 44, 19, 3, 3),
(1568, 'e0493171-6421-4dfa-9df7-10546002ff0c', 134, 63, 44, 19, 3, 4),
(1569, 'e0493171-6421-4dfa-9df7-10546002ff0c', 135, 63, 44, 19, 3, 3),
(1570, 'e0493171-6421-4dfa-9df7-10546002ff0c', 136, 64, 45, 20, 3, 3),
(1571, 'e0493171-6421-4dfa-9df7-10546002ff0c', 137, 65, 46, 20, 3, 2),
(1572, 'e0493171-6421-4dfa-9df7-10546002ff0c', 138, 66, 47, 20, 3, 4),
(1573, 'e0493171-6421-4dfa-9df7-10546002ff0c', 139, 66, 47, 20, 3, 4),
(1574, 'e0493171-6421-4dfa-9df7-10546002ff0c', 140, 66, 47, 20, 3, 4),
(1575, 'e0493171-6421-4dfa-9df7-10546002ff0c', 141, 67, 48, 20, 3, 1);
INSERT INTO `responses_people` (`idresppeo`, `hash`, `pcsp_questions`, `pcs_process`, `pc_subcriteria`, `period_criteria`, `period`, `type_answer`) VALUES
(1576, 'e0493171-6421-4dfa-9df7-10546002ff0c', 142, 67, 48, 20, 3, 1),
(1577, 'e0493171-6421-4dfa-9df7-10546002ff0c', 143, 67, 48, 20, 3, 1),
(1578, 'e0493171-6421-4dfa-9df7-10546002ff0c', 144, 68, 49, 21, 3, 2),
(1579, 'e0493171-6421-4dfa-9df7-10546002ff0c', 145, 68, 49, 21, 3, 2),
(1580, 'e0493171-6421-4dfa-9df7-10546002ff0c', 146, 69, 50, 21, 3, 3),
(1581, 'e0493171-6421-4dfa-9df7-10546002ff0c', 147, 69, 50, 21, 3, 3),
(1582, 'e0493171-6421-4dfa-9df7-10546002ff0c', 148, 69, 50, 21, 3, 3),
(1583, 'e0493171-6421-4dfa-9df7-10546002ff0c', 149, 70, 51, 21, 3, 4),
(1584, 'e0493171-6421-4dfa-9df7-10546002ff0c', 150, 70, 51, 21, 3, 3),
(1585, 'e0493171-6421-4dfa-9df7-10546002ff0c', 151, 70, 51, 21, 3, 2),
(1586, 'e0493171-6421-4dfa-9df7-10546002ff0c', 152, 71, 52, 21, 3, 3),
(1587, 'e0493171-6421-4dfa-9df7-10546002ff0c', 153, 71, 52, 21, 3, 2),
(1588, 'e0493171-6421-4dfa-9df7-10546002ff0c', 154, 71, 52, 21, 3, 2),
(1589, 'e0493171-6421-4dfa-9df7-10546002ff0c', 155, 72, 53, 21, 3, 2),
(1590, 'e0493171-6421-4dfa-9df7-10546002ff0c', 156, 72, 53, 21, 3, 3),
(1591, 'e0493171-6421-4dfa-9df7-10546002ff0c', 157, 72, 53, 21, 3, 2),
(1592, 'e0493171-6421-4dfa-9df7-10546002ff0c', 158, 72, 53, 21, 3, 3),
(1593, 'e0493171-6421-4dfa-9df7-10546002ff0c', 159, 73, 54, 22, 3, 3),
(1594, 'e0493171-6421-4dfa-9df7-10546002ff0c', 160, 73, 54, 22, 3, 3),
(1595, 'e0493171-6421-4dfa-9df7-10546002ff0c', 161, 74, 55, 22, 3, 2),
(1596, 'e0493171-6421-4dfa-9df7-10546002ff0c', 162, 74, 55, 22, 3, 2),
(1597, 'e0493171-6421-4dfa-9df7-10546002ff0c', 163, 74, 55, 22, 3, 3),
(1598, 'e0493171-6421-4dfa-9df7-10546002ff0c', 164, 75, 56, 22, 3, 2),
(1599, 'e0493171-6421-4dfa-9df7-10546002ff0c', 165, 75, 56, 22, 3, 2),
(1600, 'e0493171-6421-4dfa-9df7-10546002ff0c', 166, 75, 56, 22, 3, 2),
(1601, 'e0493171-6421-4dfa-9df7-10546002ff0c', 167, 76, 57, 22, 3, 3),
(1602, 'e0493171-6421-4dfa-9df7-10546002ff0c', 168, 76, 57, 22, 3, 3),
(1603, 'e0493171-6421-4dfa-9df7-10546002ff0c', 169, 77, 58, 22, 3, 3),
(1604, 'e0493171-6421-4dfa-9df7-10546002ff0c', 170, 77, 58, 22, 3, 2),
(1605, 'e0493171-6421-4dfa-9df7-10546002ff0c', 171, 77, 58, 22, 3, 4),
(1606, 'e0493171-6421-4dfa-9df7-10546002ff0c', 172, 78, 59, 23, 3, 2),
(1607, 'e0493171-6421-4dfa-9df7-10546002ff0c', 173, 78, 59, 23, 3, 2),
(1608, 'e0493171-6421-4dfa-9df7-10546002ff0c', 174, 79, 59, 23, 3, 2),
(1609, 'e0493171-6421-4dfa-9df7-10546002ff0c', 175, 79, 59, 23, 3, 1),
(1610, 'e0493171-6421-4dfa-9df7-10546002ff0c', 176, 80, 60, 23, 3, 2),
(1611, 'e0493171-6421-4dfa-9df7-10546002ff0c', 177, 80, 60, 23, 3, 2),
(1612, 'e0493171-6421-4dfa-9df7-10546002ff0c', 178, 81, 61, 23, 3, 2),
(1613, 'e0493171-6421-4dfa-9df7-10546002ff0c', 179, 81, 61, 23, 3, 2),
(1614, 'e0493171-6421-4dfa-9df7-10546002ff0c', 180, 82, 61, 23, 3, 2),
(1615, 'e0493171-6421-4dfa-9df7-10546002ff0c', 181, 83, 62, 23, 3, 2),
(1616, 'e0493171-6421-4dfa-9df7-10546002ff0c', 182, 83, 62, 23, 3, 2),
(1617, 'e0493171-6421-4dfa-9df7-10546002ff0c', 183, 83, 62, 23, 3, 3),
(1618, 'e0493171-6421-4dfa-9df7-10546002ff0c', 184, 84, 63, 23, 3, 3),
(1619, 'e0493171-6421-4dfa-9df7-10546002ff0c', 185, 84, 63, 23, 3, 3),
(1620, 'e0493171-6421-4dfa-9df7-10546002ff0c', 186, 84, 63, 23, 3, 3),
(1621, 'e0493171-6421-4dfa-9df7-10546002ff0c', 187, 85, 64, 24, 3, 8),
(1622, 'e0493171-6421-4dfa-9df7-10546002ff0c', 188, 85, 64, 24, 3, 7),
(1623, 'e0493171-6421-4dfa-9df7-10546002ff0c', 189, 86, 64, 24, 3, 7),
(1624, 'e0493171-6421-4dfa-9df7-10546002ff0c', 190, 87, 64, 24, 3, 6),
(1625, 'e0493171-6421-4dfa-9df7-10546002ff0c', 191, 87, 64, 24, 3, 6),
(1626, 'e0493171-6421-4dfa-9df7-10546002ff0c', 192, 87, 64, 24, 3, 6),
(1627, 'e0493171-6421-4dfa-9df7-10546002ff0c', 193, 88, 64, 24, 3, 6),
(1628, 'e0493171-6421-4dfa-9df7-10546002ff0c', 194, 88, 64, 24, 3, 6),
(1629, 'e0493171-6421-4dfa-9df7-10546002ff0c', 195, 89, 65, 24, 3, 6),
(1630, 'e0493171-6421-4dfa-9df7-10546002ff0c', 196, 90, 65, 24, 3, 8),
(1631, 'e0493171-6421-4dfa-9df7-10546002ff0c', 197, 90, 65, 24, 3, 9),
(1632, 'e0493171-6421-4dfa-9df7-10546002ff0c', 198, 90, 65, 24, 3, 8),
(1633, 'e0493171-6421-4dfa-9df7-10546002ff0c', 199, 91, 65, 24, 3, 7),
(1634, 'e0493171-6421-4dfa-9df7-10546002ff0c', 200, 91, 65, 24, 3, 8),
(1635, 'e0493171-6421-4dfa-9df7-10546002ff0c', 201, 92, 66, 25, 3, 12),
(1636, 'e0493171-6421-4dfa-9df7-10546002ff0c', 202, 93, 66, 25, 3, 12),
(1637, 'e0493171-6421-4dfa-9df7-10546002ff0c', 203, 93, 66, 25, 3, 12),
(1638, 'e0493171-6421-4dfa-9df7-10546002ff0c', 204, 93, 66, 25, 3, 13),
(1639, 'e0493171-6421-4dfa-9df7-10546002ff0c', 205, 94, 66, 25, 3, 11),
(1640, 'e0493171-6421-4dfa-9df7-10546002ff0c', 206, 94, 66, 25, 3, 11),
(1641, 'e0493171-6421-4dfa-9df7-10546002ff0c', 207, 95, 67, 25, 3, 11),
(1642, 'e0493171-6421-4dfa-9df7-10546002ff0c', 208, 96, 67, 25, 3, 11),
(1643, 'e0493171-6421-4dfa-9df7-10546002ff0c', 209, 96, 67, 25, 3, 11),
(1644, 'e0493171-6421-4dfa-9df7-10546002ff0c', 210, 96, 67, 25, 3, 11),
(1645, 'e0493171-6421-4dfa-9df7-10546002ff0c', 211, 97, 67, 25, 3, 11),
(1646, 'e0493171-6421-4dfa-9df7-10546002ff0c', 212, 97, 67, 25, 3, 11),
(1647, 'e0493171-6421-4dfa-9df7-10546002ff0c', 213, 98, 68, 26, 3, 2),
(1648, 'e0493171-6421-4dfa-9df7-10546002ff0c', 214, 98, 68, 26, 3, 3),
(1649, 'e0493171-6421-4dfa-9df7-10546002ff0c', 215, 98, 68, 26, 3, 3),
(1650, 'e0493171-6421-4dfa-9df7-10546002ff0c', 216, 99, 69, 26, 3, 1),
(1651, 'e0493171-6421-4dfa-9df7-10546002ff0c', 217, 99, 69, 26, 3, 1),
(1652, 'e0493171-6421-4dfa-9df7-10546002ff0c', 218, 99, 69, 26, 3, 1),
(1653, 'e0493171-6421-4dfa-9df7-10546002ff0c', 219, 99, 69, 26, 3, 1),
(1654, 'e0493171-6421-4dfa-9df7-10546002ff0c', 220, 100, 69, 26, 3, 1),
(1655, 'e0493171-6421-4dfa-9df7-10546002ff0c', 221, 100, 69, 26, 3, 1),
(1656, 'e0493171-6421-4dfa-9df7-10546002ff0c', 222, 101, 70, 27, 3, 6),
(1657, 'e0493171-6421-4dfa-9df7-10546002ff0c', 223, 102, 70, 27, 3, 7),
(1658, 'e0493171-6421-4dfa-9df7-10546002ff0c', 224, 102, 70, 27, 3, 8),
(1659, 'e0493171-6421-4dfa-9df7-10546002ff0c', 225, 103, 70, 27, 3, 7),
(1660, 'e0493171-6421-4dfa-9df7-10546002ff0c', 226, 103, 70, 27, 3, 8),
(1661, 'e0493171-6421-4dfa-9df7-10546002ff0c', 227, 104, 71, 27, 3, 6),
(1662, 'e0493171-6421-4dfa-9df7-10546002ff0c', 228, 105, 71, 27, 3, 6),
(1663, 'e0493171-6421-4dfa-9df7-10546002ff0c', 229, 106, 71, 27, 3, 6),
(1664, 'e0493171-6421-4dfa-9df7-10546002ff0c', 230, 107, 71, 27, 3, 6),
(1665, 'e0493171-6421-4dfa-9df7-10546002ff0c', 231, 107, 71, 27, 3, 6),
(1666, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 121, 58, 40, 19, 3, 1),
(1667, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 122, 58, 40, 19, 3, 1),
(1668, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 123, 58, 40, 19, 3, 1),
(1669, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 124, 59, 41, 19, 3, 1),
(1670, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 125, 60, 42, 19, 3, 1),
(1671, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 126, 60, 42, 19, 3, 1),
(1672, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 127, 61, 43, 19, 3, 1),
(1673, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 128, 61, 43, 19, 3, 1),
(1674, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 129, 61, 43, 19, 3, 1),
(1675, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 130, 62, 43, 19, 3, 1),
(1676, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 131, 62, 43, 19, 3, 1),
(1677, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 132, 62, 43, 19, 3, 1),
(1678, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 133, 63, 44, 19, 3, 1),
(1679, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 134, 63, 44, 19, 3, 1),
(1680, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 135, 63, 44, 19, 3, 1),
(1681, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 136, 64, 45, 20, 3, 1),
(1682, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 137, 65, 46, 20, 3, 1),
(1683, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 138, 66, 47, 20, 3, 1),
(1684, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 139, 66, 47, 20, 3, 1),
(1685, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 140, 66, 47, 20, 3, 1),
(1686, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 141, 67, 48, 20, 3, 1),
(1687, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 142, 67, 48, 20, 3, 1),
(1688, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 143, 67, 48, 20, 3, 1),
(1689, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 144, 68, 49, 21, 3, 1),
(1690, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 145, 68, 49, 21, 3, 1),
(1691, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 146, 69, 50, 21, 3, 1),
(1692, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 147, 69, 50, 21, 3, 1),
(1693, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 148, 69, 50, 21, 3, 1),
(1694, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 149, 70, 51, 21, 3, 1),
(1695, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 150, 70, 51, 21, 3, 1),
(1696, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 151, 70, 51, 21, 3, 2),
(1697, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 152, 71, 52, 21, 3, 1),
(1698, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 153, 71, 52, 21, 3, 1),
(1699, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 154, 71, 52, 21, 3, 1),
(1700, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 155, 72, 53, 21, 3, 1),
(1701, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 156, 72, 53, 21, 3, 1),
(1702, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 157, 72, 53, 21, 3, 1),
(1703, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 158, 72, 53, 21, 3, 1),
(1704, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 159, 73, 54, 22, 3, 1),
(1705, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 160, 73, 54, 22, 3, 1),
(1706, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 161, 74, 55, 22, 3, 1),
(1707, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 162, 74, 55, 22, 3, 1),
(1708, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 163, 74, 55, 22, 3, 1),
(1709, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 164, 75, 56, 22, 3, 1),
(1710, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 165, 75, 56, 22, 3, 1),
(1711, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 166, 75, 56, 22, 3, 1),
(1712, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 167, 76, 57, 22, 3, 1),
(1713, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 168, 76, 57, 22, 3, 1),
(1714, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 169, 77, 58, 22, 3, 1),
(1715, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 170, 77, 58, 22, 3, 1),
(1716, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 171, 77, 58, 22, 3, 1),
(1717, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 172, 78, 59, 23, 3, 1),
(1718, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 173, 78, 59, 23, 3, 1),
(1719, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 174, 79, 59, 23, 3, 1),
(1720, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 175, 79, 59, 23, 3, 1),
(1721, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 176, 80, 60, 23, 3, 1),
(1722, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 177, 80, 60, 23, 3, 1),
(1723, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 178, 81, 61, 23, 3, 1),
(1724, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 179, 81, 61, 23, 3, 1),
(1725, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 180, 82, 61, 23, 3, 1),
(1726, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 181, 83, 62, 23, 3, 1),
(1727, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 182, 83, 62, 23, 3, 1),
(1728, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 183, 83, 62, 23, 3, 1),
(1729, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 184, 84, 63, 23, 3, 1),
(1730, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 185, 84, 63, 23, 3, 1),
(1731, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 186, 84, 63, 23, 3, 1),
(1732, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 187, 85, 64, 24, 3, 6),
(1733, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 188, 85, 64, 24, 3, 6),
(1734, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 189, 86, 64, 24, 3, 6),
(1735, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 190, 87, 64, 24, 3, 6),
(1736, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 191, 87, 64, 24, 3, 6),
(1737, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 192, 87, 64, 24, 3, 6),
(1738, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 193, 88, 64, 24, 3, 6),
(1739, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 194, 88, 64, 24, 3, 6),
(1740, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 195, 89, 65, 24, 3, 6),
(1741, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 196, 90, 65, 24, 3, 6),
(1742, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 197, 90, 65, 24, 3, 6),
(1743, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 198, 90, 65, 24, 3, 6),
(1744, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 199, 91, 65, 24, 3, 6),
(1745, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 200, 91, 65, 24, 3, 6),
(1746, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 201, 92, 66, 25, 3, 11),
(1747, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 202, 93, 66, 25, 3, 11),
(1748, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 203, 93, 66, 25, 3, 11),
(1749, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 204, 93, 66, 25, 3, 11),
(1750, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 205, 94, 66, 25, 3, 11),
(1751, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 206, 94, 66, 25, 3, 11),
(1752, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 207, 95, 67, 25, 3, 11),
(1753, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 208, 96, 67, 25, 3, 11),
(1754, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 209, 96, 67, 25, 3, 11),
(1755, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 210, 96, 67, 25, 3, 11),
(1756, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 211, 97, 67, 25, 3, 11),
(1757, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 212, 97, 67, 25, 3, 11),
(1758, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 213, 98, 68, 26, 3, 1),
(1759, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 214, 98, 68, 26, 3, 1),
(1760, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 215, 98, 68, 26, 3, 1),
(1761, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 216, 99, 69, 26, 3, 1),
(1762, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 217, 99, 69, 26, 3, 1),
(1763, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 218, 99, 69, 26, 3, 1),
(1764, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 219, 99, 69, 26, 3, 1),
(1765, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 220, 100, 69, 26, 3, 1),
(1766, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 221, 100, 69, 26, 3, 1),
(1767, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 222, 101, 70, 27, 3, 6),
(1768, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 223, 102, 70, 27, 3, 6),
(1769, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 224, 102, 70, 27, 3, 6),
(1770, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 225, 103, 70, 27, 3, 6),
(1771, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 226, 103, 70, 27, 3, 6),
(1772, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 227, 104, 71, 27, 3, 6),
(1773, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 228, 105, 71, 27, 3, 6),
(1774, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 229, 106, 71, 27, 3, 6),
(1775, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 230, 107, 71, 27, 3, 6),
(1776, 'dc487ec4-ecc9-4469-ad42-ef4b645a8c70', 231, 107, 71, 27, 3, 6),
(1777, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 121, 58, 40, 19, 3, 1),
(1778, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 122, 58, 40, 19, 3, 1),
(1779, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 123, 58, 40, 19, 3, 1),
(1780, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 124, 59, 41, 19, 3, 1),
(1781, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 125, 60, 42, 19, 3, 1),
(1782, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 126, 60, 42, 19, 3, 1),
(1783, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 127, 61, 43, 19, 3, 1),
(1784, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 128, 61, 43, 19, 3, 1),
(1785, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 129, 61, 43, 19, 3, 1),
(1786, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 130, 62, 43, 19, 3, 1),
(1787, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 131, 62, 43, 19, 3, 1),
(1788, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 132, 62, 43, 19, 3, 1),
(1789, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 133, 63, 44, 19, 3, 1),
(1790, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 134, 63, 44, 19, 3, 1),
(1791, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 135, 63, 44, 19, 3, 1),
(1792, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 136, 64, 45, 20, 3, 1),
(1793, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 137, 65, 46, 20, 3, 1),
(1794, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 138, 66, 47, 20, 3, 1),
(1795, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 139, 66, 47, 20, 3, 1),
(1796, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 140, 66, 47, 20, 3, 1),
(1797, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 141, 67, 48, 20, 3, 1),
(1798, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 142, 67, 48, 20, 3, 1),
(1799, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 143, 67, 48, 20, 3, 1),
(1800, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 144, 68, 49, 21, 3, 1),
(1801, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 145, 68, 49, 21, 3, 1),
(1802, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 146, 69, 50, 21, 3, 1),
(1803, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 147, 69, 50, 21, 3, 1),
(1804, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 148, 69, 50, 21, 3, 1),
(1805, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 149, 70, 51, 21, 3, 1),
(1806, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 150, 70, 51, 21, 3, 1),
(1807, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 151, 70, 51, 21, 3, 1),
(1808, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 152, 71, 52, 21, 3, 1),
(1809, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 153, 71, 52, 21, 3, 1),
(1810, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 154, 71, 52, 21, 3, 1),
(1811, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 155, 72, 53, 21, 3, 1),
(1812, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 156, 72, 53, 21, 3, 1),
(1813, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 157, 72, 53, 21, 3, 1),
(1814, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 158, 72, 53, 21, 3, 1),
(1815, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 159, 73, 54, 22, 3, 1),
(1816, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 160, 73, 54, 22, 3, 1),
(1817, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 161, 74, 55, 22, 3, 1),
(1818, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 162, 74, 55, 22, 3, 1),
(1819, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 163, 74, 55, 22, 3, 1),
(1820, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 164, 75, 56, 22, 3, 1),
(1821, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 165, 75, 56, 22, 3, 1),
(1822, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 166, 75, 56, 22, 3, 1),
(1823, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 167, 76, 57, 22, 3, 1),
(1824, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 168, 76, 57, 22, 3, 1),
(1825, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 169, 77, 58, 22, 3, 1),
(1826, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 170, 77, 58, 22, 3, 1),
(1827, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 171, 77, 58, 22, 3, 1),
(1828, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 172, 78, 59, 23, 3, 1),
(1829, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 173, 78, 59, 23, 3, 1),
(1830, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 174, 79, 59, 23, 3, 1),
(1831, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 175, 79, 59, 23, 3, 1),
(1832, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 176, 80, 60, 23, 3, 1),
(1833, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 177, 80, 60, 23, 3, 1),
(1834, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 178, 81, 61, 23, 3, 1),
(1835, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 179, 81, 61, 23, 3, 1),
(1836, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 180, 82, 61, 23, 3, 1),
(1837, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 181, 83, 62, 23, 3, 1),
(1838, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 182, 83, 62, 23, 3, 1),
(1839, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 183, 83, 62, 23, 3, 1),
(1840, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 184, 84, 63, 23, 3, 1),
(1841, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 185, 84, 63, 23, 3, 1),
(1842, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 186, 84, 63, 23, 3, 1),
(1843, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 187, 85, 64, 24, 3, 6),
(1844, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 188, 85, 64, 24, 3, 6),
(1845, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 189, 86, 64, 24, 3, 6),
(1846, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 190, 87, 64, 24, 3, 6),
(1847, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 191, 87, 64, 24, 3, 6),
(1848, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 192, 87, 64, 24, 3, 6),
(1849, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 193, 88, 64, 24, 3, 6),
(1850, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 194, 88, 64, 24, 3, 6),
(1851, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 195, 89, 65, 24, 3, 6),
(1852, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 196, 90, 65, 24, 3, 6),
(1853, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 197, 90, 65, 24, 3, 6),
(1854, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 198, 90, 65, 24, 3, 6),
(1855, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 199, 91, 65, 24, 3, 6),
(1856, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 200, 91, 65, 24, 3, 6),
(1857, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 201, 92, 66, 25, 3, 11),
(1858, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 202, 93, 66, 25, 3, 11),
(1859, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 203, 93, 66, 25, 3, 11),
(1860, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 204, 93, 66, 25, 3, 11),
(1861, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 205, 94, 66, 25, 3, 11),
(1862, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 206, 94, 66, 25, 3, 11),
(1863, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 207, 95, 67, 25, 3, 11),
(1864, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 208, 96, 67, 25, 3, 11),
(1865, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 209, 96, 67, 25, 3, 11),
(1866, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 210, 96, 67, 25, 3, 11),
(1867, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 211, 97, 67, 25, 3, 11),
(1868, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 212, 97, 67, 25, 3, 11),
(1869, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 213, 98, 68, 26, 3, 1),
(1870, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 214, 98, 68, 26, 3, 1),
(1871, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 215, 98, 68, 26, 3, 1),
(1872, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 216, 99, 69, 26, 3, 1),
(1873, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 217, 99, 69, 26, 3, 1),
(1874, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 218, 99, 69, 26, 3, 1),
(1875, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 219, 99, 69, 26, 3, 1),
(1876, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 220, 100, 69, 26, 3, 1),
(1877, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 221, 100, 69, 26, 3, 1),
(1878, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 222, 101, 70, 27, 3, 6),
(1879, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 223, 102, 70, 27, 3, 6),
(1880, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 224, 102, 70, 27, 3, 6),
(1881, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 225, 103, 70, 27, 3, 6),
(1882, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 226, 103, 70, 27, 3, 6),
(1883, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 227, 104, 71, 27, 3, 6),
(1884, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 228, 105, 71, 27, 3, 6),
(1885, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 229, 106, 71, 27, 3, 6),
(1886, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 230, 107, 71, 27, 3, 6),
(1887, 'b01b1152-d18a-416a-bdea-5cd554fbd64e', 231, 107, 71, 27, 3, 6);

-- 
-- RESPONSES_PEOPLE
--

INSERT INTO `responses_people` VALUES ('1894', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '232', '110', '72', '28', '7', '2', 'Página web');
INSERT INTO `responses_people` VALUES ('1895', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '233', '110', '72', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1896', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '234', '110', '72', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1897', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '235', '111', '73', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1898', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '236', '112', '74', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1899', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '237', '112', '74', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1900', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '238', '113', '75', '28', '7', '5', 'Redes sociales, emails, whatsapp');
INSERT INTO `responses_people` VALUES ('1901', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '239', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1902', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '240', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1903', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '241', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1904', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '242', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1905', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '243', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1906', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '243', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1907', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '244', '115', '76', '28', '7', '5', '2do piso en construccion');
INSERT INTO `responses_people` VALUES ('1908', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '245', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1909', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '246', '116', '77', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1910', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '247', '117', '78', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1911', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '248', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1912', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '249', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1913', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '250', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1914', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '251', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1915', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '252', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1916', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '253', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1917', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '254', '120', '81', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1918', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '255', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('1919', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '256', '121', '82', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1920', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '257', '121', '82', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1921', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '258', '121', '82', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1922', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '259', '122', '83', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1923', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '260', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1924', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '261', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1925', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '262', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1926', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '263', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1927', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '264', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1928', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '265', '124', '85', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1929', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '266', '124', '85', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1930', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '267', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1931', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '268', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1932', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '269', '125', '86', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1933', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '270', '125', '86', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1934', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '271', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1935', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '272', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1936', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '273', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1937', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '274', '127', '88', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1938', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '275', '127', '88', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1939', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '276', '127', '88', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1940', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '277', '128', '89', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1941', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '278', '128', '89', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1942', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '279', '129', '90', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1943', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '280', '129', '90', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1944', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '281', '129', '90', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1945', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '282', '130', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1946', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '283', '130', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1947', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '284', '131', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1948', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '285', '131', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1949', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '286', '132', '92', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1950', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '287', '132', '92', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1951', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '288', '133', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1952', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '289', '133', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1953', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '290', '134', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1954', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '291', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1955', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '292', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1956', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '293', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1957', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '294', '136', '95', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1958', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '295', '136', '95', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1959', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '296', '136', '95', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1960', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '297', '137', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('1961', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '298', '137', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1962', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '299', '138', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1963', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '300', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('1964', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '301', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('1965', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '302', '139', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1966', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '303', '140', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1967', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '304', '140', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1968', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '305', '141', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1969', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '306', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('1970', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '307', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('1971', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '308', '142', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1972', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '309', '143', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1973', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '310', '143', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('1974', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '311', '144', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('1975', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '312', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('1976', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '313', '145', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('1977', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '314', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('1978', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '315', '146', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('1979', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '316', '146', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('1980', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '317', '147', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('1981', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '318', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('1982', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '319', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('1983', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '320', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('1984', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '321', '149', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('1985', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '322', '149', '99', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('1986', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '323', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1987', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '324', '150', '100', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1988', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '325', '150', '100', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1989', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '326', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1990', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '327', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1991', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '328', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('1992', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '329', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('1993', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '330', '152', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1994', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '331', '152', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('1995', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '332', '153', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('1996', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '333', '154', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('1997', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '334', '154', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('1998', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '335', '155', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('1999', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '336', '155', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2000', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '337', '156', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2001', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '338', '157', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2002', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '339', '158', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2003', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '340', '159', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2004', '057e84ff-def3-4bc0-a0d2-2200c0eb7a70', '341', '159', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2005', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '232', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2006', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '233', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2007', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '234', '110', '72', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2008', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '235', '111', '73', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2009', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '236', '112', '74', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2010', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '237', '112', '74', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2011', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '238', '113', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2012', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '239', '113', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2013', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '240', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2014', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '241', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2015', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '242', '114', '75', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2016', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '243', '114', '75', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2017', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '243', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2018', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '244', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2019', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '245', '115', '76', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2020', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '246', '116', '77', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2021', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '247', '117', '78', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2022', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '248', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2023', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '249', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2024', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '250', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2025', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '251', '119', '80', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2026', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '252', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2027', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '253', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2028', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '254', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2029', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '255', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2030', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '256', '121', '82', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2031', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '257', '121', '82', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2032', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '258', '121', '82', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2033', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '259', '122', '83', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2034', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '260', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2035', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '261', '122', '83', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2036', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '262', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2037', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '263', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2038', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '264', '123', '84', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2039', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '265', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2040', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '266', '124', '85', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2041', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '267', '124', '85', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2042', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '268', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2043', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '269', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2044', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '270', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2045', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '271', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2046', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '272', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2047', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '273', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2048', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '274', '127', '88', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2049', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '275', '127', '88', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2050', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '276', '127', '88', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2051', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '277', '128', '89', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2052', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '278', '128', '89', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2053', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '279', '129', '90', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2054', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '280', '129', '90', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2055', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '281', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2056', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '282', '130', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2057', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '283', '130', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2058', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '284', '131', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2059', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '285', '131', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2060', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '286', '132', '92', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2061', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '287', '132', '92', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2062', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '288', '133', '93', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2063', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '289', '133', '93', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2064', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '290', '134', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2065', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '291', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2066', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '292', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2067', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '293', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2068', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '294', '136', '95', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2069', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '295', '136', '95', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2070', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '296', '136', '95', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2071', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '297', '137', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2072', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '298', '137', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2073', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '299', '138', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2074', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '300', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2075', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '301', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2076', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '302', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2077', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '303', '140', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2078', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '304', '140', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2079', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '305', '141', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2080', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '306', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2081', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '307', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2082', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '308', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2083', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '309', '143', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2084', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '310', '143', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2085', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '311', '144', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2086', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '312', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2087', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '313', '145', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2088', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '314', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2089', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '315', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2090', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '316', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2091', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '317', '147', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2092', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '318', '148', '99', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2093', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '319', '148', '99', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2094', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '320', '148', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2095', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '321', '149', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2096', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '322', '149', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2097', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '323', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2098', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '324', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2099', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '325', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2100', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '326', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2101', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '327', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2102', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '328', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2103', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '329', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2104', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '330', '152', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2105', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '331', '152', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2106', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '332', '153', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2107', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '333', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2108', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '334', '154', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2109', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '335', '155', '102', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2110', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '336', '155', '102', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2111', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '337', '156', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2112', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '338', '157', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2113', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '339', '158', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2114', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '340', '159', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2115', '005a46ad-d1b7-49b4-8461-e82ae43e6f10', '341', '159', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2116', '55c939d6-e07a-493f-b039-b52aba1e704c', '232', '110', '72', '28', '7', '5', 'Pagina Web');
INSERT INTO `responses_people` VALUES ('2117', '55c939d6-e07a-493f-b039-b52aba1e704c', '233', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2118', '55c939d6-e07a-493f-b039-b52aba1e704c', '234', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2119', '55c939d6-e07a-493f-b039-b52aba1e704c', '235', '111', '73', '28', '7', '5', 'Qosqo, Sistema SysAdmin');
INSERT INTO `responses_people` VALUES ('2120', '55c939d6-e07a-493f-b039-b52aba1e704c', '236', '112', '74', '28', '7', '5', 'Nota por mesa de Entrada');
INSERT INTO `responses_people` VALUES ('2121', '55c939d6-e07a-493f-b039-b52aba1e704c', '237', '112', '74', '28', '7', '5', 'Tachos de basura reciclables, UTN Social');
INSERT INTO `responses_people` VALUES ('2122', '55c939d6-e07a-493f-b039-b52aba1e704c', '238', '113', '75', '28', '7', '5', 'Reunion de Gabinete, Redes Sociales, Qosqo');
INSERT INTO `responses_people` VALUES ('2123', '55c939d6-e07a-493f-b039-b52aba1e704c', '239', '113', '75', '28', '7', '5', 'Reunion de Gabinete, Redes Sociales, Qosqo');
INSERT INTO `responses_people` VALUES ('2124', '55c939d6-e07a-493f-b039-b52aba1e704c', '240', '113', '75', '28', '7', '5', 'Notas por mesa de entrada, Redes Sociales');
INSERT INTO `responses_people` VALUES ('2125', '55c939d6-e07a-493f-b039-b52aba1e704c', '241', '114', '75', '28', '7', '5', 'Laboratorios Nuevos, Infraestructura y Tecnologia');
INSERT INTO `responses_people` VALUES ('2126', '55c939d6-e07a-493f-b039-b52aba1e704c', '242', '114', '75', '28', '7', '5', 'Jornadas Integradoras, Trabajos en Equipo');
INSERT INTO `responses_people` VALUES ('2127', '55c939d6-e07a-493f-b039-b52aba1e704c', '243', '114', '75', '28', '7', '5', 'Reunion de Gabinete');
INSERT INTO `responses_people` VALUES ('2128', '55c939d6-e07a-493f-b039-b52aba1e704c', '243', '115', '76', '28', '7', '5', 'Planes de Accion de Mejoras');
INSERT INTO `responses_people` VALUES ('2129', '55c939d6-e07a-493f-b039-b52aba1e704c', '244', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2130', '55c939d6-e07a-493f-b039-b52aba1e704c', '245', '115', '76', '28', '7', '5', 'Pag Web, Diario Digital, E-mail');
INSERT INTO `responses_people` VALUES ('2131', '55c939d6-e07a-493f-b039-b52aba1e704c', '246', '116', '77', '29', '7', '4', 'Reunion de Objetivos Anuales');
INSERT INTO `responses_people` VALUES ('2132', '55c939d6-e07a-493f-b039-b52aba1e704c', '247', '117', '78', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2133', '55c939d6-e07a-493f-b039-b52aba1e704c', '248', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2134', '55c939d6-e07a-493f-b039-b52aba1e704c', '249', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2135', '55c939d6-e07a-493f-b039-b52aba1e704c', '250', '118', '79', '29', '7', '5', 'Reuniones');
INSERT INTO `responses_people` VALUES ('2136', '55c939d6-e07a-493f-b039-b52aba1e704c', '251', '119', '80', '29', '7', '5', 'Expedientes');
INSERT INTO `responses_people` VALUES ('2137', '55c939d6-e07a-493f-b039-b52aba1e704c', '252', '119', '80', '29', '7', '5', 'Expedientes');
INSERT INTO `responses_people` VALUES ('2138', '55c939d6-e07a-493f-b039-b52aba1e704c', '253', '119', '80', '29', '7', '5', 'Expedientes');
INSERT INTO `responses_people` VALUES ('2139', '55c939d6-e07a-493f-b039-b52aba1e704c', '254', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2140', '55c939d6-e07a-493f-b039-b52aba1e704c', '255', '120', '81', '30', '7', '5', 'Notas, Reuniones, Dialogos');
INSERT INTO `responses_people` VALUES ('2141', '55c939d6-e07a-493f-b039-b52aba1e704c', '256', '121', '82', '30', '7', '4', 'Talleres de Capacitacion para directores, Tecnicatura Gratuita de Administracion');
INSERT INTO `responses_people` VALUES ('2142', '55c939d6-e07a-493f-b039-b52aba1e704c', '257', '121', '82', '30', '7', '5', 'Cursos de Capacitacion');
INSERT INTO `responses_people` VALUES ('2143', '55c939d6-e07a-493f-b039-b52aba1e704c', '258', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2144', '55c939d6-e07a-493f-b039-b52aba1e704c', '259', '122', '83', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2145', '55c939d6-e07a-493f-b039-b52aba1e704c', '260', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2146', '55c939d6-e07a-493f-b039-b52aba1e704c', '261', '122', '83', '30', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2147', '55c939d6-e07a-493f-b039-b52aba1e704c', '262', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2148', '55c939d6-e07a-493f-b039-b52aba1e704c', '263', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2149', '55c939d6-e07a-493f-b039-b52aba1e704c', '264', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2150', '55c939d6-e07a-493f-b039-b52aba1e704c', '265', '124', '85', '30', '7', '5', 'Resoluciones');
INSERT INTO `responses_people` VALUES ('2151', '55c939d6-e07a-493f-b039-b52aba1e704c', '266', '124', '85', '30', '7', '5', 'Talleres, simulacros, Resoluciones');
INSERT INTO `responses_people` VALUES ('2152', '55c939d6-e07a-493f-b039-b52aba1e704c', '267', '124', '85', '30', '7', '5', 'Infraestructura, Equipamiento');
INSERT INTO `responses_people` VALUES ('2153', '55c939d6-e07a-493f-b039-b52aba1e704c', '268', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2154', '55c939d6-e07a-493f-b039-b52aba1e704c', '269', '125', '86', '31', '7', '5', 'Convenios');
INSERT INTO `responses_people` VALUES ('2155', '55c939d6-e07a-493f-b039-b52aba1e704c', '270', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2156', '55c939d6-e07a-493f-b039-b52aba1e704c', '271', '126', '87', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2157', '55c939d6-e07a-493f-b039-b52aba1e704c', '272', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2158', '55c939d6-e07a-493f-b039-b52aba1e704c', '273', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2159', '55c939d6-e07a-493f-b039-b52aba1e704c', '274', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2160', '55c939d6-e07a-493f-b039-b52aba1e704c', '275', '127', '88', '31', '7', '3', 'Expediente de Compra de Equipos para automatizar las aulas');
INSERT INTO `responses_people` VALUES ('2161', '55c939d6-e07a-493f-b039-b52aba1e704c', '276', '127', '88', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2162', '55c939d6-e07a-493f-b039-b52aba1e704c', '277', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2163', '55c939d6-e07a-493f-b039-b52aba1e704c', '278', '128', '89', '31', '7', '5', 'Laboratorios actualizados');
INSERT INTO `responses_people` VALUES ('2164', '55c939d6-e07a-493f-b039-b52aba1e704c', '279', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2165', '55c939d6-e07a-493f-b039-b52aba1e704c', '280', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2166', '55c939d6-e07a-493f-b039-b52aba1e704c', '281', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2167', '55c939d6-e07a-493f-b039-b52aba1e704c', '282', '130', '91', '32', '7', '5', 'Qosqo');
INSERT INTO `responses_people` VALUES ('2168', '55c939d6-e07a-493f-b039-b52aba1e704c', '283', '130', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2169', '55c939d6-e07a-493f-b039-b52aba1e704c', '284', '131', '91', '32', '7', '5', 'Qosqo');
INSERT INTO `responses_people` VALUES ('2170', '55c939d6-e07a-493f-b039-b52aba1e704c', '285', '131', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2171', '55c939d6-e07a-493f-b039-b52aba1e704c', '286', '132', '92', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2172', '55c939d6-e07a-493f-b039-b52aba1e704c', '287', '132', '92', '32', '7', '5', 'Reuniones');
INSERT INTO `responses_people` VALUES ('2173', '55c939d6-e07a-493f-b039-b52aba1e704c', '288', '133', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2174', '55c939d6-e07a-493f-b039-b52aba1e704c', '289', '133', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2175', '55c939d6-e07a-493f-b039-b52aba1e704c', '290', '134', '93', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2176', '55c939d6-e07a-493f-b039-b52aba1e704c', '291', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2177', '55c939d6-e07a-493f-b039-b52aba1e704c', '292', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2178', '55c939d6-e07a-493f-b039-b52aba1e704c', '293', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2179', '55c939d6-e07a-493f-b039-b52aba1e704c', '294', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2180', '55c939d6-e07a-493f-b039-b52aba1e704c', '295', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2181', '55c939d6-e07a-493f-b039-b52aba1e704c', '296', '136', '95', '32', '7', '5', 'Mesa de entrada, Redes Sociales');
INSERT INTO `responses_people` VALUES ('2182', '55c939d6-e07a-493f-b039-b52aba1e704c', '297', '137', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2183', '55c939d6-e07a-493f-b039-b52aba1e704c', '298', '137', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2184', '55c939d6-e07a-493f-b039-b52aba1e704c', '299', '138', '96', '33', '7', '10', 'Encuestas');
INSERT INTO `responses_people` VALUES ('2185', '55c939d6-e07a-493f-b039-b52aba1e704c', '300', '139', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2186', '55c939d6-e07a-493f-b039-b52aba1e704c', '301', '139', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2187', '55c939d6-e07a-493f-b039-b52aba1e704c', '302', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2188', '55c939d6-e07a-493f-b039-b52aba1e704c', '303', '140', '96', '33', '7', '8', 'Alumnos que realizan cambio de universidades');
INSERT INTO `responses_people` VALUES ('2189', '55c939d6-e07a-493f-b039-b52aba1e704c', '304', '140', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2190', '55c939d6-e07a-493f-b039-b52aba1e704c', '305', '141', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2191', '55c939d6-e07a-493f-b039-b52aba1e704c', '306', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2192', '55c939d6-e07a-493f-b039-b52aba1e704c', '307', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2193', '55c939d6-e07a-493f-b039-b52aba1e704c', '308', '142', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2194', '55c939d6-e07a-493f-b039-b52aba1e704c', '309', '143', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2195', '55c939d6-e07a-493f-b039-b52aba1e704c', '310', '143', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2196', '55c939d6-e07a-493f-b039-b52aba1e704c', '311', '144', '98', '34', '7', '15', 'Nota por mesa de Entrada');
INSERT INTO `responses_people` VALUES ('2197', '55c939d6-e07a-493f-b039-b52aba1e704c', '312', '145', '98', '34', '7', '15', 'Qosqo');
INSERT INTO `responses_people` VALUES ('2198', '55c939d6-e07a-493f-b039-b52aba1e704c', '313', '145', '98', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2199', '55c939d6-e07a-493f-b039-b52aba1e704c', '314', '145', '98', '34', '7', '15', 'Qosqo');
INSERT INTO `responses_people` VALUES ('2200', '55c939d6-e07a-493f-b039-b52aba1e704c', '315', '146', '98', '34', '7', '11', 'Qosqo');
INSERT INTO `responses_people` VALUES ('2201', '55c939d6-e07a-493f-b039-b52aba1e704c', '316', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2202', '55c939d6-e07a-493f-b039-b52aba1e704c', '317', '147', '99', '34', '7', '13', 'Pif');
INSERT INTO `responses_people` VALUES ('2203', '55c939d6-e07a-493f-b039-b52aba1e704c', '318', '148', '99', '34', '7', '15', 'Qosqo');
INSERT INTO `responses_people` VALUES ('2204', '55c939d6-e07a-493f-b039-b52aba1e704c', '319', '148', '99', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2205', '55c939d6-e07a-493f-b039-b52aba1e704c', '320', '148', '99', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2206', '55c939d6-e07a-493f-b039-b52aba1e704c', '321', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2207', '55c939d6-e07a-493f-b039-b52aba1e704c', '322', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2208', '55c939d6-e07a-493f-b039-b52aba1e704c', '323', '150', '100', '35', '7', '5', 'Diarios, Web, Tv');
INSERT INTO `responses_people` VALUES ('2209', '55c939d6-e07a-493f-b039-b52aba1e704c', '324', '150', '100', '35', '7', '5', 'Diarios, Web, T');
INSERT INTO `responses_people` VALUES ('2210', '55c939d6-e07a-493f-b039-b52aba1e704c', '325', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2211', '55c939d6-e07a-493f-b039-b52aba1e704c', '326', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2212', '55c939d6-e07a-493f-b039-b52aba1e704c', '327', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2213', '55c939d6-e07a-493f-b039-b52aba1e704c', '328', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2214', '55c939d6-e07a-493f-b039-b52aba1e704c', '329', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2215', '55c939d6-e07a-493f-b039-b52aba1e704c', '330', '152', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2216', '55c939d6-e07a-493f-b039-b52aba1e704c', '331', '152', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2217', '55c939d6-e07a-493f-b039-b52aba1e704c', '332', '153', '102', '36', '7', '10', 'Qosqo');
INSERT INTO `responses_people` VALUES ('2218', '55c939d6-e07a-493f-b039-b52aba1e704c', '333', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2219', '55c939d6-e07a-493f-b039-b52aba1e704c', '334', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2220', '55c939d6-e07a-493f-b039-b52aba1e704c', '335', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2221', '55c939d6-e07a-493f-b039-b52aba1e704c', '336', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2222', '55c939d6-e07a-493f-b039-b52aba1e704c', '337', '156', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2223', '55c939d6-e07a-493f-b039-b52aba1e704c', '338', '157', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2224', '55c939d6-e07a-493f-b039-b52aba1e704c', '339', '158', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2225', '55c939d6-e07a-493f-b039-b52aba1e704c', '340', '159', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2226', '55c939d6-e07a-493f-b039-b52aba1e704c', '341', '159', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2227', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '232', '110', '72', '28', '7', '5', 'Pag Web');
INSERT INTO `responses_people` VALUES ('2228', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '233', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2229', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '234', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2230', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '235', '111', '73', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2231', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '236', '112', '74', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2232', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '237', '112', '74', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2233', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '238', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2234', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '239', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2235', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '240', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2236', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '241', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2237', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '242', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2238', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '243', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2239', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '243', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2240', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '244', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2241', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '245', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2242', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '246', '116', '77', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2243', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '247', '117', '78', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2244', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '248', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2245', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '249', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2246', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '250', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2247', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '251', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2248', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '252', '119', '80', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2249', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '253', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2250', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '254', '120', '81', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2251', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '255', '120', '81', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2252', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '256', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2253', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '257', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2254', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '258', '121', '82', '30', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2255', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '259', '122', '83', '30', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2256', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '260', '122', '83', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2257', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '261', '122', '83', '30', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2258', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '262', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2259', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '263', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2260', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '264', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2261', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '265', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2262', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '266', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2263', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '267', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2264', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '268', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2265', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '269', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2266', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '270', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2267', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '271', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2268', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '272', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2269', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '273', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2270', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '274', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2271', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '275', '127', '88', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2272', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '276', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2273', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '277', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2274', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '278', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2275', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '279', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2276', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '280', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2277', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '281', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2278', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '282', '130', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2279', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '283', '130', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2280', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '284', '131', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2281', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '285', '131', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2282', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '286', '132', '92', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2283', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '287', '132', '92', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2284', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '288', '133', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2285', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '289', '133', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2286', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '290', '134', '93', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2287', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '291', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2288', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '292', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2289', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '293', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2290', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '294', '136', '95', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2291', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '295', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2292', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '296', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2293', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '297', '137', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2294', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '298', '137', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2295', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '299', '138', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2296', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '300', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2297', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '301', '139', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2298', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '302', '139', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2299', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '303', '140', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2300', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '304', '140', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2301', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '305', '141', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2302', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '306', '142', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2303', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '307', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2304', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '308', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2305', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '309', '143', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2306', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '310', '143', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2307', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '311', '144', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2308', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '312', '145', '98', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2309', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '313', '145', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2310', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '314', '145', '98', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2311', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '315', '146', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2312', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '316', '146', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2313', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '317', '147', '99', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2314', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '318', '148', '99', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2315', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '319', '148', '99', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2316', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '320', '148', '99', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2317', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '321', '149', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2318', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '322', '149', '99', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2319', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '323', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2320', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '324', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2321', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '325', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2322', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '326', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2323', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '327', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2324', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '328', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2325', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '329', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2326', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '330', '152', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2327', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '331', '152', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2328', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '332', '153', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2329', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '333', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2330', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '334', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2331', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '335', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2332', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '336', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2333', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '337', '156', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2334', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '338', '157', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2335', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '339', '158', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2336', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '340', '159', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2337', '27aeee9f-ec36-482c-a455-8c4ac32e5105', '341', '159', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2338', '5c34e211-65f7-4624-8adf-ddac5f028abe', '232', '110', '72', '28', '7', '5', 'Pif Sitio Web');
INSERT INTO `responses_people` VALUES ('2339', '5c34e211-65f7-4624-8adf-ddac5f028abe', '233', '110', '72', '28', '7', '5', 'Pif Sitio Web');
INSERT INTO `responses_people` VALUES ('2340', '5c34e211-65f7-4624-8adf-ddac5f028abe', '234', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2341', '5c34e211-65f7-4624-8adf-ddac5f028abe', '235', '111', '73', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2342', '5c34e211-65f7-4624-8adf-ddac5f028abe', '236', '112', '74', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2343', '5c34e211-65f7-4624-8adf-ddac5f028abe', '237', '112', '74', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2344', '5c34e211-65f7-4624-8adf-ddac5f028abe', '238', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2345', '5c34e211-65f7-4624-8adf-ddac5f028abe', '239', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2346', '5c34e211-65f7-4624-8adf-ddac5f028abe', '240', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2347', '5c34e211-65f7-4624-8adf-ddac5f028abe', '241', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2348', '5c34e211-65f7-4624-8adf-ddac5f028abe', '242', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2349', '5c34e211-65f7-4624-8adf-ddac5f028abe', '243', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2350', '5c34e211-65f7-4624-8adf-ddac5f028abe', '243', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2351', '5c34e211-65f7-4624-8adf-ddac5f028abe', '244', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2352', '5c34e211-65f7-4624-8adf-ddac5f028abe', '245', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2353', '5c34e211-65f7-4624-8adf-ddac5f028abe', '246', '116', '77', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2354', '5c34e211-65f7-4624-8adf-ddac5f028abe', '247', '117', '78', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2355', '5c34e211-65f7-4624-8adf-ddac5f028abe', '248', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2356', '5c34e211-65f7-4624-8adf-ddac5f028abe', '249', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2357', '5c34e211-65f7-4624-8adf-ddac5f028abe', '250', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2358', '5c34e211-65f7-4624-8adf-ddac5f028abe', '251', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2359', '5c34e211-65f7-4624-8adf-ddac5f028abe', '252', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2360', '5c34e211-65f7-4624-8adf-ddac5f028abe', '253', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2361', '5c34e211-65f7-4624-8adf-ddac5f028abe', '254', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2362', '5c34e211-65f7-4624-8adf-ddac5f028abe', '255', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2363', '5c34e211-65f7-4624-8adf-ddac5f028abe', '256', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2364', '5c34e211-65f7-4624-8adf-ddac5f028abe', '257', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2365', '5c34e211-65f7-4624-8adf-ddac5f028abe', '258', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2366', '5c34e211-65f7-4624-8adf-ddac5f028abe', '259', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2367', '5c34e211-65f7-4624-8adf-ddac5f028abe', '260', '122', '83', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2368', '5c34e211-65f7-4624-8adf-ddac5f028abe', '261', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2369', '5c34e211-65f7-4624-8adf-ddac5f028abe', '262', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2370', '5c34e211-65f7-4624-8adf-ddac5f028abe', '263', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2371', '5c34e211-65f7-4624-8adf-ddac5f028abe', '264', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2372', '5c34e211-65f7-4624-8adf-ddac5f028abe', '265', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2373', '5c34e211-65f7-4624-8adf-ddac5f028abe', '266', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2374', '5c34e211-65f7-4624-8adf-ddac5f028abe', '267', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2375', '5c34e211-65f7-4624-8adf-ddac5f028abe', '268', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2376', '5c34e211-65f7-4624-8adf-ddac5f028abe', '269', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2377', '5c34e211-65f7-4624-8adf-ddac5f028abe', '270', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2378', '5c34e211-65f7-4624-8adf-ddac5f028abe', '271', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2379', '5c34e211-65f7-4624-8adf-ddac5f028abe', '272', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2380', '5c34e211-65f7-4624-8adf-ddac5f028abe', '273', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2381', '5c34e211-65f7-4624-8adf-ddac5f028abe', '274', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2382', '5c34e211-65f7-4624-8adf-ddac5f028abe', '275', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2383', '5c34e211-65f7-4624-8adf-ddac5f028abe', '276', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2384', '5c34e211-65f7-4624-8adf-ddac5f028abe', '277', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2385', '5c34e211-65f7-4624-8adf-ddac5f028abe', '278', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2386', '5c34e211-65f7-4624-8adf-ddac5f028abe', '279', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2387', '5c34e211-65f7-4624-8adf-ddac5f028abe', '280', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2388', '5c34e211-65f7-4624-8adf-ddac5f028abe', '281', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2389', '5c34e211-65f7-4624-8adf-ddac5f028abe', '282', '130', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2390', '5c34e211-65f7-4624-8adf-ddac5f028abe', '283', '130', '91', '32', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2391', '5c34e211-65f7-4624-8adf-ddac5f028abe', '284', '131', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2392', '5c34e211-65f7-4624-8adf-ddac5f028abe', '285', '131', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2393', '5c34e211-65f7-4624-8adf-ddac5f028abe', '286', '132', '92', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2394', '5c34e211-65f7-4624-8adf-ddac5f028abe', '287', '132', '92', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2395', '5c34e211-65f7-4624-8adf-ddac5f028abe', '288', '133', '93', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2396', '5c34e211-65f7-4624-8adf-ddac5f028abe', '289', '133', '93', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2397', '5c34e211-65f7-4624-8adf-ddac5f028abe', '290', '134', '93', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2398', '5c34e211-65f7-4624-8adf-ddac5f028abe', '291', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2399', '5c34e211-65f7-4624-8adf-ddac5f028abe', '292', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2400', '5c34e211-65f7-4624-8adf-ddac5f028abe', '293', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2401', '5c34e211-65f7-4624-8adf-ddac5f028abe', '294', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2402', '5c34e211-65f7-4624-8adf-ddac5f028abe', '295', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2403', '5c34e211-65f7-4624-8adf-ddac5f028abe', '296', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2404', '5c34e211-65f7-4624-8adf-ddac5f028abe', '297', '137', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2405', '5c34e211-65f7-4624-8adf-ddac5f028abe', '298', '137', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2406', '5c34e211-65f7-4624-8adf-ddac5f028abe', '299', '138', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2407', '5c34e211-65f7-4624-8adf-ddac5f028abe', '300', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2408', '5c34e211-65f7-4624-8adf-ddac5f028abe', '301', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2409', '5c34e211-65f7-4624-8adf-ddac5f028abe', '302', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2410', '5c34e211-65f7-4624-8adf-ddac5f028abe', '303', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2411', '5c34e211-65f7-4624-8adf-ddac5f028abe', '304', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2412', '5c34e211-65f7-4624-8adf-ddac5f028abe', '305', '141', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2413', '5c34e211-65f7-4624-8adf-ddac5f028abe', '306', '142', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2414', '5c34e211-65f7-4624-8adf-ddac5f028abe', '307', '142', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2415', '5c34e211-65f7-4624-8adf-ddac5f028abe', '308', '142', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2416', '5c34e211-65f7-4624-8adf-ddac5f028abe', '309', '143', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2417', '5c34e211-65f7-4624-8adf-ddac5f028abe', '310', '143', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2418', '5c34e211-65f7-4624-8adf-ddac5f028abe', '311', '144', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2419', '5c34e211-65f7-4624-8adf-ddac5f028abe', '312', '145', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2420', '5c34e211-65f7-4624-8adf-ddac5f028abe', '313', '145', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2421', '5c34e211-65f7-4624-8adf-ddac5f028abe', '314', '145', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2422', '5c34e211-65f7-4624-8adf-ddac5f028abe', '315', '146', '98', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2423', '5c34e211-65f7-4624-8adf-ddac5f028abe', '316', '146', '98', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('2424', '5c34e211-65f7-4624-8adf-ddac5f028abe', '317', '147', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2425', '5c34e211-65f7-4624-8adf-ddac5f028abe', '318', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2426', '5c34e211-65f7-4624-8adf-ddac5f028abe', '319', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2427', '5c34e211-65f7-4624-8adf-ddac5f028abe', '320', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2428', '5c34e211-65f7-4624-8adf-ddac5f028abe', '321', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2429', '5c34e211-65f7-4624-8adf-ddac5f028abe', '322', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2430', '5c34e211-65f7-4624-8adf-ddac5f028abe', '323', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2431', '5c34e211-65f7-4624-8adf-ddac5f028abe', '324', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2432', '5c34e211-65f7-4624-8adf-ddac5f028abe', '325', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2433', '5c34e211-65f7-4624-8adf-ddac5f028abe', '326', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2434', '5c34e211-65f7-4624-8adf-ddac5f028abe', '327', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2435', '5c34e211-65f7-4624-8adf-ddac5f028abe', '328', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2436', '5c34e211-65f7-4624-8adf-ddac5f028abe', '329', '151', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2437', '5c34e211-65f7-4624-8adf-ddac5f028abe', '330', '152', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2438', '5c34e211-65f7-4624-8adf-ddac5f028abe', '331', '152', '101', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2439', '5c34e211-65f7-4624-8adf-ddac5f028abe', '332', '153', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2440', '5c34e211-65f7-4624-8adf-ddac5f028abe', '333', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2441', '5c34e211-65f7-4624-8adf-ddac5f028abe', '334', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2442', '5c34e211-65f7-4624-8adf-ddac5f028abe', '335', '155', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2443', '5c34e211-65f7-4624-8adf-ddac5f028abe', '336', '155', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2444', '5c34e211-65f7-4624-8adf-ddac5f028abe', '337', '156', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2445', '5c34e211-65f7-4624-8adf-ddac5f028abe', '338', '157', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2446', '5c34e211-65f7-4624-8adf-ddac5f028abe', '339', '158', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2447', '5c34e211-65f7-4624-8adf-ddac5f028abe', '340', '159', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2448', '5c34e211-65f7-4624-8adf-ddac5f028abe', '341', '159', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2449', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '232', '110', '72', '28', '7', '4', 'Pif');
INSERT INTO `responses_people` VALUES ('2450', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '233', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2451', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '234', '110', '72', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2452', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '235', '111', '73', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2453', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '236', '112', '74', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2454', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '237', '112', '74', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2455', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '238', '113', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2456', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '239', '113', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2457', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '240', '113', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2458', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '241', '114', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2459', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '242', '114', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2460', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '243', '114', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2461', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '243', '115', '76', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2462', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '244', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2463', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '245', '115', '76', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2464', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '246', '116', '77', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2465', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '247', '117', '78', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2466', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '248', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2467', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '249', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2468', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '250', '118', '79', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2469', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '251', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2470', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '252', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2471', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '253', '119', '80', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2472', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '254', '120', '81', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2473', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '255', '120', '81', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2474', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '256', '121', '82', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2475', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '257', '121', '82', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2476', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '258', '121', '82', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2477', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '259', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2478', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '260', '122', '83', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2479', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '261', '122', '83', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2480', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '262', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2481', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '263', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2482', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '264', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2483', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '265', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2484', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '266', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2485', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '267', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2486', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '268', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2487', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '269', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2488', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '270', '125', '86', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2489', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '271', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2490', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '272', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2491', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '273', '126', '87', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2492', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '274', '127', '88', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2493', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '275', '127', '88', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2494', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '276', '127', '88', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2495', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '277', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2496', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '278', '128', '89', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2497', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '279', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2498', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '280', '129', '90', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2499', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '281', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2500', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '282', '130', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2501', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '283', '130', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2502', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '284', '131', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2503', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '285', '131', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2504', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '286', '132', '92', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2505', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '287', '132', '92', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2506', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '288', '133', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2507', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '289', '133', '93', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2508', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '290', '134', '93', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2509', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '291', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2510', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '292', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2511', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '293', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2512', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '294', '136', '95', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2513', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '295', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2514', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '296', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2515', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '297', '137', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2516', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '298', '137', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2517', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '299', '138', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2518', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '300', '139', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2519', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '301', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2520', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '302', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2521', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '303', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2522', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '304', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2523', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '305', '141', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2524', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '306', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2525', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '307', '142', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2526', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '308', '142', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2527', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '309', '143', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2528', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '310', '143', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2529', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '311', '144', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2530', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '312', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2531', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '313', '145', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2532', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '314', '145', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2533', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '315', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2534', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '316', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2535', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '317', '147', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2536', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '318', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2537', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '319', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2538', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '320', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2539', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '321', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2540', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '322', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2541', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '323', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2542', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '324', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2543', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '325', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2544', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '326', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2545', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '327', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2546', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '328', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2547', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '329', '151', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2548', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '330', '152', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2549', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '331', '152', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2550', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '332', '153', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2551', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '333', '154', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2552', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '334', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2553', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '335', '155', '102', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2554', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '336', '155', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2555', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '337', '156', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2556', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '338', '157', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2557', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '339', '158', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2558', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '340', '159', '103', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2559', 'f3de4421-8440-40ae-abb8-3e127ab27ed2', '341', '159', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2560', 'a60013e4-6d01-423f-94b9-4477a0241556', '232', '110', '72', '28', '7', '4', 'WebSite UTN, PIF UTN FRT');
INSERT INTO `responses_people` VALUES ('2561', 'a60013e4-6d01-423f-94b9-4477a0241556', '233', '110', '72', '28', '7', '4', 'WebSite UTN, PIF UTN FRT');
INSERT INTO `responses_people` VALUES ('2562', 'a60013e4-6d01-423f-94b9-4477a0241556', '234', '110', '72', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2563', 'a60013e4-6d01-423f-94b9-4477a0241556', '235', '111', '73', '28', '7', '3', 'GP');
INSERT INTO `responses_people` VALUES ('2564', 'a60013e4-6d01-423f-94b9-4477a0241556', '236', '112', '74', '28', '7', '3', 'Mesa de Entrada');
INSERT INTO `responses_people` VALUES ('2565', 'a60013e4-6d01-423f-94b9-4477a0241556', '237', '112', '74', '28', '7', '3', 'Tachos de Basura, antenas de ionosonda');
INSERT INTO `responses_people` VALUES ('2566', 'a60013e4-6d01-423f-94b9-4477a0241556', '238', '113', '75', '28', '7', '2', 'Reuniones');
INSERT INTO `responses_people` VALUES ('2567', 'a60013e4-6d01-423f-94b9-4477a0241556', '239', '113', '75', '28', '7', '3', 'Reuniones');
INSERT INTO `responses_people` VALUES ('2568', 'a60013e4-6d01-423f-94b9-4477a0241556', '240', '113', '75', '28', '7', '3', 'Mesa de Entrada');
INSERT INTO `responses_people` VALUES ('2569', 'a60013e4-6d01-423f-94b9-4477a0241556', '241', '114', '75', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2570', 'a60013e4-6d01-423f-94b9-4477a0241556', '242', '114', '75', '28', '7', '3', 'Semana de Ing');
INSERT INTO `responses_people` VALUES ('2571', 'a60013e4-6d01-423f-94b9-4477a0241556', '243', '114', '75', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2572', 'a60013e4-6d01-423f-94b9-4477a0241556', '243', '115', '76', '28', '7', '2', 'GP');
INSERT INTO `responses_people` VALUES ('2573', 'a60013e4-6d01-423f-94b9-4477a0241556', '244', '115', '76', '28', '7', '3', 'Sec Administrativa');
INSERT INTO `responses_people` VALUES ('2574', 'a60013e4-6d01-423f-94b9-4477a0241556', '245', '115', '76', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2575', 'a60013e4-6d01-423f-94b9-4477a0241556', '246', '116', '77', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2576', 'a60013e4-6d01-423f-94b9-4477a0241556', '247', '117', '78', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2577', 'a60013e4-6d01-423f-94b9-4477a0241556', '248', '118', '79', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2578', 'a60013e4-6d01-423f-94b9-4477a0241556', '249', '118', '79', '29', '7', '3', 'GP');
INSERT INTO `responses_people` VALUES ('2579', 'a60013e4-6d01-423f-94b9-4477a0241556', '250', '118', '79', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2580', 'a60013e4-6d01-423f-94b9-4477a0241556', '251', '119', '80', '29', '7', '2', 'GP');
INSERT INTO `responses_people` VALUES ('2581', 'a60013e4-6d01-423f-94b9-4477a0241556', '252', '119', '80', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2582', 'a60013e4-6d01-423f-94b9-4477a0241556', '253', '119', '80', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2583', 'a60013e4-6d01-423f-94b9-4477a0241556', '254', '120', '81', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2584', 'a60013e4-6d01-423f-94b9-4477a0241556', '255', '120', '81', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2585', 'a60013e4-6d01-423f-94b9-4477a0241556', '256', '121', '82', '30', '7', '2', 'Capacitaciones');
INSERT INTO `responses_people` VALUES ('2586', 'a60013e4-6d01-423f-94b9-4477a0241556', '257', '121', '82', '30', '7', '2', 'capacitaciones');
INSERT INTO `responses_people` VALUES ('2587', 'a60013e4-6d01-423f-94b9-4477a0241556', '258', '121', '82', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2588', 'a60013e4-6d01-423f-94b9-4477a0241556', '259', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2589', 'a60013e4-6d01-423f-94b9-4477a0241556', '260', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2590', 'a60013e4-6d01-423f-94b9-4477a0241556', '261', '122', '83', '30', '7', '3', 'reuniones');
INSERT INTO `responses_people` VALUES ('2591', 'a60013e4-6d01-423f-94b9-4477a0241556', '262', '123', '84', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2592', 'a60013e4-6d01-423f-94b9-4477a0241556', '263', '123', '84', '30', '7', '2', 'reuniones, gp');
INSERT INTO `responses_people` VALUES ('2593', 'a60013e4-6d01-423f-94b9-4477a0241556', '264', '123', '84', '30', '7', '3', 'gp, reuniones');
INSERT INTO `responses_people` VALUES ('2594', 'a60013e4-6d01-423f-94b9-4477a0241556', '265', '124', '85', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2595', 'a60013e4-6d01-423f-94b9-4477a0241556', '266', '124', '85', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2596', 'a60013e4-6d01-423f-94b9-4477a0241556', '267', '124', '85', '30', '7', '4', 'instalaciones utn frt del PAS');
INSERT INTO `responses_people` VALUES ('2597', 'a60013e4-6d01-423f-94b9-4477a0241556', '268', '124', '85', '30', '7', '4', 'reuniones');
INSERT INTO `responses_people` VALUES ('2598', 'a60013e4-6d01-423f-94b9-4477a0241556', '269', '125', '86', '31', '7', '4', 'sec de vinculación');
INSERT INTO `responses_people` VALUES ('2599', 'a60013e4-6d01-423f-94b9-4477a0241556', '270', '125', '86', '31', '7', '4', 'proyectos en común');
INSERT INTO `responses_people` VALUES ('2600', 'a60013e4-6d01-423f-94b9-4477a0241556', '271', '126', '87', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2601', 'a60013e4-6d01-423f-94b9-4477a0241556', '272', '126', '87', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2602', 'a60013e4-6d01-423f-94b9-4477a0241556', '273', '126', '87', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2603', 'a60013e4-6d01-423f-94b9-4477a0241556', '274', '127', '88', '31', '7', '3', 'PAS');
INSERT INTO `responses_people` VALUES ('2604', 'a60013e4-6d01-423f-94b9-4477a0241556', '275', '127', '88', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2605', 'a60013e4-6d01-423f-94b9-4477a0241556', '276', '127', '88', '31', '7', '3', 'tachos de basura ecológicos');
INSERT INTO `responses_people` VALUES ('2606', 'a60013e4-6d01-423f-94b9-4477a0241556', '277', '128', '89', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2607', 'a60013e4-6d01-423f-94b9-4477a0241556', '278', '128', '89', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2608', 'a60013e4-6d01-423f-94b9-4477a0241556', '279', '129', '90', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2609', 'a60013e4-6d01-423f-94b9-4477a0241556', '280', '129', '90', '31', '7', '2', 'el tecnologico');
INSERT INTO `responses_people` VALUES ('2610', 'a60013e4-6d01-423f-94b9-4477a0241556', '281', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2611', 'a60013e4-6d01-423f-94b9-4477a0241556', '282', '130', '91', '32', '7', '2', 'gp');
INSERT INTO `responses_people` VALUES ('2612', 'a60013e4-6d01-423f-94b9-4477a0241556', '283', '130', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2613', 'a60013e4-6d01-423f-94b9-4477a0241556', '284', '131', '91', '32', '7', '2', 'gp');
INSERT INTO `responses_people` VALUES ('2614', 'a60013e4-6d01-423f-94b9-4477a0241556', '285', '131', '91', '32', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2615', 'a60013e4-6d01-423f-94b9-4477a0241556', '286', '132', '92', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2616', 'a60013e4-6d01-423f-94b9-4477a0241556', '287', '132', '92', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2617', 'a60013e4-6d01-423f-94b9-4477a0241556', '288', '133', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2618', 'a60013e4-6d01-423f-94b9-4477a0241556', '289', '133', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2619', 'a60013e4-6d01-423f-94b9-4477a0241556', '290', '134', '93', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2620', 'a60013e4-6d01-423f-94b9-4477a0241556', '291', '135', '94', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2621', 'a60013e4-6d01-423f-94b9-4477a0241556', '292', '135', '94', '32', '7', '3', 'el tecnologico, webSite, noticias en diarios, redes sociales');
INSERT INTO `responses_people` VALUES ('2622', 'a60013e4-6d01-423f-94b9-4477a0241556', '293', '135', '94', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2623', 'a60013e4-6d01-423f-94b9-4477a0241556', '294', '136', '95', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2624', 'a60013e4-6d01-423f-94b9-4477a0241556', '295', '136', '95', '32', '7', '3', 'mesa de entrada');
INSERT INTO `responses_people` VALUES ('2625', 'a60013e4-6d01-423f-94b9-4477a0241556', '296', '136', '95', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2626', 'a60013e4-6d01-423f-94b9-4477a0241556', '297', '137', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2627', 'a60013e4-6d01-423f-94b9-4477a0241556', '298', '137', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2628', 'a60013e4-6d01-423f-94b9-4477a0241556', '299', '138', '96', '33', '7', '8', 'noticias');
INSERT INTO `responses_people` VALUES ('2629', 'a60013e4-6d01-423f-94b9-4477a0241556', '300', '139', '96', '33', '7', '8', 'gp');
INSERT INTO `responses_people` VALUES ('2630', 'a60013e4-6d01-423f-94b9-4477a0241556', '301', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2631', 'a60013e4-6d01-423f-94b9-4477a0241556', '302', '139', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2632', 'a60013e4-6d01-423f-94b9-4477a0241556', '303', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2633', 'a60013e4-6d01-423f-94b9-4477a0241556', '304', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2634', 'a60013e4-6d01-423f-94b9-4477a0241556', '305', '141', '97', '33', '7', '8', 'gp');
INSERT INTO `responses_people` VALUES ('2635', 'a60013e4-6d01-423f-94b9-4477a0241556', '306', '142', '97', '33', '7', '8', 'gp');
INSERT INTO `responses_people` VALUES ('2636', 'a60013e4-6d01-423f-94b9-4477a0241556', '307', '142', '97', '33', '7', '8', 'gp');
INSERT INTO `responses_people` VALUES ('2637', 'a60013e4-6d01-423f-94b9-4477a0241556', '308', '142', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2638', 'a60013e4-6d01-423f-94b9-4477a0241556', '309', '143', '97', '33', '7', '8', 'datos como el nro de ingresantes, los que ingresan a la facultad de otras universidades, etc');
INSERT INTO `responses_people` VALUES ('2639', 'a60013e4-6d01-423f-94b9-4477a0241556', '310', '143', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2640', 'a60013e4-6d01-423f-94b9-4477a0241556', '311', '144', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2641', 'a60013e4-6d01-423f-94b9-4477a0241556', '312', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2642', 'a60013e4-6d01-423f-94b9-4477a0241556', '313', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2643', 'a60013e4-6d01-423f-94b9-4477a0241556', '314', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2644', 'a60013e4-6d01-423f-94b9-4477a0241556', '315', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2645', 'a60013e4-6d01-423f-94b9-4477a0241556', '316', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2646', 'a60013e4-6d01-423f-94b9-4477a0241556', '317', '147', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2647', 'a60013e4-6d01-423f-94b9-4477a0241556', '318', '148', '99', '34', '7', '13', 'gp');
INSERT INTO `responses_people` VALUES ('2648', 'a60013e4-6d01-423f-94b9-4477a0241556', '319', '148', '99', '34', '7', '13', 'gp');
INSERT INTO `responses_people` VALUES ('2649', 'a60013e4-6d01-423f-94b9-4477a0241556', '320', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2650', 'a60013e4-6d01-423f-94b9-4477a0241556', '321', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2651', 'a60013e4-6d01-423f-94b9-4477a0241556', '322', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2652', 'a60013e4-6d01-423f-94b9-4477a0241556', '323', '150', '100', '35', '7', '2', 'noticias, redes sociales');
INSERT INTO `responses_people` VALUES ('2653', 'a60013e4-6d01-423f-94b9-4477a0241556', '324', '150', '100', '35', '7', '3', 'noticias, redes sociales');
INSERT INTO `responses_people` VALUES ('2654', 'a60013e4-6d01-423f-94b9-4477a0241556', '325', '150', '100', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2655', 'a60013e4-6d01-423f-94b9-4477a0241556', '326', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2656', 'a60013e4-6d01-423f-94b9-4477a0241556', '327', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2657', 'a60013e4-6d01-423f-94b9-4477a0241556', '328', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2658', 'a60013e4-6d01-423f-94b9-4477a0241556', '329', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2659', 'a60013e4-6d01-423f-94b9-4477a0241556', '330', '152', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2660', 'a60013e4-6d01-423f-94b9-4477a0241556', '331', '152', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2661', 'a60013e4-6d01-423f-94b9-4477a0241556', '332', '153', '102', '36', '7', '7', 'gp');
INSERT INTO `responses_people` VALUES ('2662', 'a60013e4-6d01-423f-94b9-4477a0241556', '333', '154', '102', '36', '7', '8', 'gp');
INSERT INTO `responses_people` VALUES ('2663', 'a60013e4-6d01-423f-94b9-4477a0241556', '334', '154', '102', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2664', 'a60013e4-6d01-423f-94b9-4477a0241556', '335', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2665', 'a60013e4-6d01-423f-94b9-4477a0241556', '336', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2666', 'a60013e4-6d01-423f-94b9-4477a0241556', '337', '156', '103', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2667', 'a60013e4-6d01-423f-94b9-4477a0241556', '338', '157', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2668', 'a60013e4-6d01-423f-94b9-4477a0241556', '339', '158', '103', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2669', 'a60013e4-6d01-423f-94b9-4477a0241556', '340', '159', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2670', 'a60013e4-6d01-423f-94b9-4477a0241556', '341', '159', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2671', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '232', '110', '72', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2672', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '233', '110', '72', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2673', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '234', '110', '72', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2674', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '235', '111', '73', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2675', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '236', '112', '74', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2676', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '237', '112', '74', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2677', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '238', '113', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2678', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '239', '113', '75', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2679', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '240', '113', '75', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2680', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '241', '114', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2681', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '242', '114', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2682', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '243', '114', '75', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2683', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '243', '115', '76', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2684', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '244', '115', '76', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2685', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '245', '115', '76', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2686', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '246', '116', '77', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2687', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '247', '117', '78', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2688', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '248', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2689', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '249', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2690', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '250', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2691', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '251', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2692', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '252', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2693', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '253', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2694', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '254', '120', '81', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2695', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '255', '120', '81', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2696', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '256', '121', '82', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2697', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '257', '121', '82', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2698', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '258', '121', '82', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2699', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '259', '122', '83', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2700', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '260', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2701', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '261', '122', '83', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2702', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '262', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2703', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '263', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2704', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '264', '123', '84', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2705', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '265', '124', '85', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2706', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '266', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2707', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '267', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2708', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '268', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2709', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '269', '125', '86', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2710', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '270', '125', '86', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2711', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '271', '126', '87', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2712', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '272', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2713', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '273', '126', '87', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2714', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '274', '127', '88', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2715', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '275', '127', '88', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2716', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '276', '127', '88', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2717', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '277', '128', '89', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2718', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '278', '128', '89', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2719', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '279', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2720', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '280', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2721', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '281', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2722', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '282', '130', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2723', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '283', '130', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2724', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '284', '131', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2725', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '285', '131', '91', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2726', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '286', '132', '92', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2727', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '287', '132', '92', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2728', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '288', '133', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2729', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '289', '133', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2730', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '290', '134', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2731', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '291', '135', '94', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2732', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '292', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2733', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '293', '135', '94', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2734', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '294', '136', '95', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2735', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '295', '136', '95', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2736', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '296', '136', '95', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2737', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '297', '137', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2738', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '298', '137', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2739', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '299', '138', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2740', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '300', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2741', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '301', '139', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2742', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '302', '139', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2743', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '303', '140', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2744', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '304', '140', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2745', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '305', '141', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2746', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '306', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2747', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '307', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2748', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '308', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2749', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '309', '143', '97', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2750', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '310', '143', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2751', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '311', '144', '98', '34', '7', '14', '');
INSERT INTO `responses_people` VALUES ('2752', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '312', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2753', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '313', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2754', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '314', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2755', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '315', '146', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2756', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '316', '146', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2757', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '317', '147', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2758', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '318', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2759', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '319', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2760', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '320', '148', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2761', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '321', '149', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2762', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '322', '149', '99', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2763', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '323', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2764', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '324', '150', '100', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2765', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '325', '150', '100', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2766', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '326', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2767', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '327', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2768', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '328', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2769', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '329', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2770', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '330', '152', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2771', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '331', '152', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2772', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '332', '153', '102', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2773', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '333', '154', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2774', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '334', '154', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2775', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '335', '155', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2776', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '336', '155', '102', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2777', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '337', '156', '103', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2778', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '338', '157', '103', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2779', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '339', '158', '103', '36', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2780', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '340', '159', '103', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2781', '0ae2dc3c-22fe-4fa1-bcb0-25c0e9c71b99', '341', '159', '103', '36', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2782', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '232', '110', '72', '28', '7', '3', 'Citaciones a reunion por mail');
INSERT INTO `responses_people` VALUES ('2783', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '233', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2784', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '234', '110', '72', '28', '7', '5', 'GP');
INSERT INTO `responses_people` VALUES ('2785', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '235', '111', '73', '28', '7', '5', 'GP');
INSERT INTO `responses_people` VALUES ('2786', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '236', '112', '74', '28', '7', '3', 'Oferta academica, encuestas, CONEAU');
INSERT INTO `responses_people` VALUES ('2787', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '237', '112', '74', '28', '7', '5', 'Charlas medioambientales, ');
INSERT INTO `responses_people` VALUES ('2788', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '238', '113', '75', '28', '7', '5', 'Reuniones semanales');
INSERT INTO `responses_people` VALUES ('2789', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '239', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2790', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '240', '113', '75', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2791', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '241', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2792', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '242', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2793', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '243', '114', '75', '28', '7', '5', 'Por asignacion de cargos, evaluan trayectoria cientifica y academica');
INSERT INTO `responses_people` VALUES ('2794', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '243', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2795', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '244', '115', '76', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2796', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '245', '115', '76', '28', '7', '5', 'Nro de alumnos, Nro de aprobados, nro de trabajos aprobados, nro de tesis');
INSERT INTO `responses_people` VALUES ('2797', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '245', '115', '76', '28', '7', '5', 'Nro de tesis, Nro de aprobados, Nro de trabajos aprobados');
INSERT INTO `responses_people` VALUES ('2798', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '246', '116', '77', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2799', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '247', '117', '78', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2800', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '248', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2801', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '249', '118', '79', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2802', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '250', '118', '79', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2803', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '251', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2804', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '252', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2805', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '253', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2806', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '254', '120', '81', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2807', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '255', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2808', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '256', '121', '82', '30', '7', '5', 'Cursos y perfeccionamiento');
INSERT INTO `responses_people` VALUES ('2809', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '257', '121', '82', '30', '7', '5', 'Se da espacios para la formacion');
INSERT INTO `responses_people` VALUES ('2810', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '258', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2811', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '259', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2812', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '260', '122', '83', '30', '7', '5', 'Plan de tareas diario');
INSERT INTO `responses_people` VALUES ('2813', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '261', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2814', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '262', '123', '84', '30', '7', '5', 'Reuniones');
INSERT INTO `responses_people` VALUES ('2815', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '263', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2816', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '264', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2817', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '265', '124', '85', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2818', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '266', '124', '85', '30', '7', '5', 'Documentacion de higiene y seguridad');
INSERT INTO `responses_people` VALUES ('2819', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '267', '124', '85', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2820', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '268', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2821', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '269', '125', '86', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2822', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '270', '125', '86', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2823', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '271', '126', '87', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2824', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '272', '126', '87', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2825', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '273', '126', '87', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2826', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '274', '127', '88', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2827', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '275', '127', '88', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2828', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '276', '127', '88', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2829', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '277', '128', '89', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2830', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '278', '128', '89', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2831', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '279', '129', '90', '31', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2832', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '280', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2833', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '281', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2834', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '282', '130', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2835', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '283', '130', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2836', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '284', '131', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2837', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '285', '131', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2838', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '286', '132', '92', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2839', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '287', '132', '92', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2840', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '288', '133', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2841', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '289', '133', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2842', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '290', '134', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2843', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '291', '135', '94', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2844', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '292', '135', '94', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2845', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '293', '135', '94', '32', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2846', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '294', '136', '95', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2847', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '295', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2848', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '296', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2849', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '297', '137', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2850', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '298', '137', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2851', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '299', '138', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2852', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '300', '139', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2853', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '301', '139', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2854', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '302', '139', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2855', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '303', '140', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2856', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '304', '140', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2857', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '305', '141', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2858', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '306', '142', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2859', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '307', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2860', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '308', '142', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2861', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '309', '143', '97', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2862', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '310', '143', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2863', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '311', '144', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2864', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '312', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2865', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '313', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2866', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '314', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2867', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '315', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2868', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '316', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2869', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '317', '147', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2870', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '318', '148', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2871', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '319', '148', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2872', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '320', '148', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2873', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '321', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2874', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '322', '149', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2875', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '323', '150', '100', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2876', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '324', '150', '100', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2877', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '325', '150', '100', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2878', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '326', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2879', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '327', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2880', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '328', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2881', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '329', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2882', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '330', '152', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2883', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '331', '152', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2884', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '332', '153', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2885', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '333', '154', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2886', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '334', '154', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2887', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '335', '155', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2888', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '336', '155', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2889', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '337', '156', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2890', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '338', '157', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2891', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '339', '158', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2892', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '340', '159', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2893', '25bc45d8-13ac-46f9-a020-e2f9962a8bc8', '341', '159', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2894', '41814d17-db92-4792-bef7-c51b46b070bd', '232', '110', '72', '28', '7', '5', 'pagina de la facultad');
INSERT INTO `responses_people` VALUES ('2895', '41814d17-db92-4792-bef7-c51b46b070bd', '233', '110', '72', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2896', '41814d17-db92-4792-bef7-c51b46b070bd', '234', '110', '72', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2897', '41814d17-db92-4792-bef7-c51b46b070bd', '235', '111', '73', '28', '7', '5', 'GP');
INSERT INTO `responses_people` VALUES ('2898', '41814d17-db92-4792-bef7-c51b46b070bd', '236', '112', '74', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2899', '41814d17-db92-4792-bef7-c51b46b070bd', '237', '112', '74', '28', '7', '5', 'resolución comision medioambiente, proyectos de inclusion, asistencialismo, convenio con el municipio, donaciones que se recolectan');
INSERT INTO `responses_people` VALUES ('2900', '41814d17-db92-4792-bef7-c51b46b070bd', '238', '113', '75', '28', '7', '5', 'reunion gabinete');
INSERT INTO `responses_people` VALUES ('2901', '41814d17-db92-4792-bef7-c51b46b070bd', '239', '113', '75', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2902', '41814d17-db92-4792-bef7-c51b46b070bd', '240', '113', '75', '28', '7', '5', 'representantes en el consejo, mesa de entrada');
INSERT INTO `responses_people` VALUES ('2903', '41814d17-db92-4792-bef7-c51b46b070bd', '241', '114', '75', '28', '7', '5', 'capacitaciones');
INSERT INTO `responses_people` VALUES ('2904', '41814d17-db92-4792-bef7-c51b46b070bd', '242', '114', '75', '28', '7', '4', 'reuniones integradoras');
INSERT INTO `responses_people` VALUES ('2905', '41814d17-db92-4792-bef7-c51b46b070bd', '243', '114', '75', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2906', '41814d17-db92-4792-bef7-c51b46b070bd', '243', '115', '76', '28', '7', '4', 'cada secretaria planifica sus actividades, GP');
INSERT INTO `responses_people` VALUES ('2907', '41814d17-db92-4792-bef7-c51b46b070bd', '244', '115', '76', '28', '7', '4', 'acreditación, ordenanza de reglamento de estudios');
INSERT INTO `responses_people` VALUES ('2908', '41814d17-db92-4792-bef7-c51b46b070bd', '245', '115', '76', '28', '7', '4', 'encuestas');
INSERT INTO `responses_people` VALUES ('2909', '41814d17-db92-4792-bef7-c51b46b070bd', '246', '116', '77', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2910', '41814d17-db92-4792-bef7-c51b46b070bd', '247', '117', '78', '29', '7', '4', 'se utilizan indicadores del GP');
INSERT INTO `responses_people` VALUES ('2911', '41814d17-db92-4792-bef7-c51b46b070bd', '248', '118', '79', '29', '7', '4', 'transparencia, resolución de comisión de becas');
INSERT INTO `responses_people` VALUES ('2912', '41814d17-db92-4792-bef7-c51b46b070bd', '249', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2913', '41814d17-db92-4792-bef7-c51b46b070bd', '250', '118', '79', '29', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2914', '41814d17-db92-4792-bef7-c51b46b070bd', '251', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2915', '41814d17-db92-4792-bef7-c51b46b070bd', '252', '119', '80', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2916', '41814d17-db92-4792-bef7-c51b46b070bd', '253', '119', '80', '29', '7', '3', 'semana de la ingeniería');
INSERT INTO `responses_people` VALUES ('2917', '41814d17-db92-4792-bef7-c51b46b070bd', '254', '120', '81', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2918', '41814d17-db92-4792-bef7-c51b46b070bd', '255', '120', '81', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2919', '41814d17-db92-4792-bef7-c51b46b070bd', '256', '121', '82', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2920', '41814d17-db92-4792-bef7-c51b46b070bd', '257', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2921', '41814d17-db92-4792-bef7-c51b46b070bd', '258', '121', '82', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2922', '41814d17-db92-4792-bef7-c51b46b070bd', '259', '122', '83', '30', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2923', '41814d17-db92-4792-bef7-c51b46b070bd', '260', '122', '83', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2924', '41814d17-db92-4792-bef7-c51b46b070bd', '261', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2925', '41814d17-db92-4792-bef7-c51b46b070bd', '262', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2926', '41814d17-db92-4792-bef7-c51b46b070bd', '262', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2927', '41814d17-db92-4792-bef7-c51b46b070bd', '263', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2928', '41814d17-db92-4792-bef7-c51b46b070bd', '264', '123', '84', '30', '7', '5', 'facebook');
INSERT INTO `responses_people` VALUES ('2929', '41814d17-db92-4792-bef7-c51b46b070bd', '265', '124', '85', '30', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2930', '41814d17-db92-4792-bef7-c51b46b070bd', '266', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2931', '41814d17-db92-4792-bef7-c51b46b070bd', '267', '124', '85', '30', '7', '5', 'toda la nueva infraestructura');
INSERT INTO `responses_people` VALUES ('2932', '41814d17-db92-4792-bef7-c51b46b070bd', '268', '124', '85', '30', '7', '5', 'utn solidaria');
INSERT INTO `responses_people` VALUES ('2933', '41814d17-db92-4792-bef7-c51b46b070bd', '269', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2934', '41814d17-db92-4792-bef7-c51b46b070bd', '270', '125', '86', '31', '7', '5', 'con empresas de software');
INSERT INTO `responses_people` VALUES ('2935', '41814d17-db92-4792-bef7-c51b46b070bd', '271', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2936', '41814d17-db92-4792-bef7-c51b46b070bd', '272', '126', '87', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2937', '41814d17-db92-4792-bef7-c51b46b070bd', '273', '126', '87', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2938', '41814d17-db92-4792-bef7-c51b46b070bd', '274', '127', '88', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2939', '41814d17-db92-4792-bef7-c51b46b070bd', '275', '127', '88', '31', '7', '5', 'aula inteliente en 2do piso');
INSERT INTO `responses_people` VALUES ('2940', '41814d17-db92-4792-bef7-c51b46b070bd', '276', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2941', '41814d17-db92-4792-bef7-c51b46b070bd', '277', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2942', '41814d17-db92-4792-bef7-c51b46b070bd', '278', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2943', '41814d17-db92-4792-bef7-c51b46b070bd', '279', '129', '90', '31', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2944', '41814d17-db92-4792-bef7-c51b46b070bd', '280', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2945', '41814d17-db92-4792-bef7-c51b46b070bd', '281', '129', '90', '31', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2946', '41814d17-db92-4792-bef7-c51b46b070bd', '282', '130', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2947', '41814d17-db92-4792-bef7-c51b46b070bd', '283', '130', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2948', '41814d17-db92-4792-bef7-c51b46b070bd', '284', '131', '91', '32', '7', '5', 'GP');
INSERT INTO `responses_people` VALUES ('2949', '41814d17-db92-4792-bef7-c51b46b070bd', '285', '131', '91', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2950', '41814d17-db92-4792-bef7-c51b46b070bd', '286', '132', '92', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2951', '41814d17-db92-4792-bef7-c51b46b070bd', '287', '132', '92', '32', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2952', '41814d17-db92-4792-bef7-c51b46b070bd', '288', '133', '93', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2953', '41814d17-db92-4792-bef7-c51b46b070bd', '289', '133', '93', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2954', '41814d17-db92-4792-bef7-c51b46b070bd', '290', '134', '93', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2955', '41814d17-db92-4792-bef7-c51b46b070bd', '291', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2956', '41814d17-db92-4792-bef7-c51b46b070bd', '292', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2957', '41814d17-db92-4792-bef7-c51b46b070bd', '293', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2958', '41814d17-db92-4792-bef7-c51b46b070bd', '294', '136', '95', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2959', '41814d17-db92-4792-bef7-c51b46b070bd', '295', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2960', '41814d17-db92-4792-bef7-c51b46b070bd', '296', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2961', '41814d17-db92-4792-bef7-c51b46b070bd', '297', '137', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2962', '41814d17-db92-4792-bef7-c51b46b070bd', '298', '137', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2963', '41814d17-db92-4792-bef7-c51b46b070bd', '299', '138', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2964', '41814d17-db92-4792-bef7-c51b46b070bd', '300', '139', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2965', '41814d17-db92-4792-bef7-c51b46b070bd', '301', '139', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2966', '41814d17-db92-4792-bef7-c51b46b070bd', '302', '139', '96', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2967', '41814d17-db92-4792-bef7-c51b46b070bd', '303', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('2968', '41814d17-db92-4792-bef7-c51b46b070bd', '304', '140', '96', '33', '7', '9', '');
INSERT INTO `responses_people` VALUES ('2969', '41814d17-db92-4792-bef7-c51b46b070bd', '305', '141', '97', '33', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2970', '41814d17-db92-4792-bef7-c51b46b070bd', '306', '142', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2971', '41814d17-db92-4792-bef7-c51b46b070bd', '307', '142', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2972', '41814d17-db92-4792-bef7-c51b46b070bd', '308', '142', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2973', '41814d17-db92-4792-bef7-c51b46b070bd', '309', '143', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2974', '41814d17-db92-4792-bef7-c51b46b070bd', '310', '143', '97', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('2975', '41814d17-db92-4792-bef7-c51b46b070bd', '311', '144', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2976', '41814d17-db92-4792-bef7-c51b46b070bd', '312', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2977', '41814d17-db92-4792-bef7-c51b46b070bd', '313', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2978', '41814d17-db92-4792-bef7-c51b46b070bd', '314', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2979', '41814d17-db92-4792-bef7-c51b46b070bd', '315', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2980', '41814d17-db92-4792-bef7-c51b46b070bd', '316', '146', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('2981', '41814d17-db92-4792-bef7-c51b46b070bd', '317', '147', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2982', '41814d17-db92-4792-bef7-c51b46b070bd', '318', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2983', '41814d17-db92-4792-bef7-c51b46b070bd', '319', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2984', '41814d17-db92-4792-bef7-c51b46b070bd', '320', '148', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2985', '41814d17-db92-4792-bef7-c51b46b070bd', '321', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('2986', '41814d17-db92-4792-bef7-c51b46b070bd', '322', '149', '99', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('2987', '41814d17-db92-4792-bef7-c51b46b070bd', '323', '150', '100', '35', '7', '5', '');
INSERT INTO `responses_people` VALUES ('2988', '41814d17-db92-4792-bef7-c51b46b070bd', '324', '150', '100', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2989', '41814d17-db92-4792-bef7-c51b46b070bd', '325', '150', '100', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2990', '41814d17-db92-4792-bef7-c51b46b070bd', '326', '151', '101', '35', '7', '2', '');
INSERT INTO `responses_people` VALUES ('2991', '41814d17-db92-4792-bef7-c51b46b070bd', '327', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2992', '41814d17-db92-4792-bef7-c51b46b070bd', '328', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2993', '41814d17-db92-4792-bef7-c51b46b070bd', '329', '151', '101', '35', '7', '3', '');
INSERT INTO `responses_people` VALUES ('2994', '41814d17-db92-4792-bef7-c51b46b070bd', '330', '152', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('2995', '41814d17-db92-4792-bef7-c51b46b070bd', '331', '152', '101', '35', '7', '4', '');
INSERT INTO `responses_people` VALUES ('2996', '41814d17-db92-4792-bef7-c51b46b070bd', '332', '153', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2997', '41814d17-db92-4792-bef7-c51b46b070bd', '333', '154', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('2998', '41814d17-db92-4792-bef7-c51b46b070bd', '334', '154', '102', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('2999', '41814d17-db92-4792-bef7-c51b46b070bd', '335', '155', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('3000', '41814d17-db92-4792-bef7-c51b46b070bd', '336', '155', '102', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('3001', '41814d17-db92-4792-bef7-c51b46b070bd', '337', '156', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('3002', '41814d17-db92-4792-bef7-c51b46b070bd', '338', '157', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('3003', '41814d17-db92-4792-bef7-c51b46b070bd', '339', '158', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('3004', '41814d17-db92-4792-bef7-c51b46b070bd', '340', '159', '103', '36', '7', '8', '');
INSERT INTO `responses_people` VALUES ('3005', '41814d17-db92-4792-bef7-c51b46b070bd', '341', '159', '103', '36', '7', '10', '');
INSERT INTO `responses_people` VALUES ('3006', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '232', '110', '72', '28', '7', '4', 'pif');
INSERT INTO `responses_people` VALUES ('3007', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '233', '110', '72', '28', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3008', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '234', '110', '72', '28', '7', '3', '');
INSERT INTO `responses_people` VALUES ('3009', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '235', '111', '73', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3010', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '236', '112', '74', '28', '7', '2', '');
INSERT INTO `responses_people` VALUES ('3011', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '237', '112', '74', '28', '7', '4', '');
INSERT INTO `responses_people` VALUES ('3012', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '238', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3013', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '239', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3014', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '240', '113', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3015', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '241', '114', '75', '28', '7', '5', 'resoluciones para capacitaciones');
INSERT INTO `responses_people` VALUES ('3016', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '242', '114', '75', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3017', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '243', '114', '75', '28', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3018', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '243', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3019', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '244', '115', '76', '28', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3020', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '245', '115', '76', '28', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3021', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '246', '116', '77', '29', '7', '3', '');
INSERT INTO `responses_people` VALUES ('3022', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '247', '117', '78', '29', '7', '4', '');
INSERT INTO `responses_people` VALUES ('3023', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '248', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3024', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '249', '118', '79', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3025', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '250', '118', '79', '29', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3026', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '251', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3027', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '252', '119', '80', '29', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3028', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '253', '119', '80', '29', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3029', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '254', '120', '81', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3030', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '255', '120', '81', '30', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3031', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '256', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3032', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '257', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3033', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '258', '121', '82', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3034', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '259', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3035', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '260', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3036', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '261', '122', '83', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3037', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '262', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3038', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '263', '123', '84', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3039', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '264', '123', '84', '30', '7', '4', '');
INSERT INTO `responses_people` VALUES ('3040', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '265', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3041', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '266', '124', '85', '30', '7', '2', '');
INSERT INTO `responses_people` VALUES ('3042', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '267', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3043', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '268', '124', '85', '30', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3044', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '269', '125', '86', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3045', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '270', '125', '86', '31', '7', '5', 'convenios macro y convenios específicos');
INSERT INTO `responses_people` VALUES ('3046', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '271', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3047', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '272', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3048', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '273', '126', '87', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3049', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '274', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3050', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '275', '127', '88', '31', '7', '5', 'aula inteligente');
INSERT INTO `responses_people` VALUES ('3051', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '276', '127', '88', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3052', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '277', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3053', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '278', '128', '89', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3054', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '279', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3055', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '280', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3056', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '281', '129', '90', '31', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3057', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '282', '130', '91', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('3058', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '283', '130', '91', '32', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3059', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '284', '131', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3060', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '285', '131', '91', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3061', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '286', '132', '92', '32', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3062', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '287', '132', '92', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3063', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '288', '133', '93', '32', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3064', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '289', '133', '93', '32', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3065', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '290', '134', '93', '32', '7', '3', 'por medio de facebook');
INSERT INTO `responses_people` VALUES ('3066', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '291', '135', '94', '32', '7', '3', '');
INSERT INTO `responses_people` VALUES ('3067', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '292', '135', '94', '32', '7', '2', '');
INSERT INTO `responses_people` VALUES ('3068', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '293', '135', '94', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3069', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '294', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3070', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '295', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3071', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '296', '136', '95', '32', '7', '5', '');
INSERT INTO `responses_people` VALUES ('3072', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '297', '137', '96', '33', '7', '10', '');
INSERT INTO `responses_people` VALUES ('3073', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '298', '137', '96', '33', '7', '7', '');
INSERT INTO `responses_people` VALUES ('3074', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '299', '138', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3075', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '300', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3076', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '301', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3077', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '302', '139', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3078', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '303', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3079', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '304', '140', '96', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3080', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '305', '141', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3081', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '306', '142', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3082', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '307', '142', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3083', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '308', '142', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3084', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '309', '143', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3085', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '310', '143', '97', '33', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3086', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '311', '144', '98', '34', '7', '15', '');
INSERT INTO `responses_people` VALUES ('3087', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '312', '145', '98', '34', '7', '13', '');
INSERT INTO `responses_people` VALUES ('3088', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '313', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('3089', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '314', '145', '98', '34', '7', '12', '');
INSERT INTO `responses_people` VALUES ('3090', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '315', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3091', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '316', '146', '98', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3092', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '317', '147', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3093', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '318', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3094', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '319', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3095', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '320', '148', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3096', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '321', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3097', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '322', '149', '99', '34', '7', '11', '');
INSERT INTO `responses_people` VALUES ('3098', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '323', '150', '100', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3099', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '324', '150', '100', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3100', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '325', '150', '100', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3101', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '326', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3102', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '327', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3103', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '328', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3104', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '329', '151', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3105', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '330', '152', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3106', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '331', '152', '101', '35', '7', '1', '');
INSERT INTO `responses_people` VALUES ('3107', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '332', '153', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3108', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '333', '154', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3109', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '334', '154', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3110', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '335', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3111', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '336', '155', '102', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3112', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '337', '156', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3113', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '338', '157', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3114', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '339', '158', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3115', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '340', '159', '103', '36', '7', '6', '');
INSERT INTO `responses_people` VALUES ('3116', 'a67eee16-0a86-4f46-a6a6-0ad7cfd3bbdc', '341', '159', '103', '36', '7', '6', '');
-- 
-- AVERAGE_RESPONSES
--
INSERT INTO `average_responses` VALUES ('1051', '28', '72', '110', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1052', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1053', '28', '74', '112', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1054', '28', '75', '113', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1055', '28', '75', '114', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1056', '28', '76', '115', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1057', '29', '77', '116', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1058', '29', '78', '117', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1059', '29', '79', '118', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1060', '29', '80', '119', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1061', '30', '81', '120', '87.50', '7');
INSERT INTO `average_responses` VALUES ('1062', '30', '82', '121', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1063', '30', '83', '122', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1064', '30', '84', '123', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1065', '30', '85', '124', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1066', '31', '86', '125', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1067', '31', '87', '126', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1068', '31', '88', '127', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1069', '31', '89', '128', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1070', '31', '90', '129', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1071', '32', '91', '130', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1072', '32', '91', '131', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1073', '32', '92', '132', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1074', '32', '93', '133', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1075', '32', '93', '134', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1076', '32', '94', '135', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1077', '32', '95', '136', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1078', '33', '96', '137', '74.50', '7');
INSERT INTO `average_responses` VALUES ('1079', '33', '96', '138', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1080', '33', '96', '139', '87.00', '7');
INSERT INTO `average_responses` VALUES ('1081', '33', '96', '140', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1082', '33', '97', '141', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1083', '33', '97', '142', '62.33', '7');
INSERT INTO `average_responses` VALUES ('1084', '33', '97', '143', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1085', '34', '98', '144', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1086', '34', '98', '145', '44.67', '7');
INSERT INTO `average_responses` VALUES ('1087', '34', '98', '146', '44.50', '7');
INSERT INTO `average_responses` VALUES ('1088', '34', '99', '147', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1089', '34', '99', '148', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1090', '34', '99', '149', '56.00', '7');
INSERT INTO `average_responses` VALUES ('1091', '35', '100', '150', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1092', '35', '101', '151', '56.25', '7');
INSERT INTO `average_responses` VALUES ('1093', '35', '101', '152', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1094', '36', '102', '153', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1095', '36', '102', '154', '93.50', '7');
INSERT INTO `average_responses` VALUES ('1096', '36', '102', '155', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1097', '36', '103', '156', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1098', '36', '103', '157', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1099', '36', '103', '158', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1100', '36', '103', '159', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1114', '28', '72', '110', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1115', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1116', '28', '74', '112', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1117', '28', '75', '113', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1118', '28', '75', '114', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1119', '28', '76', '115', '81.25', '7');
INSERT INTO `average_responses` VALUES ('1120', '29', '77', '116', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1121', '29', '78', '117', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1122', '29', '79', '118', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1123', '29', '80', '119', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1124', '30', '81', '120', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1125', '30', '82', '121', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1126', '30', '83', '122', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1127', '30', '84', '123', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1128', '30', '85', '124', '68.75', '7');
INSERT INTO `average_responses` VALUES ('1129', '31', '86', '125', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1130', '31', '87', '126', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1131', '31', '88', '127', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1132', '31', '89', '128', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1133', '31', '90', '129', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1134', '32', '91', '130', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1135', '32', '91', '131', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1136', '32', '92', '132', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1137', '32', '93', '133', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1138', '32', '93', '134', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1139', '32', '94', '135', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1140', '32', '95', '136', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1141', '33', '96', '137', '93.50', '7');
INSERT INTO `average_responses` VALUES ('1142', '33', '96', '138', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1143', '33', '96', '139', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1144', '33', '96', '140', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1145', '33', '97', '141', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1146', '33', '97', '142', '99.67', '7');
INSERT INTO `average_responses` VALUES ('1147', '33', '97', '143', '74.50', '7');
INSERT INTO `average_responses` VALUES ('1148', '34', '98', '144', '67.00', '7');
INSERT INTO `average_responses` VALUES ('1149', '34', '98', '145', '52.33', '7');
INSERT INTO `average_responses` VALUES ('1150', '34', '98', '146', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1151', '34', '99', '147', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1152', '34', '99', '148', '59.67', '7');
INSERT INTO `average_responses` VALUES ('1153', '34', '99', '149', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1154', '35', '100', '150', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1155', '35', '101', '151', '68.75', '7');
INSERT INTO `average_responses` VALUES ('1156', '35', '101', '152', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1157', '36', '102', '153', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1158', '36', '102', '154', '112.50', '7');
INSERT INTO `average_responses` VALUES ('1159', '36', '102', '155', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1160', '36', '103', '156', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1161', '36', '103', '157', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1162', '36', '103', '158', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1163', '36', '103', '159', '93.50', '7');
INSERT INTO `average_responses` VALUES ('1177', '28', '72', '110', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1178', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1179', '28', '74', '112', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1180', '28', '75', '113', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1181', '28', '75', '114', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1182', '28', '76', '115', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1183', '29', '77', '116', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1184', '29', '78', '117', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1185', '29', '79', '118', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1186', '29', '80', '119', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1187', '30', '81', '120', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1188', '30', '82', '121', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1189', '30', '83', '122', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1190', '30', '84', '123', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1191', '30', '85', '124', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1192', '31', '86', '125', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1193', '31', '87', '126', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1194', '31', '88', '127', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1195', '31', '89', '128', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1196', '31', '90', '129', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1197', '32', '91', '130', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1198', '32', '91', '131', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1199', '32', '92', '132', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1200', '32', '93', '133', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1201', '32', '93', '134', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1202', '32', '94', '135', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1203', '32', '95', '136', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1204', '33', '96', '137', '112.50', '7');
INSERT INTO `average_responses` VALUES ('1205', '33', '96', '138', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1206', '33', '96', '139', '112.33', '7');
INSERT INTO `average_responses` VALUES ('1207', '33', '96', '140', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1208', '33', '97', '141', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1209', '33', '97', '142', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1210', '33', '97', '143', '18.50', '7');
INSERT INTO `average_responses` VALUES ('1211', '34', '98', '144', '90.00', '7');
INSERT INTO `average_responses` VALUES ('1212', '34', '98', '145', '90.00', '7');
INSERT INTO `average_responses` VALUES ('1213', '34', '98', '146', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1214', '34', '99', '147', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1215', '34', '99', '148', '90.00', '7');
INSERT INTO `average_responses` VALUES ('1216', '34', '99', '149', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1217', '35', '100', '150', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1218', '35', '101', '151', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1219', '35', '101', '152', '12.50', '7');
INSERT INTO `average_responses` VALUES ('1220', '36', '102', '153', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1221', '36', '102', '154', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1222', '36', '102', '155', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1223', '36', '103', '156', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1224', '36', '103', '157', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1225', '36', '103', '158', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1226', '36', '103', '159', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1240', '28', '72', '110', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1241', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1242', '28', '74', '112', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1243', '28', '75', '113', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1244', '28', '75', '114', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1245', '28', '76', '115', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1246', '29', '77', '116', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1247', '29', '78', '117', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1248', '29', '79', '118', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1249', '29', '80', '119', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1250', '30', '81', '120', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1251', '30', '82', '121', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1252', '30', '83', '122', '8.33', '7');
INSERT INTO `average_responses` VALUES ('1253', '30', '84', '123', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1254', '30', '85', '124', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1255', '31', '86', '125', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1256', '31', '87', '126', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1257', '31', '88', '127', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1258', '31', '89', '128', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1259', '31', '90', '129', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1260', '32', '91', '130', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1261', '32', '91', '131', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1262', '32', '92', '132', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1263', '32', '93', '133', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1264', '32', '93', '134', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1265', '32', '94', '135', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1266', '32', '95', '136', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1267', '33', '96', '137', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1268', '33', '96', '138', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1269', '33', '96', '139', '137.33', '7');
INSERT INTO `average_responses` VALUES ('1270', '33', '96', '140', '74.50', '7');
INSERT INTO `average_responses` VALUES ('1271', '33', '97', '141', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1272', '33', '97', '142', '124.67', '7');
INSERT INTO `average_responses` VALUES ('1273', '33', '97', '143', '56.00', '7');
INSERT INTO `average_responses` VALUES ('1274', '34', '98', '144', '67.00', '7');
INSERT INTO `average_responses` VALUES ('1275', '34', '98', '145', '82.33', '7');
INSERT INTO `average_responses` VALUES ('1276', '34', '98', '146', '44.50', '7');
INSERT INTO `average_responses` VALUES ('1277', '34', '99', '147', '90.00', '7');
INSERT INTO `average_responses` VALUES ('1278', '34', '99', '148', '90.00', '7');
INSERT INTO `average_responses` VALUES ('1279', '34', '99', '149', '44.50', '7');
INSERT INTO `average_responses` VALUES ('1280', '35', '100', '150', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1281', '35', '101', '151', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1282', '35', '101', '152', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1283', '36', '102', '153', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1284', '36', '102', '154', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1285', '36', '102', '155', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1286', '36', '103', '156', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1287', '36', '103', '157', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1288', '36', '103', '158', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1289', '36', '103', '159', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1303', '28', '72', '110', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1304', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1305', '28', '74', '112', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1306', '28', '75', '113', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1307', '28', '75', '114', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1308', '28', '76', '115', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1309', '29', '77', '116', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1310', '29', '78', '117', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1311', '29', '79', '118', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1312', '29', '80', '119', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1313', '30', '81', '120', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1314', '30', '82', '121', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1315', '30', '83', '122', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1316', '30', '84', '123', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1317', '30', '85', '124', '93.75', '7');
INSERT INTO `average_responses` VALUES ('1318', '31', '86', '125', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1319', '31', '87', '126', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1320', '31', '88', '127', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1321', '31', '89', '128', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1322', '31', '90', '129', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1323', '32', '91', '130', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1324', '32', '91', '131', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1325', '32', '92', '132', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1326', '32', '93', '133', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1327', '32', '93', '134', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1328', '32', '94', '135', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1329', '32', '95', '136', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1330', '33', '96', '137', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1331', '33', '96', '138', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1332', '33', '96', '139', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1333', '33', '96', '140', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1334', '33', '97', '141', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1335', '33', '97', '142', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1336', '33', '97', '143', '131.00', '7');
INSERT INTO `average_responses` VALUES ('1337', '34', '98', '144', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1338', '34', '98', '145', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1339', '34', '98', '146', '90.00', '7');
INSERT INTO `average_responses` VALUES ('1340', '34', '99', '147', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1341', '34', '99', '148', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1342', '34', '99', '149', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1343', '35', '100', '150', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1344', '35', '101', '151', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1345', '35', '101', '152', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1346', '36', '102', '153', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1347', '36', '102', '154', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1348', '36', '102', '155', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1349', '36', '103', '156', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1350', '36', '103', '157', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1351', '36', '103', '158', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1352', '36', '103', '159', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1366', '28', '72', '110', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1367', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1368', '28', '74', '112', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1369', '28', '75', '113', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1370', '28', '75', '114', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1371', '28', '76', '115', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1372', '29', '77', '116', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1373', '29', '78', '117', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1374', '29', '79', '118', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1375', '29', '80', '119', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1376', '30', '81', '120', '37.50', '7');
INSERT INTO `average_responses` VALUES ('1377', '30', '82', '121', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1378', '30', '83', '122', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1379', '30', '84', '123', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1380', '30', '85', '124', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1381', '31', '86', '125', '87.50', '7');
INSERT INTO `average_responses` VALUES ('1382', '31', '87', '126', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1383', '31', '88', '127', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1384', '31', '89', '128', '87.50', '7');
INSERT INTO `average_responses` VALUES ('1385', '31', '90', '129', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1386', '32', '91', '130', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1387', '32', '91', '131', '87.50', '7');
INSERT INTO `average_responses` VALUES ('1388', '32', '92', '132', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1389', '32', '93', '133', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1390', '32', '93', '134', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1391', '32', '94', '135', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1392', '32', '95', '136', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1393', '33', '96', '137', '93.50', '7');
INSERT INTO `average_responses` VALUES ('1394', '33', '96', '138', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1395', '33', '96', '139', '12.33', '7');
INSERT INTO `average_responses` VALUES ('1396', '33', '96', '140', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1397', '33', '97', '141', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1398', '33', '97', '142', '37.33', '7');
INSERT INTO `average_responses` VALUES ('1399', '33', '97', '143', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1400', '34', '98', '144', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1401', '34', '98', '145', '7.33', '7');
INSERT INTO `average_responses` VALUES ('1402', '34', '98', '146', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1403', '34', '99', '147', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1404', '34', '99', '148', '7.33', '7');
INSERT INTO `average_responses` VALUES ('1405', '34', '99', '149', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1406', '35', '100', '150', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1407', '35', '101', '151', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1408', '35', '101', '152', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1409', '36', '102', '153', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1410', '36', '102', '154', '131.00', '7');
INSERT INTO `average_responses` VALUES ('1411', '36', '102', '155', '74.50', '7');
INSERT INTO `average_responses` VALUES ('1412', '36', '103', '156', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1413', '36', '103', '157', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1414', '36', '103', '158', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1415', '36', '103', '159', '74.50', '7');
INSERT INTO `average_responses` VALUES ('1429', '28', '72', '110', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1430', '28', '73', '111', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1431', '28', '74', '112', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1432', '28', '75', '113', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1433', '28', '75', '114', '37.50', '7');
INSERT INTO `average_responses` VALUES ('1434', '28', '76', '115', '31.25', '7');
INSERT INTO `average_responses` VALUES ('1435', '29', '77', '116', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1436', '29', '78', '117', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1437', '29', '79', '118', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1438', '29', '80', '119', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1439', '30', '81', '120', '37.50', '7');
INSERT INTO `average_responses` VALUES ('1440', '30', '82', '121', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1441', '30', '83', '122', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1442', '30', '84', '123', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1443', '30', '85', '124', '56.25', '7');
INSERT INTO `average_responses` VALUES ('1444', '31', '86', '125', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1445', '31', '87', '126', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1446', '31', '88', '127', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1447', '31', '89', '128', '37.50', '7');
INSERT INTO `average_responses` VALUES ('1448', '31', '90', '129', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1449', '32', '91', '130', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1450', '32', '91', '131', '12.50', '7');
INSERT INTO `average_responses` VALUES ('1451', '32', '92', '132', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1452', '32', '93', '133', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1453', '32', '93', '134', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1454', '32', '94', '135', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1455', '32', '95', '136', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1456', '33', '96', '137', '56.00', '7');
INSERT INTO `average_responses` VALUES ('1457', '33', '96', '138', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1458', '33', '96', '139', '74.67', '7');
INSERT INTO `average_responses` VALUES ('1459', '33', '96', '140', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1460', '33', '97', '141', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1461', '33', '97', '142', '62.33', '7');
INSERT INTO `average_responses` VALUES ('1462', '33', '97', '143', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1463', '34', '98', '144', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1464', '34', '98', '145', '29.67', '7');
INSERT INTO `average_responses` VALUES ('1465', '34', '98', '146', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1466', '34', '99', '147', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1467', '34', '99', '148', '37.33', '7');
INSERT INTO `average_responses` VALUES ('1468', '34', '99', '149', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1469', '35', '100', '150', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1470', '35', '101', '151', '31.25', '7');
INSERT INTO `average_responses` VALUES ('1471', '35', '101', '152', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1472', '36', '102', '153', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1473', '36', '102', '154', '56.00', '7');
INSERT INTO `average_responses` VALUES ('1474', '36', '102', '155', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1475', '36', '103', '156', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1476', '36', '103', '157', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1477', '36', '103', '158', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1478', '36', '103', '159', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1492', '28', '72', '110', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1493', '28', '73', '111', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1494', '28', '74', '112', '37.50', '7');
INSERT INTO `average_responses` VALUES ('1495', '28', '75', '113', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1496', '28', '75', '114', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1497', '28', '76', '115', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1498', '29', '77', '116', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1499', '29', '78', '117', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1500', '29', '79', '118', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1501', '29', '80', '119', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1502', '30', '81', '120', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1503', '30', '82', '121', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1504', '30', '83', '122', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1505', '30', '84', '123', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1506', '30', '85', '124', '68.75', '7');
INSERT INTO `average_responses` VALUES ('1507', '31', '86', '125', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1508', '31', '87', '126', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1509', '31', '88', '127', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1510', '31', '89', '128', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1511', '31', '90', '129', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1512', '32', '91', '130', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1513', '32', '91', '131', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1514', '32', '92', '132', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1515', '32', '93', '133', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1516', '32', '93', '134', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1517', '32', '94', '135', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1518', '32', '95', '136', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1519', '33', '96', '137', '74.50', '7');
INSERT INTO `average_responses` VALUES ('1520', '33', '96', '138', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1521', '33', '96', '139', '99.67', '7');
INSERT INTO `average_responses` VALUES ('1522', '33', '96', '140', '56.00', '7');
INSERT INTO `average_responses` VALUES ('1523', '33', '97', '141', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1524', '33', '97', '142', '87.33', '7');
INSERT INTO `average_responses` VALUES ('1525', '33', '97', '143', '131.00', '7');
INSERT INTO `average_responses` VALUES ('1526', '34', '98', '144', '67.00', '7');
INSERT INTO `average_responses` VALUES ('1527', '34', '98', '145', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1528', '34', '98', '146', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1529', '34', '99', '147', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1530', '34', '99', '148', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1531', '34', '99', '149', '22.00', '7');
INSERT INTO `average_responses` VALUES ('1532', '35', '100', '150', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1533', '35', '101', '151', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1534', '35', '101', '152', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1535', '36', '102', '153', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1536', '36', '102', '154', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1537', '36', '102', '155', '131.00', '7');
INSERT INTO `average_responses` VALUES ('1538', '36', '103', '156', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1539', '36', '103', '157', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1540', '36', '103', '158', '112.00', '7');
INSERT INTO `average_responses` VALUES ('1541', '36', '103', '159', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1555', '28', '72', '110', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1556', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1557', '28', '74', '112', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1558', '28', '75', '113', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1559', '28', '75', '114', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1560', '28', '76', '115', '95.00', '7');
INSERT INTO `average_responses` VALUES ('1561', '29', '77', '116', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1562', '29', '78', '117', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1563', '29', '79', '118', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1564', '29', '80', '119', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1565', '30', '81', '120', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1566', '30', '82', '121', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1567', '30', '83', '122', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1568', '30', '84', '123', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1569', '30', '85', '124', '81.25', '7');
INSERT INTO `average_responses` VALUES ('1570', '31', '86', '125', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1571', '31', '87', '126', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1572', '31', '88', '127', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1573', '31', '89', '128', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1574', '31', '90', '129', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1575', '32', '91', '130', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1576', '32', '91', '131', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1577', '32', '92', '132', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1578', '32', '93', '133', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1579', '32', '93', '134', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1580', '32', '94', '135', '33.33', '7');
INSERT INTO `average_responses` VALUES ('1581', '32', '95', '136', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1582', '33', '96', '137', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1583', '33', '96', '138', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1584', '33', '96', '139', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1585', '33', '96', '140', '131.00', '7');
INSERT INTO `average_responses` VALUES ('1586', '33', '97', '141', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1587', '33', '97', '142', '99.67', '7');
INSERT INTO `average_responses` VALUES ('1588', '33', '97', '143', '93.50', '7');
INSERT INTO `average_responses` VALUES ('1589', '34', '98', '144', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1590', '34', '98', '145', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1591', '34', '98', '146', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1592', '34', '99', '147', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1593', '34', '99', '148', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1594', '34', '99', '149', '22.50', '7');
INSERT INTO `average_responses` VALUES ('1595', '35', '100', '150', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1596', '35', '101', '151', '43.75', '7');
INSERT INTO `average_responses` VALUES ('1597', '35', '101', '152', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1598', '36', '102', '153', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1599', '36', '102', '154', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1600', '36', '102', '155', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1601', '36', '103', '156', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1602', '36', '103', '157', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1603', '36', '103', '158', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1604', '36', '103', '159', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1618', '28', '72', '110', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1619', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1620', '28', '74', '112', '87.50', '7');
INSERT INTO `average_responses` VALUES ('1621', '28', '75', '113', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1622', '28', '75', '114', '68.75', '7');
INSERT INTO `average_responses` VALUES ('1623', '28', '76', '115', '62.50', '7');
INSERT INTO `average_responses` VALUES ('1624', '29', '77', '116', '25.00', '7');
INSERT INTO `average_responses` VALUES ('1625', '29', '78', '117', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1626', '29', '79', '118', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1627', '29', '80', '119', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1628', '30', '81', '120', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1629', '30', '82', '121', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1630', '30', '83', '122', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1631', '30', '84', '123', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1632', '30', '85', '124', '87.50', '7');
INSERT INTO `average_responses` VALUES ('1633', '31', '86', '125', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1634', '31', '87', '126', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1635', '31', '88', '127', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1636', '31', '89', '128', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1637', '31', '90', '129', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1638', '32', '91', '130', '37.50', '7');
INSERT INTO `average_responses` VALUES ('1639', '32', '91', '131', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1640', '32', '92', '132', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1641', '32', '93', '133', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1642', '32', '93', '134', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1643', '32', '94', '135', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1644', '32', '95', '136', '83.33', '7');
INSERT INTO `average_responses` VALUES ('1645', '33', '96', '137', '93.50', '7');
INSERT INTO `average_responses` VALUES ('1646', '33', '96', '138', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1647', '33', '96', '139', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1648', '33', '96', '140', '56.00', '7');
INSERT INTO `average_responses` VALUES ('1649', '33', '97', '141', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1650', '33', '97', '142', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1651', '33', '97', '143', '37.00', '7');
INSERT INTO `average_responses` VALUES ('1652', '34', '98', '144', '45.00', '7');
INSERT INTO `average_responses` VALUES ('1653', '34', '98', '145', '37.33', '7');
INSERT INTO `average_responses` VALUES ('1654', '34', '98', '146', '11.00', '7');
INSERT INTO `average_responses` VALUES ('1655', '34', '99', '147', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1656', '34', '99', '148', '15.00', '7');
INSERT INTO `average_responses` VALUES ('1657', '34', '99', '149', '22.50', '7');
INSERT INTO `average_responses` VALUES ('1658', '35', '100', '150', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1659', '35', '101', '151', '43.75', '7');
INSERT INTO `average_responses` VALUES ('1660', '35', '101', '152', '37.50', '7');
INSERT INTO `average_responses` VALUES ('1661', '36', '102', '153', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1662', '36', '102', '154', '112.50', '7');
INSERT INTO `average_responses` VALUES ('1663', '36', '102', '155', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1664', '36', '103', '156', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1665', '36', '103', '157', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1666', '36', '103', '158', '150.00', '7');
INSERT INTO `average_responses` VALUES ('1667', '36', '103', '159', '112.50', '7');
INSERT INTO `average_responses` VALUES ('1681', '28', '72', '110', '41.67', '7');
INSERT INTO `average_responses` VALUES ('1682', '28', '73', '111', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1683', '28', '74', '112', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1684', '28', '75', '113', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1685', '28', '75', '114', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1686', '28', '76', '115', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1687', '29', '77', '116', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1688', '29', '78', '117', '75.00', '7');
INSERT INTO `average_responses` VALUES ('1689', '29', '79', '118', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1690', '29', '80', '119', '66.67', '7');
INSERT INTO `average_responses` VALUES ('1691', '30', '81', '120', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1692', '30', '82', '121', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1693', '30', '83', '122', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1694', '30', '84', '123', '91.67', '7');
INSERT INTO `average_responses` VALUES ('1695', '30', '85', '124', '81.25', '7');
INSERT INTO `average_responses` VALUES ('1696', '31', '86', '125', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1697', '31', '87', '126', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1698', '31', '88', '127', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1699', '31', '89', '128', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1700', '31', '90', '129', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1701', '32', '91', '130', '12.50', '7');
INSERT INTO `average_responses` VALUES ('1702', '32', '91', '131', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1703', '32', '92', '132', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1704', '32', '93', '133', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1705', '32', '93', '134', '50.00', '7');
INSERT INTO `average_responses` VALUES ('1706', '32', '94', '135', '58.33', '7');
INSERT INTO `average_responses` VALUES ('1707', '32', '95', '136', '100.00', '7');
INSERT INTO `average_responses` VALUES ('1708', '33', '96', '137', '93.50', '7');
INSERT INTO `average_responses` VALUES ('1709', '33', '96', '138', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1710', '33', '96', '139', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1711', '33', '96', '140', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1712', '33', '97', '141', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1713', '33', '97', '142', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1714', '33', '97', '143', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1715', '34', '98', '144', '90.00', '7');
INSERT INTO `average_responses` VALUES ('1716', '34', '98', '145', '29.67', '7');
INSERT INTO `average_responses` VALUES ('1717', '34', '98', '146', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1718', '34', '99', '147', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1719', '34', '99', '148', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1720', '34', '99', '149', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1721', '35', '100', '150', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1722', '35', '101', '151', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1723', '35', '101', '152', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1724', '36', '102', '153', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1725', '36', '102', '154', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1726', '36', '102', '155', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1727', '36', '103', '156', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1728', '36', '103', '157', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1729', '36', '103', '158', '0.00', '7');
INSERT INTO `average_responses` VALUES ('1730', '36', '103', '159', '0.00', '7');
-- 
-- AVERAGE_CRITERIA
--
INSERT INTO `average_criteria` VALUES ('77', '28', '7', '68.49');
INSERT INTO `average_criteria` VALUES ('78', '29', '7', '65.20');
INSERT INTO `average_criteria` VALUES ('79', '30', '7', '36.25');
INSERT INTO `average_criteria` VALUES ('80', '31', '7', '69.77');
INSERT INTO `average_criteria` VALUES ('81', '32', '7', '58.75');
INSERT INTO `average_criteria` VALUES ('84', '33', '7', '19.93');
INSERT INTO `average_criteria` VALUES ('85', '34', '7', '17.16');
INSERT INTO `average_criteria` VALUES ('86', '35', '7', '13.44');
INSERT INTO `average_criteria` VALUES ('87', '36', '7', '31.16');
-- 
-- AVERAGE_SUBCRITERIA
--
INSERT INTO `average_subcriteria` VALUES ('165', '72', '28', '7', null, '77.27');
INSERT INTO `average_subcriteria` VALUES ('166', '73', '28', '7', null, '46.59');
INSERT INTO `average_subcriteria` VALUES ('167', '74', '28', '7', null, '77.27');
INSERT INTO `average_subcriteria` VALUES ('168', '75', '28', '7', null, '82.86');
INSERT INTO `average_subcriteria` VALUES ('169', '76', '28', '7', null, '58.46');
INSERT INTO `average_subcriteria` VALUES ('170', '77', '29', '7', null, '49.43');
INSERT INTO `average_subcriteria` VALUES ('171', '78', '29', '7', null, '59.09');
INSERT INTO `average_subcriteria` VALUES ('172', '79', '29', '7', null, '76.52');
INSERT INTO `average_subcriteria` VALUES ('173', '80', '29', '7', null, '75.76');
INSERT INTO `average_subcriteria` VALUES ('174', '81', '30', '7', null, '70.45');
INSERT INTO `average_subcriteria` VALUES ('175', '82', '30', '7', null, '35.99');
INSERT INTO `average_subcriteria` VALUES ('176', '83', '30', '7', null, '14.77');
INSERT INTO `average_subcriteria` VALUES ('177', '84', '30', '7', null, '40.15');
INSERT INTO `average_subcriteria` VALUES ('178', '85', '30', '7', null, '19.89');
INSERT INTO `average_subcriteria` VALUES ('179', '86', '31', '7', null, '87.50');
INSERT INTO `average_subcriteria` VALUES ('180', '87', '31', '7', null, '74.24');
INSERT INTO `average_subcriteria` VALUES ('181', '88', '31', '7', null, '67.43');
INSERT INTO `average_subcriteria` VALUES ('182', '89', '31', '7', null, '81.82');
INSERT INTO `average_subcriteria` VALUES ('183', '90', '31', '7', null, '37.88');
INSERT INTO `average_subcriteria` VALUES ('184', '91', '32', '7', null, '62.50');
INSERT INTO `average_subcriteria` VALUES ('185', '92', '32', '7', null, '63.64');
INSERT INTO `average_subcriteria` VALUES ('186', '93', '32', '7', null, '55.12');
INSERT INTO `average_subcriteria` VALUES ('187', '94', '32', '7', null, '53.98');
INSERT INTO `average_subcriteria` VALUES ('188', '95', '32', '7', null, '58.52');
INSERT INTO `average_subcriteria` VALUES ('196', '96', '33', '7', '71.10', '26.66');
INSERT INTO `average_subcriteria` VALUES ('197', '97', '33', '7', '70.42', '13.20');
INSERT INTO `average_subcriteria` VALUES ('198', '98', '34', '7', '36.74', '27.56');
INSERT INTO `average_subcriteria` VALUES ('199', '99', '34', '7', '26.99', '6.75');
INSERT INTO `average_subcriteria` VALUES ('200', '100', '35', '7', '65.15', '16.29');
INSERT INTO `average_subcriteria` VALUES ('201', '101', '35', '7', '42.33', '10.58');
INSERT INTO `average_subcriteria` VALUES ('202', '102', '36', '7', '91.91', '22.98');
INSERT INTO `average_subcriteria` VALUES ('203', '103', '36', '7', '78.67', '39.34');
-- 
-- AVERAGE_PROCESS
--
INSERT INTO `average_process` VALUES ('215', '110', '72', '28', '7', '41.67', '100.00', '77.27');
INSERT INTO `average_process` VALUES ('216', '111', '73', '28', '7', '50.00', '100.00', '93.18');
INSERT INTO `average_process` VALUES ('217', '112', '74', '28', '7', '37.50', '100.00', '77.27');
INSERT INTO `average_process` VALUES ('218', '113', '75', '28', '7', '41.67', '100.00', '83.33');
INSERT INTO `average_process` VALUES ('219', '114', '75', '28', '7', '37.50', '100.00', '82.39');
INSERT INTO `average_process` VALUES ('220', '115', '76', '28', '7', '31.25', '100.00', '77.95');
INSERT INTO `average_process` VALUES ('221', '116', '77', '29', '7', '25.00', '100.00', '65.91');
INSERT INTO `average_process` VALUES ('222', '117', '78', '29', '7', '25.00', '100.00', '59.09');
INSERT INTO `average_process` VALUES ('223', '118', '79', '29', '7', '33.33', '100.00', '76.52');
INSERT INTO `average_process` VALUES ('224', '119', '80', '29', '7', '25.00', '100.00', '75.76');
INSERT INTO `average_process` VALUES ('225', '120', '81', '30', '7', '37.50', '100.00', '70.45');
INSERT INTO `average_process` VALUES ('226', '121', '82', '30', '7', '25.00', '100.00', '71.97');
INSERT INTO `average_process` VALUES ('227', '122', '83', '30', '7', '8.33', '100.00', '59.09');
INSERT INTO `average_process` VALUES ('228', '123', '84', '30', '7', '33.33', '100.00', '80.30');
INSERT INTO `average_process` VALUES ('229', '124', '85', '30', '7', '56.25', '100.00', '79.55');
INSERT INTO `average_process` VALUES ('230', '125', '86', '31', '7', '50.00', '100.00', '87.50');
INSERT INTO `average_process` VALUES ('231', '126', '87', '31', '7', '25.00', '100.00', '74.24');
INSERT INTO `average_process` VALUES ('232', '127', '88', '31', '7', '41.67', '100.00', '67.43');
INSERT INTO `average_process` VALUES ('233', '128', '89', '31', '7', '37.50', '100.00', '81.82');
INSERT INTO `average_process` VALUES ('234', '129', '90', '31', '7', '33.33', '100.00', '75.76');
INSERT INTO `average_process` VALUES ('235', '130', '91', '32', '7', '12.50', '100.00', '55.68');
INSERT INTO `average_process` VALUES ('236', '131', '91', '32', '7', '12.50', '100.00', '69.32');
INSERT INTO `average_process` VALUES ('237', '132', '92', '32', '7', '25.00', '100.00', '63.64');
INSERT INTO `average_process` VALUES ('238', '133', '93', '32', '7', '0.00', '100.00', '51.14');
INSERT INTO `average_process` VALUES ('239', '134', '93', '32', '7', '25.00', '100.00', '59.09');
INSERT INTO `average_process` VALUES ('240', '135', '94', '32', '7', '33.33', '100.00', '71.97');
INSERT INTO `average_process` VALUES ('241', '136', '95', '32', '7', '33.33', '100.00', '78.03');
INSERT INTO `average_process` VALUES ('242', '137', '96', '33', '7', '56.00', '150.00', '93.50');
INSERT INTO `average_process` VALUES ('243', '138', '96', '33', '7', '0.00', '150.00', '74.82');
INSERT INTO `average_process` VALUES ('244', '139', '96', '33', '7', '0.00', '137.33', '73.67');
INSERT INTO `average_process` VALUES ('245', '140', '96', '33', '7', '0.00', '131.00', '42.41');
INSERT INTO `average_process` VALUES ('246', '141', '97', '33', '7', '0.00', '150.00', '78.18');
INSERT INTO `average_process` VALUES ('247', '142', '97', '33', '7', '0.00', '150.00', '73.67');
INSERT INTO `average_process` VALUES ('248', '143', '97', '33', '7', '0.00', '131.00', '59.41');
INSERT INTO `average_process` VALUES ('249', '144', '98', '34', '7', '0.00', '90.00', '50.91');
INSERT INTO `average_process` VALUES ('250', '145', '98', '34', '7', '0.00', '90.00', '40.03');
INSERT INTO `average_process` VALUES ('251', '146', '98', '34', '7', '0.00', '90.00', '19.27');
INSERT INTO `average_process` VALUES ('252', '147', '99', '34', '7', '0.00', '90.00', '28.45');
INSERT INTO `average_process` VALUES ('253', '148', '99', '34', '7', '0.00', '90.00', '35.30');
INSERT INTO `average_process` VALUES ('254', '149', '99', '34', '7', '0.00', '56.00', '17.23');
INSERT INTO `average_process` VALUES ('255', '150', '100', '35', '7', '0.00', '100.00', '65.15');
INSERT INTO `average_process` VALUES ('256', '151', '101', '35', '7', '0.00', '100.00', '49.43');
INSERT INTO `average_process` VALUES ('257', '152', '101', '35', '7', '0.00', '100.00', '35.23');
INSERT INTO `average_process` VALUES ('258', '153', '102', '36', '7', '0.00', '150.00', '105.55');
INSERT INTO `average_process` VALUES ('259', '154', '102', '36', '7', '0.00', '150.00', '103.86');
INSERT INTO `average_process` VALUES ('260', '155', '102', '36', '7', '0.00', '150.00', '66.32');
INSERT INTO `average_process` VALUES ('261', '156', '103', '36', '7', '0.00', '150.00', '78.18');
INSERT INTO `average_process` VALUES ('262', '157', '103', '36', '7', '0.00', '150.00', '85.09');
INSERT INTO `average_process` VALUES ('263', '158', '103', '36', '7', '0.00', '150.00', '91.91');
INSERT INTO `average_process` VALUES ('264', '159', '103', '36', '7', '0.00', '150.00', '59.50');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
