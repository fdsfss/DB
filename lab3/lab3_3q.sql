--a
select all id, name
from student
where id in (select id
    from takes
    where course_id like 'CS-%' and (grade='A' or grade='A-'))
order by name;

--b
select all id, name
from instructor
where id in (select all i_id
    from advisor
    where s_id in (select all id
        from takes
        where grade='B-' or grade='C+' or grade='C' or grade='C-' or grade='F' or grade=null));

--c
select distinct dept_name
from student
where id not in (select all id
    from takes
    where grade='C' or grade='F')
group by dept_name;

--d
select distinct instructor.ID, name
from instructor, teaches, takes
where instructor.ID=teaches.ID and takes.course_id=teaches.course_id
  and takes.sec_id=teaches.sec_id and takes.year=teaches.year
  and grade<>'A';

--e
select course_id, title
from course
where course_id in (select course_id
    from section
    where time_slot_id='A' or time_slot_id='B' or time_slot_id='C'
       or time_slot_id='E' or time_slot_id='H');

