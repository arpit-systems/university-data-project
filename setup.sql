DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS professor;
DROP TABLE IF EXISTS teaching;

-- STUDENT TABLE
CREATE TABLE student (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

-- COURSE TABLE
CREATE TABLE course (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT
);

-- ENROLLMENT TABLE
CREATE TABLE enrollment (
    student_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (student_id, course_id)
);

-- PROFESSOR TABLE
CREATE TABLE professor (
    professor_id INTEGER PRIMARY KEY,
    name TEXT
);

-- TEACHING TABLE
CREATE TABLE teaching (
    professor_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (professor_id, course_id)
);

-- STUDENTS
INSERT INTO student VALUES
(1, 'Arpit', 'arpit@gmail.com'),
(2, 'Rahul', 'rahul@gmail.com'),
(3, 'Neha', 'neha@gmail.com'),
(4, 'Aman', 'aman@gmail.com'),
(5, 'Priya', 'priya@gmail.com'),
(6, 'Karan', 'karan@gmail.com'),
(7, 'Simran', 'simran@gmail.com'),
(8, 'Rohit', 'rohit@gmail.com'),
(9, 'Anjali', 'anjali@gmail.com'),
(10, 'Vikas', 'vikas@gmail.com');

-- COURSES
INSERT INTO course VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Data Science'),
(104, 'Machine Learning'),
(105, 'Cloud Computing');

-- ENROLLMENTS (Many-to-Many)
INSERT INTO enrollment VALUES
(1,101),(1,102),(1,103),
(2,101),(2,104),
(3,102),(3,103),
(4,101),(4,105),
(5,104),(5,105),
(6,101),(6,102),
(7,103),(7,104),
(8,105),
(9,101),(9,103),
(10,102),(10,104);

-- PROFESSORS
INSERT INTO professor VALUES
(1,'Dr Sharma'),
(2,'Dr Mehta'),
(3,'Dr Verma'),
(4,'Dr Singh');

-- TEACHING
INSERT INTO teaching VALUES
(1,101),
(2,102),
(3,103),
(4,104),
(1,105);