SELECT COUNT(job_id) AS number_of_jobs,
    CASE
        job_location
        WHEN 'Anywhere' THEN 'Remote'
        WHEN 'New York, NY' THEN 'Local'
        ELSE 'On Site'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;