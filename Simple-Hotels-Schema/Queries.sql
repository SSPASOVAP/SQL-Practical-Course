-- Select all countries:
SELECT 
    *
FROM
    Countries

-- How many countries have in DB:
SELECT 
    COUNT(*) n_countries
FROM
    Countries

-- Select all cities:
SELECT 
    *
FROM
    Cities

-- How many cities have in DB:
SELECT 
    COUNT(*)
FROM
    Cities

-- Which city from which country is:
SELECT 
    t1.country_name
,   t2.city_name
FROM
    Countries t1
        INNER JOIN
    Cities t2
        ON t1.country_id = t2.country_id

-- How many cities have per country:
SELECT 
    t1.country_name
,   COUNT(*) n_cities
FROM
    Countries t1
        INNER JOIN
    Cities t2
        ON t1.country_id = t2.country_id
GROUP BY 
     t1.country_name

-- Select all 5-stars hotels:
SELECT
    hotel_name
FROM
    hotels
WHERE 
    stars = 5

-- Count of reservations booked per hotel:
SELECT 
    t1.hotel_name
,   COUNT(*) n_reserv
FROM
    hotels t1
        INNER JOIN
    reservation_details t2
        ON t2.hotel_id = t1.hotel_id
GROUP BY
     t1.hotel_name


-- Total price for a reservation:
SELECT 
    vt.reservation_id
,   vt.full_name
,   SUM(VT.Sum_Total) Grand_Total
FROM(SELECT 
    t5.reservation_id
,   t6.first_name || t6.last_name full_name
-- ,   t4.one_night_price
-- ,   t5.arrival_date
-- ,   t5.departure_date
-- ,   t5.departure_date - t5.arrival_date n_days
-- ,   t4.numb_rooms
,   (t5.departure_date - t5.arrival_date) * t4.one_night_price * t4.numb_rooms  Sum_Total
FROM
    Countries t1
        INNER JOIN
    Cities t2
        ON t1.country_id = t2.country_id
        INNER JOIN
    Hotels t3
        ON t3.city_id = t2.city_id
        INNER JOIN
    reservation_details t4
        ON t4.hotel_id = t3.hotel_id
        INNER JOIN
    reservations t5
        ON t5.reservation_id = t4.reservation_id
        INNER JOIN
        User_Accounts t6
            ON t6.user_id = t5.user_id) vt
GROUP BY
    vt.reservation_id
,   vt.full_name

-- Total reservations amount per hotel
SELECT 
    vt.hotel_name
,   SUM(VT.Total) Grand_Total
FROM(SELECT 
    t3.hotel_name
-- ,   t4.one_night_price
-- ,   t5.arrival_date
-- ,   t5.departure_date
-- ,   t5.departure_date - t5.arrival_date n_days
-- ,   t4.numb_rooms
,   (t5.departure_date - t5.arrival_date) * t4.one_night_price * t4.numb_rooms  Total
FROM
    Countries t1
        INNER JOIN
    Cities t2
        ON t1.country_id = t2.country_id
        INNER JOIN
    Hotels t3
        ON t3.city_id = t2.city_id
        INNER JOIN
    reservation_details t4
        ON t4.hotel_id = t3.hotel_id
        INNER JOIN
    reservations t5
        ON t5.reservation_id = t4.reservation_id) vt
GROUP BY
     vt.hotel_name
    

-- All room types along with their bed types and numbers:
SELECT
    t2.room_type
,   t3.bed_type
,   t1.numb_beds
FROM
    room_beds t1
        INNER JOIN
    room_types t2
        ON t1.room_id = t2.room_id
        INNER JOIN
    bed_types t3
        ON t3.bed_id = t1.bed_id

-- All room types along with their facilities:
SELECT
    t2.room_type
,   t3.facility_type
FROM
    rooms_facilities t1
        INNER JOIN
    room_types t2
        ON t1.room_id = t2.room_id
        INNER JOIN
    facilities t3
        ON t3.facility_id = t1.facility_id
ORDER BY
    1

-- N_facilities per room:
SELECT
    t2.room_type
,   COUNT(*) n_facilities
FROM
    rooms_facilities t1
        INNER JOIN
    room_types t2
        ON t1.room_id = t2.room_id
        INNER JOIN
    facilities t3
        ON t3.facility_id = t1.facility_id
GROUP BY
     t2.room_type

-- Details about all reservations made for the 5-strars hotels:
SELECT
    t1.reservation_id
,   t3.book_date
,   t4.first_name || ' ' || t4.last_name  Full_Name
,   t4.email
,   t2.hotel_name
--,   t2.stars
FROM
    reservation_details t1
        INNER JOIN
    hotels t2
        ON t1.hotel_id = t2.hotel_id
        INNER JOIN
    reservations t3
        ON t3.reservation_id = t1.reservation_id
        INNER JOIN
    user_accounts t4
        ON t4.user_id = t3.user_id
WHERE 
    t2.stars = 5
--
