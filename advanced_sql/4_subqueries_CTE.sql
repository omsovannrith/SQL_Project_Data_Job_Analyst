SELECT *
FROM (
        -- SubQueriey Starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(
                MONTH
                FROM job_posted_date
            ) = 1
    ) AS january_jobs;
-- Subquery ends here
WITH january_jobs AS (
    -- CTE defination starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(
            MONTH
            FROM job_posted_date
        ) = 1
) -- CTE defination ends here
SELECT *
FROM january_jobs;
select *
from job_postings_fact;
SELECT company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
        SELECT company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = true
    );
-- Find the companies that have the most openings.
-- Get the total number of job posting per company id (job_posting_fact)
-- Return the total number of jobs with the company name (company_dim)
SELECT company_id,
    job_title_short
FROM job_postings_fact
WHERE company_id IN (
        SELECT company_id
        FROM company_dim
        WHERE
    )
SELECT *
FROM company_dim;
WITH company_job_count AS (
    SELECT company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
    LEFT jOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;