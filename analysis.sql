SELECT * FROM student_attendance



-- Extracting the total attendance percentage

SELECT 
    ROUND((SUM(
				CASE WHEN status = 'Present' THEN 1 ELSE 0 END
					) * 100.0 / COUNT(status)),3) 
			AS overall_attendance_rate
FROM student_attendance


-- The most absent students

SELECT 
    Student_ID, 
    COUNT(*) AS absence_count
FROM student_attendance
WHERE status = 'Absent'
GROUP BY Student_ID
ORDER BY absence_count DESC
LIMIT 10




--  Analysis of attendance rates by department

SELECT 
    program,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) AS present_count,
    ROUND((SUM
			(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0 
				/ COUNT(*)),2)
			AS attendance_percentage
FROM student_attendance
WHERE program IS NOT NULL AND status IS NOT NULL
GROUP BY program
ORDER BY attendance_percentage ASC;


-- KPI exam success rate in each department.

SELECT program,
	ROUND(AVG(
			CASE WHEN Exam_Score >= 50 THEN 100.0 ELSE 0.0 END
			), 2) 
		AS pass_rate_pct
FROM student_attendance
GROUP BY program



-- KPI Extracting average attendance rate in each department

SELECT program ,
	ROUND(AVG(CASE WHEN status = 'Present' THEN 100.0 ELSE 0.0 END), 2) AS attendance_rate_pct
FROM student_attendance
GROUP BY program
ORDER BY attendance_rate_pct DESC



-- KPI average the Study_Hours_Per_Week in each department

SELECT program,
  		AVG(Study_Hours_Per_Week) AS avg_study_hours
FROM student_attendance
GROUP BY program



-- List of students with poor attendance and few study hours

SELECT 
    student_id, program, exam_score,
    RANK() OVER (
        ORDER BY exam_score DESC
    ) AS student_rank
FROM student_attendance
WHERE status = 'Absent'
  AND study_hours_per_week < 5
  AND exam_score < 50
GROUP BY student_id, program, exam_score

-- TO GET their number

SELECT COUNT(*) FROM (
						SELECT student_id, program, exam_Score
						FROM student_attendance
						WHERE status = 'Absent'
						  AND study_hours_per_Week < 5
						  AND exam_Score < 50        
						GROUP BY student_id,program, exam_Score
						ORDER BY exam_Score DESC
						)






