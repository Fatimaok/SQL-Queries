CREATE TABLE crixus(
timestamp TIMESTAMP,
gender VARCHAR(10),	
destination VARCHAR	(50),
time_of_travel INT,	
type_of_activity VARCHAR(50),	
holiday_with VARCHAR(50),	
transportation VARCHAR(50)
);

select *
from crixus

--CASE STUDY QUESTIONS
--1. How many customers responded to the survey?
select count(*)
from crixus;

select count(*) as num_of_people
from crixus;

--2.how many male and female responded
select gender, count(*) as gender_num
from crixus
group by gender 

--3.Where is the most preferred destination
select destination,count(*) most
from crixus
group by 1
order by 2 desc
limit 1;

--4.Which destination is the least preferred
select destination,count(*) least
from crixus
group by 1
order by 2 
limit 1;

--5.Most preferred type of activity
select type_of_activity, count(*) max
from crixus
group by 1
order by 2 desc
limit 1;

--6.How would customers like to move around?
select transportation,count(*)
from crixus
group by 1
order by 2 desc;

--7. Preferred mode of holidaying
select holiday_with,count(*)
from crixus
group by 1
order by 2 desc
limit 1;

--8. When will the customers prefer to travel?
select time_of_travel,count(*) max
from crixus
group by 1
order by 2 desc;
limit 1;

--table column altercation
alter table crixus
alter column time_of_travel type text using cast(time_of_travel as text)

update crixus
set time_of_travel =
    case cast(time_of_travel as text)
	    when'1' then 'Jan'
		when'2' then 'Feb'
		when '3' then 'March'
		when '4' then 'April'
		when '5' then 'May'
		when '6' then 'June'
		when '7' then 'July'
		when '8' then 'August'
		when '9' then 'September'
		when '10' then 'October'
		when '11' then 'November'
		when '12' then 'December'
	end;
	
select time_of_travel,count(*) 
from crixus
group by 1
order by 2 desc;
