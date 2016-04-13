create database taller_01;

use taller_01;


create table department                                  
    (
    id_department INT auto_increment,
    name_department VARCHAR(45) not null,
    constraint pk_id_department primary key (id_department)
    );
    
 create table phone
	(
	id_phone int auto_increment not null,
    number_phone varchar (12),
    constraint pk_phone primary key (id_phone)
	);   

create table clients
    (
    id_clients int auto_increment,
    name_clients varchar(40),
    nit varchar (40) not null,
    birthdate_clients varchar(20),
	id_phone int,
    constraint pk_id_clients primary key (id_clients),
	constraint fk_phone_clients foreign key(id_phone) 
		references phone (id_phone)
    );

   

create table employee                                          
    (
    id_employee int auto_increment, 
    identification varchar(20) Not null,
    name_employee varchar (40),  
    birthdate date, 
    city varchar(20),
    salary int,
    position varchar (20),
    id_department int not null, 
    constraint pk_id_employee primary key (id_employee),         
    constraint fk_employee_department foreign key (id_department) 
		references department (id_department)
	);
    
    
create table invoice                                            /* creacion de la tabla invoice*/
    (
    id_invoice int auto_increment, 
    invoice_date date, 
    price int,
    id_clients int,
    id_employee int,
    constraint pk_id_invoice primary key (id_invoice),          /*Declaracion de llave primaria para tabla invoice*/
    
    constraint fk_invoice_clients foreign key(id_clients)       /* Llamado a llave  foranea*/
        references clients (id_clients),
    constraint fk_invoice_employee foreign key(id_employee)     /* Llamado a llave  foranea*/
        references employee (id_employee)
    );

insert into department(id_department, name_department)
values (001, "gerencia");
insert into department(name_department)
values ("ventas");
insert into department(name_department)
values ("contabilidad");
insert into department(name_department)
values ("bienestar");
insert into department(name_department)
values ("mercadeo");


insert into employee(id_employee, name_employee, identification, position,birthdate, City, id_department)
values(1, "Andres Camilo Lopez Perez", "1072702578", "Gerente", "1964-01-24", "Bogota", 001);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("Javier Ignacio Molina Cano", "1015461502", "Vendedor", "1976-10-05", "Bogota", 002);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("Lillian Eugenia Gómez Álvarez", "1014274976", "asistente", "1970-11-05", "Bogota", 001);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("Gerardo Emilio Duque Gutiérrez", "1121911454", "comprador", "1976-04-09", "Cali", 003);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("Jhony Alberto Sáenz Hurtado", "1018472559", "vendedor", "1989-05-30", "Medellin", 002);
insert into employee( name_employee, identification, position,birthdate, City, id_department)
values("Germán Antonio Lotero Upegui", "1032466946", "vendedor", "1974-12-31", "Cali", 002);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("Oscar Darío Murillo González", "1026577292", "vendedor", "1956-10-05", "Bogota", 002);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("César Oswaldo Palacio Martínez", "1013649817", "contador", "1976-11-05", "Bogota", 003);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("Gloria Amparo Alzate Agudelo", "1032482154", "estadistica", "1966-04-19", "Medellin", 005);
insert into employee(name_employee, identification, position,birthdate, City, id_department)
values("Héctor Iván González Castaño", "1010204086", "enfermera", "1987-05-30", "Bogota", 004);

insert into phone( id_phone,number_phone)
values( 1, "310227678");
insert into phone(number_phone)
values( "3102176218");
insert into phone(number_phone)
values("3204831822");
insert into phone(number_phone)
values("3045503269");
insert into phone(number_phone)
values("3164000324");
insert into phone(number_phone)
values("3204831822");


insert into clients(id_clients, name_clients, nit, birthdate_clients, id_phone)
values(1, "Beatriz Elena Osorio Laverde", "899.999.094-1", "1980-12-12", 1);
insert into clients(name_clients, nit, birthdate_clients, id_phone)
values("Carlos Mario Montoya Serna", "890.928.257–9", "1967-09-12", 2);
insert into clients(name_clients, nit, birthdate_clients, id_phone)
values("Gabriel Jaime Jiménez Gómez", "891190346-1", "1985-09-05", 3);

insert into  invoice( id_invoice, id_employee, id_clients, price, invoice_date)
values (1, 1,1, 50000, '2016-03-06');
insert into  invoice(id_employee, id_clients, price, invoice_date)
values (3,2,  300000, '2016-03-05');


select * from invoice;
SELECT * FROM invoice INNER JOIN clients ON clients.id_clients = invoice.id_clients
INNER JOIN employee ON employee.id_employee = invoice.id_employee
INNER JOIN phone ON phone.id_phone = clients.id_phone;


select invoice.id_invoice,employee.name_employee,employee.position
from invoice natural join employee
where invoice.id_invoice = 2;
