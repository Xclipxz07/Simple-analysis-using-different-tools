CREATE DATABASE ae_analytics;
USE ae_analytics;


CREATE TABLE ae_data (
    id INT PRIMARY KEY,
    month VARCHAR(20),
    total_attendances INT,
    admissions INT,
    seen_within_4hrs DECIMAL(5,2)
);
INSERT INTO ae_data (id, month, total_attendances, admissions, seen_within_4hrs)
VALUES
(1, 'January',   15000, 4000, 87.5),
(2, 'February',  14500, 3800, 88.3),
(3, 'March',     16000, 4200, 86.9),
(4, 'April',     15500, 4100, 89.1),
(5, 'May',       16200, 4300, 85.7);

SELECT * FROM ae_data;

/*CALCULATING TOTAL ATTENDANCES ACROSS ALL MONTH*/
SELECT SUM(total_attendances) AS total_attendances_all_months
FROM ae_data;

/*FINDING MONTH WITH HIGHEST ATTENDACE*/
SELECT month, total_attendances
FROM ae_data
ORDER BY total_attendances DESC
LIMIT 1;

/*AVERAGE 4HR PERFORMANCE*/
SELECT AVG(seen_within_4hrs) AS avg_performance
FROM ae_data;

/*ADMISSION RATE*/
SELECT 
    month,
    ROUND((admissions * 100.0 / total_attendances), 2) AS admission_rate
FROM ae_data;

/*IDENTIFYING UNDERPERFORMING MONTH(<87%)*/
SELECT month, seen_within_4hrs
FROM ae_data
WHERE seen_within_4hrs < 87;