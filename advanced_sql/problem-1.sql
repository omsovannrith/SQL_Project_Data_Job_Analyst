SELECT MIN(salary_year_avg),
    MAX(salary_year_avg)
FROM job_postings_fact
where job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL;
SELECT job_title_short,
    MIN(salary_year_avg) AS min_salary,
    PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY salary_year_avg
    ) AS median_salary,
    MAX(salary_year_avg) AS max_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
GROUP BY job_title_short
ORDER BY max_salary DESC;
SELECT PERCENTILE_CONT(0.25) WITHIN GROUP (
        ORDER BY salary_year_avg
    ) AS low_salary,
    PERCENTILE_CONT(0.50) WITHIN GROUP (
        ORDER BY salary_year_avg
    ) AS standard_salary,
    PERCENTILE_CONT(0.75) WITHIN GROUP (
        ORDER BY salary_year_avg
    ) AS high_salary
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL;
SELECT job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 90000 THEN 'high salary'
        WHEN salary_year_avg BETWEEN 70000 AND 90000 THEN 'Standard Salary'
        WHEN salary_year_avg < 70000 THEN 'Low Salary'
        ELSE 'Unknown'
    END AS salary_bucket
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC NULLS LAST;