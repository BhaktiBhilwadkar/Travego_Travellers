#In this project we have to do the following activities…

#	Retrieve the data from these tables based on the requirements mentioned below.
# 1. (Easy) Creating the schema and required tables using sql script or using MySQL workbench UI
# a.	Create a schema named Travego. 

Create database Travego;
use Travego;


# b.	Create the tables mentioned above with the mentioned column names.
#	Creating the two tables

Create table passenger (
passenger_id int,
passenger_name varchar(20),
category varchar(20),
gender varchar (10),
boarding_city varchar(30),
destination_city varchar(30),
distance int,
bus_type varchar(20));


Create table price(
id int,
bus_type varchar(20),
distance int,
price int);


# c.	Insert the data in the newly created tables using sql script or using MySQL UI.
#	Inserting data in the tables.

insert into passenger values 
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');  


insert into price values
(1,'Sleeper',350,770), (2,'Sleeper',500,1100), (3,'Sleeper',600,1320),
(4,'Sleeper',700,1540), (5,'Sleeper',1000,2200), (6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700), (8,'Sitting',500,620), (9,'Sitting',600,744),
(10,'Sitting',700,868), (11,'Sitting',1000,1240), (12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);


# 2.	(Medium) Perform read operation on the designed table created in the above task using SQL script. 
# i) For passenger table.
select * from passenger;

# ii) For price table.
select * from price;
 
 
# a. How many females and how many male passengers traveled a minimum distance of 600 KMs?
select gender, count(*) as count_of_passenger
from passenger 
where distance <= 600 
group by gender;


# b.	Find the minimum ticket price of a Sleeper Bus. 
select min(price) 
from price 
where bus_type = 'Sleeper';


# c.	Select passenger names whose names start with character 'S' 
select passenger_name 
from passenger 
where passenger_name like 'S%';


# d. Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
describe passenger;

select pa.Passenger_name, pa.Boarding_City, pa.Destination_City, pa.Bus_Type, pr.Price
from passenger pa
left join price pr
on pa.distance = pr.distance;


# e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select p.passenger_name, pr.price
from passenger p
inner join price pr
on p.passenger_id = pr.id
where p.distance = 1000 and p.bus_type = 'Sitting';


# f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select * from passenger where passenger_name = 'Pallavi';

select bus_type,price from price 
where distance = (select distance from passenger where passenger_name = 'Pallavi');


# g. List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
select distinct(distance) 
from passenger
order by distance desc;


# h. Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables 
select passenger_name, (distance * 100) /(select sum(distance) from passenger) as distance_percentage
from passenger;



