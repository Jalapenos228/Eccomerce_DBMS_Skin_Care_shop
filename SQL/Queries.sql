
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
