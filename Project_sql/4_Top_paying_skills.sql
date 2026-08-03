/*
Answer: What are the top skills on salary?
- Look at the average salary associated with the skills for Data Analyst positions
- Focus on roles with specified salaries, reguardless of location 
- Why? It reveals how different skills impact salary levels for Data Analyst and 
    help identify the most financially rewarding skills to aquire or improve 
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25


/*
    here's a breakdown of the results for top paying skills
    - High demand for big data & ML skills: Top salaries
    - Software development & deployment proficiency:
    - Cloud computing epertise: familarity with cloud
    [
  {
    "skills": "pyspark",
    "avg_salary": "208172",
    "demand_count": "2"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155",
    "demand_count": "2"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515",
    "demand_count": "1"
  },
  {
    "skills": "watson",
    "avg_salary": "160515",
    "demand_count": "1"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486",
    "demand_count": "1"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500",
    "demand_count": "3"
  },
  {
    "skills": "swift",
    "avg_salary": "153750",
    "demand_count": "2"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777",
    "demand_count": "3"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821",
    "demand_count": "9"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000",
    "demand_count": "1"
  },
  {
    "skills": "golang",
    "avg_salary": "145000",
    "demand_count": "1"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513",
    "demand_count": "5"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907",
    "demand_count": "10"
  },
  {
    "skills": "linux",
    "avg_salary": "136508",
    "demand_count": "2"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500",
    "demand_count": "2"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162",
    "demand_count": "5"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000",
    "demand_count": "1"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103",
    "demand_count": "5"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781",
    "demand_count": "2"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436",
    "demand_count": "3"
  },
  {
    "skills": "notion",
    "avg_salary": "125000",
    "demand_count": "1"
  },
  {
    "skills": "scala",
    "avg_salary": "124903",
    "demand_count": "5"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879",
    "demand_count": "4"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500",
    "demand_count": "3"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619",
    "demand_count": "2"
  }
]
*/