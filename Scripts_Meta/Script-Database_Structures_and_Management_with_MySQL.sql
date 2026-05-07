-- Lab 1 | Módulo 1

CREATE DATABASE IF NOT EXISTS Lucky_Shrub;
USE Lucky_Shrub;

CREATE TABLE Orders (
	OrderID INT NOT NULL PRIMARY KEY,
	ClientID VARCHAR(10),
	ProductID VARCHAR(10),
	Quantity INT,
	Cost DECIMAL(6,2)
);

INSERT INTO Orders VALUES
(1, "Cl1", "P1", 10, 500),
(2, "Cl2", "P2", 5, 100),
(3, "Cl3", "P3", 20, 800),
(4, "Cl4", "P4", 15, 150),
(5, "Cl3", "P3", 10, 450),
(6, "Cl2", "P2", 5, 800),
(7, "Cl1", "P4", 22, 1200),
(8, "Cl3", "P1", 15, 150),
(9, "Cl1", "P1", 10, 500),
(10, "Cl2", "P2", 5, 100);

SELECT * FROM Orders WHERE Cost <= 250;
SELECT * FROM Orders WHERE Cost BETWEEN 50 AND 750;
SELECT * FROM Orders WHERE ClientID = "Cl3" AND Cost > 100;
SELECT * FROM Orders WHERE ProductID IN ("P1", "P2") AND Quantity > 2;

-- Reading Exercise | Módulo 1

CREATE TABLE Employees (
	EmployeeID INT NOT NULL PRIMARY KEY,
	EmployeeName VARCHAR(150) DEFAULT NULL,
	Department VARCHAR(150) DEFAULT NULL,
	ContactNo VARCHAR(12) DEFAULT NULL,
	Email VARCHAR(100) DEFAULT NULL,
	AnnualSalary INT DEFAULT NULL
);

INSERT INTO Employees VALUES
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@ luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@ luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@ luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@ luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@ luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

SELECT * FROM Employees WHERE AnnualSalary >= 50000 AND Department = "Marketing";
SELECT * FROM Employees WHERE NOT AnnualSalary > 50000;
SELECT * FROM Employees WHERE Department IN ("Marketing", "Finance", "Legal") AND AnnualSalary < 50000; 
SELECT * FROM Employees WHERE AnnualSalary BETWEEN 10000 AND 50000;
SELECT * FROM Employees WHERE EmployeeName LIKE "S___%";

show tables;

-- Lab 1 | Módulo 1
CREATE DATABASE little_lemon;
USE little_lemon;

CREATE TABLE Customers(
	CustomerID INT NOT NULL PRIMARY KEY,
	FullName VARCHAR(100) NOT NULL,
	PhoneNumber INT NOT NULL UNIQUE
);

INSERT INTO Customers VALUES
(1, "Vanessa McCarthy", 0757536378),
(2, "Marcos Romero", 0757536379),
(3, "Hiroki Yamane", 0757536376),
(4, "Anna Iversen", 0757536375),
(5, "Diana Pinto", 0757536374);

CREATE TABLE Bookings(
	BookingID INT NOT NULL PRIMARY KEY,
	BookingDate DATE NOT NULL,
	TableNumber INT NOT NULL,
	NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8),
	CustomerID INT NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

INSERT INTO Bookings VALUES
(10, '2021-11-11', 7, 5, 1),
(11, '2021-11-10', 5, 2, 2),
(12, '2021-11-10', 3, 2, 4);

-- Task 1
SELECT c.FullName, c.PhoneNumber, b.BookingDate, b.NumberOfGuests
FROM Customers AS c
INNER JOIN Bookings as b
ON c.CustomerID = b.CustomerID;

-- Task 2
SELECT c.CustomerID, b.BookingID
FROM Customers AS c
LEFT JOIN Bookings AS b
ON c.CustomerID = b.CustomerID;

