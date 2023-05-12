USE edyoda;

show tables;

create table salespeople (
snum int primary key ,
sname varchar(50) unique,
city varchar(50),
comm int);

insert into salespeople values 
(1001,'Peel','London',12),
(1002,  'Serres' ,'Sanjose ',13),
(1004 ,'Motika', 'London' ,11),
(1007 ,'Rifkin' ,'Barcelona ',15),
(1003 ,'Axelrod', 'Newyork', 10);

create table customers (
cnum int primary key,
cname varchar(50) not null,
city varchar(50),
snum int,
foreign key (snum) references salespeople(snum));


insert into customers values 
(2001, 'Hoffman','London', 1001),
(2002,  'Giovanni','Rome', 1003),
(2003, 'Liu','Sanjose',1002),
(2004,  'Grass','Berlin', 1002),
(2006, 'Clemens' ,'London',1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007,' Pereira', 'Rome', 1004);

create table orders(
onum int primary key,
amt float,
odate date,
cnum int ,foreign key (cnum)  references customers(cnum),
snum int ,foreign key (snum) references salespeople(snum));

insert into orders values
(3001, 18.69 ,'1990-10-3 ',2008 ,1007),
(3003, 767.19,'1990-10-3' , 2001, 1001),
(3002, 1900.10, '1990-10-3'  ,2007, 1004),
(3005,  5160.45, '1990-10-3'  ,2003, 1002),
(3006,  1098.16, '1990-10-3' , 2008, 1007),
(3009, 1713.23, '1990-10-4', 2002, 1003),
(3007,  75.75 ,'1990-10-4', 2004, 1002),
(3008,  4273.00,' 1990-10-5', 2006, 1001),
(3010,  1309.95,' 1990-10-6', 2004 ,1002),
(3011  ,9891.88 ,'1990-10-6' ,2006 ,1001);

select * from salespeople;

-- Q1
select count(sname) from salespeople
where sname like 'A%';

-- Q2
select * from  salespeople as sl inner join orders as od 
on  sl.snum = od.snum 
where amt >= 2000;

-- Q3
select count(sname) from salespeople 
where city = 'Newyork';

-- Q4
select  city , count(*) as Num_of_people   from salespeople
where city in ('London' ,'Paris')
group by city;


-- Q5
select sl.sname, od.odate, count(sl.sname) as num_orders
from salespeople as sl inner join orders as od 
on sl.snum = od.snum
group by sl.sname , od.odate;

