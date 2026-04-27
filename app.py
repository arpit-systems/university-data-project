import streamlit as st
import mysql.connector
import pandas as pd

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="university_db"
)

st.title("University Data Dashboard")

# Student-Course Mapping
st.subheader("Student-Course Mapping")
q1 = """
SELECT student.name, course.course_name
FROM enrollment
JOIN student ON enrollment.student_id = student.student_id
JOIN course ON enrollment.course_id = course.course_id;
"""
df1 = pd.read_sql(q1, conn)
st.dataframe(df1)

# Course Popularity
st.subheader("Course Popularity")
q2 = """
SELECT course.course_name, COUNT(*) AS total_students
FROM enrollment
JOIN course ON enrollment.course_id = course.course_id
GROUP BY course.course_name
ORDER BY total_students DESC;
"""
df2 = pd.read_sql(q2, conn)
st.dataframe(df2)

conn.close()