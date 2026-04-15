-- 3-2. 집계함수

-- #1 COUNT 함수
-- 개념 : 행의 갯수를 세는 함수

-- #2 사용법
-- 개념 : 모든 행(NULL 포함)을 카운트하여 갯수를 반환
-- 사용법01 : 전체 갯수 
SELECT COUNT(*) FROM Customers; --  Customers테이블에 전체 행의 갯수를 세어 행으로 나타내라 컬럼명은 COUNT(*)
-- 사용법02 : 조건이 있는 것을 셈
SELECT COUTN(*)
FROM Customers
WHERE Country ='korea'; -- 해당 조건을 만족하는 행의 갯수를 세어라
-- 사용법03
-- COUNT(*) : 모든 행 카운트 (NULL포함)
-- COUNT(컬럼) : NULL 제외하고 카운트
-- | City  |
-- | ----- |
-- | Seoul |
-- | NULL  |
-- | Busan |
SELECT COUNT(*) FROM Customers; -- 3, NULL을 포함해서
SELECT COUNT(City) FROM Custmers; -- 2 NULL을 포함하지 않음
