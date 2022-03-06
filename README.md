# 5663TeamProject
Database Team Project
## Team Members
Vincent Rodriguez Heidi Ramzel Daniel Blue-Diaz

### Description
For the first phase of this project you will extract, transform and load (ETL) a large dataset (UK Accidents) into a 
relational database using SQL Server Integration Services (SSIS). Then, you will build a normalized database (using 
SQL Server and SQL Server Management Studio) and issue SQL queries. For the second phase you will convert the 
normalized database from phase 1 into a dimensional database and an associated cube, using SQL Server Analysis 
Services (SSAS). You will then issue aggregate (MDX) queries to this cube. For the third phase, you will construct a 
NoSQL database using MongoDB using the UK Accidents data and issue NoSQL queries to this database.
Data Source
The UK Traffic Accidents database is available at https://www.kaggle.com/silicon99/dft-accident-data. Download 
**Accidents0515.csv**, **Casualties0515.csv** and **Vehicles0515.csv** files, as well as all the csv files in the contextCSVs 
folder. 
I have created a zipfile TermProjectFiles.zip in Canvas that contains the Accidents0515.csv, Casualties0515.csv and 
Vehicles0515.csv files as well as a Microsoft Excel 97-2003 file called ContextCSVSheets2003.xls that contains all 
the ContextCSV files as separate sheets with the appropriate names (see table below).

<table>
  <tr>
    <th>Accidents0515.csv</th><th>Casualties0515.csv</th><th>Vehicles0515.csv</th>
  </tr>
  <tr>
    <td>
      accident_severity<br>
      day_of_week<br>
      junction_detail<br>
      junction_control<br>
      light_conditions<br>
      local_authorty_district<br>
      local_authority_highway<br>
      pedestrian_crossing_human_control<br>
      pedestrian_crossing_physical_facilities<br>
      police_force<br>
      police_officer_attend_scene<br>
      road_class (can be related to<br>
      First_Road_Class in Accidents table)<br>
      road_type<br>
      urban_or_rural_area
    </td>
    <td>
      age_band<br>
      casualty_class<br>
      casualty_type<br>
      casualty_severity<br>
      pedestrian_location<br>
      pedestrian_movement<br>
    </td>
    <td>
      Journey_purpose<br>
      junction_location<br>
      point_of_impact<br>
      vehicle_type<br>
      vehicle_manoeuvre<br>
      vehicle_location<br>
      sex_of_driver (Updated – <br>
      belongs to Vehicles, not <br>
      Casualties)
    </td>
    </tr>
  </table>
  
Any columns not described by the context CSV files can be found in the main data page, by clicking the main files 
(Accidents0515.csv, Casualties0515.csv and Vehicles0515.csv). Also, download the Data Dictionary spreadsheet 
Road-Safety-Open-Dataset-Data-Guide.xlsx from Canvas. It can be used as a reference.

### Phase 1 Activities
***
1. Come up with appropriate data types for every column in all the CSV files. Use the guidelines from the 
class lecture. It is very important that any fields (columns) that are linked (such as with primary key – 
foreign key relationships) across multiple tables have the exactly same data type. (Hint: Use smallint for 
code columns in contextCSV tables as well as for their corresponding columns in the Accidents, Vehicles 
and Casualties Tables. The one exception is local_highway_authority which should be nchar(10).)

2. I will create a Database with your Section Type and your Team Number on stwssbsql01.ad.okstate.edu 
server. For example, Distance_Team01 or Tuesday_Team01, or Thursday_Team01. All members of a team 
will have access to their particular database. You will create the tables discussed below and issue queries 
on your respective team database.

3. Using SSIS (Lecture 4 Video, when available) convert each of the Accidents0515.csv, Casualties0515.csv 
and Vehicles0515.csv to separate relational tables (Accidents, Casualties and Vehicles table, respectively) 
in SQL Server Express, with appropriate primary keys. It is important that each column has an 
appropriate data type of your choosing.

4. Using SSIS and create separate tables for each of the contexxtCSV files from ContextCSVSheets2003.xls. The numerical code column in each contextCSV file will be the primary key and must have exactly the same data type for the corresponding column in one of the 3 main CSV files. For example, the table corresponding to accident_severity has the following code and description:

  > 1 Fatal
  > 2 Serious
  > 3 Slight
 
  Its primary key should be the accident_severity_code (code) and the second column contains the accident_severity_description (label). This table will then be linked with the main accident_severity column of the Accident table. You have to do this for every relevant column that matches up with the tables corresponding to the contextCSV files.  You may want to prefix these contextCSV tables with their relevant main table names. E.g., accident_accident_severity will be the table corresponding to the accident_severity contextCSV. You may also want to prefix the column names of these tables with the name of the table. 
  Example: accident_severity_code and 
            accident_severity_description.
  
5. Using SSMS, you will then establish primary-key foreign key constraints among the three main tables 
(Accidents, Casualties and Vehicles) as well as between each of the main tables and their column code 
tables (see diagram based on my implementation below).

6. Justify whether your entire relational database is in 3NF or not. You don’t have to take every context 
table; you can argue with just one of them.

7. Queries: Come up with 10 queries that answer interesting questions.
  -  Write out what the query is answering first in English narrative and then give the query and its response output (You can limit records to 10 or so; enough to show a representative sample).
  -  Each query must include at least two main tables (Accidents, Casualties, Vehicles) and at least two context tables. No query must be from just one table.
  -  Your queries must include examples of subqueries (uncorrelated and correlated), JOIN queries (at least one of them an outer join), GROUP BY, GROUP BY ROLLUP, GROUP BY CUBE. 
  -  In every query, make a note that highlight which of these features have been included.
8. Conclusion: Write a short one paragraph of what you feel about using a normalized database such as this to extract business intelligence using SQL. What do you think are the strengths and limitations?
