-- Insert into Department
INSERT INTO Department (dept_id, dept_name, phone_no, fax_no, location, manager_id) VALUES ('CIS', 'Computing and Information Systems', '0207461234', '0131-555-1002', 'E Block', NULL);
INSERT INTO Department (dept_id, dept_name, phone_no, fax_no, location, manager_id) VALUES ('COMP', 'Computer Science Department', '0208525678', '0131-555-2002', 'A Block', NULL);
INSERT INTO Department (dept_id, dept_name, phone_no, fax_no, location, manager_id) VALUES ('MATH', 'Mathematics Department', '0203456789', '0131-555-3002', 'B Block', NULL);
INSERT INTO Department (dept_id, dept_name, phone_no, fax_no, location, manager_id) VALUES ('ENG', 'Engineering Department', '0209876543', '0131-555-4002', 'C Block', NULL);
INSERT INTO Department (dept_id, dept_name, phone_no, fax_no, location, manager_id) VALUES ('BUS', 'Business School', '0202764321', '0131-555-5002', 'D Block', NULL);

-- Insert into AcademicStaff
INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES 
('John', 'Smith', 'Ext-1001', 'OF-101', 'M', 65000.00, 'Senior Lecturer', 'PhD in Computer Science', '15 Academic Lane, Edinburgh', NULL, 'CIS');
INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES
    ('Emily', 'Brown', 'Ext-1002', 'OF-102', 'F', 72000.00, 'Professor', 'PhD in Information Systems', '22 Scholar Street, Glasgow', NULL, 'COMP');
INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES
    ('Michael', 'Johnson', 'Ext-1003', 'OF-103', 'M', 55000.00, 'Lecturer', 'PhD in Software Engineering', '45 University Road, Aberdeen', NULL, 'MATH');
INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES
    ('Sarah', 'Wilson', 'Ext-1004', 'OF-104', 'F', 68000.00, 'Associate Professor', 'MSc in Computer Science', '33 Research Close, Edinburgh', NULL, 'ENG');
INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES
    ('David', 'Lee', 'Ext-1005', 'OF-105', 'M', 60000.00, 'Senior Lecturer', 'PhD in Business Analytics', '11 Academic Park, Glasgow', NULL, 'BUS');
INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES 
('Robert', 'Taylor', 'Ext-1006', 'OF-106', 'M', 68000.00, 'Associate Professor', 'PhD in Artificial Intelligence', '78 Innovation Road, Edinburgh', NULL, 'COMP');
INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES 
    ('Lisa', 'Wang', 'Ext-1007', 'OF-107', 'F', 62000.00, 'Senior Lecturer', 'PhD in Data Science', '92 Research Park, Glasgow', NULL, 'CIS');
    INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES 
('James', 'Martinez', 'Ext-1008', 'OF-108', 'M', 57000.00, 'Lecturer', 'MSc in Cybersecurity', '56 Academic Close, Aberdeen', NULL, 'ENG');
    INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES 
('Sophia', 'Patel', 'Ext-1009', 'OF-109', 'F', 70000.00, 'Professor', 'PhD in Machine Learning', '34 University Avenue, Dundee', NULL, 'MATH');
    INSERT INTO AcademicStaff (first_name, last_name, phone_extension_no, office_no, sex, salary, post, qualifications, address, user_id, dept_id) VALUES 
('Daniel', 'Kim', 'Ext-1010', 'OF-110', 'M', 63000.00, 'Senior Lecturer', 'PhD in Business Informatics', '17 Innovation Lane, Stirling', NULL, 'BUS');

-- Insert into DepartmentManager
INSERT INTO DepartmentManager (staff_no, start_date) VALUES (10000, TO_DATE('2020-01-15', 'YYYY-MM-DD'));
INSERT INTO DepartmentManager (staff_no, start_date) VALUES (10001, TO_DATE('2019-07-01', 'YYYY-MM-DD'));
INSERT INTO DepartmentManager (staff_no, start_date) VALUES (10003, TO_DATE('2021-03-10', 'YYYY-MM-DD'));

-- Update department managers
UPDATE Department SET manager_id = 100 WHERE dept_id = 'CIS';
UPDATE Department SET manager_id = 101 WHERE dept_id = 'COMP';
UPDATE Department SET manager_id = 102 WHERE dept_id = 'MATH';

