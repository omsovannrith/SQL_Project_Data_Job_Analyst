/*
 Question: What are the top paying data analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that available remotely
 - Focuses on job postings with specificed salaries (remove nulls)
 - Why? Highlight the top-paying opportunity for Data Analysis, offering insights into 
 */
SELECT job_id,
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    company_dim.name AS Company_name,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;