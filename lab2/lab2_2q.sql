--drop table products;
--drop table costumers;
--drop table orders;
--drop table order_items;

create table products(
    id varchar(6) unique not null primary key,
    name varchar(20) unique not null,
    description text,
    price double precision not null check(price > 0)
);

insert into products values(222, 'apple', null, 62.11);
insert into products values(555, 'oranges', null, 40.34);
insert into products values(123, 'milk', null, 35.05);
insert into products values(738, 'yogurt', null, 10.78);

create table costumers(
    id integer unique not null primary key,
    full_name varchar(50) not null,
    timestamp timestamp(10) not null,
    delivery_address text not null
);

insert into costumers values(12, 'Anna Gluck', '1970-01-01 00:00:01', 'Annas_adress');
insert into costumers values(13, 'William Georges', '1970-01-01 00:00:02', 'Liams_adress');
insert into costumers values(14, 'Teresa Poretsky', '1970-01-01 00:00:03', 'Olivers_adress');
insert into costumers values(15, 'James Condon', '1970-01-01 00:00:04', 'Emmas_adress');


create table orders(
    code integer unique not null primary key,
    costumer_id int references costumers(id),
    total_sum double precision not null check(total_sum > 0),
    is_paid boolean not null
);

insert into orders values(1, 12, 4, false);
insert into orders values(2, 13, 345, true);
insert into orders values(3, 14, 100, true);
insert into orders values(4, 15, 1, true);

update orders
set is_paid=true
where code=1;

    create table order_items(
        order_code integer references orders(code),
        product_id varchar(6) references products(id),
        quantity integer not null check(quantity > 0),
        primary key(order_code, product_id)
    );

insert into order_items values(2, 555, 9);
insert into order_items values(3, 555, 3);
insert into order_items values(1, 738, 4);
insert into order_items values(3, 123, 5);
insert into order_items values(4, 222, 2);

delete from order_items where order_code=3;