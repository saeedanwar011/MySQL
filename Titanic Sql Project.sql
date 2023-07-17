create database titanic_project;

-- Check table 
select * from titanic;

-- Show the first 10 rows of the dataset.
select * from titanic
limit 10;
select * from titanic
order by PassengerId desc
limit 10;


-- Find the number of Passengers who survied.
select count(*) From titanic 
where Survived;


-- Find the average age of all passangers..
select avg(age) from titanic;


-- Find the numbers of passangers in each class.
select Pclass, count(*) as 'no.of passangeers' from titanic
group by Pclass;


-- Find the first 10 rows of the datased sorted by passangers class in desecending order.
select count(*) as 'no.of passangeers' from titanic
group by Pclass
order by Pclass asc;


-- Find the average fare paid by each class of passangers.
select avg(Fare), Pclass from titanic
group by Pclass;


-- Find the name of the passanger with higest fare.
select Name, Fare from titanic
where Fare = (select max(Fare) from titanic);


-- Find the name of the passanger who had the higest age among the survivers.
select Name, Age from titanic
where Age = (select max(Age) from titanic);


-- Find the number of passenger who paid more than the average fare.
select count(*) as 'num_passanger' from titanic
where fare > (select avg(fare) from titanic);


-- Find the name of the passenger who had the most parents of childern on board.
select Name, Parch from titanic
where Parch = (select max(Parch) from titanic);


/* Find the number of mala and female passsebgers who survived, 
and order the results by sex in ascending order*/
select sex,count(*) as survived_by_sex  from titanic 
where Survived = 1
group by Sex
order by Survived asc;


-- Find the name, age , of the youngerst female passenger who survied in third class.
select Name, Age from titanic
where sex = 'Female' and Pclass = 3 and survived = 1 and age = (select min(age) from titanic
where sex = 'Female' and Pclass = 3 and survived = 1 );


-- Find the name , age and fare of the oldest passenger who survived.
select Name, Age, Fare from titanic
where Age = (select  max(Age) from titanic where survived = 1);


-- Find the no. of male and female passengers
select
sum(case when sex = 'Male' then 1 else 0 end) as num_male,
sum(case when sex = 'Female' then 1 else 0 end) as num_female
from titanic;


-- Select all the passenger who traveled in cabin that was not shared by other passengers.
select * from titanic
where cabin not in ( select Cabin from titanic 
group by cabin 
having count(*) > 1);