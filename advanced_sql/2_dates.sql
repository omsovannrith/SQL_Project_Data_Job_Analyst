-- SELECT '2023-01-01'::DATE,
--         '123'::INTEGER,
--         'true'::BOOLEAN,
--         '3.14'::REAL;
SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS date_month
FROM job_postings_fact
LIMIT 5;
SELECT COUNT(job_id) AS job_posted_count,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posted_count DESC;
-- 1
SELECT job_schedule_type,
    ROUND(AVG(salary_year_avg), 2) AS avg_year_salary,
    ROUND(AVG(salary_hour_avg), 2) AS avg_hour_salary
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;
SELECT *
FROM job_postings_fact
limit 100;
-- 2
SELECT COUNT(*) AS job_posted_count,
    -- job_location as Location,
    -- job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New York' ,
    -- EXTRACT(MONTH FROM job_posted_date) as month
    EXTRACT(
        MONTH
        FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York'
    ) AS month
FROM job_postings_fact
WHERE job_posted_date > '2023-01-01'
    AND job_posted_date < '2024-01-01'
GROUP BY month
ORDER BY month;
-- 3
SELECT DISTINCT company_dim.company_id,
    name,
    job_health_insurance,
    job_posted_date
FROM job_postings_fact
    JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE job_health_insurance = TRUE
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023
    AND EXTRACT(
        QUARTER
        FROM job_posted_date
    ) = 2
ORDER BY job_posted_date;
SELECT *
FROM company_dim
limit 100;
SELECT DISTINCT ON (company_dim.company_id) company_dim.company_id,
    name,
    TRUE AS job_health_insurance,
    job_posted_date
FROM job_postings_fact
    JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_health_insurance = TRUE
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023
    AND EXTRACT(
        QUARTER
        FROM job_posted_date
    ) = 2
ORDER BY company_dim.company_id,
    job_posted_date;