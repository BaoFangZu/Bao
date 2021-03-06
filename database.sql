-- MySQL Script generated by MySQL Workbench
-- 12/04/16 13:26:45
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exposure
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `exposure` ;

-- -----------------------------------------------------
-- Schema exposure
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exposure` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema iam
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `iam` ;

-- -----------------------------------------------------
-- Schema iam
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `iam` ;
USE `exposure` ;

-- -----------------------------------------------------
-- Table `iam`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iam`.`user` ;

CREATE TABLE IF NOT EXISTS `iam`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(200) NULL,
  `phone` VARCHAR(45) NULL,
  `password` VARCHAR(100) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`comment` ;

CREATE TABLE IF NOT EXISTS `exposure`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(45) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `target_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`house`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`house` ;

CREATE TABLE IF NOT EXISTS `exposure`.`house` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  `price` FLOAT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `title` VARCHAR(200) NULL,
  `content` VARCHAR(450) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`like` ;

CREATE TABLE IF NOT EXISTS `exposure`.`like` (
  `target_id` INT NULL,
  `user_id` INT NOT NULL,
  `type` VARCHAR(45) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`favorite` ;

CREATE TABLE IF NOT EXISTS `exposure`.`favorite` (
  `user_id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `house_id` INT NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`user` ;

CREATE TABLE IF NOT EXISTS `exposure`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(200) NULL,
  `phone` VARCHAR(45) NULL,
  `password` VARCHAR(100) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`attachment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`attachment` ;

CREATE TABLE IF NOT EXISTS `exposure`.`attachment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(200) NULL,
  `house_id` INT NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `attachment_id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;

USE `iam` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

