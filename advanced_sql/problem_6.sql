--1
CREATE TABLE jan_2023_jobs AS
SELECT *
FROM job_postings_fact
WHERE job_posted_date > '2023-01-01'
    AND job_posted_date < '2023-02-01'
ORDER BY job_posted_date,
    job_id;
SELECT *
FROM jan_2023_jobs;
--2
CREATE TABLE feb_2023_jobs AS
SELECT *
FROM job_postings_fact
WHERE job_posted_date > '2023-02-01'
    AND job_posted_date < '2023-03-01'
ORDER BY job_posted_date,
    job_id;
SELECT *
FROM feb_2023_jobs;
--3
CREATE TABLE mar_2023_jobs AS
SELECT *
FROM job_postings_fact
WHERE job_posted_date > '2023-03-01'
    AND job_posted_date < '2023-04-01'
ORDER BY job_posted_date,
    job_id;
SELECT *
FROM mar_2023_jobs;
-- 1
CREATE TABLE jan_2023_jobs_extract AS
SELECT *
FROM job_postings_fact
where EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 1
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023
ORDER BY job_posted_date;
SELECT *
FROM jan_2023_jobs_extract;
--2
CREATE TABLE feb_2023_jobs_extract AS
SELECT *
FROM job_postings_fact
where EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 2
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023
ORDER BY job_posted_date;
SELECT *
FROM feb_2023_jobs_extract;
--3 
CREATE TABLE mar_2023_jobs_extract AS
SELECT *
FROM job_postings_fact
where EXTRACT(
        MONTH
        FROM job_posted_date
    ) = 3
    AND EXTRACT(
        YEAR
        FROM job_posted_date
    ) = 2023
ORDER BY job_posted_date;
SELECT *
FROM mar_2023_jobs_extract;