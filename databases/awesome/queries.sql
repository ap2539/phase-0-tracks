CREATE TABLE Items
("id" INTEGER PRIMARY KEY,
"item" VARCHAR(255),
"price" DECIMAL);

CREATE TABLE Customers
("id" INTEGER PRIMARY KEY,
"cust_first_name" VARCHAR(255),
"cust_last_name" VARCHAR(255),
"cust_ship_address" VARCHAR(255),
"cust_ship_city" VARCHAR(255));

CREATE TABLE Orders
("id" INTEGER PRIMARY KEY,
"cust_id" INTEGER,
FOREIGN KEY (cust_id) REFERENCES Customers(id));

CREATE TABLE OrderLines
("order_line_id" INTEGER PRIMARY KEY,
"order_id" INTEGER,
"item_id" INTEGER,
"qty" INTEGER,
FOREIGN KEY (order_id) REFERENCES Orders(id),
FOREIGN KEY (item_id) REFERENCES Items(id));



INSERT INTO Items VALUES
(1, "Laptop", 789.99),
(2, "Mouse", 32.99),
(3, "Keyboard", 35.00),
(4, "Mouse Pad", 5.00),
(5, "Monitor", 149.99),
(6, "Speaker", 25.99);