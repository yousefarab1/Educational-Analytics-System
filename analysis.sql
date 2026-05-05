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
    major,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) AS present_count,
    ROUND((SUM
			(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0 
				/ COUNT(*)),2)
			AS attendance_percentage
FROM student_attendance
WHERE major IS NOT NULL AND status IS NOT NULL
GROUP BY major
ORDER BY attendance_percentage ASC;


-- KPI exam success rate in each department.

SELECT major,
	ROUND(AVG(
			CASE WHEN Exam_Score >= 50 THEN 100.0 ELSE 0.0 END
			), 2) 
		AS pass_rate_pct
FROM student_attendance
GROUP BY major



-- KPI Extracting average attendance rate in each department

SELECT major ,
	ROUND(AVG(CASE WHEN status = 'Present' THEN 100.0 ELSE 0.0 END), 2) AS attendance_rate_pct
FROM student_attendance
GROUP BY major
ORDER BY attendance_rate_pct DESC



-- KPI average the Study_Hours_Per_Week in each department

SELECT major,
  		AVG(Study_Hours_Per_Week) AS avg_study_hours
FROM student_attendance
GROUP BY major



-- List of students with poor attendance and few study hours

SELECT student_id, major, exam_Score
FROM student_attendance
WHERE status = 'Absent'
  AND study_hours_per_Week < 5
  AND exam_Score < 50        
GROUP BY student_id,major, exam_Score
ORDER BY exam_Score DESC

-- TO GET their number

SELECT COUNT(*) FROM (
						SELECT student_id, major, exam_Score
						FROM student_attendance
						WHERE status = 'Absent'
						  AND study_hours_per_Week < 5
						  AND exam_Score < 50        
						GROUP BY student_id,major, exam_Score
						ORDER BY exam_Score DESC
						)






