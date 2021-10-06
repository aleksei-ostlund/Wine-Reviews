-- best value wine by country --

SELECT country,round(AVG(price),2) AS avg_price, AVG(points) AS avg_rating, round(AVG(points)/AVG(price),2) AS points_to_price
FROM winemag_data AS w
GROUP BY country
HAVING COUNT(*) >=5
ORDER BY points_to_price DESC

-- best value USA wines by province

SELECT min(points), COUNT(*),province,round(AVG(price),2) AS avg_price, AVG(points) AS avg_rating, round(AVG(points)/AVG(price),2) AS points_to_price
FROM winemag_data AS w
WHERE country = 'US'
GROUP BY province
HAVING count(*) >=5
ORDER BY points_to_price DESC

-- best value wines by country/region --

SELECT AVG(points), country, province, round(avg(price),2) AS avg_price, COUNT(*), round(AVG(points)/AVG(price),2) AS points_to_price
FROM winemag_data
GROUP BY country, province
HAVING COUNT(*) >=2
ORDER BY points_to_price DESC 

-- best value wines by variety --

SELECT AVG(points), variety, round(avg(price),2) AS avg_price, COUNT(*), round(AVG(points)/AVG(price),2) AS points_to_price
FROM winemag_data
GROUP BY variety
HAVING COUNT(*) >=5
ORDER BY points_to_price DESC
LIMIT 10

-- best value single wines --

SELECT title, variety, country, province, winery, price, points, ROUND((points)/(price),2) AS points_to_price
FROM winemag_data
WHERE price IS NOT NULL
ORDER by points_to_price DESC
LIMIT 10

-- best value sauvignon blanc --

SELECT title, variety, country, province, winery, price, points, ROUND((points)/(price),2) AS points_to_price
FROM winemag_data
WHERE price IS NOT NULL AND variety LIKE '%Sauvignon BLanc%'
ORDER by points_to_price DESC
LIMIT 10

-- most expensive wines --

SELECT title, variety, country, province, winery, price, points, ROUND((points)/(price),2) AS points_to_price
FROM winemag_data
WHERE price IS NOT NULL
ORDER by price desc
LIMIT 10

-- best rated italian wine with price <= 15 --
SELECT title, variety, country, province, winery, price, points, ROUND((points)/(price),2) AS points_to_price
FROM winemag_data
WHERE country LIKE '%Italy%' AND price <= 15
ORDER BY points_to_price desc