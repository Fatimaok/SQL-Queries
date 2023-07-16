create table fraudulent(
step int,	
type varchar(20),
amount float,	
nameorig varchar(50),	
oldbalanceorg float,	
newbalanceorig float,
namedest varchar(50),	
oldbalancedest float, 	
newbalancedest  float,	
isfraud	int,
isflaggedfraud int
);

select *
from fraudulent

copy public.fraudulent
from 'C:\Users\fosy9\Downloads\Fraudulent Transactions.csv'
delimiter ',' csv header

--Question 1
select type, count(*) as num_of_transactions
from fraudulent
group by type
order by 2 desc;

--Question 2
select type, count(*) as num_of_transactions
from fraudulent
group by type
order by 2 desc
limit 1;

--Question 3
 select type,round (avg(amount))
 from fraudulent
 where isfraud=1
 group by type;
 
 --Question 4
 select max(amount)
 from fraudulent;
 
 --Question 5
 select min(amount)
 from fraudulent;
 
 --Question 6
select nameorig, sum(amount)
from fraudulent
where isfraud =1
group by nameorig
order by 2 desc
 limit 20;
 
 --Question 7
 select *
 from fraudulent
 
 select sum (isflaggedfraud) as flagged_as_fraud, sum(isfraud) as fraud,sum(isfraud)/ sum (isflaggedfraud) as effectiveness 
 from fraudulent 
 
 --Question 8
 select namedest, sum(amount) as total_amount
 from fraudulent
 where isfraud =1
 group by 1
 order by 2 desc
 limit 20;
 