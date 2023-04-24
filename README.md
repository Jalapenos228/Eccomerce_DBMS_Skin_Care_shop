# Eccomerce_DBMS_Skin_Care_shop

## Contents
- Project Description
- Basic structure
  - Entity Relation (ER) diagram and constraints
  - Relational database schema
- Implementation
  - Creating tables
- Normalization forms
- PL/SQL queries
  - Function
  - Trigger 
  - Procedures 

## 1. Project Description  

Team: 
This project was made by Manap Zhassulan. 
 
E-Commerce Database Management System is a system that is designed to store, process, retrieve and analyze information concerned with the administrative and management of sales activity done by a customer online sitting at home. This project includes the development of a database management system for an online skin care store. Main goal of system was to create a relational database solution that could effectively manage various e-commerce entities.<br>
The system will also include various procedures, functions, and triggers to enhance the functionality of the system. This document provides a comprehensive overview of our project, which includes an introduction, an Object Relationship Diagram (ERD), a relational schema, a detailed explanation of structure normal forms, and an overview of the SQL implementation. 

## 2. Basic Structure 

### 2.1 Entity Relation (ER) diagram
![ERD](https://user-images.githubusercontent.com/75801288/234105464-3f31d699-f4a9-4cf1-ac5c-2bcf9a37603b.png)
For more clear view, click here [Erd.pdf](https://github.com/Jalapenos228/Eccomerce_DBMS_Skin_Care_shop/files/11314333/Erd.pdf)
### 2.2.1 Entities and their Attributes
| ENTITIES           |  ATTRIBUTES                                                                       | 
| ---------          |:-------------:                                                                    |
| Customers          | c_id<br>F_name<br>L_name<br>Email<br>Phone |
| Address            | Address_id<br>Unit_num<br>Street_num<br>Address_name<br>City<br>Region<br>Postal_code |
| Customer_address   | Customer_id<br>Address_id<br>Is_default |
| Products           | Product_id<br>Product_name<br>Description<br>Category_id |
| Product_size       | Size_id<br>Product_Size |
| Ingredients        | Ingredients_id<br>Name|
| Skin_concern       | Skin_concern_id<br>Skin_concern_Type|
| Brand              | Brand_id<br>Name|
| Product_entry      | Product_entry_id<br>Product_id<br>Size_id<br>Ingredients_id<br>Skin_concern_id<br>Brand_id<br>Quantity_stock|
| Shopping_cart      | Cart_id<br>Product_entry_id<br>Quantity<br>Customer_id|
| Payment_type       | Payment_type_id<br>Payment_name|
| Payment_method     | Payment_id<br>Customer_id<br>Payment_type_id<br>Provider<br>Account_number<br>Expire_date<br>Is_default|
| Shipping_method    | Shipping_id<br>Name<br>price|
| Order_status       | Order_status_id<br>Status|
| Shop_order         | Shop_order_id<br>Customer_id<br>Order_date<br>Payment_method_id<br>Shipping_method_id<br>Shipping_address_id<br>Order_total<br>Order_status|

### 2.2.2 Entities and Relations

| ENTITITY          | ENTITITY         |   CARDINALITY    |                                                         
| ---------          |:-------------:  |                    |
| Customers          |Customer_address  |one-to-many|
|  Customers         |   Shopping_cart|one-to-many|
| Customers          |  Shop_order      |    one-to-many   |  
| Address            |  Customer_address  |    one-to-many |        
|  Address           |Shop_order|one-to-many|
|Customer_address    |Customers|many-to-one|
| Customer_address   |Address|many-to-one|
| Products           |Category|many-to-one|
| Products           |Product_entry|one-to-many|
| Product_size       |Product_entry|one-to-many|
| Ingredients        |Product_entry|one-to-many|
| Skin_concern       |Product_entry|one-to-many|
| Brand              | Product_entry|one-to-many|
| Product_entry      |Products|many-to-one|
| Product_entry      |Shopping_cart|one-to-many|
| Shopping_cart      |Product_entry|many-to-one|
| Shopping_cart      |Customers|many-to-one|
| Payment_type       |Payment_method|one-to-many|
| Payment_method     |Customers|many-to-one|
| Payment_method     |Payment_type|many-to-one|
| Payment_method     |Shop_order|one-to-many|
| Shipping_method    |Shop_order|one-to-many|
| Order_status       |Shop_order|one-to-many|



### 2.3 Relational Database Schema 
![RelationalDS](https://user-images.githubusercontent.com/75801288/234059830-f0a556af-66d7-41f3-84c1-14b29a29c91d.png)
For more clear view, click here[RelationalDS.pdf](https://github.com/Jalapenos228/Eccomerce_DBMS_Skin_Care_shop/files/11314343/RelationalDS.pdf)
![RelationalD](https://user-images.githubusercontent.com/75801288/234060862-090bfe55-0f1e-4257-af32-857cf6d1a82a.PNG)

## 3.Implementation
### 3.1 Creating tables
Complete script is available in tables.sql
```sql
CREATE TABLE Customers(
    c_id numeric(10) not null,
    F_name varchar2(20),
    L_name varchar2(20),
    Email varchar2(30),
    Phone char(11),
    CONSTRAINT customers_pk PRIMARY KEY (c_id)
);

CREATE TABLE Address(
    Address_id numeric(10) not null,
    Unit_num NUMBER not null,
    Street_num NUMBER not null,
    Address_name varchar2(30) not null,
    City varchar2(20) not null,
    Region varchar2(30) not null,
    Postal_code char(6) not null,
    CONSTRAINT address_pk PRIMARY KEY (Address_id)
);
CREATE TABLE Customer_address(
    Customer_id numeric(10) not null,
    Address_id numeric(10) not null,
    Is_default char(1) not null,
    CONSTRAINT fk_customer_address FOREIGN KEY (Customer_id) REFERENCES Customers(c_id), 
    CONSTRAINT fk_customer_address_2 FOREIGN KEY (Address_id) REFERENCES Address(Address_id)
);

CREATE TABLE Product_size(
    Size_id numeric(10) not null,
    Product_Size varchar2(6) not null,
    CONSTRAINT Size_pk PRIMARY KEY (Size_id)
);

CREATE TABLE Ingredients(
    Ingredients_id numeric(10) not null,
    Name varchar2(20),
    CONSTRAINT Ingredients_pk PRIMARY KEY (Ingredients_id)
);

CREATE TABLE Skin_concern(
    Skin_concern_id numeric(10) not null,
    Skin_concern_Type varchar2(30) not null,
    CONSTRAINT Skin_concern_pk PRIMARY KEY (Skin_concern_id)
);

CREATE TABLE Brand(
    Brand_id numeric(10) not null,
    Name varchar2(30) not null,
    CONSTRAINT Brand_pk PRIMARY KEY (Brand_id)
);

CREATE TABLE Category(
    Category_id numeric(10) not null,
    Name varchar2(25) not null,
    CONSTRAINT Category_pk PRIMARY KEY (Category_id)
);

CREATE TABLE Products(
    Product_id numeric(10) not null,
    Product_name varchar2(35) not null,
    Description varchar2(100),
    Category_id numeric(10) not null,
    CONSTRAINT Products_pk PRIMARY KEY (Product_id),
    CONSTRAINT fk_Products FOREIGN KEY (Category_id) REFERENCES Category (Category_id)
);

CREATE TABLE Product_entry (
    Product_entry_id numeric(10) not null,
    Product_id numeric(10) not null,
    Size_id numeric(10) not null,
    Ingredients_id numeric(10) not null,
    Skin_concern_id numeric(10) not null,
    Brand_id numeric(10) not null,
    Quantity_stock number not null, 
    CONSTRAINT Product_entry_pk PRIMARY KEY (Product_entry_id),
    CONSTRAINT fk_Product_entry FOREIGN KEY (Size_id) REFERENCES Product_size (Size_id),
    CONSTRAINT fk_Product_entry_2 FOREIGN KEY (Skin_concern_id) REFERENCES Skin_concern (Skin_concern_id),
    CONSTRAINT fk_Product_entry_3 FOREIGN KEY (Ingredients_id) REFERENCES Ingredients (Ingredients_id),
    CONSTRAINT fk_Product_entry_4 FOREIGN KEY (Brand_id) REFERENCES Brand (Brand_id),
    CONSTRAINT fk_Product_entry_5 FOREIGN KEY (Product_id) REFERENCES Products (Product_id)
);

CREATE TABLE Shopping_cart (
    Cart_id numeric(10) not null,
    Product_entry_id numeric(10) not null,
    Quantity number not null, 
    Customer_id numeric(10) not null,
    CONSTRAINT Shopping_cart_pk PRIMARY KEY (Cart_id),
    CONSTRAINT fk_Shopping_cart FOREIGN KEY (Product_entry_id) REFERENCES Product_entry (Product_entry_id),
    CONSTRAINT fk_Shopping_cart_2 FOREIGN KEY (Customer_id) REFERENCES Customers (c_id)
);

CREATE TABLE Payment_type (
    Payment_type_id numeric(10) not null,
    Payment_name varchar2(20) not null,
    CONSTRAINT Payment_type_pk PRIMARY KEY (Payment_type_id)
);

CREATE TABLE Payment_method (
    Payment_id numeric(10) not null,
    Customer_id numeric(10) not null,
    Payment_type_id numeric(10) not null,
    Provider varchar(20) not null,
    Account_number varchar2(25) not null,
    Expire_date date not null,
    Is_default char(1) not null,
    CONSTRAINT Payment_method_pk PRIMARY KEY (Payment_id),
    CONSTRAINT fk_Payment_method FOREIGN KEY (Customer_id) REFERENCES Customers (c_id),
    CONSTRAINT fk_Payment_method_2 FOREIGN KEY (Payment_type_id) REFERENCES Payment_type (Payment_type_id)
);

CREATE TABLE Shipping_method(
    Shipping_id numeric(10) not null,
    Name varchar2(20) not null,
    price number not null,
    CONSTRAINT Shipping_method_pk PRIMARY KEY (Shipping_id)
);

CREATE TABLE Order_status(
    Order_status_id numeric(10) not null,
    Status varchar(20) not null,
    CONSTRAINT Order_status_pk PRIMARY KEY (Order_status_id)
);

CREATE TABLE Shop_order(
    Shop_order_id numeric(10) not null,
    Customer_id numeric(10) not null,
    Order_date numeric(10) not null,
    Payment_method_id numeric(10) not null,
    Shipping_method_id numeric(10) not null,
    Shipping_address_id numeric(10) not null,
    Order_total number not null,
    Order_status numeric(10) not null,
    CONSTRAINT Shop_order_pk PRIMARY KEY (Shop_order_id),
    CONSTRAINT fk_Shop_order FOREIGN KEY (Customer_id) REFERENCES Customers (c_id),
    CONSTRAINT fk_Shop_order_2 FOREIGN KEY (Payment_method_id) REFERENCES Payment_method (Payment_id),
    CONSTRAINT fk_Shop_order_3 FOREIGN KEY (Shipping_method_id) REFERENCES Shipping_method (Shipping_id),
    CONSTRAINT fk_Shop_order_4 FOREIGN KEY (Shipping_address_id) REFERENCES Address (Address_id),
    CONSTRAINT fk_Shop_order_5 FOREIGN KEY (Order_status) REFERENCES Order_status (Order_status_id)
);

CREATE TABLE Product_order (
    Product_order_id numeric(10) not null,
    Product_entry_id numeric(10) not null,
    Shop_order_id numeric(10) not null,
    price number not null,
    Quantity number not null,
    CONSTRAINT Product_order_pk PRIMARY KEY (Product_order_id),
    CONSTRAINT fk_Product_order FOREIGN KEY (Product_entry_id) REFERENCES Product_entry (Product_entry_id),
    CONSTRAINT fk_Product_order_2 FOREIGN KEY (Shop_order_id) REFERENCES Shop_order (Shop_order_id)
);

CREATE TABLE Customer_review(
    Customer_review_id numeric(10) not null,
    Customer_id numeric(10) not null,
    Product_order_id numeric(10) not null,
    Rating_value char(1) not null,
    Customer_comment varchar2(300) not null,
    CONSTRAINT Customer_review_pk PRIMARY KEY (Customer_review_id),
    CONSTRAINT fk_Customer_review FOREIGN KEY (Product_order_id) REFERENCES Product_order (Product_order_id),
    CONSTRAINT fk_Customer_review_2 FOREIGN KEY (Customer_id) REFERENCES Customers (c_id)
)
```
## 4. Queries
Complete script is available in Queries.sql
```pl/sql
--1Query

CREATE OR REPLACE PROCEDURE get_avg_price_by_brand(out_result OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN out_result FOR
    SELECT b.Name, p.Product_name, AVG(pe.Quantity_stock) AS Average_Quantity
    FROM Brand b
    JOIN Product_entry pe ON b.Brand_id = pe.Brand_id
    JOIN Products p ON pe.Product_id = p.Product_id
    GROUP BY b.Name, p.Product_name;
END;

DECLARE
  product_name VARCHAR2(100);
  avg_quantity NUMBER;
  brand_name VARCHAR2(100);
  result_cursor SYS_REFCURSOR;
BEGIN
  get_avg_price_by_brand(result_cursor);
LOOP
    FETCH result_cursor INTO brand_name, product_name, avg_quantity;
    EXIT WHEN result_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Brand: ' || brand_name || ', Product: ' || product_name || ', Average Quantity: ' || avg_quantity);
  END LOOP;
  CLOSE result_cursor;
END;

-- 2query

CREATE OR REPLACE FUNCTION count_customers
RETURN NUMBER
IS
    num_customers NUMBER;
BEGIN
    SELECT COUNT(*) INTO num_customers
    FROM Customers;
    
    RETURN num_customers;
END;

SELECT count_customers() FROM dual;

-- 3query

CREATE OR REPLACE PROCEDURE update_customers (
    p_c_id IN Customers.c_id%TYPE,
    p_email IN Customers.Email%TYPE,
    p_phone IN Customers.Phone%TYPE
)
IS
    v_count NUMBER;
BEGIN
    UPDATE Customers SET
        Email = p_email,
        Phone = p_phone
    WHERE c_id = p_c_id;

    v_count := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE('Number of rows updated: ' || v_count);
END;

DECLARE
    v_c_id Customers.c_id%TYPE := 783;
    v_email Customers.Email%TYPE := 'newemail@example.com';
    v_phone Customers.Phone%TYPE := '78587872128';
BEGIN
    update_customers(p_c_id => v_c_id, p_email => v_email, p_phone => v_phone);
END;

-- 4query

DECLARE
  short_title EXCEPTION;
  title_length NUMBER;
BEGIN
  SELECT LENGTH(Product_name) INTO title_length FROM Products WHERE Product_id = 3; 
  IF (title_length < 5) THEN
    RAISE short_title;
  END IF;
EXCEPTION
  WHEN short_title THEN
    DBMS_OUTPUT.PUT_LINE('Error: Product title must be at least 5 characters long');
END;

-- 5query
CREATE OR REPLACE TRIGGER count_products
BEFORE INSERT ON Products
FOR EACH ROW
DECLARE
    product_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO product_count FROM Products;
    DBMS_OUTPUT.PUT_LINE('The current number of rows in Products table is: ' || product_count);
END;

```
This link explains hoq works queries: https://docs.google.com/presentation/d/1Qmq1dc4ak_ik1qpzPGQebt8uIjVVPYtCo5JRdMqq7xw/edit?usp=sharing


