create table company(
  id integer primary key,
  "name of the company" varchar(255) unique
);

create table brands(
  id integer primary key,
  name varchar(255) unique,
  company_id integer references company(id),
  annual_income integer
);

create table models (
  id integer primary key,
  name_of_the_model varchar(255) unique,
  brand_id integer references brands(id),
  price integer,
  in_stock integer,
  sale integer
);

create table color (
  color_name varchar(20) unique,
  id_model integer unique
);

create table "main_factory" (
  "name" varchar(255) primary key,
  "address" text,
  "num_of_produced_cars" integer,
  "foundation date" timestamp
);

create table "details_factory" (
  "id" integer,
  "detail id" integer unique,
  "model id" integer references models(id),
  "field" integer primary key
);

create table "transmission" (
  "id" integer,
  "name" varchar(255),
  "model id" integer
);

create table "vehicles" (
  "vin" varchar(20) primary key,
  "model id" integer references models(id)
);

create table "parking" (
  "vin" varchar references vehicles(vin),
  "model" varchar references models(name_of_the_model),
  "date_of_manufacture" timestamp,
  "address" text primary key
);

create table "dealer" (
  "id" integer primary key,
  "first name" varchar(255),
  "second name" varchar(255),
  "parking_address" varchar references parking(address)
);

create table "costumer" (
  "id" integer primary key,
  "first name" varchar(255),
  "second name" varchar(255),
  "address" text,
  "phone num" integer,
  "gender" varchar(1),
  "annual income" integer
);

create table "purchase" (
  "dealer id" integer references dealer(id),
  "costumer id" integer references costumer(id),
  "vin" varchar(20) references vehicles(vin),
  "data" timestamp,
  "mark" varchar(255) references brands(name),
  "model" varchar(255) references models(name_of_the_model),
  "color" varchar references color(color_name),
  "contract_num" integer primary key
);

create table "mechanic" (
  "full name" text primary key,
  "contact num" integer references purchase(contract_num)
);

create table "engine" (
  "id" integer unique,
  "name" varchar(255),
  "model id" integer references models(id)
);

create table "detail" (
  "part_of" varchar references models(name_of_the_model),
  "field"  integer primary key
);

create table "supplier" (
  "id" integer unique not null,
  "detail" integer references details_factory("detail id"),
  "model" varchar(255) references models(name_of_the_model)
);

create table "body styles" (
  "model" varchar references models(name_of_the_model),
  "2-door" bool,
  "4-door" bool,
  "wagon" bool,
  "universal" bool,
  "sedan" bool,
  "field" integer
);

