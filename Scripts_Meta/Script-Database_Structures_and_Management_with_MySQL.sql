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

-- Reading Exercise 1 | Módulo 1

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

-- Lab 2 | Módulo 1
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

-- Lab 3 | Módulo 1
DROP TABLE Orders;

CREATE TABLE Orders(
	OrderID INT,
	Department VARCHAR(100),
	OrderDate DATE,
	OrderQty INT,
	OrderTotal INT,
	PRIMARY KEY(OrderID)
);

INSERT INTO Orders VALUES
(1,'Lawn Care','2022-05-05',12,500),
(2,'Decking','2022-05-22',150,1450),
(3,'Compost and Stones','2022-05-27',20,780),
(4,'Trees and Shrubs','2022-06-01',15,400),
(5,'Garden Decor','2022-06-10',2,1250),
(6,'Lawn Care','2022-06-10',12,500),
(7,'Decking','2022-06-25',150,1450),
(8,'Compost and Stones','2022-05-29',20,780),
(9,'Trees and Shrubs','2022-06-10',15,400),
(10,'Garden Decor','2022-06-10',2,1250),
(11,'Lawn Care','2022-06-25',10,400), 
(12,'Decking','2022-06-25',100,1400),
(13,'Compost and Stones','2022-05-30',15,700),
(14,'Trees and Shrubs','2022-06-15',10,300),
(15,'Garden Decor','2022-06-11',2,1250),
(16,'Lawn Care','2022-06-10',12,500),
(17,'Decking','2022-06-25',150,1450),
(18,'Trees and Shrubs','2022-06-10',15,400),
(19,'Lawn Care','2022-06-10',12,500),
(20,'Decking','2022-06-25',150,1450),
(21,'Decking','2022-06-25',150,1450);

-- Task 1 
SELECT OrderDate FROM Orders GROUP BY OrderDate;

-- Task 2
SELECT OrderDate, COUNT(OrderID) FROM Orders GROUP BY OrderDate;

-- Task 3
SELECT Department, SUM(OrderQty) FROM Orders GROUP BY Department;

-- Task 4
SELECT OrderDate, COUNT(OrderID) FROM Orders
GROUP BY OrderDate
HAVING OrderDate BETWEEN '2022-06-01' AND '2022-06-30';

-- Reading Exercise 2 | Módulo 1
CREATE TABLE Employees_Orders (
	OrderID INT NOT NULL,
	EmployeeID INT NOT NULL,
	Status VARCHAR(150),
	HandlingCost INT DEFAULT NULL,
	PRIMARY KEY (EmployeeID, OrderID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Employees_Orders VALUES
(1,3,"In Progress",200), 
(1,5,"Not Recieved",300), 
(1,4,"Not Recieved",250), 
(2,3,"Completed",200), 
(2,5,"Completed",300), 
(2,4,"In Progress",250), 
(3,3,"In Progress",200), 
(3,5,"Not Recieved",300), 
(3,4,"Not Recieved",250), 
(4,3,"Completed",200), 
(4,5,"In Progress",300), 
(4,4,"In Progress",250), 
(5,3,"Completed",200), 
(5,5,"In Progress",300), 
(5,4,"Not Recieved",250), 
(11,3,"Completed",200), 
(11,5,"Completed",300), 
(11,4,"Not Recieved",250), 
(14,3,"Completed",200), 
(14,5,"Not Recieved",300), 
(14,4,"Not Recieved",250);

-- Task 1
SELECT EmployeeID, EmployeeName
FROM Employees
WHERE EmployeeID = ANY(SELECT EmployeeID FROM Employees_Orders WHERE Status = 'Completed');

-- Task 2
SELECT EmployeeID, HandlingCost
FROM Employees_Orders
WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal / 100 * 20) FROM Orders);

-- Task 3
SELECT EmployeeID, HandlingCost
FROM Employees_Orders
WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal / 100 * 20) FROM Orders) GROUP BY EmployeeID, HandlingCost;

-- Task 4
SELECT EmployeeID, HandlingCost
FROM Employees_Orders
WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal / 100 * 20) AS twentyPercent FROM Orders GROUP BY OrderTotal HAVING twentyPercent > 100) GROUP BY EmployeeID, HandlingCost;

-- Lab 1 | Módulo 2
SHOW tables;
SELECT * FROM Orders;
DROP TABLE Orders;

CREATE TABLE Orders(
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
(8, "Cl1", "P1", 15, 150);

-- Task 1
SELECT * FROM Orders;
REPLACE INTO Orders VALUES 
(9, "Cl1", "P1", 10, 5000), 
(10, "Cl2", "P2", 5, 100);

-- Task 2
REPLACE INTO Orders SET OrderId = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 500;

-- Reading Exercise 1 | Módulo 2
SHOW tables;

CREATE TABLE Starters(
	StarterName VARCHAR(100) NOT NULL PRIMARY KEY,
	Cost DECIMAL(3,2),
	StarterType VARCHAR(100) DEFAULT 'Mediterranean'
);

REPLACE INTO Starters VALUES ("Cheese Bread", 9.50, "Indian");
SELECT * FROM Starters;
REPLACE INTO Starters SET StarterName = "Cheese Bread", Cost = 9.75, StarterType = "Indian";

