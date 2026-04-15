-- 3-4. HAVING

-- #1 설명
-- 개념 : 그룹 결과에 조건을 거는것 
-- 필요한이유 : GROUP BY 결과를 집계함수 기준으로 필터링
-- 예를 들어서 ‘나라 별로 묶고 2명 이상인 나라만 보고 싶다’ 이런 것을 WHERE로 하면 안된다. ( 에러나옴)
-- WHERE과 함께 사용할 경우 WHERE이 연산 우선순위이기 때문에 계산이 에러가 나옴
-- 그리고 WHERE은 그룹으로 연산이 안됨
SELECT Country, COUNT(*)
FROM Customers
WHERE COUNT(*) >= 2   -- 에러
GROUP BY Country;

-- #2 작성법
SELECT 그룹 컬럼, COUNT(*)
FROM 테이블
WHERE 행조건
GROUP BY 그룹컬럼
HAVING COUNT(*) 조건

SELECT Country, COUNT(*)
FROM Customers
GROUP BY Country -- 같은 값 끼리 묶기
HAVING COUNT(*) >=2; -- Country 그룹에서 갯수가 2개 이상인 것만 출력

-- #3 응용 : WHERE과 함께 사용할 경우
SELECT Country, COUNT(*)
FROM Customers
WHERE Country != 'USA' -- 먼저 필터, USA 제거 
GROUP BY Country -- 묶기
HAVING COUNT(*) >=2; -- 나중에 필터, 조건 적용
-- 연산 순서 WHERE - GROUP BY - HAVING - SELECT  
-- 자연어 해석 : "Customers테이블에서 미국 제외하고, 국가별 고객 수를 세, 고객이 2명 이상인 국가만 보여줘"
-- Customers 테이블에서
-- Country가 'USA'인 행을 먼저 제거하고 (WHERE)
-- Country 기준으로 그룹화한 뒤 (GROUP BY)
-- 각 그룹의 행 개수를 COUNT()로 계산하고
-- 그 결과에서 COUNT() ≥ 2인 그룹만 반환한다 (HAVING)

-- #4 예제
-- 문제1 : 기본 HAVING문제
-- 각 country별 customer 수를 구하고, 5명 이상인 country만 조회하세요
SELECT Country, COUNT(*)
FROM Customers
GROUP BY Country
HAVING COUNT(*) >= 5;
-- 문제2 : WHERE + HAVING 같이 쓰기
-- USA 제외 + 고객 3명 이상 국가
SELECT Country, COUNT(*)
FROM Customers
WHERE Country != 'USA'
GROUP BY Country
HAVING COUNT(*) >=3;
-- 문제3 : 도시 기준 HAVING
-- 고객이 2명 이상인 도시
SELECT City, COUNT(*)
FROM Customers
GROUP BY City
HAVING COUNT(*) >= 2; 
-- 문제4 : HAVING + ORDER BY 
-- 고객 많은 순으로 국가 정렬 (3명 이상만)
SELECT Country, COUNT(*)
FROM Customers
GROUP BY Country
HAVING COUNT(*) >=3
ORDER BY COUNT(*) DESC;
-- 문제5 : 살짝 꼬은 문제 (시험용)
-- 도시별 고객 수 중, 1명인 도시 제외
SELECT City, COUNT(*)
FROM Customers
GROUP BY City
HAVING COUNT(*) > 1;











