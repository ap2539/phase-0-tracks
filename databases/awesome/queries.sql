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

SELECT  i.item, ol.qty, sum(i.price * ol.qty) "Order_line_total"
FROM OrderLines ol, items i
WHERE ol.item_id = i.id
and ol.order_id = 1
group by ol.order_line_id;

SELECT sum(i.price * ol.qty) "order_total"
FROM OrderLines ol, items i
WHERE ol.item_id = i.id
and ol.order_id = 1
group by ol.order_id;
