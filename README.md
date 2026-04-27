# 📊 University Data Management & Analytics System

## 🔹 Live Demo
🚀 https://university-data-project-4pf2z5vywhixglvwxgq4le.streamlit.app/

---

## 🔹 Overview
This project demonstrates an end-to-end relational data system, including database design, data modeling, and interactive analytics using SQL and Streamlit.

It simulates a real-world university environment where students enroll in courses and professors teach them.

---

## 🔹 Database Design

### 📌 Entity Tables
- Student  
- Course  
- Professor  

### 🔗 Junction Tables
- Enrollment (Student ↔ Course)  
- Teaching (Professor ↔ Course)  

### 🔑 Relationships
- Many-to-Many relationships implemented using junction tables  

### 🧠 Keys Used
- Primary Keys  
- Composite Keys  
- Relational Mapping  

---

## 🔹 SQL Concepts Used
- SELECT, WHERE  
- INNER JOIN  
- GROUP BY, COUNT  
- HAVING  
- ORDER BY  
- DISTINCT  
- Multi-table joins  

---

## 🔹 Key Analysis
- 📌 Student–Course Mapping  
- 📈 Course Popularity Analysis  
- 👥 Students enrolled in multiple courses  
- 🎓 Professor–Course mapping  
- 🔗 Full relational data insights  

---

## 🔹 Tech Stack
- SQLite (Database)  
- SQL (Querying)  
- Python (Backend)  
- Streamlit (Dashboard)  

---

## 🔹 Project Purpose
To demonstrate strong SQL fundamentals, relational database design, and the ability to solve real-world analytical problems using structured data.

This project also showcases a complete workflow:
**Database → Querying → Visualization → Deployment**

---

## 🔹 How to Run Locally

```bash
pip install -r requirements.txt
streamlit run app.py

