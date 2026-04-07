INSERT INTO courses (course_code, course_name, credits, professor_name, professor_email, semester)
VALUES 
('CHE 211', 'Fluid Mechanics', 0.5, 'David Simakov', 'dsimakov@uwaterloo.ca', 'Spring 2026'),
('CHE 225', 'Strategies for Process Improvement', 0.5, 'Hamid Reza Kariminia Hamedaani', 'hrhamedaani@uwaterloo.ca', 'Spring 2026'),
('CHE 231', 'Physical Chemistry 2', 0.5, 'Daniel Rangel Martinez', NULL, 'Spring 2026'),
('CHE 241', 'Materials Sci & Eng', 0.5, 'Tizazu Mekonnen', 'tmekonne@uwaterloo.ca', 'Spring 2026'),
('CHE 291', 'Chemical Engineering Lab 2', 0.25, 'Jennifer Moll', 'jennifer.moll@uwaterloo.ca', 'Spring 2026'),
('CHE 218', 'Differential Equations', 0.5, 'Farshad Moradi Kashkooli', 'fmoradik@uwaterloo.ca', 'Spring 2026');

-- QA check
SELECT * FROM courses;

-- LINKED ASSIGNMENTS (Populating based on Syllabus)

-- CHE 211: Fluid Mechanics (ID: 1)
INSERT INTO grade_items (course_id, assessment_type, assessment_name, due_date, weight) VALUES
(1, 'Assignment', 'Assignment 1', '2026-05-01', 4.0),
(1, 'Assignment', 'Assignment 2', '2026-05-01', 4.0),
(1, 'Assignment', 'Assignment 3', '2026-05-01', 4.0),
(1, 'Assignment', 'Assignment 4', '2026-05-01', 4.0),
(1, 'Assignment', 'Assignment 5', '2026-05-01', 4.0),
(1, 'Exam', 'Midterm Exam', '2026-05-01', 30.0),
(1, 'Exam', 'Final Exam', '2026-05-01', 50.0);

-- CHE 225: Process Improvement (ID: 2)
INSERT INTO grade_items (course_id, assessment_type, assessment_name, due_date, weight) VALUES
(2, 'Assignment', 'Assignment 1', '2026-05-01', 4.0),
(2, 'Assignment', 'Assignment 2', '2026-05-01', 4.0),
(2, 'Assignment', 'Assignment 3', '2026-05-01', 4.0),
(2, 'Assignment', 'Assignment 4', '2026-05-01', 4.0),
(2, 'Assignment', 'Assignment 5', '2026-05-01', 4.0),
(2, 'Tutorial', 'Tutorial 1', '2026-05-01', 0.5), (2, 'Tutorial', 'Tutorial 2', '2026-05-01', 0.5),
(2, 'Tutorial', 'Tutorial 3', '2026-05-01', 0.5), (2, 'Tutorial', 'Tutorial 4', '2026-05-01', 0.5),
(2, 'Tutorial', 'Tutorial 5', '2026-05-01', 0.5), (2, 'Tutorial', 'Tutorial 6', '2026-05-01', 0.5),
(2, 'Tutorial', 'Tutorial 7', '2026-05-01', 0.5), (2, 'Tutorial', 'Tutorial 8', '2026-05-01', 0.5),
(2, 'Tutorial', 'Tutorial 9', '2026-05-01', 0.5), (2, 'Tutorial', 'Tutorial 10', '2026-05-01', 0.5),
(2, 'Exam', 'Midterm Exam', '2026-05-01', 30.0),
(2, 'Exam', 'Final Exam', '2026-05-01', 45.0);

-- CHE 231: P-Chem 2 (ID: 3)
INSERT INTO grade_items (course_id, assessment_type, assessment_name, due_date, weight) VALUES
(3, 'Assignment', 'Assignment 1', '2026-05-01', 4.166), (3, 'Assignment', 'Assignment 2', '2026-05-01', 4.166),
(3, 'Assignment', 'Assignment 3', '2026-05-01', 4.166), (3, 'Assignment', 'Assignment 4', '2026-05-01', 4.166),
(3, 'Assignment', 'Assignment 5', '2026-05-01', 4.166), (3, 'Assignment', 'Assignment 6', '2026-05-01', 4.166),
(3, 'Quiz', 'Quiz 1', '2026-05-01', 6.0), (3, 'Quiz', 'Quiz 2', '2026-05-01', 6.0),
(3, 'Quiz', 'Quiz 3', '2026-05-01', 6.0), (3, 'Quiz', 'Quiz 4', '2026-05-01', 6.0),
(3, 'Quiz', 'Quiz 5', '2026-05-01', 6.0),
(3, 'Exam', 'Final Exam', '2026-05-01', 45.0);

