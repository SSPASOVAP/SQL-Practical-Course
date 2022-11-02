---------------------------------- Several Select Statements for Testing

-- Select All customers:
SELECT 
    *
FROM
    Customers;


-- Select All Employees:
SELECT 
    *
FROM
    Employees;


-- Selecy all details from employees about employee with ID = 5:
SELECT
    *
FROM
    employees
WHERE 
    employee_id = 5;


-- Find all employees that have 'h' in their names?:
SELECT 
    first_name || ' ' || last_name employee
,   email
FROM 
    employees
WHERE 
    LOWER(first_name || ' ' || last_name) LIKE '%h%';


-- Find all customers that have their name ends with 'a' or 'e' infront Ltd.:
SELECT
    customer_name
FROM
    customers
WHERE
    REGEXP_LIKE(customer_name, '^.*\w(a|e)\sLtd.$');


-- Find all sold products, their unit price and quantity. 
-- What is the price discount$ and what is the final price?:
SELECT
    t1.order_id
,   t3.product_name
,   t2.unit_price
,   t2.quantity
,   t2.discount
,   t2.unit_price * t2.quantity Total
,   t2.unit_price *  t2.quantity * t2.discount Discount$
,   t2.unit_price * t2.quantity - t2.unit_price *  t2.quantity * t2.discount Grand_Total
FROM
    orders t1
        INNER JOIN
    order_details t2
        ON t2.order_id = t1.order_id
        INNER JOIN
    products t3
        ON t2.product_id = t3.product_id;


-- Find the total number of orders, number of sold items, total quantity and cost of all sold products:
SELECT 
    SUM(t2.unit_price * t2.quantity) Sum_Total
,   SUM(t2.quantity) Total_Qty
,   COUNT(DISTINCT t1.order_id) N_Orders
,   COUNT(*) N_Items
FROM
    orders t1
        INNER JOIN
    order_details t2
        ON t2.order_id = t1.order_id
        INNER JOIN
    products t3
        ON t2.product_id = t3.product_id;


-- Find the total amount per order:
SELECT
    t1.order_id
,   SUM(t2.unit_price * t2.quantity) Total
FROM
    orders t1
        INNER JOIN
    order_details t2
        ON t2.order_id = t1.order_id
        INNER JOIN
    products t3
        ON t2.product_id = t3.product_id
GROUP BY
    t1.order_id;


-- Find how many orders and items each of the customers has bought, and what is the total cost of their orders?:
SELECT
    t3.customer_name
,   SUM(t2.unit_price * t2.quantity) Total
,   COUNT(*) N_items
,   COUNT(DISTINCT t2.order_id) N_orders
FROM
    orders t1
        INNER JOIN
    order_details t2
        ON t2.order_id = t1.order_id
        INNER JOIN
    customers t3
        ON t1.customer_id = t3.customer_id
GROUP BY
    t3.customer_name;

-- Find the total sales per sub category, do not show sub categories where no sales from:
SELECT
    t4.sub_category_name
,   SUM(t2.unit_price * t2.quantity) Total
FROM
    orders t1
        INNER JOIN
    order_details t2
        ON t2.order_id = t1.order_id
        INNER JOIN
    products t3
        ON t2.product_id = t3.product_id
        INNER JOIN
    sub_categories t4
        ON t3.sub_category_id = t4.sub_category_id
GROUP BY
    t4.sub_category_name;


--Find the total sales per sub category, show also those where are no sales from:
SELECT
    t4.sub_category_name
,   SUM(t2.unit_price * t2.quantity) Total
FROM
    sub_categories t4
    LEFT OUTER JOIN
    (orders t1
        INNER JOIN
    order_details t2
        ON t2.order_id = t1.order_id
        INNER JOIN
    products t3
        ON t2.product_id = t3.product_id)
        ON t3.sub_category_id = t4.sub_category_id
GROUP BY
    t4.sub_category_name
ORDER BY
    2 DESC NULLS FIRST;


-- Find how many days have past from order date and today's date:
SELECT
    t1.order_id
,   CONCAT(CONCAT(t2.first_name, ' '), t2.last_name) employee
,   t3.customer_name
,   t1.order_date
,   FLOOR(SYSDATE - t1.order_date) days_between
FROM
    orders t1
        INNER JOIN
    employees t2
        ON t1.employee_id = t2.employee_id
        INNER JOIN
    customers t3
        ON t1.customer_id = t3.customer_id;


-- Select all order IDs and order dates. 
-- Represent the result along with month name like: dd-Mon-yyyy, month week, year week and day name:
SELECT
    order_id
