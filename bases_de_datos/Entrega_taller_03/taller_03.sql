/***********CREACION DE LA BASE DE DATOS***********/
create database taller_03;


/***********USO DE LA BASE DE DATOS***********/
use taller_03;


/***********CREACION DE LAS TABLAS***********/
create table program(
    id_program INT not null,
    name_program varchar(60) not null,
    constraint pk_id_program primary key (id_program)
);

create table payment(
    id_payment INT auto_increment not null,
    way_pay varchar(10) not null,
    constraint pk_id_payment primary key (id_payment)
);

create table schedule(
    id_schedule int not null auto_increment,
    id_hour time not null,
    constraint pk_id_schedule primary key (id_schedule)
);

create table classroom(
    id_classroom INT auto_increment,
    constraint pk_id_classroom primary key (id_classroom)
);


create table teacher(
    id_teacher INT auto_increment,
    name_teacher varchar(45) Not null,
    constraint pk_id_teacher primary key (id_teacher)
);
create table course(
    id_course INT auto_increment not null,
    name_course VARCHAR(45),
    coste INT NOT NULL,
    id_program2 INT not null,
    constraint pk_id_course primary key (id_course),
    constraint fk_program_course foreign key (id_program2) references program (id_program)
);


create table groups(
    id_groups INT auto_increment not null,
    id_course2 INT,
    id_classroom2 INT,
    id_schedule2 INT,
    begin_course DATE NOT NULL,
    end_course DATE NOT NULL,
    constraint pk_id_groups primary key (id_groups),
    constraint fk_groups_course foreign key (id_course2)
    references course (id_course),
    constraint fk_groups_classroteacher_has_courseom foreign key (id_classroom2)
    references classroom (id_classroom),
    constraint fk_groups_schedule foreign key (id_schedule2)
    references schedule (id_schedule)

);
create table student(
    id_student INT auto_increment,
    name_student varchar(50) Not null,
    birthdate DATE NOT NULL,
    id_groups2 int not null,
    constraint pk_id_student primary key (id_student),
    constraint fk_groups foreign key (id_groups2) references groups(id_groups)
);

create table date_payment(
    id_student4 INT not null,
    id_payment2 int not null,
    date_pay date not null,
    constraint fk_student3 foreign key(id_student4) references student(id_student),
    constraint fk_payment2 foreign key(id_payment2) references payment(id_payment)
);

create table teacher_hasgroups(
    id_teacher2 int not null,
    id_course3 INT not null,
    constraint fk_teacher2 foreign key(id_teacher2) references teacher(id_teacher),
    constraint fk_course3 foreign key(id_course3) references course(id_course)
);

create table teacher_can_hasgroups(
    id_teacher3 int not null,
    id_course4 INT not null,
    constraint fk_teacher3 foreign key(id_teacher3) references teacher(id_teacher),
    constraint fk_course4 foreign key(id_course4) references course(id_course)
);
/***********INSERT DE LOS DATOS***********/


/************PROGRAMA ACADEMICO**********/
insert into program(id_program, name_program)
values (0001, "Tecnologia informatica");

/****************PAGOS**********************/
insert into payment(id_payment, way_pay)
values(1, "efectivo");
insert into payment(id_payment, way_pay)
values(2, "tarjeta");
insert into payment(id_payment, way_pay)
values(3, "cheque");

/****************HORARIO**********************/

insert into schedule(id_schedule, id_hour)
values (1, 070000);
insert into schedule( id_hour)
values (090000);
insert into schedule( id_hour)
values (110000);
insert into schedule( id_hour)
values (130000);
insert into schedule( id_hour)
values (150000);
insert into schedule( id_hour)
values (170000);
insert into schedule( id_hour)
values (180000);
insert into schedule( id_hour)
values (200000);


