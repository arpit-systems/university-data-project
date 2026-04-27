DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS professor;
DROP TABLE IF EXISTS teaching;

CREATE TABLE student (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE course (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT
);

CREATE TABLE enrollment (
    student_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE professor (
    professor_id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE teaching (
    professor_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (professor_id, course_id),
    FOREIGN KEY (professor_id) REFERENCES professor(professor_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO student VALUES
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