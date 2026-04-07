# 2B Chemical Engineering Grade Tracker (SQL)

A custom PostgreSQL-based system designed to manage a heavy 2B Chemical Engineering course load at the University of Waterloo.

## Features
- **Master Calendar View:** Merges weekly recurring lectures with one-time assignment deadlines.
- **Dynamic GPA Tracker:** Calculates current averages while accounting for different assignment weightings.
- **Final Exam Goal Tracker:** Back-calculates the required final exam score needed to hit a target grade.
- **Task Management:** Tracks 'Not Started', 'Doing', and 'Done' statuses for all deliverables.

## Project Structure
- `schema.sql`: Table structures, constraints, and the Master Schedule View.
- `seed.sql`: Syllabus data and weekly lecture schedules.
- `maintenance.sql`: Templates for daily updates (grades, dates, status).
- `dashboard.sql`: High-level views for term progress and daily agendas.
