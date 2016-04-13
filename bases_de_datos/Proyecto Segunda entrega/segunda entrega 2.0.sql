create database minisuper;

use minisuper; 
create table product(
	id_product int not null,
    name_product varchar(45) not null,
    description varchar(100),
    cost int not null,
    expiration date,
    constraint pk_id_product primary key (id_product)
);

create table city(
	id_city int not null,
	name_city varchar(45),
	constraint pk_id_city primary key (id_city)
);

create table schedules(
	id_schedule int not null,
    time_begin time not null,
    time_end time not null,
    constraint pk_id_schedule primary key(id_schedule)
);


create table market(
	id_market int not null,
    id_city2 int not null,
    market_name varchar(45),
    constraint pk_id_market primary key (id_market),
    constraint fk_id_city2 foreign key (id_city2) references city(id_city)
);

create table employee(
	id_employee int not null,
    name_employee varchar(45) not null,
    cedula varchar (12),
    id_schedule2 int,
    id_market2 int not null,
    constraint pk_id_employee primary key (id_employee),
    constraint fk_id_schedule2 foreign key(id_schedule2) references schedules (id_schedule),
    constraint fk_id_market foreign key (id_market2) references market (id_market)
);
/*create table client(
	id_client int not null,
    name_client varchar(45) not null,
	nit varchar (12) not null,
    constraint pk_id_client primary key (id_client)    
);*/

create table till(
	id_till int not null,
    id_market3 int not null,
    cash int,
    constraint pk_id_till primary key (id_till),
    constraint fk_id_market3 foreign key (id_market3) references market (id_market)
);

create table invoice(
	id_invoice int not null auto_increment,
    id_employee2 int not null,
    id_till2 int not null,
    invoice_date date not null,
    constraint pk_id_invoice primary key (id_invoice),
    constraint fk_id_employee foreign key (id_employee2) references employee(id_employee),
    constraint fk_id_till2 foreign key (id_till2) references till(id_till)
);

create table invoiceline(
	id_invoiceline int not null,
    id_invoice2 int not null,
    id_product4 int not null,
    constraint pk_id_invoiceline primary key (id_invoiceline),
    constraint fk_id_invoice2 foreign key (id_invoice2) references invoice(id_invoice),
    constraint fk_id_product4 foreign key (id_product4) references product (id_product)
);

create table stocktaking(
	id_stocktaking int not null,
    id_market4 int not null,
    id_product3 int not null,
    quantity int not null,
    constraint pk_id_stocktaking primary key (id_stocktaking),
    constraint fk_id_market4 foreign key (id_market4) references market(id_market),
    constraint fk_id_product3 foreign key (id_product3) references product(id_product)
);


insert product( id_product, name_product, description, cost, expiration)
	values(001, 'Arroz', 'Arroz libra Supremo', 2000, '2018-02-01');
insert product( id_product, name_product, description, cost, expiration)
	values(002, 'Arroz', 'Arroz libra Roa', 2000, '2018-02-01');
insert product( id_product, name_product, description, cost, expiration)
	values(003, 'Arroz', 'Arroz libra Diana', 2100, '2018-02-01');
insert product( id_product, name_product, description, cost, expiration)
	values(004, 'Panela', 'Panela partida 2 KG',2500, '2012-05-28');
insert product( id_product, name_product, description, cost, expiration)
	values(005, 'Tomate', 'Tomate castilla libra',2000, '2021-01-30');
insert product( id_product, name_product, description, cost, expiration)
	values(006, 'Helado', 'Paleta de agua', 1100, '2021-08-28');
insert product( id_product, name_product, description, cost, expiration)
	values(007, 'Pan', 'Marca propia',200, '2016-06-06');
insert product( id_product, name_product, description, cost, expiration)
	values(008, 'Pasta', 'Pasta Doria 500 GM',1300, '2020-06-06');
insert product( id_product, name_product, description, cost, expiration)
	values(009, 'Lentejas', 'Marca Propia 500 GM',1500, '2017-02-01');
insert product( id_product, name_product, description, cost, expiration)
	values(010, 'Carne', 'Carne lomo 500 GM',7000, '2013-05-09');
insert product( id_product, name_product, description, cost, expiration)
	values(011, 'Pollo', 'Pollo entero andino',7000, '2016-04-13');
insert product( id_product, name_product, description, cost, expiration)
	values(012, 'Salchichas', 'Salchicha Zenu X2', 1800, '2017-10-13');
insert product( id_product, name_product, description, cost, expiration)
	values(013, 'Jamon', 'Jamon Pietran 500 GM', 9000, '2018-01-31');
insert product( id_product, name_product, description, cost, expiration)
	values(014, 'Bocadillo', 'Bocadillo Beleño 500 GM',4000, '2009-08-30');
insert product( id_product, name_product, description, cost, expiration)
	values(015, 'Tostacos', 'Tostacos 250 GM',600, '2016-04-20');
