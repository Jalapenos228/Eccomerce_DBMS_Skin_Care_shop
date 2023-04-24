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


| ENTITIES           |  ATTRIBUTES                                                                       | 
| ---------          |:-------------:                                                                    |
| Customers          |
| Address            |
| Customer_address   |
| Products           |
| Product_size       |
| Ingredients        |
| Skin_concern       |
| Brand              | 
| Product_entry      |
| Shopping_cart      |
| Payment_type       |
| Payment_method     |
| Shipping_method    |
| Order_status       |
| Shop_order         |


### 2.2.2 Entities and Relations

### 2.3 Relational Database Schema 
![RelationalDS](https://user-images.githubusercontent.com/75801288/234059830-f0a556af-66d7-41f3-84c1-14b29a29c91d.png)
For more clear view, click here[RelationalDS.pdf](https://github.com/Jalapenos228/Eccomerce_DBMS_Skin_Care_shop/files/11314343/RelationalDS.pdf)
![RelationalD](https://user-images.githubusercontent.com/75801288/234060862-090bfe55-0f1e-4257-af32-857cf6d1a82a.PNG)

## 3. Queries
This link explains hoq works queries: https://docs.google.com/presentation/d/1Qmq1dc4ak_ik1qpzPGQebt8uIjVVPYtCo5JRdMqq7xw/edit?usp=sharing


