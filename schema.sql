DROP TABLE IF EXISTS grade_items CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS lectures CASCADE;

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(10) NOT NULL,
    course_name TEXT NOT NULL,
    credits FLOAT NOT NULL,
    professor_name TEXT,
    professor_email TEXT,
    semester VARCHAR(20) NOT NULL
);

CREATE TABLE grade_items (
    item_id SERIAL PRIMARY KEY,
    course_id INTEGER REFERENCES courses(course_id) ON DELETE CASCADE,
    assessment_type TEXT NOT NULL,
    assessment_name TEXT NOT NULL,
    due_date DATE,
    weight FLOAT NOT NULL,
    earned_grade FLOAT
);

ALTER TABLE grade_items 
ADD COLUMN status VARCHAR(20) DEFAULT 'Not Started' 
CHECK (status IN ('Not Started', 'Doing', 'Done'));

CREATE TABLE lectures (
    lecture_id SERIAL PRIMARY KEY,
    course_id INTEGER REFERENCES courses(course_id) ON DELETE CASCADE,
    day_of_week VARCHAR(10) NOT NULL, 
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    location TEXT
);

CREATE OR REPLACE VIEW master_schedule AS
WITH date_range AS (
    SELECT generate_series(
        '2026-05-11'::date, 
        '2026-08-05'::date, 
        '1 day'::interval
    )::date AS calendar_date
),
all_events AS (
    -- Map recurring lectures to their actual dates
    SELECT 
        dr.calendar_date,
        l.start_time,
        c.course_code,
        'LECTURE' AS type,
        l.location AS details
    FROM date_range dr
    JOIN lectures l ON TRIM(TO_CHAR(dr.calendar_date, 'Day')) = l.day_of_week
    JOIN courses c ON l.course_id = c.course_id

    UNION ALL

    -- Map deliverables to their due dates
    SELECT 
        g.due_date AS calendar_date,
        '23:59:00'::time AS start_time,
        c.course_code,
        'DEADLINE' AS type,
        g.assessment_name || ' (' || g.status || ')' AS details -- Shows status on calendar
    FROM grade_items g
    JOIN courses c ON g.course_id = c.course_id
    WHERE g.status != 'Done' -- Only show deadlines for things not finished