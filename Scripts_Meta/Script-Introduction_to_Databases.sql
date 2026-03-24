-- Lab 1 | Módulo 2

CREATE DATABASE cm_devices;
USE cm_devices;
CREATE TABLE Devices (
	deviceID INT,
	deviceName VARCHAR(50),
	price DECIMAL
);
SHOW tables;
SHOW COLUMNS FROM Devices;
CREATE TABLE Stock (
	deviceID INT,
	quantity INT, 
	totalPrice DECIMAL
);
SHOW COLUMNS FROM Stock;

-- Lab 2 | Módulo 2

CREATE TABLE Customers (
	username CHAR(9), 
	fullName VARCHAR(100),
	email VARCHAR(255
));
SHOW tables;
SHOW COLUMNS FROM Customers;
CREATE TABLE Feedback (
	feedbackID CHAR(8), 
	feedbackType VARCHAR(100), 
	comment TEXT(500)
);

-- Lab 3 | Módulo 2

CREATE TABLE Address (
	id INT NOT NULL, 
	street VARCHAR(255), 
	postcode VARCHAR(10), 
	town VARCHAR(30) DEFAULT "Harrow"
);
SHOW COLUMNS FROM Address;
DROP TABLE Address;
CREATE TABLE Address (
	id INT NOT NULL,
	street VARCHAR(255),
	postcode VARCHAR(10) DEFAULT "HA97DE", 
	town VARCHAR(30) DEFAULT "Harrow"
); 

-- Lab 4 | Módulo 2

CREATE TABLE Invoice (
	customerName VARCHAR(50), 
	orderDate DATE, 
	quantity INT, 
	price DECIMAL
);
SHOW tables;
SHOW COLUMNS FROM Invoice;
CREATE TABLE Contact (
	accountNumber INT,
	phone VARCHAR(14),
	email VARCHAR(255)
);
SHOW COLUMNS FROM Contact;

-- Lab 5 | Módulo 2

CREATE DATABASE bookshop;
USE bookshop;
CREATE TABLE Customers (
	customerID INT, 
	customerName VARCHAR(50),
	customerAddress VARCHAR(255)
);
SHOW tables;
INSERT INTO Customers VALUES (1, "Gabriel", "Rua Legal, 21");
SELECT * FROM Customers;
INSERT INTO Customers VALUES (2, "James", "24 Carlson Road, London") ;

-- Lab 6 | Módulo 2

CREATE DATABASE football_club;
USE football_club;
CREATE TABLE Players (
	playerID INT, 
	playerName VARCHAR(50), 
	age INT
);
SHOW tables;
CREATE TABLE Games (
	gameID INT,
	gameDate DATE,
	score INT
);

-- Lab 7 | Módulo 2

USE bookshop;
SHOW tables;
TRUNCATE TABLE Customers;
INSERT INTO Customers VALUES
(1, 'Jack', '115 Old street Belfast'),
(2, 'James', '24 Carlson Rd London'),
(4, 'Maria', '5 Fredrik Rd, Bedford'),
(5, 'Jade', '10 Copland Ave Portsmouth '),
(6, 'Yasmine', '15 Fredrik Rd, Bedford'),
(3, 'Jimmy', '110 Copland Ave Portsmouth');
SELECT * FROM Customers;
DELETE FROM Customers WHERE customerID = 3;
DELETE FROM Customers WHERE customerID = 6;

-- Lab 1 | Módulo 3

