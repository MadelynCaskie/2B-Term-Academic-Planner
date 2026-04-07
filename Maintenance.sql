-- ==========================================
-- TEMPLATE 1: INDIVIDUAL GRADE UPDATE
-- ==========================================
UPDATE grade_items 
SET earned_grade = [INSERT_GRADE_HERE] 
WHERE course_id = [INSERT_COURSE_ID] 
AND assessment_name = '[INSERT_ASSIGNMENT_NAME]';


-- ==========================================
-- TEMPLATE 2: INDIVIDUAL DATE UPDATE
-- ==========================================
UPDATE grade_items 
SET due_date = '[YYYY-MM-DD]' 
WHERE course_id = [INSERT_COURSE_ID] 
AND assessment_name = '[INSERT_ASSIGNMENT_NAME]';


-- ==========================================
-- TEMPLATE 3: BULK SYLLABUS UPDATE
-- For mass entering all dates at the start of the term.
-- Just add more lines inside the parentheses as needed.
-- Can be altered to update grades instead.
-- ==========================================
UPDATE grade_items AS g SET
    due_date = v.new_date
FROM (VALUES
    ([ID], '[NAME]', '[YYYY-MM-DD]'),
    ([ID], '[NAME]', '[YYYY-MM-DD]'),
    ([ID], '[NAME]', '[YYYY-MM-DD]')
) AS v(c_id, a_name, new_date)
WHERE g.course_id = v.c_id 
AND g.assessment_name = v.a_name;


-- ==========================================
-- TEMPLATE 4: RESET A GRADE
-- In case of typo, sets grade back to empty.
-- ==========================================
UPDATE grade_items 
SET earned_grade = NULL 
WHERE course_id = [INSERT_COURSE_ID] 
AND assessment_name = '[INSERT_ASSIGNMENT_NAME]';

-- ==========================================
-- TEMPLATE 5: UPDATE TASK STATUS
-- Tracks assignment progress (Not Started, Doing, Done)
-- ==========================================
UPDATE grade_items 
SET status = '[Not Started / Doing / Done]' 
WHERE course_id = [INSERT_COURSE_ID] 
AND assessment_name = '[INSERT_ASSIGNMENT_NAME]';