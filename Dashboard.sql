-- ==========================================
-- VIEW 1: OVERALL TERM GPA CALCULATOR
-- ==========================================
SELECT 
    ROUND(
        SUM(earned_grade * (weight / 100)) / 
        NULLIF(SUM(CASE WHEN earned_grade IS NOT NULL THEN weight ELSE 0 END), 0) 
        * 100, 2
    ) AS term_average
FROM grade_items 
WHERE earned_grade IS NOT NULL;


-- ==========================================
-- VIEW 2: INDIVIDUAL COURSE CALCULATORS & PROGRESS
-- Shows how much of each course is finished vs. current mark
-- ==========================================
SELECT 
    c.course_code,
    ROUND(
        SUM(g.earned_grade * (g.weight / 100)) / 
        NULLIF(SUM(CASE WHEN g.earned_grade IS NOT NULL THEN g.weight ELSE 0 END), 0) 
        * 100, 2
    ) AS current_mark,
    SUM(CASE WHEN g.earned_grade IS NOT NULL THEN g.weight ELSE 0 END) AS percent_completed,
    (100 - SUM(CASE WHEN g.earned_grade IS NOT NULL THEN g.weight ELSE 0 END)) AS percent_remaining
FROM courses c
JOIN grade_items g ON c.course_id = g.course_id
GROUP BY c.course_code
ORDER BY percent_completed DESC;


-- ==========================================
-- VIEW 3: UPCOMING DEADLINES (Upcoming 7 Days)
-- Shows everything due in the next week based on the current date
-- ==========================================
SELECT 
    c.course_code, 
    g.assessment_name, 
    g.due_date, 
    g.weight
FROM courses c
JOIN grade_items g ON c.course_id = g.course_id
WHERE g.due_date BETWEEN CURRENT_DATE AND (CURRENT_DATE + INTERVAL '7 days')
AND g.earned_grade IS NULL
ORDER BY g.due_date ASC;


-- ==========================================
-- VIEW 4: SYLLABUS CHECKLIST 
-- Only shows things not finished
-- ==========================================
SELECT 
    c.course_code, 
    g.assessment_name, 
    g.status,
    g.due_date
FROM courses c
JOIN grade_items g ON c.course_id = g.course_id
WHERE g.status != 'Done'
AND g.earned_grade IS NULL
ORDER BY g.due_date ASC;


-- ==========================================
-- VIEW 5: THE FINAL EXAM GOAL TRACKER
-- Set your 'target_grade' below to see what you need on the Final
-- ==========================================
WITH target AS (
    SELECT 80.0 AS goal -- <--- CHANGE THIS NUMBER TO TARGET FINAL GRADE
)
SELECT 
    c.course_code,
    t.goal AS desired_final_mark,
    -- Calculate current weighted points earned
    ROUND(SUM(g.earned_grade * (g.weight / 100)), 2) AS points_already_earned,
    -- Identify the final exam weight
    MAX(CASE WHEN g.assessment_name ILIKE '%Final%' THEN g.weight ELSE NULL END) AS final_weight,
    -- (Target - Points Earned) / (Final Weight / 100)
    ROUND(
        (t.goal - SUM(CASE WHEN g.earned_grade IS NOT NULL THEN g.earned_grade * (g.weight / 100) ELSE 0 END)) 
        / (MAX(CASE WHEN g.assessment_name ILIKE '%Final%' THEN g.weight ELSE NULL END) / 100), 2
    ) AS required_score_on_final
FROM courses c
JOIN grade_items g ON c.course_id = g.course_id
CROSS JOIN target t
GROUP BY c.course_code, t.goal
HAVING MAX(CASE WHEN g.assessment_name IS LIKE '%Final%' THEN g.weight ELSE NULL END) IS NOT NULL;

-- ==========================================
-- VIEW 7: TODAY'S TASKS
-- Pulls from the master calendar to show classes and deadlines
-- ==========================================
SELECT 
    start_time, 
    course_code, 
    type,
    details AS "Location/Assignment"
FROM master_schedule 
WHERE calendar_date = CURRENT_DATE
ORDER BY start_time ASC;