
-- Question1
-- first step is to create a new table to store the normalized data for 1NF
CREATE TABLE productItems (
    productItem_id INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    fullName VARCHAR(100),
    Product VARCHAR(100)
);

-- second step is to Insert data into the newly created table
INSERT INTO productItems (OrderID, fullName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

--retriving the product output
SELECT * FROM productItems;

-- Question2
-- first step is to create a new table to store the normalized data for 2NF to remove partial dependency
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

--Second step we create a new table for OrderProducts
CREATE TABLE ProductOrders (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into the OrderProducts table
INSERT INTO OrderProducts (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- geting te output
SELECT * FROM Orders;
SELECT * FROM ProductOrders;