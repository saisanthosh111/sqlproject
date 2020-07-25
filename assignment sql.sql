select * from employee;
-- compound functions
-- using or
select * from employee where (sex="M" and salary > 30000) or (sex="F" and salary < 30000);
-- using not

select * from project where not ((plocation Like "%Houston" or plocation like "%Stafford")
);
-- using year function

select YEAR(mgr_start_date),dname from department;

-- using and
select * from project where (( plocation not Like "%Houston") and (plocation not like  "%Stafford"));

-- using concat
select ssn,concat(fname," ",minit," ",lname) from employee ;

-- using orderby
select pno,hours from works_on order by pno asc ,hours asc;

-- using count
select count(*)
from employee
where super_ssn IS NULL;

-- using avg function
select avg(salary),count(*)-count(super_ssn)
from employee ;

-- using nested queries
select fname, salary
from employee
where salary >= (select avg(salary) from employee);

-- using having function
select pno, count(*) numemps 
from works_on 
group by pno 
having numemps = 
	(select min(nemps) 
	from (
		select pno, count(*) nemps 
		from works_on group by pno
	     ) tempproj
	 );
     
-- using groupby,orderby
select * from employee
group by sex
order by salary;

-- using inner join
select p.pname,p.pnumber,d.dlocation from
project as p inner join dept_locations as d on p.dnum = d.dnumber;

-- using left inner join
select p.pname,p.pnumber,d.dlocation from
project as p left join dept_locations as d on p.dnum = d.dnumber;

-- using right inner join
select p.pname,p.pnumber,d.dlocation from
project as p right join dept_locations as d on p.dnum = d.dnumber;

-- using left outer join
select p.pname,p.pnumber,d.dlocation from
project as p left outer join dept_locations as d on p.dnum = d.dnumber;

-- using first_value
select fname,lname,salary,sex,
first_value(fname) over(
partition by sex
order by salary
)"least salary among all"
from
employee;