/***********SALONES***********/
insert into classroom(id_classroom) values(101);
insert into classroom(id_classroom) values(102);
insert into classroom(id_classroom) values(103);
insert into classroom(id_classroom) values(201);
insert into classroom(id_classroom) values(202);
insert into classroom(id_classroom) values(203);
insert into classroom(id_classroom) values(301);


/***********PROFESORES***********/

insert into  teacher(id_teacher, name_teacher) values(1, "Carlos Alberto Romero Camacho");
insert into  teacher(name_teacher) values("Rafael Castro Garcia");
insert into  teacher(name_teacher) values("Oscar Leon Perez Gonzales");
insert into  teacher(name_teacher) values("Andrea Franco Rivera");



insert into course(id_course, name_course, coste, id_program2) values(1,"Programacion Basica", 50000, 0001);
insert into course(id_course, name_course, coste, id_program2) values(2,"Mantenimiento de Computadores", 100000, 0001);
insert into course(id_course, name_course, coste, id_program2) values(3,"Bases de datos", 300000, 0001);
insert into course(id_course, name_course, coste, id_program2) values(4,"Electronica Digital", 100, 0001);
insert into course(id_course, name_course, coste, id_program2) values(5,"Redes", 170000, 0001);

insert into groups(id_groups, id_course2, id_classroom2, id_schedule2, begin_course, end_course)
values (1, 1, 301, 6, '2016-02-02', '2016-06-02');
insert into groups( id_course2, id_classroom2, id_schedule2, begin_course, end_course)
values (3, 101, 2, '2016-02-02', '2016-06-02');
insert into groups( id_course2, id_classroom2, id_schedule2, begin_course, end_course)
values (2, 103, 8, '2016-02-02', '2016-06-02');
insert into groups( id_course2, id_classroom2, id_schedule2, begin_course, end_course)
values (5, 202, 3, '2016-02-02', '2016-06-02');
insert into groups( id_course2, id_classroom2, id_schedule2, begin_course, end_course)
values (4, 102, 4, '2016-02-02', '2016-06-02');



insert into student(id_student,  name_student, birthdate, id_groups2)
values(1, "Nancy Rivera Palacio", '1992-04-20', 1);
insert into student(name_student, birthdate, id_groups2)
values("German Andres Paez Vargas", '1994-08-05', 1);
insert into student(name_student, birthdate, id_groups2)
values("Gustavo Adolfo Murcia Padilla", '1986-01-24', 1);
insert into student(name_student, birthdate, id_groups2)
values("Gerardo Emilio Duque Gutierrez", '1970-03-02', 2);
insert into student(name_student, birthdate, id_groups2)
values("Gloria Amparo Alzate Agudelo", '1970-08-16', 3);
insert into student(name_student, birthdate, id_groups2)
values("Lillian Eugenia Gomez Alvarez", '1992-08-20', 3);
insert into student(name_student, birthdate, id_groups2)
values("Maria Camila Sotelo Sierra", '1995-06-06', 4);
insert into student(name_student, birthdate, id_groups2)
values("Andres Camilo Lopez Perez", '1998-12-20', 4);
insert into student(name_student, birthdate, id_groups2)
values("Laura Daniela Montenegro Saavedra", '2000-11-06', 4);
insert into student(name_student, birthdate, id_groups2)
values("Sandra Milena Rodriguez Franco", '1988-12-03', 4);
insert into student(name_student, birthdate, id_groups2)
values("Liliana Martinez Fajardo", '1995-07-16', 4);
insert into student(name_student, birthdate, id_groups2)
values("Miguel Antonio Caro Restrepo", '1998-07-06', 5);
insert into student(name_student, birthdate, id_groups2)
values("Carolina Pacheco Duarte", '1999-12-16', 5);
insert into student(name_student, birthdate, id_groups2)
values("Hector Ivan Gonzalez Correa", '1984-03-11', 5);


