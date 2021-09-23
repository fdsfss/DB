create table students(
    full_name varchar(50) unique primary key,
    age int not null,
    birth_date date not null,
    gender varchar(6) not null,
    average_grade double precision not null,
    info_about_student text not null,
    dormitory_is_needed boolean not null,
    add_info text
);

create table instructors(
    full_name varchar(50) unique primary key not null,
    speaks_on_eng boolean not null,
    speaks_on_rus boolean not null,
    work_experience text,
    possibility_having_remote_lessons text
);

create table course(
    room_number int unique not null primary key,
    lesson_title varchar(10) unique not null,
    teaching_instructor varchar(50) references instructors(full_name),
    students_in_this_course int not null check(students_in_this_course > 0)
);

create table attendance(
    room_num int references course(room_number),
    students_full_name varchar(50) references students(full_name),
    lesson_title varchar(10) references course(lesson_title),
    instructor varchar(50) references instructors(full_name),
    attendance boolean not null,
    primary key(room_num, lesson_title, instructor)
);