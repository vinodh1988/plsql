create global temporary table mytemptab2

(
sno number(6) primary key,
name varchar(30) not null,
salary number(10) not null
)
on commit delete rows;

drop table mytemptab;

select * from mytemptab2;

insert into mytemptab2 select employee_id,first_name,salary from employees;

commit;