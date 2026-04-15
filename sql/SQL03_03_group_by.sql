-- 3-3. GROUP BY

-- #1 개념 : 같은 값끼리 묶어서 집계하는 것 
SELECT Country, COUNT(*)  -- 행의 갯수를 세는 행수
FROM Customers
GROUP BY Country;

-- #2 예제 
-- 문제1 : Customers 테이블에서 City별 고객 수를 구하세요.
SELECT City, Count(*)
FROM Customers
GROUP BY City;
-- 문제2 : Customers 테이블에서 Country별 고객 수를 구하고, 많은 순으로 정렬하세요.
SELECT Country, COUNT(*)
FROM Customers
GROUP BY Country
ORDER BY COUNT(*) DESC;