,   order_date
,   TO_CHAR(order_date, 'dd-Mon-yyyy', 'NLS_DATE_LANGUAGE = English') Month_Name
,   TO_CHAR(order_date, 'w') month_week
,   TO_CHAR(order_date, 'ww') year_week
,   TO_CHAR(order_date, 'Day', 'NLS_DATE_LANGUAGE = English') day_of_week
FROM
    orders
ORDER BY
    order_date;


-- Select all order ids from order_details. Bring out for each row: product name, sub-category name, category name, 
-- unit price, quantity, discount, full employee name (add also their phones in parentheses next to the name), store name and city:
SELECT 
    t1.order_id
,   t3.product_name
,   t4.sub_category_name
,   t5.category_name
,   t2.unit_price
,   t2.quantity
,   t2.discount
,   t6.first_name || ' ' || t6.last_name || ' (' || t6.phone || ')' Employee
,   t7.store_name
,   t8.city_name
FROM
    orders t1
        INNER JOIN
    order_details t2
        ON t2.order_id = t1.order_id
        INNER JOIN
    products t3
        ON t2.product_id = t3.product_id
        INNER JOIN
    sub_categories t4
        ON t3.sub_category_id = t4.sub_category_id
        INNER JOIN
    categories t5
        ON t4.category_id = t5.category_id
        INNER JOIN 
    employees t6
        ON t1.employee_id = t6.employee_id
        INNER JOIN
    stores t7
        ON t6.store_id = t7.store_id
        INNER JOIN 
    cities t8
        ON t7.city_id = t8.city_id;


-- Find all employees, whose sales >= to the city AVG (all sales from all stores within one city):
WITH
     VT
        AS(SELECT 
                t1.employee_id
            ,   t1.first_name || ' ' || t1.last_name employee
            ,   t5.city_name
            ,   SUM(t3.unit_price * t3.quantity) Total
            FROM 
                employees t1
                    INNER JOIN
                orders t2
                    ON t2.employee_id = t1.employee_id
                    INNER JOIN
                order_details t3
                    ON t3.order_id = t2.order_id
                    INNER JOIN
                stores t4
                    ON t1.store_id = t4.store_id
                    INNER JOIN
                cities t5
                    ON t4.city_id = t5.city_id
            GROUP BY
                t1.employee_id
            ,   t1.first_name || ' ' || t1.last_name
            ,   t5.city_name)
        , city_view
                AS(SELECT 
                        vt.city_name
                    ,   AVG(vt.Total) city_avg
                    FROM
                        VT
                    GROUP BY
                        vt.city_name)
SELECT 
    vt.city_name
,   vt.employee
,   vt.total
FROM
    VT
        INNER JOIN
    city_view cv
        ON vt.city_name = cv.city_name
WHERE 
    vt.total >= cv.city_avg;


-- Bring out all employees with their sales per category, 
-- calculate the horizontal and vertical total, making the result looks like a pivot table:
WITH 
    employee_view
        AS(SELECT
            t1.first_name || ' ' || last_name employee
        ,   t6.category_name
        ,   SUM(t3.unit_price * t3.quantity) Total
        FROM
            employees t1
                INNER JOIN
            orders t2
                ON t2.employee_id = t1.employee_id
                INNER JOIN
            order_details t3
                ON t3.order_id = t2.order_id
                INNER JOIN 
            products t4
                ON t3.product_id = t4.product_id
                INNER JOIN
            sub_categories t5
                ON t4.sub_category_id = t5.sub_category_id
                INNER JOIN
            categories t6
                ON t5.category_id = t6.category_id
        GROUP BY
            t1.first_name || ' ' || last_name
        ,   t6.category_name)
    SELECT
        ev.employee
    ,   SUM(CASE WHEN ev.category_name = 'Keyboard' THEN ev.total ELSE 0 END) Keyboard
    ,   SUM(CASE WHEN ev.category_name = 'Stringed' THEN ev.total ELSE 0 END) Stringed
    ,   SUM(CASE WHEN ev.category_name = 'Percussion' THEN ev.total ELSE 0 END) Percussion
    ,   SUM(ev.total) Grand_Total
    FROM
        employee_view ev
    GROUP BY
        ev.employee
UNION
    SELECT
        NULL
    ,   SUM(CASE WHEN ev.category_name = 'Keyboard' THEN ev.total ELSE 0 END)
    ,   SUM(CASE WHEN ev.category_name = 'Stringed' THEN ev.total ELSE 0 END)
    ,   SUM(CASE WHEN ev.category_name = 'Percussion' THEN ev.total ELSE 0 END)
    ,   SUM(ev.total)
    FROM
        employee_view ev
    GROUP BY
        NULL;

