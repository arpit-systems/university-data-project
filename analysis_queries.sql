CREATE DATABASE university_db;
USE university_db;
DROP TABLE IF EXISTS student;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);
DROP TABLE IF EXISTS course;

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

DROP TABLE IF EXISTS professor;

CREATE TABLE professor (
    professor_id INT PRIMARY KEY,
    name VARCHAR(50)
);
DROP TABLE IF EXISTS enrollment;

CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
DROP TABLE IF EXISTS teaching;

CREATE TABLE teaching (
    professor_id INT,
    course_id INT,
    PRIMARY KEY (professor_id, course_id),
    FOREIGN KEY (professor_id) REFERENCES professor(professor_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

studentINSERT INTO student VALUES
(1, 'Arpit', 'arpit@gmail.com'),
(2, 'Rahul', 'rahul@gmail.com'),
(3, 'Neha', 'neha@gmail.com'),
(4, 'Simran', 'simran@gmail.com'),
(5, 'Amit', 'amit@gmail.com'),
(6, 'Priya', 'priya@gmail.com'),
(7, 'Karan', 'karan@gmail.com'),
(8, 'Sneha', 'sneha@gmail.com'),
(9, 'Rohit', 'rohit@gmail.com'),
(10, 'Anjali', 'anjali@gmail.com');

INSERT INTO course VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Data Science'),
(104, 'Machine Learning'),
(105, 'DBMS'),
(106, 'Cloud'),
(107, 'Big Data'),
(108, 'Statistics'),
(109, 'AI'),
(110, 'Data Engineering');

INSERT INTO professor VALUES
(1, 'Dr Sharma'),
(2, 'Dr Mehta'),
(3, 'Dr Singh'),
(4, 'Dr Gupta'),
(5, 'Dr Verma'),
(6, 'Dr Khan'),
(7, 'Dr Roy'),
(8, 'Dr Das'),
(9, 'Dr Jain'),
(10, 'Dr Kapoor');

INSERT INTO enrollment VALUES
(1, 101),
(1, 102),
(2, 101),
(2, 103),
(3, 104),
(4, 105),
(5, 106),
(6, 107),
(7, 108),
(8, 109);

INSERT INTO teaching VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109),
(10, 110);

SELECT * FROM student;

-- INNER JOIN: Student and Course Mapping
-- Concept: JOIN (Combining tables)
SELECT student.name, course.course_name
FROM enrollment
JOIN student ON enrollment.student_id = student.student_id
JOIN course ON enrollment.course_id = course.course_id;

-- GROUP BY + COUNT: Course Popularity Analysis
-- Concept: Aggregation + Sorting
SELECT course.course_name, COUNT(*) AS total_students
FROM enrollment
JOIN course ON enrollment.course_id = course.course_id
GROUP BY course.course_name
ORDER BY total_students DESC;

-- SUBQUERY + HAVING: Students enrolled in multiple courses
-- Concept: Subquery + GROUP BY + HAVING
SELECT name
FROM student
WHERE student_id IN (
    SELECT student_id
    FROM enrollment
    GROUP BY student_id
    HAVING COUNT(*) > 1
);

-- SUBQUERY + NOT IN: Courses with no enrollment
-- Concept: Subquery + Filtering
SELECT course_name
FROM course
WHERE course_id NOT IN (
    SELECT course_id FROM enrollment
);

-- MULTIPLE JOIN: Student + Course + Professor Mapping
-- Concept: Multiple JOIN (Relational Mapping)
SELECT student.name, course.course_name, professor.name AS professor_name
FROM enrollment
JOIN student ON enrollment.student_id = student.student_id
JOIN course ON enrollment.course_id = course.course_id
JOIN teaching ON course.course_id = teaching.course_id
JOIN professor ON teaching.professor_id = professor.professor_id;