CREATE DATABASE Chinook;
USE Chinook;
CREATE TABLE Customer (
	CustomerId INT NOT NULL,
	FirstName VARCHAR(40) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Company VARCHAR(80),
	Address VARCHAR(70),
	City VARCHAR(40),
	State VARCHAR(40),
	Country VARCHAR(40),
	PostalCode VARCHAR(10),
	Phone VARCHAR(24),
	Fax VARCHAR(24),
	Email VARCHAR(60) NOT NULL,
	SupportRepId INT,
	CONSTRAINT PK_Customer PRIMARY KEY (CustomerId)
);
INSERT INTO Customer VALUES
(1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
(2, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5446', '+55 (11) 3033-4564', 'eduardo@woodstock.com.br', 4),
(3, 'Alexandre', 'Rocha', 'Banco do Brasil S.A.', 'Av. Paulista, 2022', 'São Paulo', 'SP', 'Brazil', '01310-200', '+55 (11) 3055-3278', '+55 (11) 3055-8131', 'alero@uol.com.br', 5),
(4, 'Roberto', 'Almeida', 'Riotur', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', '+55 (21) 2271-7000', '+55 (21) 2271-7070', 'roberto.almeida@riotur.gov.br', 3),
(5, 'Mark', 'Philips', 'Telus', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', '+1 (780) 434-4554', '+1 (780) 434-5565', 'mphilips12@shaw.ca', 5),
(6, 'Jennifer', 'Peterson', 'Rogers Canada', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', '+1 (604) 688-2255', '+1 (604) 688-8756', 'jenniferp@rogers.ca', 3);

SELECT CustomerID, FirstName, LastName, City, State, Country FROM Customer;

SELECT CustomerID, FirstName, LastName, City, State, Country 
FROM Customer
ORDER BY FirstName;

SELECT * FROM Customer WHERE Country = "Canada";

SELECT * FROM Customer
WHERE Country = "Canada"
ORDER BY FirstName;

SELECT FirstName, LastName, Country 
FROM Customer
WHERE Country = "Canada"
ORDER BY FirstName;

-- Keys in Depth | Módulo 4
CREATE DATABASE automobile;
USE automobile;
CREATE TABLE Vehicle (
	vehicleID VARCHAR(10) NOT NULL PRIMARY KEY,
	ownerID VARCHAR(10) NOT NULL,
	plateNumber VARCHAR(10) NOT NULL,
	phoneNumber INT NOT NULL
);
CREATE TABLE Owner (
	ownerID VARCHAR(10) NOT NULL PRIMARY KEY,
	ownerName VARCHAR(50) NOT NULL,
	ownerAddress VARCHAR(255) NOT NULL 
);
ALTER TABLE Vehicle ADD FOREIGN KEY (ownerID) REFERENCES Owner (ownerID);
SHOW COLUMNS FROM Vehicle;

-- Data normalization | Módulo 4

CREATE DATABASE medical_group;
USE medical_group;
CREATE TABLE Surgery (
	DoctorID VARCHAR(10),
	DoctorName VARCHAR(50),
	Region VARCHAR(20),
	PatientID VARCHAR(10),
	PatientName VARCHAR(50),
	SurgeryNumber INT,
	Council VARCHAR(20),
	Postcode VARCHAR(10),
	SlotID VARCHAR(5),
	TotalCost DECIMAL
);

-- 1NF
CREATE TABLE Patient (
	PatientID VARCHAR(10) NOT NULL,
	PatientName VARCHAR(50),
	SlotID VARCHAR(10) NOT NULL,
	TotalCost DECIMAL,
	CONSTRAINT PK_Patient PRIMARY KEY (PatientID, SlotID)
);
CREATE TABLE Doctor (
	DoctorID VARCHAR(10),
	DoctorName VARCHAR(50),
	PRIMARY KEY (DoctorID)
);
ALTER TABLE Surgery DROP TotalCost;
ALTER TABLE Surgery MODIFY SurgeryNumber INT FIRST;
ALTER TABLE Surgery ADD PRIMARY KEY (SurgeryNumber);
SHOW COLUMNS FROM Surgery;

-- 2NF
CREATE TABLE Appointments (
	AppointmentID INT NOT NULL,
	SlotID VARCHAR(10),
	TotalCost DECIMAL,
	PRIMARY KEY (AppointmentID)
);
ALTER TABLE Patient DROP SlotID, DROP TotalCost;
SHOW COLUMNS FROM Patient;
SHOW COLUMNS FROM Appointments;

-- 3NF
CREATE TABLE Location (
	SurgeryNumber INT NOT NULL,
	Postcode VARCHAR(10),
	PRIMARY KEY (SurgeryNumber)
);
CREATE TABLE Council (
	Council VARCHAR(20) NOT NULL,
	Region VARCHAR(20),
	PRIMARY KEY (Council)
);
DROP TABLE Surgery;

-- Lembrando que antes de qualquer ALTER e DROP em banco de dados povoados,
-- deve-se passar os dados para as tabelas normalizadas.
SHOW tables;