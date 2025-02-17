# Relational Database Project (IAL Course)

This project focuses on the **design and implementation of a relational database** on a chosen topic as part of the **IAL (Databases and Information Systems)** course. The project is developed in **teams of two students** and follows a structured approach in four phases.

The database is implemented in **Oracle 12c** and must support **repeatable execution**, meaning all SQL scripts should be able to **drop and recreate** database objects.

## 📌 Project Structure
The project consists of **four main phases**, each submitted separately:

### **1️⃣ Data Model (ERD) & Use Case Model**
- **ER Diagram** representing the data structure (in UML or Crow’s Foot notation).
- **Use Case Diagram** describing system functionality.
- The model must include **at least one generalization/specialization relationship**.
- Submission: **PDF document with diagrams and a brief description**.

### **2️⃣ SQL Schema Creation**
- SQL script for creating **database schema**, including:
  - **Tables** with **primary keys, foreign keys, and integrity constraints**.
  - **Sample data** for testing.
  - **Generalization/specialization transformation** from ERD to relational schema.
  - **CHECK constraints** for specific column validations (e.g., IDs, ISBN, bank account numbers).
  - **Auto-generated primary keys** using sequences.
- Submission: **UTF-8 encoded SQL script**.

### **3️⃣ SQL Queries (SELECT Statements)**
- SQL script creating the schema and executing **at least seven queries**:
  - **2 queries** joining **two tables**.
  - **1 query** joining **three tables**.
  - **2 queries** using **GROUP BY and aggregation**.
  - **1 query** using the **EXISTS predicate**.
  - **1 query** using **IN with a subquery**.
- Each query must include **a comment explaining its purpose**.
- Submission: **UTF-8 encoded SQL script**.

### **4️⃣ Advanced Database Objects**
- SQL script extending the database with:
  - **2 non-trivial triggers**.
  - **2 stored procedures**, including:
    - **Cursor usage**.
    - **Exception handling**.
    - **Variable referencing table column types (`%TYPE`, `%ROWTYPE`)**.
  - **Index creation** to optimize queries.
  - **EXPLAIN PLAN analysis** before and after index creation.
  - **Access rights definition** for the second team member.
  - **Materialized view** shared between team members.
  - **Complex SELECT query** using **WITH and CASE**.
- Submission: **UTF-8 encoded SQL script**.

## 🚀 How to Run
1. **Create the database schema**:
   ```sql
   @schema.sql
2. **Create the database schema**:
   ```sql
   @queries.sql
3. **Create the database schema**:
   ```sql
   @advanced.sql

## 📝 Author
**Dinara Garipova**  && **Mark Barzali**
Project for **IDS Course**    

## ⚖️ License
This project is licensed under the **MIT License** – you are free to use, modify, and distribute with attribution.
