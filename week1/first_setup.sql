-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NULL,
  `TableNo` INT NULL,
  `Customers_CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_Bookings_Customers_idx` (`Customers_CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customers`
    FOREIGN KEY (`Customers_CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `Starter` VARCHAR(45) NULL,
  `MainCourse` VARCHAR(45) NULL,
  `Dessert` VARCHAR(45) NULL,
  `Drinks` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Cuisine` VARCHAR(45) NULL,
  `MenuItems_MenuItemID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_Menus_MenuItems1_idx` (`MenuItems_MenuItemID` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_MenuItems1`
    FOREIGN KEY (`MenuItems_MenuItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL NULL,
  `Customers_CustomerID` INT NOT NULL,
  `Menus_MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Customers1_idx` (`Customers_CustomerID` ASC) VISIBLE,
  INDEX `fk_Orders_Menus1_idx` (`Menus_MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`Customers_CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Menus1`
    FOREIGN KEY (`Menus_MenuID`)
    REFERENCES `LittleLemonDB`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Salary` INT NULL,
  `Role` VARCHAR(45) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `DeliveryID` INT NOT NULL,
  `DeliiveryDate` DATE NULL,
  `Status` VARCHAR(45) NULL,
  `Orders_OrderID` INT NOT NULL,
  `Staff_StaffID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fk_OrderDeliveryStatus_Orders1_idx` (`Orders_OrderID` ASC) VISIBLE,
  INDEX `fk_OrderDeliveryStatus_Staff1_idx` (`Staff_StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDeliveryStatus_Orders1`
    FOREIGN KEY (`Orders_OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDeliveryStatus_Staff1`
    FOREIGN KEY (`Staff_StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`ContactDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`ContactDetails` (
  `ContactID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NULL,
  `Customers_CustomerID` INT NOT NULL,
  `Staff_StaffID` INT NOT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `fk_ContactDetails_Customers1_idx` (`Customers_CustomerID` ASC) VISIBLE,
  INDEX `fk_ContactDetails_Staff1_idx` (`Staff_StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_ContactDetails_Customers1`
    FOREIGN KEY (`Customers_CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContactDetails_Staff1`
    FOREIGN KEY (`Staff_StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
