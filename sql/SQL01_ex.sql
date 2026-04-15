-- # GPT가 만들어준 문제
-- 문제01 : Customers 테이블에서 고객 이름(CustomerName)과 국가(Country)를 조회하세요.
SELECT CustomerName, Country FROM Customers
-- 문제02 : Customers 테이블에서 도시(City)가 'London' 인 고객의 이름(CustomerName)과 도시(City)를 조회하세요.
SELECT CustomerName, City FROM Customers 
WHERE City ='London';
-- 문제03 : Customers 테이블에서 국가(Country)가 'Mexico' 인 고객의 이름(CustomerName)과 국가(Country)를 조회하세요.
SELECT CustomerName, Country FROM Customers 
WHERE Country ='Mexico';
-- 문제04 : Customers 테이블에서 고객 이름(CustomerName)과 도시(City)를 고객 이름 기준 오름차순(ASC)으로 조회하세요.
SELECT CustomerName, City FROM Customers
ORDER BY CustomerName ASC;
-- 문제05 : Customers 테이블에서 국가(Country)가 'Germany' 인 고객의 이름(CustomerName)과 국가(Country)를 고객 이름 기준 오름차순으로 조회하세요.
SELECT CustomerName, Country
FROM Customers 
WHERE Country ='Germany' 
ORDER BY CustomerName ASC;
-- 문제06 : Customers 테이블에서 국가(Country)가 'France' 또는 'Brazil' 인 고객의 이름(CustomerName)과 국가(Country)를 조회하세요.
SELECT CustomerName, Country
FROM Customers
WHERE Country = 'France' OR Country = 'Brazil';
-- 문제07 : Customers 테이블에서 고객 이름(CustomerName)을 내림차순(DESC)으로 조회하세요.
SELECT CustomerName
FROM Customers
ORDER BY CustomerName DESC;
-- 문제08 : Customers 테이블에서 고객 이름(CustomerName)과 국가(Country)를 고객 이름 기준 오름차순으로 정렬한 뒤, 5개만 조회하세요.
SELECT CustomerName, Country
FROM Customers
ORDER BY CustomerName ASC
LIMIT 5;
-- 문제09 : Customers 테이블에서 도시(City)가 'London' 이거나 국가(Country)가 'Mexico' 인 고객의 이름(CustomerName), 도시(City), 국가(Country)를 조회하세요.
SELECT CustomerName, City, Country
FROM Customers
WHERE City = 'London' OR Country = 'Mexico';
-- 문제10 : Customers 테이블에서 고객 번호(CustomerID)를 ID, 고객 이름(CustomerName)을 Name 으로 별칭 지정해서 조회하세요.
SELECT CustomerId AS 'ID',
  CustomerName AS 'Name'
FROM Customers;
