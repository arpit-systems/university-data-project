import streamlit as st
import sqlite3
import pandas as pd

# connect to SQLite database
conn = sqlite3.connect("cms.db")

st.title("University Data Dashboard")

# -------------------------------
# 1. Student-Course Mapping
# -------------------------------
st.subheader("Student-Course Mapping")

q1 = """
SELECT student.name, course.course_name
FROM enrollment
JOIN student ON enrollment.student_id = student.student_id
JOIN course ON enrollment.course_id = course.course_id;
"""

df1 = pd.read_sql(q1, conn)
st.dataframe(df1)

# -------------------------------
# 2. Course Popularity
# -------------------------------
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

# -------------------------------
# 3. Students with Multiple Courses
# -------------------------------
st.subheader("Students Enrolled in More Than 1 Course")

q3 = """
SELECT student.name, COUNT(*) AS total_courses
FROM enrollment
JOIN student ON enrollment.student_id = student.student_id
GROUP BY student.student_id
HAVING COUNT(*) > 1;
"""

df3 = pd.read_sql(q3, conn)
st.dataframe(df3)

# -------------------------------
# 4. Professor Teaching Courses
# -------------------------------
st.subheader("Professor Teaching Courses")

q4 = """
SELECT professor.name AS professor_name, course.course_name
FROM teaching
JOIN professor ON teaching.professor_id = professor.professor_id
JOIN course ON teaching.course_id = course.course_id;
"""

df4 = pd.read_sql(q4, conn)
st.dataframe(df4)

conn.close()
