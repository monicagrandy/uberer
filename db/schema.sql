CREATE TABLE IF NOT EXISTS `ClientContact` (
	`PK` INT NOT NULL AUTO_INCREMENT,
	`Name` varchar(50),
	`JoinDate` varchar(250),
	`Phone` INT(50),
	`Email` varchar(250),
	`Rating` INT(10),
	`Blocked` BOOLEAN,
	`Billing` INT(10),
	PRIMARY KEY (`PK`)
);.

CREATE TABLE IF NOT EXISTS `DriverContact` (
	`PK` INT NOT NULL AUTO_INCREMENT,
	`Name` varchar(250),
	`JoinDate` varchar(250),
	`Phone` INT(50),
	`Email` varchar(250),
	`Payroll` INT(50),
	`Address` varchar(500),
	`Rating` INT (10),
	PRIMARY KEY (`PK`)
);.

CREATE TABLE IF NOT EXISTS `Rides` (
	`PK` INT NOT NULL AUTO_INCREMENT,
	`Date` Varchar(250),
	`Distance` FLOAT,
	`TripCost` FLOAT,
	`Dispute` INT(50),
	`InitialClient` INT(50),
	`Pool1` INT(50),
	`Pool2` INT(50),
	`TripDriver` INT(50),
	PRIMARY KEY (`PK`)
);.

CREATE TABLE IF NOT EXISTS `Disputes` (
	`PK` INT NOT NULL AUTO_INCREMENT,
	`Ride` INT(50),
	`Driver` INT(50),
	`Client` INT(50),
	`Resolved` BOOLEAN,
	PRIMARY KEY (`PK`)
);.

CREATE TABLE IF NOT EXISTS `ClientBilling` (
	`PK` INT NOT NULL AUTO_INCREMENT,
	`BillingAddress` varchar(500),
	`AcctInfo` INT(50),
	`Name` varchar(250),
	`ClientInfo` INT(50),
	PRIMARY KEY (`PK`)
);.

CREATE TABLE IF NOT EXISTS `DriverPayment` (
	`PK` INT NOT NULL AUTO_INCREMENT,
	`AcctNumber` INT(50),
	`CurrentPayPeriod` varchar(250),
	`TotalGross` FLOAT,
	`TotalNet` FLOAT,
	`DriverInfo` INT(50),
	PRIMARY KEY (`PK`)
);.

ALTER TABLE `ClientContact` ADD FOREIGN KEY (`Billing`) REFERENCES CLIENTBILLING(`PK`);.

ALTER TABLE `DriverContact` ADD FOREIGN KEY (`Payroll`) REFERENCES DRIVERPAYMENT(`PK`);.

ALTER TABLE `Rides` ADD FOREIGN KEY (`Dispute`) REFERENCES DISPUTES(`PK`);.

ALTER TABLE `Rides` ADD FOREIGN KEY (`InitialClient`) REFERENCES CLIENTCONTACT(`PK`);.

ALTER TABLE `Rides` ADD FOREIGN KEY (`Pool1`) REFERENCES CLIENTCONTACT(`PK`);.

ALTER TABLE `Rides` ADD FOREIGN KEY (`Pool2`) REFERENCES CLIENTCONTACT(`PK`);.

ALTER TABLE `Rides` ADD FOREIGN KEY (`TripDriver`) REFERENCES DRIVERCONTACT(`PK`);.

ALTER TABLE `Disputes` ADD FOREIGN KEY (`Client`) REFERENCES CLIENTCONTACT(`PK`);.

ALTER TABLE `Disputes` ADD FOREIGN KEY (`Driver`) REFERENCES DRIVERCONTACT(`PK`);.

ALTER TABLE `Disputes` ADD FOREIGN KEY (`Ride`) REFERENCES RIDES(`PK`);.

ALTER TABLE `ClientBilling` ADD FOREIGN KEY (`ClientInfo`) REFERENCES CLIENTCONTACT(`PK`);.

ALTER TABLE `DriverPayment` ADD FOREIGN KEY (`DriverInfo`) REFERENCES DRIVERCONTACT(`PK`);








