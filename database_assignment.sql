-- 1.creating a database
CREATE DATABASE database_assignment;

//-- deleting a database
DROP DATABASE database_assignment;


-- before working on a database, you need to select it
USE database_assignment;


-- 2.creating a table named customers
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    phone_number VARCHAR(15),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    points INT
);

// SELECT * FROM customers;
// TRUNCATE TABLE customers;
// -- inserting data/record into a table
// ALTER TABLE customers AUTO_INCREMENT = 1001


-- 3.Insert the following customer data:
INSERT INTO customers(first_name, last_name, date_of_birth, phone_number, address, city, state, points) VALUES
('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', '2273'),
('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', '947'),
('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', '2967'),
('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', '457'),
('Clemmie', 'Betchley', '1973-11-07', NULL, '5 Spohn Circle', 'Arlington', 'TX', '3675')
;


-- 4.show only 2 members whose points are more than 1000(Using limit)
SELECT * 
FROM customers
WHERE points > 1000
LIMIT 2;



-- 5.Find the customers whose age is from 1980 to 1990 or points less than 1000.
SELECT * 
FROM customers 
WHERE points < 1000 
OR date_of_birth BETWEEN '1980-01-01' AND '1990-12-31';



-- 6.Order the customers by points in ascending order.
SELECT * 
FROM customers 
ORDER BY points ASC;


-- 7.Find the customer whose name contains 'burgh' using a Regular Expression.
SELECT * 
FROM customers 
WHERE first_name 
REGEXP 'burgh'
OR last_name 
REGEXP 'burgh';


-- 8.Find a customer who does not have a phone number.
SELECT *
FROM customers
WHERE phone_number IS NULL;


-- 9.Change the 'Date of Birth' column name to 'dob'.
ALTER TABLE customers 
CHANGE COLUMN date_of_birth dob DATE;


-- 10.Find the max point holder customer name.
SELECT first_name, last_name 
FROM customers 
ORDER BY points DESC LIMIT 1;


-- 11.Execute a query for the following scenario.
-- If customers have points less than 1000, they are bronze members.
-- If customers have points of more than 1000 and less than 2000, they are silver members.
-- If customers have points of more than 2000 and less than 3000, they are gold members.
-- If customers have points of more than 3000, they are platinum members.
SELECT *,
       CASE
           WHEN points < 1000 THEN 'bronze'
           WHEN points >= 1000 AND points < 2000 THEN 'silver'
           WHEN points >= 2000 AND points < 3000 THEN 'gold'
           WHEN points >= 3000 THEN 'platinum'
       END AS membership_status
FROM customers;


