-- 문제 1
select
    a.emp_no,
    concat(a.first_name, ' ', a.last_name) as name,
    b.salary
from employees a
join salaries b on a.emp_no = b.emp_no
where b.to_date = '9999-01-01'
order by b.salary desc;

-- 문제 2
select
    a.emp_no,
    concat(a.first_name, ' ', a.last_name) as name,
    b.title
from employees a
join titles b on a.emp_no = b.emp_no
where b.to_date = '9999-01-01'
order by name asc;

-- 문제 3
select
    a.emp_no,
    concat(a.first_name, ' ', a.last_name) as name,
    c.dept_name
from employees a
join dept_emp b on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
where b.to_date = '9999-01-01'
order by name asc;

-- 문제 4
select
    a.emp_no,
    concat(a.first_name, ' ', a.last_name) as name,
    b.salary,
    c.title,
    e.dept_name
from employees a
join salaries b on a.emp_no = b.emp_no
join titles c on a.emp_no = c.emp_no
join dept_emp d on a.emp_no = d.emp_no
join departments e on d.dept_no = e.dept_no
where b.to_date = '9999-01-01' and
      c.to_date = '9999-01-01' and
      d.to_date = '9999-01-01'
order by name asc;

-- 문제 5
select a.emp_no, concat(a.first_name, ' ', a.last_name) as name
from employees a
join titles b on a.emp_no = b.emp_no
where b.title = 'Technique Leader' and
      b.to_date != '9999-01-01';
      
-- 문제 6
select
    concat(a.first_name, ' ', a.last_name) as name,
    c.dept_name,
    d.title
from employees a
join dept_emp b on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
join titles d on a.emp_no = d.emp_no
where a.last_name like 'S%' and
      b.to_date = '9999-01-01' and
      d.to_date = '9999-01-01';
      
-- 문제 7
select a.emp_no, a.first_name, b.title, c.salary
from employees a
join titles b on a.emp_no = b.emp_no
join salaries c on a.emp_no = c.emp_no
where b.to_date = '9999-01-01' and
      b.title = 'Engineer' and
      c.to_date = '9999-01-01' and
      c.salary >= 40000
order by c.salary desc;

-- 문제 8
select a.title as 직책, b.salary as 급여
from titles a
join salaries b on a.emp_no = b.emp_no
where a.to_date = '9999-01-01' and
      b.to_date = '9999-01-01' and
      b.salary >= 50000
order by b.salary desc;

-- 문제 9
select a.dept_name, avg(c.salary)
from departments a
join dept_emp b on a.dept_no = b.dept_no
join salaries c on b.emp_no = c.emp_no
where b.to_date = '9999-01-01' and
      c.to_date = '9999-01-01'
group by a.dept_no
order by avg(c.salary) desc;

-- 문제 10
select a.title, avg(b.salary)
from titles a
join salaries b on a.emp_no = b.emp_no
where a.to_date = '9999-01-01' and
      b.to_date = '9999-01-01'
group by a.title
order by avg(b.salary) desc;
