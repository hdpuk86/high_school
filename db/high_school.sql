DROP TABLE student_subjects;
DROP TABLE students;
DROP TABLE subjects;

CREATE TABLE students(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE subjects(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  teacher VARCHAR(255)
);

CREATE TABLE student_subjects(
  id SERIAL4 PRIMARY KEY,
  student_id INT4 REFERENCES students(id),
  subject_id INT4 REFERENCES subjects(id)
);
