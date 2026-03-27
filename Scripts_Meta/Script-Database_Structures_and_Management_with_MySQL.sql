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
