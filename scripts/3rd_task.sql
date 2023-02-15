-- Konkrétně musí tento skript obsahovat alespoň
-- (1,2)dva dotazy využívající spojení dvou tabulek,
-- (3)jeden využívající spojení tří tabulek,
-- (4,5) dva dotazy s klauzulí GROUP BY a agregační funkcí,
-- (6) jeden dotaz obsahující predikát EXISTS
-- (7) a jeden dotaz s predikátem IN s vnořeným selectem (nikoliv IN s množinou konstantních dat)

-- 1) Table join User and its reviews
SELECT "User".name, r.description
FROM "User"
         JOIN review r on "User".id = r.user_id;

-- 2) Table join User and its orders
SELECT "User".name, o.total_price
FROM "User"
         JOIN "Order" o on "User".id = o.user_id;


-- 3) Table join User and products in its cart
SELECT "User".name, p.name
FROM "User"
         JOIN cartitem ON "User".id = cartitem.user_id
         JOIN product p on cartitem.product_id = p.id;

-- 4) Group by and aggregation with count of orders
SELECT "User".name, count(o.id)
FROM "User"
         JOIN "Order" o on "User".id = o.user_id
GROUP BY "User".name;

-- 5) Group by and aggregation with sum of prices
SELECT "User".name, sum(o.total_price)
FROM "User"
         JOIN "Order" o on "User".id = o.user_id
GROUP BY "User".name;

-- 6) Check if user has any orders
SELECT "User".name
FROM "User"
WHERE EXISTS (SELECT *
              FROM "Order" o
              WHERE "User".id = o.user_id);

-- 7) Check if user has any orders with IN
SELECT "User".name
FROM "User"
WHERE "User".id IN (SELECT o.user_id
                    FROM "Order" o);
