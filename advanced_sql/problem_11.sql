-- Practice Problem 11
-- Question 
-- Identify the top 5 skills that are most frequently mentioned in job_postings.
-- Use a subquery to find this skill IDs with highest counts in the company_dim table and then join this result 
-- with the skills_dim table to get the skil names.
SELECT company_id,
    COUNT(*) AS total_jobs
FROM job_postings_fact
GROUP BY company_id
ORDER BY total_jobs DESC;
SELECT *
FROM company_dim;
SELECT *
FROM job_postings_fact;
SELECT job_title_short,
    COUNT(*) AS job_count
FROM job_postings_fact
GROUP BY job_count;
WITH skill_id AS (
    SELECT job_title_short,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY skill_id
)
SELECT company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
    LEFT jOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;
SELECT DISTINCT job_title_short,
    COUNT(*) AS skill_id
from job_postings_fact;
SELECT skill_id,
    COUNT(*) as skill_id_count
FROM skills_dim
GROUP BY skill_id;
SELECT sd.skill_id,
    sd.skills,
    skill_count
FROM skills_dim sd
    JOIN (
        SELECT skill_id,
            COUNT(*) AS skill_count
        FROM skills_job_dim
        GROUP BY skill_id
        ORDER BY skill_count DESC
        LIMIT 5
    ) AS top_skills ON sd.skill_id = top_skills.skill_id
ORDER BY top_skills.skill_count DESC;
SELECT sd.skill_id,
    sd.skills,
    skill_count
FROM skills_dim sd
    JOIN (
        SELECT skill_id,
            COUNT(*) AS skill_count
        FROM skills_job_dim
        GROUP BY skill_id
        ORDER BY skill_count DESC
        LIMIT 5
    ) AS top_skills ON sd.skill_id = top_skills.skill_id
ORDER by top_skills.skill_count DESC;
-- Practice Problem 2
-- Quesiton:
-- Determine the size category ('Small', 'Medium', 'Large') for each company by first identify the number of jobs posting they have. 
-- Use a subquery to calculate the total job posting per company. 
-- A company is considered 'Small' if it has less than 10 job_postings. 'Meduim' if the number of job postings is between 10 and 50. and 'Large' if it has more than 60 Job postings.
-- Implement a subquery to aggregate job posting counts per company before classify them based on size.
SELECT company_id,
    COUNT(*) AS total_compony_jobs_posting
FROM company_dim
GROUP BY company_id
ORDER BY total_compony_jobs_posting DESC;
SELECT job_id,
    COUNT(*) AS jobs_count
FROM job_postings_fact
GROUP BY job_id
ORDER BY jobs_count;
SELECT cd.company_id,
    cd.name AS company_name,
    company_job_count
FROM company_dim cd
    JOIN (
        SELECT company_id,
            COUNT(*) AS company_job_count
        FROM job_postings_fact
        GROUP BY company_id
        ORDER BY company_job_count DESC
    ) as company_size ON cd.company_id = company_size.company_id
ORDER BY company_size.company_job_count;