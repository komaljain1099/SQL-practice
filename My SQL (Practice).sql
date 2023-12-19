desc customers ;
#All Data
select * from customers ;

#Few Columns
select customernumber, customerName, state , country from customers;
#filters 
select customernumber , customername as  customer_names ,state , country 
from customers
where country = "USA" ;
select * from customers
where country = "USA" and state = "NY";
#filter
select customernumber,customername,state, country 
from customers 
where country = "USA" and state <> "NY" ; 
select customernumber, customername,state, country 
from customers 
where country = "USA" or country = "Austria" or country = "Belgium";
select country from customers
where country like "A%";
select country from customers
where country like "B%";
select country from customers
where country like "C%";
select distinct country from customers
where country like "A%" OR country like "B%" OR country like "C%"
Order by 1;



select * from products ;

select  productcode, productname,
case when MSRP <=50 then "Low"
WHEN MSRP > 50 and MSRP <= 100 then "Medium"
    else "High"
    end as price_category
    from products;


select *,
year(orderdate) as year,
month (orderdate) as month,
case when month (orderdate)<=6 then "H1"
else "H2" END as year_half
from orders;

select    productname, MSRP, productcode,
case when MSRP <= 50 THEN "low"
  WHEN MSRP > 50 and MSRP <= 100 THEN "Medium"
   else "High"
   end  as price_category
   From products
   where productcode = "S10_1678";
   
   
select  customernumber,creditlimit ,
   case when creditlimit > 100000 then "High"
   when creditlimit > 25000 and creditlimit<= 100000 then "Medium"
   else "Low"
   end as customer_type
from customers;

select *,
ISNULL (state) as is_null,
IFNULL (State,"This Value Is Null") as if_null
from customers;

select *,
  coalesce(state,0) as state_0,
  coalesce(addressLine1,addressline2,city,state,country) as address1,
  coalesce(addressline2,city,state,country) as address2
  from customers;
  
  
  select count(*) from customers;

  
  #Count
  select * from orderdetails;
  select count(*) from orderdetails;
  
  select ordernumber, count(*) as no_of_products
  from orderdetails
  group by orderNumber;
  

  select country,state, count(*) as no_of_customers
  from customers
  group by country,state
  order by 3 desc;

select * from customers;

#Sum
select sum(quantityordered) from orderdetails;

select ordernumber,
sum(quantityordered) as total_quantity
from orderdetails
group by orderNumber;

#sum order by
select ordernumber , sum(quantityordered) as total_quantity
from orderdetails
group by ordernumber
having total_quantity>500
order by total_quantity desc;

#avg
select 
case when creditlimit > 100000 then "high" 
when creditLimit >= 25000 and creditlimit <= 100000 then "medium"
else "low" end as customer_type,
round (avg(creditlimit )) as avg_cl
from customers
group by customer_type;


SELECT
YEAR(Paymentdate) as year_,
month(paymentdate) as month_,
sum(amount) as total
FROM PAYMENTS
group by year_,month_
order by total desc;


drop table student;

create table student(
roll_no int unique not null,
name varchar (50),
#gender enum("male","female"),
city varchar (30),
marks int);


insert into student value (1,"Arjun","Mumbai",70);
insert into student value  (2,"Arjun","Mumbai",70);
insert into student value  (1,"michelle","chennai",80);
insert into student value  (2,"michekke","hyderabad",70);

desc student;
 
select * from student;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`excelr` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `excelr`;

/*Table structure for table "students*/
create table students (
roll_no int primary key ,
studentsname varchar(50),
age int check (age > 5 and age < 15),
parents_email varchar (20) unique ,
address varchar (50) default "_");

desc students;
insert into students value (1,"Rahul","10","kedar@gmail.com","Mumbai");
select * from students;
insert into students value (3, "Swati" ,"12" , null, "");


Create table customer(
id int primary key,
name varchar (50),
city varchar (50));

desc customers;
 
insert into customer values (1,"Arvind","mumbai");
insert into customer values (2,"praveen","bangalore");
insert into customer values (3,"Anand","chennai");
insert into customer values (10,"Aditya","kolkata");
 select * from customer ;
 
drop table orders;
 create table orders(
 order_id int primary key,
 order_num int,
 customer_id int,
 foreign key (customer_id) references customer(id));
 
  select * from customer;
  
insert into orders values (1,12344,3);
insert into orders values (2,12344,1);
insert into orders values (3,12344,2);
insert into orders values (4,12344,10);

 select * from orders;
 
 
 select * from customers c
 left join orders o on c.customerNumber = o.customerNumber;
 
 select * from 
 customers c join orders o on c.customerNumber = o.customerNumber;
 
 
 select c.customerNumber,customerName,orderNumber from 
 customers c join orders o on c.customerNumber = o.customerNumber;
 
 select ordernumber, orderdate ,status , customerName ,o.customerNumber from orders o 
 join customers c on c.customerNumber = o.customerNumber;
 
 
 use test;
 
 drop table student;
 create table student(
 roll_no int,
 first_name varchar(50),
 last_name varchar(50),
 age int,
 marks int);
 
 insert into student 
 values 
 (1,"harry","brooks",26,40),
 (2,"komal","jain",24,50),
 (3,"kashish","jain",21,30);
 
 select * from student;
 desc student;
 
 #ALTER 
 ##ADD column 
 ALTER TABLE student ADD marks2 int ;

ALTER TABLE student ADD marks3 int AFTER first_name;
 ALTER TABLE student ADD marks4 int FIRST; 
ALTER TABLE student ADD marks5 int , ADD city2 varchar (30);
desc student;
ALTER TABLE student ADD marks6 int AFTER marks5 , ADD address varchar (20),ADD roll_number5 int first;

#DROP column 
ALTER table student 
DROP city2,drop marks2,drop marks3,drop marks4,drop marks5, drop marks6,drop roll_number5;
alter table student 
drop address;

#RENAME Column 
ALTER TABLE student
CHANGE marks marks_in_physics int;

#CHANGE Dtatype 
ALTER TABLE student
MODIFY first_name VARCHAR(100);
ALTER TABLE student 
MODIFY age varchar(100);

##TRAUNCATE DATATYPE
TRUNCATE TABLE student;
select * from student;

##RENAME TABLE 
RENAME TABLE student to student_rename;

##views + joins excersise 
select * from offices;
select * from employees;

select territory , count(employeesNumber) as no_of_employees
from employees e left join offices o ON e.officeCode = o.officecode
group by territory
order by 2 desc;

