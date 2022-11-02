---------------------- Several Select Statemts for Testing 

-- Selcet all models:
SELECT
    *
FROM
    models;


-- Select all models and represent touch screen column as 'Yes' and 'No':
SELECT
    model_name
,   CASE WHEN touch_screen = 0 THEN 'No' ELSE 'Yes' END touch_screen
FROM
    models;


-- Bring out all laptop IDs with their brand, model and color:
SELECT
    t3.laptop_id
,   t1.brand_name
,   t2.model_name
,   t4.color
FROM
    Brands t1
        INNER JOIN
    Models t2
        ON t2.brand_id = t1.brand_id
        INNER JOIN 
    Laptops t3
        ON t3.model_id = t2.model_id
        INNER JOIN
    Colors t4
        ON t2.color_id= t4.color_id;


-- Bring out all laptop IDs with their brand, model and all characteristics, where price is above 500$:
SELECT
    t3.laptop_id
,   t1.brand_name
,   t2.model_name
,   t3.screen_size_inches
,   t5.resolution_type
,   t3.ram_gb
,   t4.processor_model
,   t4.numb_cores
,   t3.battery_duration_h
,   t3.price
FROM
    Brands t1
        INNER JOIN
    Models t2
        ON t2.brand_id = t1.brand_id
        INNER JOIN
    Laptops t3
        ON t3.model_id = t2.model_id
        INNER JOIN
    Processor_type t4
        ON t3.processor_id = t4.processor_id
        INNER JOIN
    Resolution t5
        ON t3.resolution_id = t5.resolution_id
WHERE 
    t3.price > 500;


-- Bring out all laptop IDs with their brand, model, standard price, discount and final price, where standard price is above 1000$:
SELECT
    t3.laptop_id
,   t1.brand_name
,   t2.model_name
,   t3.price
,   t3.discount
,   ROUND(price - (price * t3.discount), 2) Final_Price
FROM
    Brands t1
        INNER JOIN
    Models t2
        ON t2.brand_id = t1.brand_id
        INNER JOIN
    Laptops t3
        ON t3.model_id = t2.model_id
WHERE 
    t3.price > 1000
ORDER BY
    5 DESC NULLS FIRST;


-- Bring out all laptop models that have accessories included:
SELECT
    t1.brand_name
,   t2.model_name
,   t4.accessory_type
FROM
    Brands t1
        INNER JOIN
    Models t2
        ON t2.brand_id = t1.brand_id
        INNER JOIN
    Laptop_Accessories t3
        ON t3.model_id = t2.model_id
        INNER JOIN
    Accessories t4
        ON t3.accessory_id = t4.accessory_id;


-- Find all laptop models: those that have accessories and those which do not have too. 
-- Sort the result in ascending where Nulls are on the top:
SELECT
    t2.model_name
,   t4.accessory_type
FROM
    Models t2
        LEFT OUTER JOIN
    (Laptop_Accessories t3
        INNER JOIN
    Accessories t4
        ON t3.accessory_id = t4.accessory_id)
        ON t3.model_id = t2.model_id
ORDER BY
    2 NULLS FIRST;


-- Find from each color how many laptops we have and sort the result by number of models in ascending:
SELECT
    t1.color
,   COUNT(model_id) n_models
FROM
    colors t1
       LEFT OUTER JOIN
    models t2
        ON t2.color_id = t1.color_id
GROUP BY 
    color
ORDER BY
    2;


-- Find all brands with their average standard cost. Display them only if the average
-- standard cost is a value between 1000 and 2000
SELECT
    t1.brand_name
,   AVG(t3.price) Avg_Brand_Price
FROM
    Brands t1
        INNER JOIN
    Models t2
        ON t2.brand_id = t1.brand_id
        INNER JOIN
    Laptops t3
        ON t3.model_id = t2.model_id
GROUP BY
    t1.brand_name
HAVING AVG(t3.price) > 2000;


-- Select all laptop models with their brands and prices. Bring out a global price Rank list in descending:
SELECT
    t1.brand_name
,   t2.model_name
,   t3.price
,   RANK()
    OVER(ORDER BY t3.price DESC) Brand_Rank
FROM
    Brands t1
        INNER JOIN
    Models t2
        ON t2.brand_id = t1.brand_id
        INNER JOIN
    Laptops t3
        ON t3.model_id = t2.model_id


-- Select all laptop models with their brands and prices. Bring out all prices at Rank list in descending per category:
SELECT
    t1.brand_name
,   t2.model_name
,   t3.price
,   RANK()
    OVER(PARTITION BY t1.brand_name
    ORDER BY t3.price DESC) Brand_Rank
FROM
    Brands t1
        INNER JOIN
    Models t2
        ON t2.brand_id = t1.brand_id
        INNER JOIN
    Laptops t3
        ON t3.model_id = t2.model_id;