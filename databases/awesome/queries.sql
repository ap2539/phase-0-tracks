CREATE TABLE Items
("id" INTEGER PRIMARY KEY,
"item" VARCHAR(255),
"price" DECIMAL);

CREATE TABLE Customers
("id" INTEGER PRIMARY KEY,
"cust_first_name" VARCHAR(255),
"cust_last_name" VARCHAR(255),
"cust_username" VARCHAR(255));

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

INSERT INTO Customers VALUES
(1, "Alex", "Perez","ap2539"),
(null, "Balze", "Cleveland","b456"),
(null, "Audrey", "Anita","aa789"),
(null, "Jenny", "Lane","jl424");

INSERT INTO Orders VALUES
(1, 1),
(2, 1);

INSERT INTO OrderLines VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 2, 6, 3);

SELECT o.id, c.cust_first_name, c.cust_last_name, sum(i.price * ol.qty)
FROM Customers c, Orders o, OrderLines ol, items i
WHERE c.id = o.cust_id
AND o.id = ol.order_id
AND ol.item_id = i.id
GROUP BY ol.order_id;

