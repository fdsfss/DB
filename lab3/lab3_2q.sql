--a
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
order by avg_salary;

--b

--c

--d
select id, name
from student
where id in (select id
    from takes
    where course_id in (select course_id
        from course
        where dept_name='Comp. Sci.' and credits>3));

--e
select all id, name
from instructor
where dept_name='Biology' or dept_name='Philosophy' or dept_name='Music';

--f
select distinct teaches.id, instructor.name
from instructor, teaches
where year=2018 and instructor.id=teaches.id and
    teaches.id not in (select id
    from teaches
    where year=2017);

select id, name from instructor where id in (select id from teaches where year='2018')
                                  and id not in (select id from teaches where year='2017');


