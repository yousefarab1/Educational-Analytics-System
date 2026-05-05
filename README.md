# 🎓 Educational Analytics System (EAS)

## 📝 Project Overview

The **Educational Analytics System (EAS)** is a professional data analytics project designed to transform raw, inconsistent educational data into actionable strategic insights. This project focuses on processing student records, attendance logs, and academic performance to identify patterns that help educational institutions improve student engagement and success rates.

## 📊 Key Objectives

- **Attendance Analysis:** Tracking overall attendance rates and identifying chronic absenteeism.
- **Academic Performance:** Measuring average scores and pass rates across different programs.
- **KPI Development:** Correlating study habits with exam results to pinpoint at-risk students.
- **Data Cleansing:** Handling missing values and formatting inconsistencies in "dirty" datasets.

## 🛠 Tech Stack

- **SQL:** Primary engine for data cleaning, transformation, and calculating core KPIs.
- **Power BI:** (Currently Integrating) For creating interactive dashboards and real-time visual analytics.
- **Python (Pandas):** Used for initial data profiling and ETL processes.

## 📈 Key Performance Indicators (KPIs)

1.  **Attendance Rate:** Percentage of students present in scheduled sessions.
2.  **Pass Rate:** Percentage of students scoring above the success threshold (50%+).
3.  **Study Intensity:** Average weekly study hours per academic program.
4.  **Student Risk Level:** Identification of students with low attendance and declining academic scores.

## 📂 Data Schema

The dataset `educational_analytics_dirty.csv` includes:

- `Student_ID`: Unique student identifier.
- `Program`: Academic department (Business, Engineering, Computer Science, etc.).
- `Exam_Score`: Final exam results.
- `Study_Hours_Per_Week`: Weekly self-study duration.
- `status`: Attendance status (Present/Absent).

## 🚀 Business Intelligence (Power BI)

The project is being integrated into **Power BI** to deliver:

- **Interactive Dashboards:** Dynamic filtering by Department, Semester, and Gender.
- **Trend Analysis:** Visualizing attendance fluctuations over the academic year.
- **Early Warning System:** Automated alerts for students likely to fail based on attendance trends.

## 💻 Sample SQL Analytics

```sql
SELECT
    Program,
    ROUND(AVG(CASE WHEN LOWER(TRIM(status)) = 'present' THEN 100.0 ELSE 0.0 END), 2) AS Attendance_Rate,
    ROUND(AVG(Exam_Score), 2) AS Avg_Score,
    COUNT(*) AS Total_Records
FROM educational_analytics_dirty
WHERE Program IS NOT NULL
GROUP BY Program;
```
