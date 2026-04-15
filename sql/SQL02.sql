-- 02. 사칙연산

-- #1 사칙연산 기본
-- +,-,*,/ : 각각 더하기, 빼기, 곱하기, 나누기
-- %, MOD : 나머지 
SELECT 1 + 2 ; -- 컬럼명 : 1 + 2 , 행 : 3
SELECT 1 + 2 AS '일플러스이'; -- 컬럼명 : 일플러스이 , 행 : 3
SELECT 5 - 2.5 AS DFFERENCE; -- 컬럼명 : DFFERENCE , 행 : 2.5
SELECT 3 * ( 2 + 4) / 2, 'Hello'; -- 컬럼명01 : 3 * ( 2 + 4) / 2 , 행01 : 9.0000 , 컬럼명02 : Hello , 행02 : Hello
SELECT 10%3;  -- 컬럼명 : 10%3 , 행 : 1

--#2 문자열 사칙연산
-- 문자 열에 사칙 연산을 가하면 문자열을 0으로인식
SELECT 'ABC' + 3; -- 컬럼명 : 'ABC' + 3 , 행 : 3
SELECT 'ABC' * 3; -- 컬럼명 : 'ABC' * 3 , 행 : 0
SELECT '1' + '002' * 3; -- 컬럼명 : '1' + '002' * 3 , 행 : 7
-- 숫자를 문자열화 해도 숫자로 계산됨

-- #3 예제
SELECT OrderID, ProductID, OrderID  + ProductID FROM OrderDetails -- 결과는 행마다 둘의 숫자가 더한 값이 나옴
SELECT ProductName, Price, Price /2 AS HalfPrice FROM Products

-- #4 참/ 거짓 관련 연산자
SELECT TRUE, FALSE 
 -- 컬럼명 : TRUE , 행 : 1
 -- 컬럼명 : FALSE , 행 : 0
SELECT TRUE, NOT 1, !FALSE, NOT FALSE;
 -- 컬럼명 : TRUE , 행 : 1
 -- 컬럼명 : NOT 1 , 행 : 0
 -- 컬럼명 : !FALSE , 행 : 1
 -- 컬럼명 : NOT FALSE , 행 : 1
-- 설명 : MySQL에서 TRUE는 1, FALSE는 0으로 저장
SELECT 0 = TRUE, 1 = TRUE, 0 = FALSE, 1 = FALSE;
-- 위는 조건식으로 진실인것은1, 거짓인 것은 0으로 처리
-- WHERE 다음에도 조건식(부울식)이 오는 것임

-- #5 IS 연산자
-- 개념 : 값을 비교하는 연산자
-- 논리값(TRUE/FALSE)이나 NULL 비교할 때 사용 
SELECT TRUE IS TRUE; -- TRUE가 TRUE 인가? 맞음 -> 1로 반환
-- '='와 'is'의 차이 
-- '=' : 일반 값을 비교
SELECT 1 = 1; -- TRUE
-- 'IS' : 논리값 /NULL을 비교
SELECT TRUE IS TRUE; -- TRUE
SELECT NULL IS NULL; -- TRUE
SELECT TRUE IS FALSE; -- FALSE

-- #6 NOT 연산자
-- 의미 : 뒤에 오는 조건을 반대로 뒤집는다.
SELECT * FROM Customers
WHERE City IS NOT NULL; -- City 값이 있는 것만 가져와
SELECT * FROM Customers
WHERE NOT City = 'London'; -- London이 아닌 것만 가져와라
WHERE City != 'London'; -- 이것과 위 문장이 동일함 

-- #7 예제
SELECT (TRUE IS FALSE) IS NOT TRUE; -- (false) is false -> 진실(TRUE)

-- #8 AND/OR 연산자
-- AND(&&) : 양쪽 모두 TRUE일때만 TRUE
-- OR(||) : 한쪽이라도 TRUE라면 TRUE
SELECT TRUE AND FALSE, TRUE OR FALSE; -- 각 행에 0,1 이렇게 나옴
SELECT 2 + 3 = 6 OR 2 * 3 = 6; -- 한쪽이 TRUE이기 때문에 1 반환 
-- 그리고 SELECT 뒤를 열제목으로 불러오고 값은 행으로 보여줌

-- #9 예제
SELECT * FROM Orders
WHERE CustomerId = 15 AND EmployeeId = 4; -- 두 조건이 동시에 만족되는 행을 찾는다.
SELECT * FROM Products
WHERE ProductName = 'Tofu' OR CategoryId = 8;
SELECT * FROM OrderDetails
WHERE ProductId = 20
AND (OrderId = 10514 OR Quantity = 50);
-- 괄호를 제거할 경우 연산 순서가 달라져서 결과도 달라짐

-- #10 비교연산자
-- '=' : 양쪽 값이 같음
-- '!=', '<>'  : 양쪽 값이 다름
-- '>','<' : (왼쪽, 오른쪽) 값이 더 큼
-- '>=','<=' : (왼쪽, 오른쪽) 값이 같거나 더 큼
SELECT 1 = 1, !(1 <> 1), NOT (1 < 2), 1 > 0 IS NOT FALSE; -- 참, 참, 거짓, 참
SELECT 'A' = 'A', 'A' != 'B', 'A' < 'B', 'A'> 'B';
-- 문자열은 알파벳 순으로 나중에 오는 값이 더 큰 걸로 지정하고 비교하는 듯 
SELECT 'A' = 'a'; -- 참으로 나옴, 대소문자는 구별하지 않음

