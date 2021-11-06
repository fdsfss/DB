-- a. combine each row of dealer table with each row of client table

select *
from client cross join dealer;

-- b. find all dealers along with client name, city, grade, sell number, date, and amount

select dealer.id, dealer.name as dealer, client.name as client, city, priority, sell.id, date, amount
from client right outer join dealer on client.dealer_id = dealer.id
    right outer join sell on sell.client_id = client.id;

-- c. find the dealer and client who belongs to same city

select dealer.name, client.name
from client inner join dealer
on client.city = dealer.location and dealer.id = client.dealer_id;

-- d. find sell id, amount, client name, city those sells where sell amount exists between
-- 100 and 500

select sell.id, amount, client.name as client, city
from sell inner join client
on sell.amount > 100 and sell.amount < 500;

-- e. find dealers who works either for one or more client or not yet join under any of
-- the clients

select * from dealer;

-- f. find the dealers and the clients he service, return client name, city, dealer name,
-- commission.

select client.name as client, client.city as city, dealer.name as dealer, dealer.charge as comission
from client full join dealer
on client.dealer_id = dealer.id;

-- g. find client name, client city, dealer, commission those dealers who received a
-- commission from the sell more than 12%

select client.name as client, client.city as city, dealer.name as dealer, dealer.charge as comission
from client inner join dealer
on dealer.charge > 0.12 and dealer.id = client.dealer_id;

-- h. make a report with client name, city, sell id, sell date, sell amount, dealer name
-- and commission to find that either any of the existing clients haven’t made a
-- purchase(sell) or made one or more purchase(sell) by their dealer or by own.

select client.name as client, client.city as city, sell.id, date, amount, dealer.name as dealer, dealer.charge as comission
from client inner join dealer on client.dealer_id = dealer.id
    inner join sell on client.id = sell.client_id;

-- i. find dealers who either work for one or more clients. The client may have made,
-- either one or more purchases, or purchase amount above 2000 and must have a
-- grade, or he may not have made any purchase to the associated dealer. Print
-- client name, client grade, dealer name, sell id, sell amount

select client.name as client, client.priority as grade, dealer.name as dealer, sell.id, amount
from client right outer join dealer on dealer.id = client.dealer_id
    left outer join sell on sell.client_id = client.id
where client.priority is not null and sell.amount > 2000;

-- 2. Create following views:

-- a. count the number of unique clients, compute average and total purchase
-- amount of client orders by each date.

create view unique_clients(number) as
    select count(distinct client.id)
    from client;
select * from unique_clients;

create view purchase_amount(date, average_amount, total_amount) as
    select date, avg(amount), sum(amount)
    from sell
    group by date order by date;
select * from purchase_amount;

-- b. find top 5 dates with the greatest total sell amount

create view top_five as
    select *
    from (select * from purchase_amount order by total_amount desc) as s
    limit 5;
select * from top_five;

-- c. count the number of sales, compute average and total amount of all
-- sales of each dealer

create view dealers_sell(dealer_name, number_of_sales,average_amount,total_amount) as
    select dealer.name, count(sell.id), avg(amount), sum(amount)
    from dealer inner join sell on dealer.id = sell.dealer_id
    group by dealer.id;
select * from dealers_sell;

-- d. compute how much all dealers earned from charge(total sell amount *
-- charge) in each location

create view dealers_earned(location, dealers_earn) as
    select location, sum(charge * amount)
    from dealer inner join sell on dealer.id = sell.dealer_id
    group by location;
select * from dealers_earned;

-- e. compute number of sales, average and total amount of all sales dealers
-- made in each location

create view sales_location(location, sal_number_of_sales, sal_average_amount, sal_total_amount) as
    select location, count(sell.id), avg(amount), sum(amount)
    from dealer inner join sell on dealer.id = sell.dealer_id
    group by location;
select * from sales_location;

-- f. compute number of sales, average and total amount of expenses in
-- each city clients made.

create view client_expenses(city, exp_number_of_sales, exp_average_amount, exp_total_amount) as
    select city, count(sell.id), avg(amount), sum(amount)
    from client inner join sell on client.id = sell.client_id
    group by city;
select * from client_expenses;

-- g. find cities where total expenses more than total amount of sales in
-- locations

create view more_expenses as
    select *
    from sales_location inner join client_expenses on sales_location.location = client_expenses.city
    where client_expenses.exp_total_amount > sales_location.sal_total_amount;
select * from more_expenses;

-- drop all views
drop view unique_clients;
drop view purchase_amount;
drop view top_five;
drop view dealers_sell;
drop view dealers_earned;
drop view sales_location;
drop view client_expenses;
drop view more_expenses;