-- Insert into Course
INSERT INTO Course (course_code, course_title, duration_in_years, course_leader, dept_id) VALUES ('PgDIT', 'Postgraduate Diploma in Information Technology', 1, 10002, 'CIS');
INSERT INTO Course (course_code, course_title, duration_in_years, course_leader, dept_id) VALUES ('MSc-CS', 'Master of Science in Computer Science', 2, 10004,'COMP');
INSERT INTO Course (course_code, course_title, duration_in_years, course_leader, dept_id) VALUES ('PgD-SE', 'Postgraduate Diploma in Software Engineering', 1, 10005, 'MATH');
INSERT INTO Course (course_code, course_title, duration_in_years, course_leader, dept_id) VALUES ('MSc-AI', 'Master of Science in Artificial Intelligence', 2, NULL,'COMP'); 
INSERT INTO Course (course_code, course_title, duration_in_years, course_leader, dept_id) VALUES ('PgD-DS', 'Postgraduate Diploma in Data Science', 1, NULL,'CIS');

-- Insert into Module
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES ('MM-101', 'Multi-Media', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 10008, 'PgDIT');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES ('DSA-201', 'Data Structures and Algorithms', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 10009, 'MSc-CS');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES ('SE-301', 'Software Engineering Principles', TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'), 10003, 'PgD-SE');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES ('AI-401', 'Advanced Machine Learning', TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-12-13', 'YYYY-MM-DD'), 10009, 'MSc-AI');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES ('DS-201', 'Big Data Analytics', TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-12-13', 'YYYY-MM-DD'), 10008, 'PgD-DS');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES('CYB-301', 'Network Security Principles', TO_DATE('2024-01-30', 'YYYY-MM-DD'), TO_DATE('2024-05-28', 'YYYY-MM-DD'),  NULL,'PgD-SE');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES('ML-502', 'Deep Learning Techniques', TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), NULL, 'MSc-AI');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES('BUS-401', 'Digital Business Transformation', TO_DATE('2024-01-22', 'YYYY-MM-DD'), TO_DATE('2024-05-26', 'YYYY-MM-DD'), NULL,'PgD-DS');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES('NLP-601', 'Natural Language Processing', TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), NULL,'MSc-AI');
INSERT INTO Module (module_code, module_title, start_date, end_date, module_coordinator, course_code) VALUES('ETH-501', 'Ethics in Technology', TO_DATE('2024-01-28', 'YYYY-MM-DD'), TO_DATE('2024-05-24', 'YYYY-MM-DD'), NULL, 'PgD-DS');

-- Insert books into Texts
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9781234567811', 'Machine Learning Fundamentals', 'Tech Insights', 'Elena Rodriguez', '1st Edition', 'AI-401');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9789876543221', 'Big Data: Techniques and Technologies', 'Data Press', 'Michael Chen', '2nd Edition', 'DS-201');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9781122334466', 'Cybersecurity Essentials', 'Security Publishers', 'Alex Thompson', '3rd Edition', 'CYB-301');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9781234567822', 'Deep Learning in Practice', 'AI Academic Press', 'Sophia Lee', '1st Edition', 'ML-502');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9789876543232', 'Digital Business Strategy', 'Business Innovators', 'David Johnson', '2nd Edition', 'BUS-401');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9781122334477', 'Natural Language Processing Techniques', 'Linguistic Tech', 'Emma Wilson', '1st Edition', 'NLP-601');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9781234567833', 'Technology Ethics', 'Ethical Computing Press', 'Jack Anderson', '1st Edition', 'ETH-501');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9781234567890', 'Multi-Media Systems Design', 'Tech Publishers', 'Alice Thompson', '2nd Edition', 'MM-101');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9789876543210', 'Advanced Data Structures', 'Academic Press', 'Robert Williams', '3rd Edition', 'DSA-201');
INSERT INTO Texts (isbn, title, publisher, author, edition, module_code) VALUES ('9781122334455', 'Software Engineering Practices', 'Engineering Books Ltd', 'Sarah Martinez', '4th Edition', 'SE-301');



