DROP TABLE IF EXISTS `Customer`;
CREATE TABLE Customer(
  CustomerID int(11) NOT NULL,
  CustomerNameFirst varchar(255) NOT NULL,
  CustomerNameLast varchar(255) NOT NULL,
  CustomerPhone varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
  OrderID int(11) NOT NULL,
  CustomerID int(11) NOT NULL,
  DateOrdered DATE NOT NULL,
  PriceOfOrder int(11) NOT NULL,
  PRIMARY KEY (`OrderID`)
);

DROP TABLE IF EXISTS FruitBasket;
CREATE TABLE FruitBasket(
  FruitName varchar(255) NOT NULL,
  OrderID int(11) NOT NULL,
  PRIMARY KEY (`OrderID`, `FruitName`)
);


DROP TABLE IF EXISTS Fruits;
CREATE TABLE Fruits(
  FruitName varchar(255) NOT NULL,
  OrderID int(11) NOT NULL,
  NumInStorage int(11) NOT NULL,
  PriceOfFruit int(11) NOT NULL,
  PRIMARY KEY (`FruitName`),
  KEY (`OrderID`)
);

DROP TABLE IF EXISTS tasteComp;
CREATE TABLE TasteComp(
  FruitName varchar(255) NOT NULL,
  TasteName varchar(255) NOT NULL,
  PRIMARY KEY (`TasteName`, `FruitName`)
);

DROP TABLE IF EXISTS VitaminComp;
CREATE TABLE VitaminComp(
  FruitName varchar(255) NOT NULL,
  VitaminName varchar(255) NOT NULL,
  PRIMARY KEY (`VitaminName`, `FruitName`)
);

DROP TABLE IF EXISTS Tastes;
CREATE TABLE Tastes(
  TasteName varchar(255) NOT NULL,
  PRIMARY KEY (TasteName)
);

DROP TABLE IF EXISTS Vitamins;
CREATE TABLE Vitamins(
  VitaminName varchar(255) NOT NULL,
  PRIMARY KEY (VitaminName)
);

INSERT INTO Customer (CustomerID, CustomerNameFirst, CustomerNameLast, CustomerPhone)
VALUES (123456, 'Bob', 'Smith', '1234567890');

INSERT INTO Orders (OrderID, CustomerID, DateOrdered, PriceOfOrder)
VALUES (654321, (SELECT CustomerID FROM Customer WHERE CustomerID = 123456), 2020-11-01, 5);

INSERT INTO Fruits (FruitName, OrderID, NumInStorage, PriceOfFruit)
VALUES ('Apple', (SELECT OrderID FROM Orders Where OrderID = 654321), 5, 1);

INSERT INTO Vitamins (VitaminName)
VALUES ('Vitamin C');

INSERT INTO Tastes (TasteName)
VALUES ('Juicy');

INSERT INTO FruitBasket (FruitName, OrderID)
VALUES ((SELECT FruitName FROM Fruits WHERE FruitName = 'Apple'), (SELECT OrderID FROM Orders WHERE OrderID = 654321));

INSERT INTO TasteComp
VALUES ((SELECT FruitName FROM Fruits WHERE FruitName = 'Apple'), (SELECT TasteName FROM Tastes WHERE TasteName = 'Juicy'));

INSERT INTO VitaminComp
VALUES ((SELECT FruitName FROM Fruits WHERE FruitName = 'Apple'), (SELECT VitaminName FROM Vitamins WHERE VitaminName = 'Vitamin C'));
