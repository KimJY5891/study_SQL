-- 3-5. JOIN

-- #0 먼저 알아야할 기타 개념
-- 테이블명.컬럼명
Cumstomer.Name
-- 점을 사용하는 이유
--     JOIN하면 테이블이 2개 이상이라서 같은 이름 컬럼이 존재할 수 있음
--     그래서 테이블명.컬럼명을 사용하여 컬럼명이 같아서 나타나는 에러를 없앨수 있음
--별명(alias)
-- AS 를 사용 하여 별명을 사용할 수 있지만
-- 없어도 사용하여 별명을 정할 수 있다
FROM Customers AS c;
FROM Customers c;
-- 둘이 같은 의미이다.
-- 주의사항 
-- 미리 지정하지 않으면 사용할 수 없음
-- 실행순
SELECT c.Name
FROM Customers c
--연산순서
1. FROM
2. JOIN
3. ON
4. SELECT

-- #1 설명
-- 테이블 A와 테이블 B에서 각각 필요한 컬럼을 빼서 합쳐야할 때가 있음 
-- 테이블끼리 연결하는 것 관련 컬럼을 기준으로 두 개 이상의 테이블 행을 결합하는 것
SELECT 컬럼들
FROM 테이블1
JOIN 테이블2 -- 붙인다.
ON 연결조건(공통컬럼) -- 어떻게 붙일지
SELECT c.ContactName, o.OrderID
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID -- ID가 같은 것 끼리만 붙여라

-- #2 ON
-- 예시(AI힘빌림)
👤 Customers
| CustomerID | ContactName |
| ---------- | ----------- |
| 1          | Kim         |
| 2          | Lee         |

📦 Orders
| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 1          |
| 103     | 2          |
-- ON 없을 경우 연산
SELECT *
FROM Customers c
JOIN Orders o;

모든 조합 (폭발)
Kim + 101
Kim + 102
Kim + 103
Lee + 101
Lee + 102
Lee + 103
-- >의미 없는 데이터

-- 코드__ON사용시
ON c.CustomerID = o.CustomerID
-- CustomerID가 같은 것끼리만 붙여라
-- 결과
Kim + 101
Kim + 102
Lee + 103
-- “같은 번호 가진 애들끼리만 매칭해라”
-- ON이 필요한 이유
-- 모든 조합을 가져오는게 아니라
-- ID(공통키)를 기준으로하여 테이블을 생성함

-- #3 핵심개념
-- 1. 공통 키가 있어야함
-- 2. ON으로 연결
-- 3. 결과 “ 합쳐진 테이블”

-- #4 INNER JOIN
-- 개념설명
-- 둘 다 있는 데이터만 가져옴
-- 예시 데이터
Customers
| CustomersID | 이름   |
| -- | ---- |
| 1  | Kim  |
| 2  | Lee  |
| 3  | Park |
Orders
| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 1          |
| 103     | 2          |
-- 코드
SELECT c.ContactName, o.OrderID
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;
-- 결과
Kim 101
Kim 102
Lee 103
-- 설명
-- 즉 겹치는 것만 가져옴

-- #5 LEFT JOIN
-- 개념설명
-- 왼쪽 테이블은 무조건 다 가져옴
-- 예시데이터
Customers
| CustomersID | 이름   |
| -- | ---- |
| 1  | Kim  |
| 2  | Lee  |
| 3  | Park |
Orders
| OrderID | CustomerID |
| ------- | ---------- |
| 101     | 1          |
| 102     | 1          |
| 103     | 2          |
-- 코드
SELECT c.ContactName, o.OrderID
FROM Customers c -- LEFT의 기준임
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
-- 결과
Kim 101
Kim 102
Lee 103
Park NULL   ← 핵심
-- 설명
왼쪽인 테이블의 은 다 살리고 없으면 NULL 채움