-- CHE 241: Materials Sci (ID: 4)
INSERT INTO grade_items (course_id, assessment_type, assessment_name, due_date, weight) VALUES
(4, 'Assignment', 'Assignment 1', '2026-05-01', 5.0), (4, 'Assignment', 'Assignment 2', '2026-05-01', 5.0),
(4, 'Assignment', 'Assignment 3', '2026-05-01', 5.0), (4, 'Assignment', 'Assignment 4', '2026-05-01', 5.0),
(4, 'Quiz', 'Quiz 1', '2026-05-01', 1.0), (4, 'Quiz', 'Quiz 2', '2026-05-01', 1.0),
(4, 'Quiz', 'Quiz 3', '2026-05-01', 1.0), (4, 'Quiz', 'Quiz 4', '2026-05-01', 1.0),
(4, 'Quiz', 'Quiz 5', '2026-05-01', 1.0),
(4, 'Exam', 'Midterm', '2026-05-01', 20.0),
(4, 'Presentation', 'Presentation', '2026-05-01', 10.0),
(4, 'Exam', 'Final Exam', '2026-05-01', 45.0);

-- CHE 291: Lab 2 (ID: 5)
INSERT INTO grade_items (course_id, assessment_type, assessment_name, due_date, weight) VALUES
(5, 'Quiz', 'Prelab Quiz 1', '2026-05-01', 1.0), (5, 'Quiz', 'Prelab Quiz 2', '2026-05-01', 1.0), (5, 'Quiz', 'Prelab Quiz 3', '2026-05-01', 1.0),
(5, 'Proposal', 'Prelab Group Proposal', '2026-05-01', 1.0),
(5, 'Performance', 'Lab Performance 1', '2026-05-01', 1.0), (5, 'Performance', 'Lab Performance 2', '2026-05-01', 1.0),
(5, 'Performance', 'Lab Performance 3', '2026-05-01', 1.0), (5, 'Performance', 'Lab Performance 4', '2026-05-01', 1.0),
(5, 'In-Lab', 'In-Lab Component 1', '2026-05-01', 0.5), (5, 'In-Lab', 'In-Lab Component 2', '2026-05-01', 0.5),
(5, 'In-Lab', 'In-Lab Component 3', '2026-05-01', 0.5), (5, 'In-Lab', 'In-Lab Component 4', '2026-05-01', 0.5),
(5, 'Report', 'Lab 1 Individual Memo', '2026-05-01', 20.0),
(5, 'Report', 'Lab 2 Group DA', '2026-05-01', 10.0),
(5, 'Report', 'Lab 3 Group Memo', '2026-05-01', 14.0),
(5, 'Report', 'Lab 4 Individual DA', '2026-05-01', 14.0),
(5, 'Attendance', 'Lab 5/6 Attendance', '2026-05-01', 1.2),
(5, 'Quiz', 'Lab 5/6 Quiz', '2026-05-01', 3.0),
(5, 'Exercise', 'Lab 5/6 In-Class Exercises', '2026-05-01', 9.0),
(5, 'Report', 'Lab 5/6 Tutorial Group Report', '2026-05-01', 16.8),
(5, 'Review', 'Teamwork Review and Survey', '2026-05-01', 2.0);

-- CHE 218: Diff Eq (ID: 6)
INSERT INTO grade_items (course_id, assessment_type, assessment_name, due_date, weight) VALUES
(6, 'Assignment', 'Assignment 1', '2026-05-01', 4.0), (6, 'Assignment', 'Assignment 2', '2026-05-01', 4.0),
(6, 'Assignment', 'Assignment 3', '2026-05-01', 4.0), (6, 'Assignment', 'Assignment 4', '2026-05-01', 4.0),
(6, 'Assignment', 'Assignment 5', '2026-05-01', 4.0),
(6, 'Exam', 'Midterm', '2026-05-01', 25.0),
(6, 'Exam', 'Final Exam', '2026-05-01', 55.0);

-- Spring 2026 Weekly Schedule
-- Excluding CHE 202
INSERT INTO lectures (course_id, day_of_week, start_time, end_time, location)
VALUES 
-- MONDAY
(5, 'Monday', '08:30:00', '11:20:00', 'DWE 2529 (Lab)'),
(6, 'Monday', '11:30:00', '12:20:00', 'DWE 2527'),
(3, 'Monday', '14:30:00', '16:20:00', 'PHY 313'),

-- TUESDAY
(4, 'Tuesday', '10:30:00', '12:20:00', 'E6 2024'),
(1, 'Tuesday', '13:30:00', '15:20:00', 'E6 2024'),

-- WEDNESDAY
(6, 'Wednesday', '11:30:00', '12:20:00', 'DWE 2527'),
(2, 'Wednesday', '13:30:00', '15:20:00', 'DWE 2529'),
(3, 'Wednesday', '15:30:00', '16:20:00', 'DWE 2529'),
(3, 'Wednesday', '16:30:00', '17:20:00', 'DWE 2529 (Tutorial)'),

-- THURSDAY
(4, 'Thursday', '10:30:00', '11:20:00', 'E6 2024'),
(4, 'Thursday', '11:30:00', '12:20:00', 'E6 2024 (Tutorial)'),
(1, 'Thursday', '13:30:00', '14:20:00', 'E6 2024'),
(1, 'Thursday', '14:30:00', '15:20:00', 'E6 2024 (Tutorial)'),

-- FRIDAY
(6, 'Friday', '10:30:00', '11:20:00', 'DWE 2527 (Tutorial)'),
(6, 'Friday', '11:30:00', '12:20:00', 'DWE 2527'),
(2, 'Friday', '13:30:00', '14:20:00', 'DWE 2529'),
(2, 'Friday', '14:30:00', '15:20:00', 'DWE 2529 (Tutorial)');