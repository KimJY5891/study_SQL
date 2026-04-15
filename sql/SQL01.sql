-- #1
-- 주석의 내용을 작성하세요! 

-- #2
SELECT * FROM Customers;
SELECT * -- 가져 오겟다.(SELECT) 모든 컬럼을 (*)
  
-- #3
SELECT * FROM Customers;  -- FROM (테이블 네임) 
-- 즉, Customers라는 테이블에서(FROM), 모든 컬럼(*)을 선택(SELECT)해서 가져와라!

-- #4 
SELECT CustomrerName, City, Country 
FROM Customers; -- 이렇게 줄 바꿔서 작성하는 것도 가능, SQL에서는 큰 의미가 없다.
-- 대신 단어끼리는 띄어쓰기를 해야한다.

-- #5
SELECT 
  CustomerName, 1, 'Hello', NULL
FROM Customers
-- SELECT 뒤에 컬럼명이 아닌 값(상수)을 직접 넣으면
-- 1) 모든 행에 값(상수혹은 텍스트)를 똑같이 채워넣음
-- 2) 데이터가 곧 컬럼명이 됨. 별도의 별칭(AS)을 지정하지 않으면 입력한 값이 그대로 해당 열의헤터(컬럼명)이 됩니다.

-- #6 WHERE(행관)
SELECT * -- 나는 가져오겠다.(SELECT) 모든 컬럼을(*)
FROM Orders -- Orders에서(FROM)
WHERE EmployeeID = 3; -- EmployeeID가 3인 조건(WHERE)의 데이터를 !
-- WHERE 조건

-- #7 연습01
SELECT CustomerID, EmployeeID -- 결과를 보여줄 두 가지의 열을 선택
FROM Orders -- 오더 테이블에서
WHERE EmployeeID = 3; -- EmployeeID에서 3인 두 가지열을 선택해서 출력

-- #8 연습02
SELECT * FROM OrderDetails
WHERE Quantity < 5; 
-- 모든 열(*)을 선택(SELECT)하고 테이블 Orders으로 부터(FROM)
-- Quantity 값이 5미만 값을 조건으로 하여 
-- 모든 열이 보이는 출력 Orders 테이블을 출력

-- #9 ORDER BY 
-- ASC (센딩) : 오름차순 , 기본설정되어있음
-- DESC (디센딩) : 내림차순 , 기본 설정이 아님
SELECT * FROM Customers
ORDER BY ContactName; -- 기본 ASC로 지정됨
ORDER BY ContactName DESC; -- 역순을 원한다면 이렇게 진행하면 됨
-- 결과를 보면 콘택트 네임 기준으로 보면 알파벳 순서로 정순과 역순이 진행되는 것을 볼 수 있음.

-- #10 ASC와 DESC를 같이 사용할 경우
SELECT * FROM OrderDetails
ORDER BY ProductID ASC, Quantity DESC;
-- ProductID를 먼저 오름차순으로 진행하고, 
-- 먼저 정렬된 ProductID 값이 같은 것들 내에서 Qunatity 값은 역순으로 순서를 변경하여 정리한다.

-- #11 LIMIT
-- LIMIT {가져올 갯수} 또는 LIMIT {건널 뛸 갯수}, {가져올 갯수}
-- 가져올 갯수만 작성할 경우 건널 뛸 갯수의 기본 값은 0
-- 이런 식으로 원하는 만큼만 데이터를 가져올 수  있음
SELECT * FROM Cusmtomers
LIMIT 10; -- 10개로 제한해서 가져와라!
-- 순서대로 10개만 가져옴
SELECT * FROM Customers
LIMIT 0, 10 -- LIMIT 10과 결과가 같음. 건너뛸 갯수의 기본값은 0인가봄
LIMIT 30, 10; -- 이 경우 ID 기준으로 31 ~ 40 만 나옴

-- #12 AS // 원하는 별명(alias)으로 가져오기
-- 설명 : AS를 사용해서 컬럼명을 변경할 수 있다.
SELECT 
  CustomerId AS ID, -- ID 대신에 '아이디'로도 가능
  CustomerName AS NAEM -- '고객명'으로 대체 가능
  Address AS ADDR -- '주소'으로 대체 가능
FROM Customers

-- #13 최종활용
SELECT 
  CustomerId AS '아이디',
  CustomerName AS '고객명',
  
SELECT
	CustomerId AS '아이디',
	CustomerName AS '고객명',
	City AS '도시',
	Country AS '국가' 
-- CustomerId을 선택하고 '아이디'로 컬럼명을 변경하여 선택하는 등
FROM Customers -- Customers라는 테이블에서 
WHERE
	City = 'London' OR Country = 'Mexico' 
	-- 행의 조건은 City 컬럼에서 'London' 혹은 Country 컬럼에서 'Mexico'가 있는 행을 선택
ORDER BY CustomerName -- CustomerName 컬럼 기준으로 오름차순으로 정렬하고
LIMIT 0, 5; -- 건너 뛰는 갯수 없이 5개 만 출력하라
