-- 문제 1
select count(*)
from salaries
where salary > (select avg(salary)
                from salaries
                where to_date = '9999-01-01');
                
-- 문제 2
select a.emp_no, concat(a.first_name, ' ', a.last_name) as name, c.salary
from employees a
join dept_emp b on a.emp_no = b.emp_no
join salaries c on a.emp_no = c.emp_no
join (select dept_no, max(salary) as max_salary
      from dept_emp a
      join salaries b on a.emp_no = b.emp_no
      where a.to_date = '9999-01-01' and
            b.to_date = '9999-01-01'
      group by dept_no) d on b.dept_no = d.dept_no
where b.to_date = '9999-01-01' and
      c.to_date = '9999-01-01' and
      c.salary = d.max_salary
order by c.salary desc;

-- 문제 3
select a.emp_no, concat(a.first_name, ' ', a.last_name) as name, c.salary, d.avg_salary
from employees a
join dept_emp b on a.emp_no = b.emp_no
join salaries c on a.emp_no = c.emp_no
join (select a.dept_no, avg(b.salary) as avg_salary
      from dept_emp a
      join salaries b on a.emp_no = b.emp_no
      where a.to_date = '9999-01-01' and
            b.to_date = '9999-01-01'
      group by a.dept_no) d on b.dept_no = d.dept_no
where b.to_date = '9999-01-01' and
      c.to_date = '9999-01-01' and
      c.salary > d.avg_salary;

-- 문제 4
select a.emp_no,
       concat(a.first_name, ' ', a.last_name) as name,
       c.manager_name,
       c.dept_name
from employees a
join dept_emp b on a.emp_no = b.emp_no
join (select b.dept_no, c.dept_name, concat(a.first_name, ' ', a.last_name) as manager_name
      from employees a
      join dept_manager b on a.emp_no = b.emp_no
      join departments c on b.dept_no = c.dept_no
      where b.to_date = '9999-01-01') c on b.dept_no=c.dept_no
where b.to_date = '9999-01-01';

-- 문제 5
select a.emp_no,
       concat(a.first_name, ' ', a.last_name) as name,
       b.title,
       c.salary
from employees as a
join titles as b on a.emp_no = b.emp_no
join salaries as c on a.emp_no = c.emp_no
join dept_emp as d on a.emp_no = d.emp_no
join (select a.dept_no, avg(b.salary) as avg_salary 
      from dept_emp a
      join salaries b on a.emp_no = b.emp_no
      where a.to_date = '9999-01-01' and
            b.to_date = '9999-01-01'
      group by a.dept_no
      order by avg(b.salary) desc
      limit 1) as e on d.dept_no = e.dept_no
where b.to_date = '9999-01-01' and
      c.to_date = '9999-01-01' and
      d.to_date = '9999-01-01';

-- 문제 6
select a.dept_name
from departments as a
join (select a.dept_no, avg(b.salary) as avg_salary 
      from dept_emp a
      join salaries b on a.emp_no = b.emp_no
      where a.to_date = '9999-01-01' and
            b.to_date = '9999-01-01'
      group by a.dept_no
      order by avg(b.salary) desc
      limit 1) as b on a.dept_no = b.dept_no;
      
-- 문제 7
select a.title
from titles as a
join salaries as b on a.emp_no = b.emp_no
where a.to_date = '9999-01-01' and
      b.to_date = '9999-01-01'
group by a.title
order by avg(b.salary) desc
limit 1;

-- 문제 8   
select d.dept_name,
       concat(a.first_name, ' ', a.last_name) as name,
       c.salary,
       e.manager_name,
       e.salary
from employees as a
join dept_emp as b on a.emp_no = b.emp_no
join salaries as c on a.emp_no = c.emp_no
join departments as d on b.dept_no = d.dept_no
join (select concat(a.first_name,' ',a.last_name) as manager_name,
             b.dept_no,
             c.salary
      from employees as a
      join dept_manager as b on a.emp_no = b.emp_no
      join salaries as c on a.emp_no = c.emp_no
      where b.to_date = '9999-01-01' and
            c.to_date = '9999-01-01') as e on b.dept_no = e.dept_no
where b.to_date = '9999-01-01' and
      c.to_date = '9999-01-01' and
      c.salary > e.salary;