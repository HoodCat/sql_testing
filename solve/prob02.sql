-- 문제 1
select *, (result.최고임금-result.최저임금) as '최고임금 - 최저임금'
from (select
        (select max(salary)
         from salaries) as '최고임금',
        (select min(salary)
         from salaries) as '최저임금') result;
     
-- 문제 2
select date_format(max(hire_date),'%Y년 %m월 %d일') as '막내 입사일'
from employees;

-- 문제 3
select date_format(min(hire_date), '%Y년 %m월 %d일') as '왕고참 입사일'
from employees;

-- 문제 4
select avg(salary) as '평균연봉'
from salaries
where to_date = '9999-01-01';

-- 문제 5
select
    (select max(salary)
     from salaries
     where to_date = '9999-01-01') as '최고연봉',
    (select min(salary)
     from salaries
     where to_date = '9999-01-01') as '최저연봉';
 
 -- 문제 6
 select
    year(current_time()) - year(max(birth_date)) as 'youngest',
    year(current_time()) - year(min(birth_date)) as 'oldest'
 from employees;