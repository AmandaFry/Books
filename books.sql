-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Books` DEFAULT CHARACTER SET utf8 ;
USE `Books` ;

-- -----------------------------------------------------
-- Table `Books`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `alias` VARCHAR(45) NULL,
  `email` VARCHAR(75) NULL,
  `password` VARCHAR(255) NULL,
  `birthday` DATE NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL,
  `review` TEXT NULL,
  `user_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reviews_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_reviews_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `Books`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `reviews_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_books_reviews1_idx` (`reviews_id` ASC),
  CONSTRAINT `fk_books_reviews1`
    FOREIGN KEY (`reviews_id`)
    REFERENCES `Books`.`reviews` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(75) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`books_authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`books_authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_books_authors_books1_idx` (`book_id` ASC),
  INDEX `fk_books_authors_authors1_idx` (`author_id` ASC),
  CONSTRAINT `fk_books_authors_books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `Books`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_authors_authors1`
    FOREIGN KEY (`author_id`)
    REFERENCES `Books`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
