/*
 Find job postings from the first quarter that have a salary greater than 
 - Combine job posting tables from the first quarter of 2023 (jan_Mar)
 - Gets a job postings with an average yearly salary > $70,000
 */
SELECT *
FROM jan_2023_jobs
WHERE salary_year_avg > 70000
UNION ALL
SELECT *
FROM feb_2023_jobs
WHERE salary_year_avg > 70000
UNION ALL
SELECT *
FROM mar_2023_jobs
WHERE salary_year_avg > 70000;
SELECT job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
        SELECT *
        FROM jan_2023_jobs
        UNION ALL
        SELECT *
        FROM feb_2023_jobs
        UNION ALL
        SELECT *
        FROM mar_2023_jobs
    ) AS quarter1_job_postings
WHERE quarter1_job_postings.salary_year_avg > 70000
    AND quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY quarter1_job_postings.salary_year_avg DESC