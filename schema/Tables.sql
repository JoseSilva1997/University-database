-- Create Department Table
CREATE TABLE Department (
    dept_id VARCHAR2(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR2(40) UNIQUE NOT NULL,
    phone_no VARCHAR2(20) UNIQUE NOT NULL,
    fax_no VARCHAR2(20) UNIQUE,
    location VARCHAR2(200) NOT NULL,
    manager_id NUMBER(4) UNIQUE
);

-- Create DepartmentManager Table
CREATE TABLE DepartmentManager (
    manager_id NUMBER(4) PRIMARY KEY NOT NULL,
    staff_no NUMBER(6) NOT NULL,
    start_date DATE NOT NULL
);

CREATE SEQUENCE dept_mgr_seq START WITH 100;

-- Dynamically update department manager id
CREATE OR REPLACE TRIGGER trg_manager_id
BEFORE INSERT ON DepartmentManager
FOR EACH ROW
WHEN (NEW.manager_id IS NULL)
BEGIN
    SELECT dept_mgr_seq.NEXTVAL INTO :NEW.manager_id FROM DUAL;
END;
/

-- Create Course Table
CREATE TABLE Course (
    course_code VARCHAR2(20) PRIMARY KEY NOT NULL,
    course_title VARCHAR2(100) UNIQUE NOT NULL,
    duration_in_years NUMBER(1),
    course_leader NUMBER(6) UNIQUE,
    dept_id VARCHAR2(10)
);

-- Create Module Table
CREATE TABLE Module (
    module_code VARCHAR2(15) PRIMARY KEY NOT NULL,
    module_title VARCHAR2(100) UNIQUE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    module_coordinator NUMBER(6),
    course_code VARCHAR2(20)
);

-- Create Texts Table
CREATE TABLE Texts (
    isbn VARCHAR2(13) PRIMARY KEY NOT NULL,
    title VARCHAR2(100),
    publisher VARCHAR2(25),
    author VARCHAR2(50),
    edition VARCHAR2(20),
    module_code VARCHAR2(15)
);

COMMENT ON COLUMN Texts.isbn IS 'ISBN-13 format';

-- Create Student Table
CREATE TABLE Student (
    matriculation_no NUMBER(7) PRIMARY KEY NOT NULL,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    DOB DATE NOT NULL,
    sex CHAR(1) CHECK (sex IN ('M', 'F')) NOT NULL,
    financial_loan NUMBER(5),
    nok_name VARCHAR2(100),
    nok_address VARCHAR2(100),
    nok_phone VARCHAR2(20) UNIQUE,
    nok_relationship VARCHAR2(15),
    user_id CHAR(7) UNIQUE,
    address_id NUMBER(6),
    course_code VARCHAR2(20)
);

CREATE SEQUENCE student_seq START WITH 100000;

-- Generate and populate matriculation_no and user_id
CREATE OR REPLACE TRIGGER trg_generate_matriculation_no_user_id
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    -- Generate matriculation_no if NULL
    IF :NEW.matriculation_no IS NULL THEN
	SELECT student_seq.NEXTVAL INTO :NEW.matriculation_no FROM DUAL;
    END IF;

    -- Generate user_id using the generated matriculation_no
    :NEW.user_id :=
	SUBSTR(:NEW.first_name, 1, 2) ||
	SUBSTR(:NEW.last_name, 1, 2) ||
	SUBSTR(TO_CHAR(:NEW.matriculation_no), -3);
END;
/

-- Create StudentAddress Table
CREATE TABLE StudentAddress (
    address_id NUMBER(6) PRIMARY KEY NOT NULL,
    town VARCHAR2(30) NOT NULL,
    street VARCHAR2(100) NOT NULL,
    post_code VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE student_address_seq START WITH 100000;

-- Dynamically update address_id
CREATE OR REPLACE TRIGGER trg_address_id
BEFORE INSERT ON StudentAddress
FOR EACH ROW
WHEN (NEW.address_id IS NULL)
BEGIN
    SELECT student_address_seq.NEXTVAL INTO :NEW.address_id FROM DUAL;
END;
/

-- Create StudentModule Table
CREATE TABLE StudentModule (
    matriculation_no NUMBER(7) NOT NULL,
    module_code VARCHAR2(15) NOT NULL,
    performance CHAR(4) CHECK (performance IN ('pass', 'fail')),
    PRIMARY KEY (matriculation_no, module_code)
);

-- Populate StudentModule table with each module a student is taking.
CREATE OR REPLACE TRIGGER trg_populate_student_module
AFTER INSERT ON Student
FOR EACH ROW
BEGIN
    -- Insert records into StudentModule for all modules in the student's course
    INSERT INTO StudentModule (matriculation_no, module_code, performance)
    SELECT :NEW.matriculation_no, m.module_code, NULL
    FROM Module m
    WHERE m.course_code = :NEW.course_code;
END;
/

-- Create Assessment Table
CREATE TABLE Assessment (
    assessment_id NUMBER(5) PRIMARY KEY NOT NULL,
    module_code VARCHAR2(15) NOT NULL,
    assessment_type VARCHAR2(100),
    weight NUMBER(3) CHECK (weight BETWEEN 5 AND 100)
);

CREATE SEQUENCE assessment_seq START WITH 1000;

-- Dynamically update the assessment_id
CREATE OR REPLACE TRIGGER trg_assessment_id
BEFORE INSERT ON Assessment
FOR EACH ROW
WHEN (NEW.assessment_id IS NULL)
BEGIN
    SELECT assessment_seq.NEXTVAL INTO :NEW.assessment_id FROM DUAL;
END;
/

-- Create StudentAssessment Table
CREATE TABLE StudentAssessment (
    assessment_id NUMBER(5) NOT NULL,
    matriculation_no NUMBER(7) NOT NULL,
    grade NUMBER(5,2) NOT NULL,
    PRIMARY KEY (assessment_id, matriculation_no)

);

-- Ensure the student is enrolled in the module before inserting grade.
CREATE OR REPLACE TRIGGER trg_validate_assessment
BEFORE INSERT OR UPDATE ON StudentAssessment
FOR EACH ROW
DECLARE
    v_module_code_assessment VARCHAR2(15);
    v_module_code_student VARCHAR2(15);
BEGIN
    -- Get the module_code associated with the assessment_id
    SELECT module_code
    INTO v_module_code_assessment
    FROM Assessment
    WHERE assessment_id = :NEW.assessment_id;

    -- Get the module_code associated with the student in StudentModule
    SELECT module_code
    INTO v_module_code_student
    FROM StudentModule
    WHERE matriculation_no = :NEW.matriculation_no
      AND module_code = v_module_code_assessment;

    -- If no match is found, raise an error
    IF v_module_code_student IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'The assessment_id is not associated with a module the student is enrolled in.');
    END IF;
END;
/

-- Create AcademicStaff Table
CREATE TABLE AcademicStaff (
    staff_no NUMBER(6) PRIMARY KEY NOT NULL,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    phone_extension_no VARCHAR2(20),
    office_no VARCHAR2(20),
    sex CHAR(1) CHECK (sex IN ('M', 'F')) NOT NULL,
    salary NUMBER(8,2) NOT NULL,
    post VARCHAR2(30) NOT NULL,
    qualifications VARCHAR2(200),
    address VARCHAR2(100),
    user_id CHAR(7) UNIQUE,
    dept_id VARCHAR2(10) NOT NULL
);

CREATE SEQUENCE staff_seq START WITH 10000;

-- Dynamically update staff_id and user_id
CREATE OR REPLACE TRIGGER trg_staff_id_user_id
BEFORE INSERT ON AcademicStaff
FOR EACH ROW
BEGIN
    -- Generate staff_no if NULL
    IF :NEW.staff_no IS NULL THEN
        SELECT staff_seq.NEXTVAL INTO :NEW.staff_no FROM DUAL;
    END IF;

    -- Generate user_id using the generated staff_no
    :NEW.user_id := 
        SUBSTR(:NEW.first_name, 1, 2) || 
        SUBSTR(:NEW.last_name, 1, 2) || 
        SUBSTR(TO_CHAR(:NEW.staff_no), -3);
END;
/

-- Create Teaching Table
CREATE TABLE Teaching (
    module_code VARCHAR2(15) NOT NULL,
    staff_no NUMBER(6) NOT NULL,
    hours_per_week NUMBER(4,2) CHECK (hours_per_week <= 20),
    PRIMARY KEY (module_code, staff_no)
);

-- Ensure the teacher and the module belong to the same department
CREATE OR REPLACE TRIGGER trg_validate_teaching
BEFORE INSERT OR UPDATE ON Teaching
FOR EACH ROW
DECLARE
    teacher_dept_id VARCHAR(10);
    module_dept_id VARCHAR(10);
BEGIN
    -- Get the department of the teacher
    SELECT dept_id INTO teacher_dept_id
    FROM AcademicStaff
    WHERE staff_no = :NEW.staff_no;

    -- Get the department of the module
    SELECT dept_id INTO module_dept_id
    FROM Module m
    JOIN Course c ON m.course_code = c.course_code
    WHERE m.module_code = :NEW.module_code;

    -- Check if the departments match
    IF teacher_dept_id != module_dept_id THEN
        RAISE_APPLICATION_ERROR(-20002, 'Teacher and module must belong to the same department.');
    END IF;
END;
/

-- Foreign keys for Department
ALTER TABLE Department
ADD FOREIGN KEY (manager_id) REFERENCES DepartmentManager(manager_id) ON DELETE SET NULL;

-- Foreign keys for DepartmentManager
ALTER TABLE DepartmentManager
ADD FOREIGN KEY (staff_no) REFERENCES AcademicStaff(staff_no) ON DELETE CASCADE;

-- Foreign keys for Course
ALTER TABLE Course
ADD FOREIGN KEY (course_leader) REFERENCES AcademicStaff(staff_no) ON DELETE SET NULL;

ALTER TABLE Course
ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE SET NULL;

-- Foreign keys and constraints for Module
ALTER TABLE Module
ADD FOREIGN KEY (module_coordinator) REFERENCES AcademicStaff(staff_no) ON DELETE SET NULL;

ALTER TABLE Module
ADD FOREIGN KEY (course_code) REFERENCES Course(course_code) ON DELETE SET NULL;

ALTER TABLE Module
ADD CHECK (start_date < end_date);

-- Prevents modules longer than a year 
ALTER TABLE Module
ADD CHECK (end_date - start_date <= 365); 

-- Foreign keys for Texts
ALTER TABLE Texts
ADD FOREIGN KEY (module_code) REFERENCES Module(module_code) ON DELETE SET NULL;

-- Foreign keys and constraints for Student
ALTER TABLE Student
ADD FOREIGN KEY (address_id) REFERENCES StudentAddress(address_id);

ALTER TABLE Student
ADD FOREIGN KEY (course_code) REFERENCES Course(course_code);

-- Foreign keys for StudentModule
ALTER TABLE StudentModule
ADD FOREIGN KEY (matriculation_no) REFERENCES Student(matriculation_no) ON DELETE CASCADE;

ALTER TABLE StudentModule
ADD FOREIGN KEY (module_code) REFERENCES Module(module_code) ON DELETE CASCADE;

-- Foreign keys for Assessment
ALTER TABLE Assessment
ADD FOREIGN KEY (module_code) REFERENCES Module(module_code) ON DELETE CASCADE;

-- Foreign keys for StudentAssessment
ALTER TABLE StudentAssessment
ADD FOREIGN KEY (assessment_id) REFERENCES Assessment(assessment_id) ON DELETE CASCADE;

ALTER TABLE StudentAssessment
ADD FOREIGN KEY (matriculation_no) REFERENCES Student(matriculation_no) ON DELETE CASCADE;

-- Foreign keys for AcademicStaff
ALTER TABLE AcademicStaff
ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE SET NULL;

-- Foreign keys for Teaching
ALTER TABLE Teaching
ADD FOREIGN KEY (module_code) REFERENCES Module(module_code) ON DELETE CASCADE;

ALTER TABLE Teaching
ADD FOREIGN KEY (staff_no) REFERENCES AcademicStaff(staff_no) ON DELETE CASCADE;
