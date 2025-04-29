-- 테이블 생성
CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    teacher_id INT NOT NULL
);

-- 데이터 삽입
INSERT INTO course (id, name, teacher_id) VALUES
(1, 'Database design', 1),
(2, 'English literature', 2),
(3, 'Python programming', 1);



-- student 테이블 생성
CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- student 테이블 데이터 삽입
INSERT INTO student (id, first_name, last_name) VALUES
(1, 'Shreya', 'Bain'),
(2, 'Rianna', 'Foster'),
(3, 'Yosef', 'Naytor');



-- teacher 테이블 생성
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- teacher 테이블 데이터 삽입
INSERT INTO teacher (id, first_name, last_name) VALUES
(1, 'Taylah', 'Booker'),
(2, 'Sarah-Louise', 'Blake');



-- student_course 테이블 생성
CREATE TABLE student_course (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

-- student_course 테이블 데이터 삽입
INSERT INTO student_course (student_id, course_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1);



SELECT 
    student.id AS student_id,
    student.first_name,
    student.last_name,
    student_course.course_id
FROM 
    student
INNER JOIN student_course
ON student.id = student_course.student_id;



SELECT 
    teacher.id AS teacher_id,
    teacher.first_name,
    teacher.last_name,
    course.id AS course_id,
    course.name AS course_name
FROM 
    teacher
INNER JOIN course
ON teacher.id = course.teacher_id;



SELECT 
    course.id AS course_id,
    course.name AS course_name,
    student_course.student_id
FROM 
    course
INNER JOIN student_course
ON course.id = student_course.course_id;



