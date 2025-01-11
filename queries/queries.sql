-- List details of all departments located in (insert location)
select*
from department
where location = 'E Block'


-- List title, start and end dates of all modules run in the (insert course code)
select module_title, start_date, end_date
from module
where course_code = 'PgDIT'


-- List name, address, and salary for each female member of academic staff who manages a department
select a.first_name, a.last_name, a.address, a.salary
from AcademicStaff a, departmentManager d
where a.staff_no = d.staff_no and a.sex = 'F'


-- List name, sex, and salary for each lecturer with a PhD degree.
select first_name, last_name, sex, salary
from AcademicStaff
where qualifications like '%PhD%'


-- List last name, post, and qualifications of all members of academic staff who are employed by (insert department)
select first_name, last_name, post, qualifications
from AcademicStaff
where dept_id = 'CIS'


-- List matriculation number, last name, and sex of all students who are studying (insert module).
-- Order result alphabetically by last name.
select s.matriculation_no, s.last_name, s.sex
from Student s, StudentModule sm, Module m
where s.matriculation_no = sm.matriculation_no and m.module_code = sm.module_code and module_title = 'Multi-Media'
order by last_name


-- List staff number, last name, sex, and post of all academic staff whose salary is greater than the average salary of all academic staff.
select staff_no, last_name, sex, post
from AcademicStaff
where salary > (select avg(salary)
    			from AcademicStaff)


-- For each course with more than 10 students, list course title and the number of students (under an appropriate header)
select c.course_title, count(s.course_code) as number_of_students
from Student s, course c
where s.course_code = c.course_code
group by c.course_title
having count(s.course_code) > 10


-- List the number of female members of academic staff and the number of male members of academic staff employed by (insert department)
select sex, count(sex) as number_of_staff
from AcademicStaff
where dept_id = 'CIS'
group by sex


-- For each member of academic staff who spends more than (insert number of hours) teaching any module list the member of academic staff last name, the module title and the number of hours.
select a.last_name, m.module_title, t.hours_per_week
from AcademicStaff a
join Teaching t on a.staff_no = t.staff_no
join Module m on t.module_code = m.module_code
where hours_per_week > 6


-- For each department, list the department name, the number of female members of academic staff, and the number of male members of academic staff under appropriate headers.
select *
from (select d.dept_name as department_name, a.sex
		from Department d
    	left join AcademicStaff a on d.dept_id = a.dept_id) 
pivot (
    count(sex) 
    for sex in ('F' as female_staff_count, 'M' as male_staff_count))


-- All modules each student is taking:

select c.course_code, c.course_title, s.matriculation_no, s.first_name, s.last_name, m.module_code, m.module_title
from course c
join module m on c.course_code = m.course_code
join student s on c.course_code = s.course_code
order by course_code asc

-- Calculate module completion rates for each course:

select c.course_title, 
       round((sum(case when sm.performance = 'pass' then 1 else 0 end) * 100.0) / count(sm.matriculation_no), 2) as pass_rate
from Course c
join Student s on c.course_code = s.course_code
join StudentModule sm on s.matriculation_no = sm.matriculation_no
group by c.course_title
having count(sm.matriculation_no) > 0


-- Get all student grades for a specific module:

select a.module_code, a.assessment_type, sa.matriculation_no, s.first_name, s.last_name, sa.grade
from assessment a, studentassessment sa, student s
where a.module_code = 'MM-101' and a.assessment_id = sa.assessment_id and s.matriculation_no = sa.matriculation_no



-- The assessments a specific student will take:

select * 
from StudentModule s, assessment a
where matriculation_no = 100002 and a.module_code = s.module_code


-- The total amount of hours every member of academic staff teaches:

select staff_no, sum(hours_per_week) as total_hours
from Teaching
group by staff_no
order by total_hours desc


-- List all modules taugh by a specific member of academic Staff:

select m.module_title, t.hours_per_week
from Teaching t
join Module m on t.module_code = m.module_code
where t.staff_no = 10005


-- Identify top-performing students in each module:

select m.module_title, sa.matriculation_no, max(sa.grade) as highest_grade
from StudentAssessment sa
join Assessment a on sa.assessment_id = a.assessment_id
join Module m on a.module_code = m.module_code
group by m.module_title, sa.matriculation_no


-- Find the average grade for each module by department:

select d.dept_name, m.module_title, avg(sa.grade) as average_grade
from Module m
join Course c on m.course_code = c.course_code
join Department d on c.dept_id = d.dept_id
join Assessment a on m.module_code = a.module_code
join StudentAssessment sa on a.assessment_id = sa.assessment_id
gourp by d.dept_name, m.module_title
order by d.dept_name, average_grade desc



-- Identify modules with no students enrolled

select m.module_code, m.module_title
from Module m
left join StudentModule sm on m.module_code = sm.module_code
where sm.matriculation_no is null



-- Find members of academic staff who are not assigned to teach any module

select a.staff_no, a.first_name, a.last_name
from AcademicStaff a
left join Teaching t on a.staff_no = t.staff_no
where t.staff_no is null;
