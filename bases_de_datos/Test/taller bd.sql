create database institute;
use institute;

create table student(
id_student INT auto_increment, 
name_student varchar(20) Not null,
birthdate DATE NOT NULL,
constraint pk_id_student primary key (id_student)
);

create table teacher(
id_teacher INT auto_increment, 
name_teacher varchar(20) Not null,
constraint pk_id_teacher primary key (id_teacher)
);

create table classroom(
id_classroom INT auto_increment, 
constraint pk_id_classroom primary key (id_classroom)
);

create table schedules(
id_schedules int not null auto_increment,
id_hour time not null, 
constraint pk_id_schedules primary key (id_schedules)
);

create table program(
id_program INT not null, 
constraint pk_id_program primary key (id_program)
);


create table payment( 
id_payment INT auto_increment not null,
constraint pk_id_payment primary key (id_payment)
);

create table course(
id_course INT auto_increment not null,
name_course VARCHAR(45),
coste INT NOT NULL,
begin_course DATE NOT NULL,
end_course DATE NOT NULL,
id_program INT not null,
constraint pk_id_course primary key (id_course),
constraint fk_program_course foreign key (id_program) references program (id_program)
);

create table teacher_has_course(
teacher_name VARCHAR(45) not null,
id_teacher INT not null,
id_course INT not null,
id_program INT not null,

constraint fk_teacherHasCourse_course foreign key (id_course) 
	references course (id_course),
constraint fk_teacherHasCourse_teacher foreign key (id_teacher) 
	references teacher (id_teacher),
constraint fk_teacherHasCourse_program foreign key (id_program) 
	references program (id_program)
);

create table groups(
id_group INT auto_increment not null,
id_course INT,
id_program INT,
id_classroom INT,
id_schedules INT,

constraint pk_id_groups primary key (id_group),

constraint fk_groups_course foreign key (id_course) 
	references course (id_course),
constraint fk_groups_program foreign key (id_program)
	references program (id_program),
constraint fk_groups_classroteacher_has_courseom foreign key (id_classroom) 
	references classroom (id_classroom),
constraint fk_groups_schedules foreign key (id_schedules) 
	references schedules (id_schedules)

);



create table studentsHasGroups(
id_student INT,
id_group INT,
id_payment INT,

constraint fk_studentsHasGroups_student foreign key (id_student) 
	references student (id_student),
constraint fk_studentsHasGroups_group foreign key (id_group)
	references groups (id_group),
constraint fk_studentsHasGroups_payment foreign key (id_payment) 
	references payment (id_payment)


);

create table grade(
id_grade INT auto_increment not null ,
id_group INT,
id_course INT,
id_program INT,

constraint pk_id_grade primary key (id_grade),

constraint fk_grade_group foreign key (id_group)
 	references groups (id_group),
constraint fk_grade_course foreign key (id_course)
 	references course (id_course),
constraint fk_grade_program foreign key (id_program)
 	references program (id_program)
);
/*     AGREDAR DATOS ESTUDIANTES */
insert into student(name_student, birthdate)
values ('Jorge Cuervo', '1994-01-24');
insert into student(name_student, birthdate)
values ('sergio rojas', '1998-11-24');
insert into student(name_student, birthdate)
values ('jenny cano', '1987-07-12');
insert into student(name_student, birthdate)
values ('esteban flores', '1970-03-01');
insert into student(name_student, birthdate)
values ('angelica garcia', '1950-12-31');
insert into student(name_student, birthdate)
values ('andrea ochoa', '1945-05-14');
insert into student(name_student, birthdate)
values ('natalia mondragon', '2001-09-09');
insert into student(name_student, birthdate)
values ('Yaneth castillo', '2098-03-05');
insert into student(name_student, birthdate)
values ('fredy medina', '2093-12-13');
insert into student(name_student, birthdate)
values ('Esperanza martinez', '1999-04-12');
/*     AGREDAR DATOS PROFESORES */
insert into teacher(name_teacher)
values ('Yonatan Cuervo');
insert into teacher(name_teacher)
values ('Sergio Lopez');
insert into teacher(name_teacher)
values ('Enrique Peñalosa');
/*    salones de clase */
insert into classroom(id_classroom) values (100);
insert into classroom(id_classroom) values (101);
insert into classroom(id_classroom) values (102);
insert into classroom(id_classroom) values (103);
insert into classroom(id_classroom) values (105);
select * from classroom;