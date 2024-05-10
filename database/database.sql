DROP DATABASE IF EXISTS `Transport`;

CREATE DATABASE `Transport`;

USE `Transport`;

CREATE TABLE
    `Users` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `Username` VARCHAR(250) NOT NULL,
        `Password` VARCHAR(250) NOT NULL
    );

CREATE TABLE
    `Modules` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `Name` VARCHAR(250) NOT NULL
    );

CREATE TABLE
    `Permissions` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `UserId` INT NOT NULL,
        `ModuleId` INT NOT NULL,
        `AddPermission` INT NOT NULL,
        `EditPermission` INT NOT NULL,
        `DeletePermission` INT NOT NULL,
        `ViewPermission` INT NOT NULL,
        FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`),
        FOREIGN KEY (`ModuleId`) REFERENCES `Modules` (`Id`)
    );

CREATE TABLE
    `Customers` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `Name` VARCHAR(250) NOT NULL,
        `Address` VARCHAR(250) NOT NULL,
        `Number` VARCHAR(250) NOT NULL,
        `GSTno` VARCHAR(250) NOT NULL
    );

CREATE TABLE
    `Items` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `Name` VARCHAR(250) NOT NULL,
        `CityName` VARCHAR(250) NOT NULL,
        `Freight` VARCHAR(250) NOT NULL
    );

CREATE TABLE
    `Cities` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `Name` VARCHAR(250) NOT NULL,
        `Address` VARCHAR(250) NOT NULL,
        `Number` VARCHAR(250) NOT NULL
    );

CREATE TABLE
    `Memo` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `MemoDate` DATE NOT NULL,
        `TruckNo` VARCHAR(250) NOT NULL,
        `From` VARCHAR(250) NOT NULL,
        `To` VARCHAR(250) NOT NULL,
        `Remarks` VARCHAR(250) NOT NULL
    );

CREATE TABLE
    `Receipts` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `LrNo` INT NOT NULL,
        `Date` DATE NOT NULL,
        `ItemName` VARCHAR(250) NOT NULL,
        `Quantity` INT NOT NULL,
        `Rate` INT NULL,
        `Weight` INT NOT NULL,
        `FromCity` VARCHAR(250) NOT NULL,
        `ToCityName` VARCHAR(250) NOT NULL,
        `ToCityAddress` VARCHAR(250) NULL,
        `InvoiceNumber` VARCHAR(250) NOT NULL,
        `EwayBill` VARCHAR(250) NOT NULL,
        `ConsignorName` VARCHAR(250) NOT NULL,
        `ConsignorAddress` VARCHAR(250) NULL,
        `ConsignorNumber` VARCHAR(250) NULL,
        `ConsignorGstNo` VARCHAR(250) NULL,
        `ConsigneeName` VARCHAR(250) NOT NULL,
        `ConsigneeAddress` VARCHAR(250) NULL,
        `ConsigneeNumber` VARCHAR(250) NULL,
        `ConsigneeGstNo` VARCHAR(250) NULL,
        `Freight` INT NOT NULL,
        `Crossing` INT NOT NULL,
        `BC` INT NOT NULL,
        `Hamali` INT NOT NULL,
        `PayPaidBilled` INT NOT NULL,
        `Total` INT NOT NULL,
        `Remarks` VARCHAR(250) NULL,
        `MemoCreated` INT DEFAULT 0
    );

CREATE TABLE
    `ReceiptsMemoDone` (
        `Id` INT PRIMARY KEY AUTO_INCREMENT,
        `ReceiptId` INT NOT NULL,
        `MemoId` INT NOT NULL,
        FOREIGN KEY (`ReceiptId`) REFERENCES `Receipts` (`Id`),
        FOREIGN KEY (`MemoId`) REFERENCES `Memo` (`Id`)
    );

INSERT INTO
    `Users` (`Username`, `Password`)
VALUES
    ('admin', 'admin');

INSERT INTO
    `Modules` (`Name`)
VALUES
    ('Customers'),
    ('Items'),
    ('Cities'),
    ('LR'),
    ('Memo'),
    ('Users');

INSERT INTO
    `Permissions` (
        `UserId`,
        `ModuleId`,
        `AddPermission`,
        `EditPermission`,
        `DeletePermission`,
        `ViewPermission`
    )
VALUES
    (1, 1, 1, 1, 1, 1),
    (1, 2, 1, 1, 1, 1),
    (1, 3, 1, 1, 1, 1),
    (1, 4, 1, 1, 1, 1),
    (1, 5, 1, 1, 1, 1),
    (1, 6, 1, 1, 1, 1);