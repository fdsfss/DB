select all title, credits
from course
where credits>3;

select all building, room_number
from classroom
where building='Watson' or building='Packard';

select all course_id, title
from course
where dept_name='Comp. Sci.';

select all course.course_id, title
from section, course
where section.semester='Fall';

select all student.id, name
from student
where tot_cred>45 and tot_cred<90;

select all name
from student
where name like '%a'
      or name like '%e'
      or name like '%i'
      or name like '%o'
      or name like '%u'
      or name like '%y';

select distinct course.course_id, title
from course, prereq
where prereq_id='CS-101' and course.course_id=prereq.course_id;

