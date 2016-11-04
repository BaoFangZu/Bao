-- MySQL Script generated by MySQL Workbench
-- 11/04/16 17:43:54
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
-- Table `exposure`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`article` ;

CREATE TABLE IF NOT EXISTS `exposure`.`article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(45) NULL,
  `path` VARCHAR(45) NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_article_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `iam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`comment` ;

CREATE TABLE IF NOT EXISTS `exposure`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(45) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_comment1_idx` (`comment_id` ASC),
  INDEX `fk_comment_article1_idx` (`article_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `exposure`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `exposure`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `iam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`house`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`house` ;

CREATE TABLE IF NOT EXISTS `exposure`.`house` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  `price` FLOAT NULL,
  `article_id` INT NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `article_id`),
  INDEX `fk_house_article1_idx` (`article_id` ASC),
  CONSTRAINT `fk_house_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `exposure`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`like` ;

CREATE TABLE IF NOT EXISTS `exposure`.`like` (
  `target_id` INT NULL,
  `user_id` INT NOT NULL,
  INDEX `fk_like_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_like_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `iam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exposure`.`favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exposure`.`favorite` ;

CREATE TABLE IF NOT EXISTS `exposure`.`favorite` (
  `article_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  INDEX `fk_favorite_article1_idx` (`article_id` ASC),
  INDEX `fk_favorite_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_favorite_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `exposure`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `iam`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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

USE `iam` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
