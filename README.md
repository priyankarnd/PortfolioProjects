This repository is a showcase of my portfolio projects to join in a Data Analyst position.

SQLQuery1.sql:
Covid-19 Death dataset from https://ourworldindata.org/covid-deaths is used and the data is processed in MS Excel. The Excel files are imported in the MS SQL Server and then SQL queries are performed to retrieve the required information as described in the comments in the file.


Tableau Project: 
Using the queries of views, a COVID global dashboard is created in Tableau with the link: https://public.tableau.com/app/profile/priyankar.roychowdhury/viz/CovidDashboard_16224990379010/Dashboard1


DataCleaningQuery.sql



postgres-challenge.sql:
At ABC Company, each year every employee is given a percentage based increment to their salaries based on the departments they belong to. You have to write a Python or psql script(s) to read from flat_data.csv and store into employees and department DB tables in the schema below. Furthermore you need to read tables from the database, calculate the updated salaries and write them back. Please note that you will need to create these tables in the PostgreSQL.

The database contains the following schemas:

employee: id :: UUID, first_name::Text, last_name::Text, salary::numeric, department_id::UUID
department: id::UUID, name::Text, salary_increment::numeric
The salary_increment column in department contains the percentage value for calculating the salary. The output of the process should be the following table

updated_salaries: employee_id, updated_salary
All the tables must be created by script and have the necessary key relationships between them.

Please use the following data in the flat_data.csv file

first_name,last_name,salary,dept_name,salary_increment
Darius,Mufutau,3901,Finance,10
Tiger,Elliott,5489,IT,15
Malik,Macaulay,5444,Sales,17
Ali,Vance,8993,Marketing,16
Randall,Deacon,9515,IT,15
Josiah,Lee,8113,Sales,17
Dante,Mohammad,8446,Sales,17
Wyatt,Kuame,4817,Marketing,16
Quinn,Oliver,5513,Finance,10
Oliver,Gary,5158,IT,15
Thane,Phelan,4957,Sales,17
Walter,Lester,3864,Finance,10
Samson,Dolan,6855,IT,15
Beck,Walker,7077,Sales,17
Lucas,Marshall,7499,Marketing,16
John,Nash,4269,IT,15
Quinlan,Elliott,7503,Sales,17
Ivan,Dennis,4048,Sales,17
Wang,Ronan,9319,Marketing,16
Stone,Jameson,9354,Finance,10
Clayton,Jarrod,4102,IT,15
Cain,Sean,7353,Sales,17


