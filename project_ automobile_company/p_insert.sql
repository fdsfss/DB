insert into company (id, "name of the company") values (8878956, 'VAG');
insert into company (id, "name of the company") values (4162796, 'Toyota');
insert into company (id, "name of the company") values (9326031, 'General Motors');

insert into brands (id, name, company_id, annual_income) values ('8046', 'Bugatti', 8878956, 5000);
insert into brands (id, name, company_id, annual_income) values ('8663', 'Lamborghini', 8878956, 2000);
insert into brands (id, name, company_id, annual_income) values ('0452', 'Lexus', 4162796, 5000);
insert into brands (id, name, company_id, annual_income) values ('3524', 'Toyota', 4162796, 4000);
insert into brands (id, name, company_id, annual_income) values ('9432', 'Cadillac', 9326031, 7000);
insert into brands (id, name, company_id, annual_income) values ('8232', 'Chevrolet', 9326031, 1000);

insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('5439', 'Bugatti Chiron', '8046', 100, 10, 2);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('8472', 'Bugatti Veyron Grand Sport', '8046', 200, 10, 3);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('8214', 'Lamborghini Aventador', '8663', 300, 10, 4);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('3546', 'Lamborghini Gallardo', '8663', 100, 10, 2);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('6650', 'Lexus GX', '0452', 200, 10, 3);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('1432', 'Lexus ES', '0452', 300, 10, 6);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('3877', 'Toyota Highlander', '3524', 100, 10, 7);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('7321', 'Toyota Corolla', '3524', 200, 10, 3);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('0005', 'Cadillac BLS', '9432', 300, 10, 5);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('1234', 'Cadillac ATS', '9432', 100, 10, 3);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('7212', 'Aveo HB', '8232', 200, 10, 2);
insert into models (id, name_of_the_model, brand_id, price, in_stock, sale) values ('3321', 'Cobalt', '8232', 300, 10, 4);

insert into color (color_name, id_model) values ('Puce', '5439');
insert into color (color_name, id_model) values ('Indigo', '8472');
insert into color (color_name, id_model) values ('Pink', '8214');
insert into color (color_name, id_model) values ('Goldenrod', '3546');
insert into color (color_name, id_model) values ('Fuscia', '6650');
insert into color (color_name, id_model) values ('Khaki', '1432');
insert into color (color_name, id_model) values ('Aquamarine', '3877');
insert into color (color_name, id_model) values ('Turquoise', '7321');
insert into color (color_name, id_model) values ('Indig', '0005');
insert into color (color_name, id_model) values ('Green', '1234');
insert into color (color_name, id_model) values ('Teal', '7212');
insert into color (color_name, id_model) values ('Mauv', '3321');

insert into main_factory (name, address, num_of_produced_cars, "foundation date") values ('Yundt, Johns and Okuneva', '96398 Myrtle Drive', '20', '1/8/2020');
insert into main_factory (name, address, num_of_produced_cars, "foundation date") values ('VonRueden, Mann and Schroeder', '1100 Northfield Way', '15', '09/09/2021');

insert into details_factory (id, "detail id", "model id", field) values ('11315', '90390', '5439', '62');
insert into details_factory (id, "detail id", "model id", field) values ('25324', '56982', '0005', '64');
insert into details_factory (id, "detail id", "model id", field) values ('23211', '63211', '7212', '51');
insert into details_factory (id, "detail id", "model id", field) values ('71326', '99321', '3321', '60');
insert into details_factory (id, "detail id", "model id", field) values ('30468', '36415', '6650', '94');

insert into transmission (id, name, "model id") values ('81', 'Manual transmission', '8200');
insert into transmission (id, name, "model id") values ('70', 'Automatic transmission', '572');
insert into transmission (id, name, "model id") values ('5', 'Manual transmission', '31821');
insert into transmission (id, name, "model id") values ('252', 'Automatic transmission', '89');
insert into transmission (id, name, "model id") values ('44', 'Continuously variable transmission', '0');
insert into transmission (id, name, "model id") values ('29500', 'Automatic transmission', '981');
insert into transmission (id, name, "model id") values ('81361', 'Manual transmission', '229');
insert into transmission (id, name, "model id") values ('00', 'Continuously variable transmission', '121');
insert into transmission (id, name, "model id") values ('0734', 'Manual transmission', '33');
insert into transmission (id, name, "model id") values ('21143', 'Automatic transmission', '1');
insert into transmission (id, name, "model id") values ('337', 'Manual transmission', '0');
insert into transmission (id, name, "model id") values ('7', 'Manual transmission', '27537');

insert into vehicles (vin, "model id") values ('WVGEF9BP8FD626315', '5439');
insert into vehicles (vin, "model id") values ('1FMJU1G50AE489139', '5439');
insert into vehicles (vin, "model id") values ('3LN6L2G96DR475820', '8472');
insert into vehicles (vin, "model id") values ('WAUJF78K89N123334', '8214');
insert into vehicles (vin, "model id") values ('JM1NC2LF0E0464549', '8214');
insert into vehicles (vin, "model id") values ('WAUMFAFH1FN941016', '3546');
insert into vehicles (vin, "model id") values ('YV140MAK3F1689473', '6650');
insert into vehicles (vin, "model id") values ('1GYUKJEF3AR706952', '1432');
insert into vehicles (vin, "model id") values ('1FTEW1CW6AK260495', '3877');
insert into vehicles (vin, "model id") values ('WDDNG9FB6CA612657', '7321');
insert into vehicles (vin, "model id") values ('WBA3D5C50FK654092', '0005');
insert into vehicles (vin, "model id") values ('WAURFAFR8EA326824', '1234');
insert into vehicles (vin, "model id") values ('WBA4A5C59FG285622', '7212');
insert into vehicles (vin, "model id") values ('JM1NC2JF0D0893336', '3321');
insert into vehicles (vin, "model id") values ('JM3ER2W36A0966046', '3546');
insert into vehicles (vin, "model id") values ('5N1AR2MM5DC436104', '7321');
insert into vehicles (vin, "model id") values ('VNKKTUD35FA161885', '3877');
insert into vehicles (vin, "model id") values ('5UXFG8C51AL024625', '3321');

insert into parking (vin, model, date_of_manufacture, address) values ('WVGEF9BP8FD626315', 'Bugatti Chiron', '3/9/2019', '1728 Jackson Parkway');
insert into parking (vin, model, date_of_manufacture, address) values ('YV140MAK3F1689473', 'Lexus GX', '5/2/2020', '83952 Warbler Place');

insert into dealer (id, "first name", "second name", "parking_address") values ('0', 'Rosemonde', 'Pennycook', '1728 Jackson Parkway');
insert into dealer (id, "first name", "second name", "parking_address") values ('7263', 'Benjamen', 'Nasey', '83952 Warbler Place');