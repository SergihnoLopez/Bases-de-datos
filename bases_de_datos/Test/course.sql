-- MySQL Script generated by MySQL Workbench
-- 02/26/16 17:48:47
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema course
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema course
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `course` DEFAULT CHARACTER SET utf8 ;
USE `course` ;

-- -----------------------------------------------------
-- Table `course`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`program` (
  `idprogram` INT NOT NULL,
  `name_group` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprogram`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`course` (
  `program_idprogram` INT NOT NULL,
  `idcourse` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `coste` TINYINT(4) NOT NULL,
  `inicio` DATE NOT NULL,
  `fin` DATE NOT NULL,
  PRIMARY KEY (`program_idprogram`, `idcourse`),
  INDEX `fk_course_program_idx` (`program_idprogram` ASC),
  CONSTRAINT `fk_course_program`
    FOREIGN KEY (`program_idprogram`)
    REFERENCES `course`.`program` (`idprogram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`teacher` (
  `idteacher` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idteacher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`student` (
  `idstudent` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `nacimiento` DATE NOT NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`payment` (
  `idpayment` INT NOT NULL,
  `efectivo` INT NULL,
  `cheque` INT NULL,
  `tarjeta` INT NULL,
  PRIMARY KEY (`idpayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`teacher_has_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`teacher_has_course` (
  `teacher_idteacher` INT NOT NULL,
  `course_idcourse` INT NOT NULL,
  `course_program_idprogram` INT NOT NULL,
  `teacher_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`teacher_idteacher`, `course_idcourse`, `course_program_idprogram`),
  INDEX `fk_teacher_has_course_course1_idx` (`course_idcourse` ASC, `course_program_idprogram` ASC),
  INDEX `fk_teacher_has_course_teacher1_idx` (`teacher_idteacher` ASC),
  CONSTRAINT `fk_teacher_has_course_teacher1`
    FOREIGN KEY (`teacher_idteacher`)
    REFERENCES `course`.`teacher` (`idteacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_course_course1`
    FOREIGN KEY (`course_idcourse` , `course_program_idprogram`)
    REFERENCES `course`.`course` (`idcourse` , `program_idprogram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`classroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`classroom` (
  `idclassroom` INT NOT NULL,
  PRIMARY KEY (`idclassroom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`schedule` (
  `idtable1` INT NOT NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`group` (
  `idgroup` INT NOT NULL,
  `course_idcourse` INT NOT NULL,
  `course_program_idprogram` INT NOT NULL,
  `classroom_idclassroom` INT NOT NULL,
  `schedule_idtable1` INT NOT NULL,
  PRIMARY KEY (`idgroup`, `course_idcourse`, `course_program_idprogram`, `classroom_idclassroom`, `schedule_idtable1`),
  INDEX `fk_group_course1_idx` (`course_idcourse` ASC, `course_program_idprogram` ASC),
  INDEX `fk_group_classroom1_idx` (`classroom_idclassroom` ASC),
  INDEX `fk_group_schedule1_idx` (`schedule_idtable1` ASC),
  CONSTRAINT `fk_group_course1`
    FOREIGN KEY (`course_idcourse` , `course_program_idprogram`)
    REFERENCES `course`.`course` (`idcourse` , `program_idprogram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_classroom1`
    FOREIGN KEY (`classroom_idclassroom`)
    REFERENCES `course`.`classroom` (`idclassroom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_schedule1`
    FOREIGN KEY (`schedule_idtable1`)
    REFERENCES `course`.`schedule` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`student_has_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`student_has_group` (
  `student_idstudent` INT NOT NULL,
  `group_idgroup` INT NOT NULL,
  `payment_idpayment` INT NOT NULL,
  PRIMARY KEY (`student_idstudent`, `group_idgroup`, `payment_idpayment`),
  INDEX `fk_student_has_group_group1_idx` (`group_idgroup` ASC),
  INDEX `fk_student_has_group_student1_idx` (`student_idstudent` ASC),
  INDEX `fk_student_has_group_payment1_idx` (`payment_idpayment` ASC),
  CONSTRAINT `fk_student_has_group_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `course`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_group_group1`
    FOREIGN KEY (`group_idgroup`)
    REFERENCES `course`.`group` (`idgroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_group_payment1`
    FOREIGN KEY (`payment_idpayment`)
    REFERENCES `course`.`payment` (`idpayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`grade` (
  `idgrade` INT NOT NULL,
  `group_idgroup` INT NOT NULL,
  `group_course_idcourse` INT NOT NULL,
  `group_course_program_idprogram` INT NOT NULL,
  PRIMARY KEY (`idgrade`, `group_idgroup`, `group_course_idcourse`, `group_course_program_idprogram`),
  INDEX `fk_grade_group1_idx` (`group_idgroup` ASC, `group_course_idcourse` ASC, `group_course_program_idprogram` ASC),
  CONSTRAINT `fk_grade_group1`
    FOREIGN KEY (`group_idgroup` , `group_course_idcourse` , `group_course_program_idprogram`)
    REFERENCES `course`.`group` (`idgroup` , `course_idcourse` , `course_program_idprogram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `course` ;

-- -----------------------------------------------------
-- Placeholder table for view `course`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`view1` (`id` INT);

-- -----------------------------------------------------
--  routine1
-- -----------------------------------------------------

DELIMITER $$
USE `course`$$
$$

DELIMITER ;

-- -----------------------------------------------------
-- View `course`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course`.`view1`;
USE `course`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;