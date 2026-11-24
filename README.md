# Healthcare SQL Analysis

## Project Overview
SQL analysis of healthcare data to understand patient lab results, treatment costs, and outcomes by diagnosis.

## Database Schema
Database: `healthcare` with 4 tables:
- **Patients**: age, gender, diagnosis, admission/discharge date, outcome, treatment cost
- **Diagnoses**: diagnosis names
- **Outcomes**: outcome types
- **Labs**: lab tests and results per patient

Tables are linked using primary and foreign keys (Patients → Diagnoses, Outcomes; Labs → Patients).

## Tools Used
- MySQL
- MySQL Workbench
- Excel

## Key Analysis
1. Detailed lab history of every patient (4-table JOIN)
2. Average lab result by diagnosis and test
3. Count of abnormal lab results per patient (Blood Sugar, Cholesterol, Hemoglobin)
4. Diagnoses with the highest total treatment cost
5. High-risk patients (age above 65 and not recovered)
6. Lab trend over time for selected patients
7. Distribution of outcomes by diagnosis

## Files
- `My SQL Project1.sql`: table creation and all queries
- `patients.xlsx`, `Diagnoses.xlsx`, `Outcome.xlsx`, `LabID.xlsx`: source data
