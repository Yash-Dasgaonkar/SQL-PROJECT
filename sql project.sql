-- Create the university database
CREATE DATABASE university;

-- Use the university database
USE university;

-- Create the school table
CREATE TABLE school (
    school_id INT PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255)
);

-- Insert 10 records into the school table
INSERT INTO school (school_id, name, location) VALUES
(1, 'School of Science', 'Science City'),
(2, 'School of Arts', 'Art Street'),
(3, 'School of Engineering', 'Tech Avenue'),
(4, 'School of Business', 'Business District'),
(5, 'School of Medicine', 'Health Campus'),
(6, 'School of Law', 'Legal Plaza'),
(7, 'School of Education', 'Learning Lane'),
(8, 'School of Music', 'Melody Square'),
(9, 'School of Agriculture', 'Farmville'),
(10, 'School of Social Sciences', 'Society Square');

-- Create the course table
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    name VARCHAR(255),
    credits INT
);

-- Insert 10 records into the course table
INSERT INTO course (course_id, name, credits) VALUES
(101, 'Mathematics', 3),
(102, 'History', 4),
(103, 'Computer Science', 4),
(104, 'Physics', 3),
(105, 'Marketing', 3),
(106, 'Biology', 4),
(107, 'Economics', 3),
(108, 'Chemistry', 4),
(109, 'English Literature', 3),
(110, 'Psychology', 3);

-- Create the student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    school_id INT,
    course_id INT,
    FOREIGN KEY (school_id) REFERENCES school(school_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Insert 10 records into the student table
INSERT INTO student (student_id, name, age, school_id, course_id) VALUES
(1, 'John Doe', 20, 1, 103),
(2, 'Jane Smith', 22, 2, 105),
(3, 'Bob Johnson', 21, 3, 101),
(4, 'Alice Williams', 23, 4, 107),
(5, 'Charlie Brown', 20, 5, 106),
(6, 'Eva Davis', 22, 6, 104),
(7, 'Mike Miller', 21, 7, 109),
(8, 'Sophie Wilson', 23, 8, 110),
(9, 'David Lee', 20, 9, 108),
(10, 'Linda Chen', 22, 10, 102);

select * from student;
select * from course;
select *  from school;



/*1) list all schools along with their locations*/
select * from school;

/*2)Find the names and credits of all courses*/
select name ,credits from course;

/*3) Retrieve the names and ages of all students*/
select name, age from student;

/*4)Get the details of the student with ID 3*/
select * from student where student_id=3;

/*5)List the courses and their credits offered by the 'School of Engineering'.*/
select * from student;
select  * from course;
select * from school;

select sc.name as school_name,c.name,c.credits from course as c
inner join  student as s on  c.course_id=s.course_id
inner join school as sc on sc.school_id=s.school_id
where sc.name="school of engineering";

/*(6)Count the number of students in each school*/
select * from student;
select * from school;

SELECT sc.name AS school_name, COUNT(*) AS student_count
FROM student s
JOIN school sc ON s.school_id = sc.school_id
GROUP BY sc.name;

/*(7) Find the average age of students.*/
select * from student;
select avg(age) as average_age from student;

/*(8)Retrieve the names of students along with the names of their schools and courses.*/
select * from student;
select * from course;
select * from school;
select s.name as student_name,sc.name as school_name, c.name as course_name from student as s 
inner join school as sc on  s.school_id=sc.school_id
inner join course as c on s.course_id= c.course_id;

/*(9)List the courses with more than 3 credits.*/
select * from course;
select name from course where credits>3;

/* 10)Get the names of students who are enrolled in courses with less than 4 credits.*/
select * from student;
select * from course;
select s.name as student_name, c.name as course_name , c.credits as course_credits from student as s
inner join course as c on s.course_id=c.course_id where c.credits<4;

select s.name as student_name,c.name as course_name,c.credits as credits from student as s
inner join course as c 
on s.course_id=c.course_id
where c.credits<4;