-- Insert into StudentAddress
INSERT INTO StudentAddress (town, street, post_code) VALUES ('Edinburgh', '15 Scholar Street', 'EH1 2AB');
INSERT INTO StudentAddress (town, street, post_code) VALUES ('Glasgow', '22 University Road', 'G1 1XQ');
INSERT INTO StudentAddress (town, street, post_code) VALUES ('Aberdeen', '45 Academic Lane', 'AB10 1RQ');
INSERT INTO StudentAddress (town, street, post_code) VALUES ('Dundee', '33 Research Close', 'DD1 4LR');
INSERT INTO StudentAddress (town, street, post_code) VALUES ('Stirling', '11 Innovation Park', 'FK9 4LA');

-- Insert into Student
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Alice', 'Chen', TO_DATE('1995-03-15', 'YYYY-MM-DD'), 'F', 5000, 'James Chen', '22 Family Lane, Edinburgh', '07700900123', 'Father', NULL, 100000, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('David', 'Kumar', TO_DATE('1996-07-22', 'YYYY-MM-DD'), 'M', 6500, 'Priya Kumar', '45 Home Street, Glasgow', '07400112345', 'Mother', NULL, 100001, 'MSc-CS');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Emma', 'Rodriguez', TO_DATE('1994-11-30', 'YYYY-MM-DD'), 'F', 4200, 'Carlos Rodriguez', '11 Family Park, Aberdeen', '07501234567', 'Father', NULL, 100000, 'PgD-SE');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Ryan', 'Thompson', TO_DATE('1997-05-18', 'YYYY-MM-DD'), 'M', 5500, 'Sarah Thompson', '22 Family Road, Perth', '07300654321', 'Mother', NULL, 100000, 'MSc-AI');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Olivia', 'Singh', TO_DATE('1996-09-12', 'YYYY-MM-DD'), 'F', 4800, 'Raj Singh', '45 Home Street, Inverness', '07712345678', 'Father', NULL, 100001, 'PgD-DS');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Lucas', 'Garcia', TO_DATE('1995-11-25', 'YYYY-MM-DD'), 'M', 6200, 'Maria Garcia', '11 Academic Close, Dundee', '07523987654', 'Mother', NULL, 100002, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Ava', 'Mohammed', TO_DATE('1997-02-07', 'YYYY-MM-DD'), 'F', 5100, 'Ahmed Mohammed', '33 University Lane, Glasgow', '07911112233', 'Father', NULL,100003, 'MSc-CS');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Ethan', 'Nguyen', TO_DATE('1996-06-30', 'YYYY-MM-DD'), 'M', 4600, 'Linda Nguyen', '56 Innovation Park, Edinburgh', '07765432198', 'Mother', NULL, 100004, 'PgD-SE');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('John', 'Doe', TO_DATE('1997-06-22', 'YYYY-MM-DD'), 'M', 3000, 'Jane Doe', '45 Maple Street, Glasgow', '07700900234', 'Mother', NULL, 100001, 'PgD-DS');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Maria', 'Garcia', TO_DATE('1998-12-01', 'YYYY-MM-DD'), 'F', 4000, 'Carlos Garcia', '10 Elm Avenue, Manchester', '07700900345', 'Brother', NULL, 100002, 'MSc-AI');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Jack', 'Smith', TO_DATE('1994-05-22', 'YYYY-MM-DD'), 'M', 3000, 'Sarah Smith', '12 River Road, London', '07112233445', 'Mother', NULL, 100001, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Maya', 'Brown', TO_DATE('1996-11-30', 'YYYY-MM-DD'), 'F', 4500, 'David Brown', '33 Elm Street, Manchester', '07223344556', 'Father', NULL, 100002, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Liam', 'Johnson', TO_DATE('1993-08-14', 'YYYY-MM-DD'), 'M', 6000, 'Emma Johnson', '44 Maple Avenue, Birmingham', '07334455667', 'Sister', NULL, 100003, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Ella', 'Williams', TO_DATE('1997-02-05', 'YYYY-MM-DD'), 'F', 5200, 'Olivia Williams', '55 Oak Road, Leeds', '07445566778', 'Mother', NULL, 100004, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Noah', 'Jones', TO_DATE('1992-12-12', 'YYYY-MM-DD'), 'M', 7000, 'Sophia Jones', '66 Pine Street, Bristol', '07556677889', 'Aunt', NULL, 100003, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Ava', 'Davis', TO_DATE('1998-09-21', 'YYYY-MM-DD'), 'F', 5500, 'Isabella Davis', '77 Cedar Lane, Sheffield', '07667788990', 'Grandmother', NULL, 100002, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Ethan', 'Martinez', TO_DATE('1991-04-10', 'YYYY-MM-DD'), 'M', 5800, 'Michael Martinez', '88 Birch Street, Liverpool', '07778899001', 'Brother', NULL, 100001, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Mia', 'Garcia', TO_DATE('1995-06-28', 'YYYY-MM-DD'), 'F', 6200, 'Linda Garcia', '99 Willow Way, Newcastle', '07889900112', 'Sister', NULL, 100000, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Lucas', 'Rodriguez', TO_DATE('1990-01-17', 'YYYY-MM-DD'), 'M', 4800, 'Robert Rodriguez', '11 Cherry Circle, Nottingham', '07999001123', 'Father', NULL, 100001, 'PgDIT');
INSERT INTO Student (first_name, last_name, DOB, sex, financial_loan, nok_name, nok_address, nok_phone, nok_relationship, user_id, address_id, course_code) VALUES 
('Sophia', 'Lee', TO_DATE('1993-10-19', 'YYYY-MM-DD'), 'F', 5300, 'Nancy Lee', '22 Spruce Street, Cardiff', '07100112233', 'Aunt', NULL, 100000, 'PgDIT');

