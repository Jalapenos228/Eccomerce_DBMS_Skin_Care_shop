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