insert product( id_product, name_product, description, cost, expiration)
	values(016, 'Gatorade', 'Bebida Gatorade 1000 ml',2500, '2018-02-01');
insert product( id_product, name_product, description, cost, expiration)
	values(017, 'Jabon', 'Rindex 5000 GR', 2200, '2015-04-12');
insert product( id_product, name_product, description, cost, expiration)
	values(018, 'Aceite', 'Aceite Gourmet 3000 ml',7600, '2018-12-01');
insert product( id_product, name_product, description, cost, expiration)
	values(019, 'Margarina', 'Margarina La Fina 500 GM',3500, '2017-02-01');
insert product( id_product, name_product, description, cost, expiration)
	values(020, 'Huevos', 'Huevo AA Unidad',300, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(021, 'Garbanzo', 'Garbanzo 500 GM',2100, '2017-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(022, 'Azucar', 'Azucar Morena Riopaila 500GM',2500, '2017-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(023, 'Azucar', 'Azucar Blanco Incauca 500 GM',2600, '2017-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(024, 'Fideos', 'Fideos Doria 500 GM',1400, '2016-09-01');
insert product( id_product, name_product, description, cost, expiration)
values(025, 'Arbeja', 'Arbeja seca 500 GM',1800, '2016-09-01');
insert product( id_product, name_product, description, cost, expiration)
values(026, 'Gelatina', 'Gelatina Frutiño caja 500 GM',1200, '2018-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(027, 'Yogourt', 'Yogourt Alpina 1000 ml',2500, '2018-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(028, 'Cereal', 'Cereal Nestle 400 GM',4800, '2018-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(029, 'Harina de Trigo', 'Harina de trigo los Farallones 500 GM',1700, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(030, 'Harina de Maiz', 'Promasa',1800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(031, 'Leche entera', 'Leche Entera Alqueria 1000 ml',2000, '2016-04-21');
insert product( id_product, name_product, description, cost, expiration)
values(032, 'Leche deslactosada', 'Leche Deslactosada Alqueria',2800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(033, 'Frijol', 'Frijol Bola Roja 500 MG',2000, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(034, 'Mayonesa', 'Mayonesa 250 GM',800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(035, 'Leche en Polvo', 'Leche en polvo 500 GM',1900, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(036, 'cafe', 'Colcafe 500 GM',3200, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(037, 'Queso doble crema', 'Queso Alpina Doble Crema 500 GM',4800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(038, 'Queso Campesino', 'Queso Campesino Alpina 500 GM',4500, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(039, 'Papel Sanitario', 'Papel Familia Doble Hoja rollo',1900, '2030-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(040, 'Papel Sanitario', 'Papel Familia Hoja sencilla rollo',800, '2030-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(041, 'Atun', 'Atun Van Camps',3000, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(042, 'Sardinas', 'Sardinas Van Camps',2500, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(043, 'Gaseosa', 'Gaseosa Pepsi 2500 ml',300, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(044, 'Gaseosa', 'Gaseosa Manzana 2500 ml',3500, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(045, 'Gaseosa', 'Gaseosa 7UP 2500 ml',3500, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(046, 'Detergente liquido', 'detergente liquido Accion 100 ml',3000, '2026-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(047, 'Sal', 'Sal Refisal 500 MG',900, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(048, 'Salsa de Tomate', 'Salsa de Tomate Fruko 800 Ml',800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(049, 'Salsa Negra', 'Salsa Negra Fruko 800 ml',800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(050, 'Vinagre', 'Vinagre La constanza 800 Ml',1500, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(051, 'Mermelada', 'Mermelada Fruko 800 Ml',800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(052, 'Granola', 'Granola Nestle 500 GM',2300, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(053, 'Mani', 'Mani la Especial 250 GM',3000, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(054, 'Ponque', 'Ponque Ramo 500 GM',2000, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(055, 'Galletas', 'Galletas integrales Noe 250 GM',800, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(056, 'Chocolate', 'Chocolate Sol 500 GM',3500, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(057, 'Pasabocas', 'Pasabocas Margarita 250 GM',1200, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(058, 'Maiz pira', 'Maiz Pira 500 GM',900, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(059, 'Tostadas', 'Tostadas Bimbo 250 GM',1200, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(060, 'Servilletas', 'Servilletas Familia 500 UND',1100, '2016-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(061, 'Toallas Higienicas', 'Toallas Higienicas Nosotras 10 UND',4500, '2020-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(062, 'Gel Antibacterial', 'Gel Antibacterial Familia 400 ML',1200, '2030-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(063, 'Desengrasante', 'Desengrasante Dersa liquido 500 ml', 2300, '2020-05-01');
insert product( id_product, name_product, description, cost, expiration)
values(064, 'Shampoo', 'Shampoo sobre pantene 50 ML',500, '2030-05-01');



insert city(id_city, name_city) values (001, 'Bogota');
insert city(id_city, name_city) values (002, 'Bucaramanga');
insert city(id_city, name_city) values (003, 'Tunja');

insert schedules(id_schedule, time_begin, time_end) values(1,'06:00','14:00');
insert schedules(id_schedule, time_begin, time_end) values(2,'14:00','20:00');
insert schedules(id_schedule, time_begin, time_end) values(3,'20:00','06:00');

insert market(id_market, id_city2, market_name) values(001, 001, 'Monserrate');
insert market(id_market, id_city2, market_name) values(002, 001, 'Bacata');
insert market(id_market, id_city2, market_name) values(003, 002, 'Chicamocha');
insert market(id_market, id_city2, market_name) values(004, 002, 'Hormiga');
insert market(id_market, id_city2, market_name) values(005, 003, 'Ruana');

insert employee(id_employee, name_employee, id_schedule2, id_market2)
	values(001, 'Francisco Andres Murcia Rodriguez', 1, 001);
insert employee(id_employee, name_employee, id_schedule2, id_market2)
	values(002, 'Fredy Andres Lopez Roa', 2, 001);
insert employee(id_employee, name_employee, id_schedule2, id_market2)
	values(003, 'Hernan Rojas Camacho', 1, 002);
insert employee(id_employee, name_employee, id_schedule2, id_market2)
	values(004, 'Sebastian Manuel Mora Farfan', 2, 002);
insert employee(id_employee, name_employee, id_schedule2, id_market2)
	values(005, 'Luis Fernando Muriel Montoya', 1, 003);
insert employee(id_employee, name_employee, id_market2)
	values(006, 'Astrid Roncancio Pelaez', 003); 
insert employee(id_employee, name_employee, id_market2)
	values(007, 'Karen Tatiana Pedroza Torres', 002);     

insert till(id_till, id_market3, cash) values(001,001, 50000);
insert till(id_till, id_market3, cash) values(002,001, 50000);
insert till(id_till, id_market3, cash) values(003,002, 100000);
insert till(id_till, id_market3, cash) values(004,003, 70000);

insert invoice(id_invoice, id_employee2, id_till2, invoice_date) 
	values(001, 001, 001,'2016-03-19');
insert invoice(id_invoice, id_employee2, id_till2, invoice_date) 
	values(002, 001, 002,'2016-01-02');
insert invoice(id_invoice, id_employee2, id_till2, invoice_date) 
	values(003, 002, 001,'2013-12-24');
insert invoice(id_invoice, id_employee2, id_till2, invoice_date) 
	values(004, 003, 003,'2016-04-13');
insert invoice(id_invoice, id_employee2, id_till2, invoice_date) 
	values(005, 003, 003,'2016-04-10');
insert invoice(id_invoice, id_employee2, id_till2, invoice_date) 
	values(006, 002, 002,'2016-04-01');
insert invoice(id_invoice, id_employee2, id_till2, invoice_date) 
	values(007,004, 004,'2014-01-12');

insert invoiceline(id_invoiceline, id_invoice2, id_product4)
	values(001, 001, 002);
insert invoiceline(id_invoiceline, id_invoice2, id_product4)
	values(002, 002, 018);
insert invoiceline(id_invoiceline, id_invoice2, id_product4)
	values(003, 003, 010);    
insert invoiceline(id_invoiceline, id_invoice2, id_product4)
	values(004, 004, 012);    
insert invoiceline(id_invoiceline, id_invoice2, id_product4)
	values(005, 005, 05);   
    
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(001, 001,011,10);
 insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(002, 001,003,12);   
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(003, 002,001,1);        
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(004, 003,008,15);    
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(005, 003,012,12);    
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(006, 004,002,0);    
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(007, 004,017,07);    
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(008, 004,011,6);    
insert stocktaking(id_stocktaking, id_market4, id_product3, quantity)
	values(009, 002,005,3);    
    
     -- consultas -- -- consultas -- -- consultas -- -- consultas -- -- consultas -- -- consultas --
     
     
select * from product limit 0,4; -- consulta los primeros 4 productos

select * from product where expiration< now(); -- consulta todos los productos ya vencidos

select id_market4, id_product3, product.name_product, quantity from stocktaking inner join product on product.id_product= stocktaking.id_product3;
  
select sum(quantity) from stocktaking where stocktaking.id_market4 =1;
  
select * from employee left join schedules on employee.id_schedule2= schedules.id_schedule;

SELECT COUNT(*) FROM employee;
  
SELECT product.name_product ,COUNT(*) FROM product WHERE product.cost >5000 group by product.cost;
  
 
select till.cash as Efectivo, till.id_market3 as Supermercado, till.id_till as Caja , count(*) as CantCajas from till group by till.id_market3
HAVING sum(till.cash) >10;
  

select ArtistId from album 
	where AlbumId NOT IN 
		(select AlbumId from track where GenreId=3);
        
        
select id_employee2 from invoice 
	where id_employee2 NOT IN 
		(select id_employee from employee where employee.id_market2=1);
  
  
select id_employee2 from invoice 
	where id_employee2  IN 
		(select id_employee from employee where employee.id_market2=1);
  
  
  
select *from product;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    