-- Insert into Assessment
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('AI-401', 'Coursework', 40);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('DS-201', 'Group Assignment', 35);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('CYB-301', 'Exam', 45);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('ML-502', 'Project', 50);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('MM-101', 'Coursework', 40);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('MM-101', 'Final Exam', 60);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('DSA-201', 'Project', 50);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('DSA-201', 'Written Exam', 50);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('SE-301', 'Group Assignment', 30);
INSERT INTO Assessment (module_code, assessment_type, weight) VALUES ('SE-301', 'Individual Report', 70);


-- Insert into StudentAssessment
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100005, 75.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100005, 80.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'DSA-201' AND assessment_type = 'Project'), 100006, 85.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'SE-301' AND assessment_type = 'Individual Report'), 100007, 88.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'CYB-301' AND assessment_type = 'Exam'), 100002, 92.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'SE-301' AND assessment_type = 'Group Assignment'), 100002, 88.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'SE-301' AND assessment_type = 'Individual Report'), 100002, 79.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'AI-401' AND assessment_type = 'Coursework'), 100003, 92.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'ML-502' AND assessment_type = 'Project'), 100003, 88.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100000, 28.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100000, 45.2);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100010, 82.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100010, 88.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100011, 79.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100011, 85.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100012, 91.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100012, 93.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100013, 70.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100013, 77.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100014, 75.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100014, 80.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100015, 37.25);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100015, 39.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100016, 42.2);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100016, 35.3);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100017, 76.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100017, 82.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100018, 88.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100018, 90.5);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Coursework'), 100019, 73.0);
INSERT INTO StudentAssessment (assessment_id, matriculation_no, grade) VALUES ((SELECT assessment_id FROM Assessment WHERE module_code = 'MM-101' AND assessment_type = 'Final Exam'), 100019, 78.5);

-- Insert into Teaching
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('MM-101', 10006, 10.5);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('DSA-201', 10001, 12.0);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('SE-301', 10008, 8.5);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('AI-401', 10005, 11.5);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('DS-201', 10000, 9.0);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('CYB-301', 10002, 8.0);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('ML-502', 10005, 12.5);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('BUS-401', 10006, 7.5);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('NLP-601', 10001, 10.0);
INSERT INTO Teaching (module_code, staff_no, hours_per_week) VALUES ('ETH-501', 10000, 8.5);


UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100010;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100011;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100012;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100013;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100014;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100017;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100018;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100019;
UPDATE StudentModule SET performance = 'pass' WHERE matriculation_no = 100005;
UPDATE StudentModule SET performance = 'fail' WHERE matriculation_no = 100000;
UPDATE StudentModule SET performance = 'fail' WHERE matriculation_no = 100015;
UPDATE StudentModule SET performance = 'fail' WHERE matriculation_no = 100016;
