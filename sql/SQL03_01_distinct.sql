-- 3. 빠르게 공부

-- #1 DISTINCT
-- 개념 : 중복제거하는 기능으로, 값의 종류가 무엇인지 알아 볼 수 있음
-- 작성법
SELECT DISTINCT Country -- Country 열의 값의 중복을 제거하여 종류가 뭐가 있는지 반환하라
FROM Customers;

-- #2 DISTINCT 특이사항 : 두 컬럼으로 적용시
-- 각 컬럼으 따로 중복 제거하는 것이 아니라 두 컬럼의 쌍을 하나의 값으로 판단하여 중복을 제거한다. 
SELECT DISTINCT Country, Ctiy
FROM customers
-- 실행 전                        실행 후
-- | Country | City  |          | Country | City  |
-- | ------- | ----- |          | ------- | ----- |
-- | Korea   | Seoul |          | Korea   | Seoul |
-- | Korea   | Busan |          | Korea   | Busan |
-- | Korea   | Seoul |          | USA     | Seoul |
-- | USA     | Seoul |          

-- #3 응용 : count()
SELECT COUNT(DISTINCT Country) -- Country 컬럼에서 값의 종류가 몇개인지 확인
FROM Customers;

-- #4 예제
-- 문제1 : Customers 테이블에서 중복 없는 City만 조회하세요.
SELECT DISTINCT City
FROM Customers;
-- 문제2 : Customers 테이블에서 중복 없는 Country 개수를 구하세요.
SELECT COUNT(DISTINCT Country)
FROM Customers;
-- 문제3 : Customers 테이블에서 중복 없는 Country, City 를 구하세요.
SELECT DISTINCT Country, City
FROM Customers;