insert into date_payment( id_student4, id_payment2, date_pay) values(1, 1,'2016-02-12');
insert into date_payment( id_student4, id_payment2, date_pay) values(2, 1,'2016-02-02');
insert into date_payment( id_student4, id_payment2, date_pay) values(3, 1,'2016-02-01');
insert into date_payment( id_student4, id_payment2, date_pay) values(4, 1,'2016-01-14');
insert into date_payment( id_student4, id_payment2, date_pay) values(5, 1,'2016-02-20');
insert into date_payment( id_student4, id_payment2, date_pay) values(6, 1,'2016-01-05');
insert into date_payment( id_student4, id_payment2, date_pay) values(7, 1,'2016-03-13');
insert into date_payment( id_student4, id_payment2, date_pay) values(8, 1,'2016-02-12');
insert into date_payment( id_student4, id_payment2, date_pay) values(9, 1,'2016-01-12');
insert into date_payment( id_student4, id_payment2, date_pay) values(10, 1,'2016-02-23');
insert into date_payment( id_student4, id_payment2, date_pay) values(11, 1,'2016-01-17');
insert into date_payment( id_student4, id_payment2, date_pay) values(12, 1,'2016-01-30');
insert into date_payment( id_student4, id_payment2, date_pay) values(13, 1,'2016-01-21');
insert into date_payment( id_student4, id_payment2, date_pay) values(14, 1,'2016-01-15');


insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (1,5);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (1,2);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (1,3);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (1,1);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (2,2);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (2,4);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (2,5);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (3,5);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (3,1);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (3,4);
insert into  teacher_can_hasgroups(id_teacher3, id_course4) values (4,3);

insert into  teacher_hasgroups(id_teacher2, id_course3) values (1,5);
insert into  teacher_hasgroups(id_teacher2, id_course3) values (1,2);
insert into  teacher_hasgroups(id_teacher2, id_course3) values (2,4);
insert into  teacher_hasgroups(id_teacher2, id_course3) values (3,1);
insert into  teacher_hasgroups(id_teacher2, id_course3) values (4,3);

/*********ESTUDIANTES DE UN GRUPO***********/

select * from student where id_groups2 = 1;

/*********LOS CURSOS UN DOCENTE PUEDE IMPARTIR***********/

SELECT * from  teacher_hasgroups 
inner JOIN teacher on teacher_hasgroups.id_teacher2 = teacher.id_teacher 
inner JOIN course on teacher_hasgroups.id_course3 = course.id_course
WHERE teacher_hasgroups.id_teacher2 =1;

/*********LOS CURSOS QUE UN DOCENTE PUEDE IMPARTIR***********/

SELECT * from  teacher_can_hasgroups 
inner JOIN teacher on teacher_can_hasgroups.id_teacher3 = teacher.id_teacher 
inner JOIN course on teacher_can_hasgroups.id_course4 = course.id_course
WHERE teacher_can_hasgroups.id_teacher3 =4;

/***********ESTUDIANTES MENORES******************/

select id_student, name_student, birthdate from student  where('1998-02-07' > student.birthdate );

/*********PAGOS EN EFECTIVO MES ACTUAL***********/

SELECT * FROM date_payment WHERE date_payment.date_pay BETWEEN '2016-03-01'  AND '2016-06-06';

/*********ESTUDIANTES MOROSOS***********/

select * from student  join  date_payment on date_payment.id_student4= student.id_student 
join groups on id_groups2=id_groups
where(date_payment.date_pay > groups.begin_course) and  id_groups2=1;

/*********LOS DOCENTES QUE PUEDEN IMPARTIR UN CURSO***********/

select * from course join  teacher_can_hasgroups on course.id_course= teacher_can_hasgroups.id_course4
join teacher on teacher.id_teacher = teacher_can_hasgroups.id_teacher3
where id_course=1;

/*************CURSOS QUE COMIENZAN EN X FECHA***************/

SELECT * FROM groups WHERE groups.begin_course BETWEEN '2016-01-28'  AND '2016-02-20';


