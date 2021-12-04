-- 1 task a
create or replace function incrm(x integer)
returns integer as
    $$
        begin
        return $1+1;
    end;
    $$
language 'plpgsql';
-- 1 task b
create or replace function suum(integer, integer)
returns integer as
    $$
        begin
            return $1+$2;
        end
    $$
language 'plpgsql';

-- 1task c
create or replace function div2(x integer)
returns boolean as
    $$
        begin
            if x % 2 == 0 then
                return true;
            else
                return false;
            end if;
        end;

    $$
language 'plpgsql';

--1 task d
create or replace function passw(x text)
returns boolean as
    $$
        begin
            if length(x) >= 8 and length(x) <= 15 then return true;
            else return false;
            end if;
        end;
    $$
language 'plpgsql';

--1 task e
create function two_out(a integer,out a_plus integer,out a_minus integer) as
    $$
    begin
        a_plus=a+1;
        a_minus=a-1;
    end;
    $$
    language  'plpgsql';
select * from two_out(1);

-- 2 task
create table people(
    id integer primary key,
    age int,
    name varchar(60),
    birthday date,
    today date default now()

);

--а
create or replace function timest()
returns trigger as
    $$
        begin
            if(name!=new.name) then new.today = current_date;
            end if;
            return new;
        end;
    $$
language 'plpgsql';

create trigger today_1
    before update
    on people
    for each row
    execute procedure timest();
insert into people(id, name) values (9, 'dana');
update people set name = 'ddana' where name = 'dana';

-- b
create or replace function age()
returns trigger as
    $$
        begin
            update people
            set age=round((current_date-new.birthday)/365.25)
            where id = new.id;
            return new;
end;
    $$
language 'plpgsql';
create trigger neewagee after insert on people
    for each row execute procedure age();
insert into people(id, name, birthday)  values (11, 'lima', '09-08-2002');

-- c
create table product(
    id integer primary key,
    name_of_prod varchar(80),
    price integer
);

create or replace function pricee()
returns trigger as
    $$
        begin
            update product
            set price=price+0.12*price
            where id = new.id;
            return new;
        end;
    $$
language 'plpgsql';

create trigger cost after insert on product
    for each row execute procedure pricee();
insert into product(id, name_of_prod,price) values (1, 'milk', 200);

insert into product(id,name_of_prod,price) values (3, 'cheese', 223);


-- d
create or replace function stop_del() returns trigger language plpgsql
    as $$
    begin
        insert into product(id,name_of_prod,price) values(old.id,old.name,old.price);
        return old;
    end;
    $$;

create trigger del_changes
    after delete
    on product
    for each row
    execute procedure stop_del();
delete from product where id=2;
select * from product;
-- e

-- 4 task
create table employee_1(
    salary int,
    id int primary key,
    name varchar(120),
    birthday date,
    exp int,
    discount int,
    age int
);
--a
create or replace procedure salary() as
$$
    begin
        update employee
        set salary = (exp/2)*0.1*salary+salary,
            discount = (exp/2)*0.1*employee.discount + employee.discount,
            discount = (exp/5)*0.01 * employee.discount + employee.discount;
        commit;
    end;
    $$
language 'plpgsql';


-- b
create or replace procedure sallarry() as
    $$
        begin
            update employee
            set salary = salary*1.15
            where age >= 40;
            update employee
            set salary = salary*1.15*(exp/8);
            update employee
            set discount = 20 where exp >= 8;
            commit;
        end;
    $$
language 'plpgsql';

-- 5 task
create table members(
    memid integer,
    surname varchar(200),
    firstname varchar(200),
    address varchar(300),
    zipcode integer,
    telephone varchar(20),
    recommendedby integer,
    joindate timestamp
);
create table bookings(
    facid integer,
    memid integer,
    starttime timestamp,
    slots integer
);
create table facilities(
    facid integer,
    name varchar(200),
    membercost numeric,
    guestcost numeric,
    initialoutlay numeric,
    monthlymaintenance numeric
);
with recursive recommenders(recommender, member) as (
	select recommendedby, memid
		from members
	union all
	select mems.recommendedby, recs.member
		from recommenders recs
		inner join members mems
			on mems.memid = recs.recommender
)
select recs.member member, recs.recommender, mems.firstname, mems.surname
	from recommenders recs
	inner join members mems
		on recs.recommender = mems.memid
	where recs.member = 22 or recs.member = 12
order by recs.member asc, recs.recommender desc