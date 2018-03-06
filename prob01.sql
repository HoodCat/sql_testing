-- 문제 1
select concat(first_name, ' ', last_name)
from employees
where emp_no = 10944;

-- 문제 2
select concat(first_name, ' ', last_name) as '이름',
       gender as '성별',
       hire_date as '입사일'
from employees
order by hire_date asc;

-- 문제 3
select gender, count(gender) as cnt_of_gender
from employees
group by gender;

-- 문제 4
select count(*) as cnt_of_employees
from salaries
where to_date like '9999%';

-- 문제 5
select count(*)
from departments;

-- 문제 6
select distinct count(emp_no)
from dept_manager
where to_date like '9999%';

-- 문제 7
select *
from departments
order by length(dept_name) desc;

-- 문제 8
select count(*)
from salaries
where salary >= 120000 and
	  to_date like '9999%';
      
-- 문제 9
select distinct title
from titles
order by length(title) desc;

-- 문제 10
select count(*)
from titles
where title = 'Engineer' and
      to_date >= now();
--      to_date like '9999%';
      
-- 문제 11
select *
from titles
where emp_no = 13250
order by from_date asc;