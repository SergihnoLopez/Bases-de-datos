create database taller_02;
use taller_02;

create table  driver(
id_driver int auto_increment not null,
name_driver varchar(45) not null,
address varchar(45) not null,
phome varchar(45) not null,
constraint pk_driver primary key(id_driver)
);


create table model(
id_model int not null,
number_passenger int not null,
constraint pk_model primary key(id_model)
);

create table garage(
id_garage int auto_increment not null,
capacity int not null,
constraint pk_garage primary key(id_garage)
);


create table schedule(
id_schedule int auto_increment not null,
hours time,
constraint pk_schedule primary key(id_schedule)
);

create table city(
id_city int auto_increment not null,
id_garage2 int not null,
constraint pk_city primary key(id_city),
constraint fk_garage foreign key(id_garage2) references garage(id_garage)
);

create table route(
id_route int auto_increment not null,
average_pasassager int not null,
id_city2 int,
constraint pk_route primary key (id_route),
constraint fk_city foreign key (id_city2) references city(id_city)
);

create table route_schedule(
id_schedule2 int,
id_route2 int,
constraint fk_schedule foreign key (id_schedule2) references schedule(id_schedule),
constraint fk_route foreign key (id_route2) references route(id_route)
);

create table bus(
id_bus int auto_increment not null,
id_model2 int not null,
id_driver2 int not null,
id_route3 int not null,
constraint pk_bus primary key(id_bus),
constraint fk_model foreign key(id_model2) references model(id_model),
constraint fk_driver foreign key(id_driver2) references driver(id_driver),
constraint fk_route3 foreign key(id_route3) references route(id_route)
);








