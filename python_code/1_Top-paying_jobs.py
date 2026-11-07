# import psycopg2

# conn = psycopg2.connect(
#     host="localhost",
#     port="5432",
#     database="sql_course",
#     user="postgres",
#     password="Rith@123"
# )

# cursor = conn.cursor()
# cursor.execute("SELECT * FROM job_postings_fact LIMIT 10")

# rows = cursor.fetchall()
# print(rows)

# conn.close()

import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg2://postgres:Rith@123@localhost:5432/sql_course"
)

query = """
SELECT *
FROM job_postings_fact
LIMIT 1000;
"""

df = pd.read_sql(query, engine)

print(df.head())
print(df.info())