-- #11 예제
SELECT ProductsName, Price, Price > 20 AS EXPENSIVE 
-- Price 에서 20보다 큰것들을 참 아닐 경우 거짓으로 행으로 표시함
FROM Products;
-- WHERE EXPENSIVE = 0 => 이렇게 적을 경우 언노운 컬럼 에러 나옴
-- SELECT에서 만든 alias는 WHERE에서 바로 사용할 수 없다. (GPT 설명) 
-- WHERE가 연산이 SELECT 보다 우선 순위에 있음
SELECT ProductName, Price,
NOT Price > 20 AS CHEAP
-- Price 컬럼에서 20 보다 작은 값을 참으로 표기하고 컬럼명은 CHEAP 으로 표기한다.
FROM Products;

-- #12 BETWEEN 연산자
-- [value] BETWEEN [min] AND [max] : 두 값 사이에 있음 -> 있을 경우 TRUE, 없을 경우 : FALSE
-- [value] NOT BETWEEN [min] AND [max] : 두 값 사이에 있음 -> 있을 경우 FALSE, 없을 경우 : TRUE
SELECT 5 BETWEEN 1 AND 10; -- 5가 1 이상이고, 10이하인가를 검사
SELECT 5>=1 AND 5<=10 -- 위 코드와 같다. 
SELECT 5 BETWEEN 10 AND 1; -- 순서가 바뀌면 둘 사이가 아니기에 거짓(0)으로 나옴
SELECT 'banana' NOT BETWEEN 'Apple' AND 'camera';
-- a와 c 사이가 b라서 진실이기만 not이라서 거짓으로 출력됨
SELECT 'banana' NOT BETWEEN 'Apple' AND 'baaera';
-- 'Apple' 와 'baaera' 사이에 있지 않아서 거짓이지만 NOT이 앞에 있어서 진실로 출력됨

-- # 13 예제
SELECT * FROM OrderDetails
WHERE ProductID BETWEEN 1 AND 4; -- ProductID가 1 에서 4 사이인 행만 출력된다.
SELECT * FROM Customers
WHERE CustomerName BETWEEN 'b' AND 'c';
-- b이상 c이하 즉, b로 시작하는 문자열과 'c'까지만 출력가능 (c이하니까 c까지만 포함가능)
-- c로 시작하는 일 반 문자열은 'c'보다 위로 보아서 출력이 되지 않는다.

-- # 14 IN 연산자
-- IN (_,_,_ ... ) : 괄호 안에의 값들 가운데 있음
-- NOT IN (_,_,_ ... ) : 괄호 안에의 값들 가운데 없음
SELECT 1 + 2 IN (2,3,4); -- 1(TRUE)행의 값으로 반환함
SELECT 1 + 2 NOT IN (2,3,4); -- 0(FALSE) 값을 반환
SELECT 'Hello' in (1,TRUE,'hello'); -- 1(TRUE) 행의 값으로 반환함.
--MySQL에서는 대문자 소문자 구분이 없음 

-- #15 예제
SELECT * FROM Customers
WHERE City IN ('Torino', 'Paris', 'Portland', 'Madrid');
-- 'Torino', 'Paris', 'Portland', 'Madrid' 중에서 포함된
-- ( 조건식에 맞아서 true인) 행들만 반환라 

-- #16 LIKE 연산자
-- LIKE '(문자열)%(문자열)' : % 부분에 0 ~ X개 문자를 가진 패
                             0개 이상의 아무 문자열이 올 수 있는 자리
                             ( 내가 이해하는 걸로는 숫자를 따지지 않는 문자열 변수?)
-- LIKE '(문자열)_(문자열)' : _갯수 만큼 문자를 가진 패 
SELECT
 'HELLO' LIKE 'hel%', -- hel로 시작 => TRUE
 'HELLO' LIKE 'H%', -- H로 시작하면 가능 => TRUE
 'HELLO' LIKE 'H%O', -- H로 시작 + O로 끝 => TRUE
 'HELLO' LIKE '%O', --  O로 끝나는지 확인 => TRUE
 'HELLO' LIKE '%LL%', -- 중간에 LL이 들어가는면 OK => TRUE
 'HELLO' LIKE '%HELLO%', -- 문자열 안에 HELLO가 포함되면 OK => TRUE
 'HELLO' LIKE '%H', -- H로 끝나야함(핵심) => 
 'HELLO' LIKE '문자열', --  => 

SELECT 
 'HELLO' LIKE '문자열', --  => 
 'HELLO' LIKE '문자열', --  => 
 'HELLO' LIKE '문자열', --  => 
 'HELLO' LIKE '문자열', --  => 
 'HELLO' LIKE '문자열', --  => 
 'HELLO' LIKE '문자열', --  => 
 'HELLO' LIKE '문자열', --  => 



















