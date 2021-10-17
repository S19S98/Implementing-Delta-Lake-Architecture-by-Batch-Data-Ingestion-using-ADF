# Implementing-Delta-Lake-Architecture-by-Batch-Data-Ingestion-using-ADF
Delta Lake architecture implementation

# AIM:
To implement a delta lake architecture which consists of **Bronze Layer** (raw data), **Silver Layer**  (Grouping of logical columns from multiple tables of Bronze Layer)
and **Gold Layer** (Cleaned and Enriched data ready for Analytics and data scientist applications) using **Azure Data Factory**. 
Azure Data Factory helps to create the **ETL pipelines** and load data Batch by Batch at hourly rate. 
Finally using **Databricks** perform analytics to get some insight from the original raw data. 

# Resources Used:
- Azure SQL Server 
- ADLS Blob Storage: 
  - Containers 
    - Bronze 
    - Silver 
    - Gold 
- Azure Data Factory 
- Databricks 

# Resource Deployment:
All the above resources are deployed using Azure, under a single Resource Group:
  - Azure SQL Server: sql-db-etl, in East US
    - The SQL Server database had a sample AdventureWorksLT db, provisioned by Azure, was used in the project
      - Tables: Address, Customer, CustomerAddress, Product, ProductCategory, ProductDescription, ProductModel, ProductModelProductDescription, SalesOrderDetail, SalesOrderHeader
      - Schema: SalesLT
  - ADLS BLOb Storage: az21ssadls, Containers - bronze, silver, gold
  - Azure Data Factory:
    - Linked Services:
      - Azure Databricks
      - Azure Blob Storage (bronze(acts as both input and output), silver(acts as input), gold)
      - Azure SQL Database (acts as an output)
    - Datasets:
      - 10 input datasets from Azure SQL Database to bronze ADLS container
      - 10 input datasets from Bronze ADLS container to silver ADLS container
     
# Pipeline 1:
  - Involves direct Copy Data activity from source SQL Server to Target ADLS Bronze Container. 
  - Also added a Tumbling Window Trigger to copy data after every one hour acting as a batch load of data.
  - Populates the bronze container with 10 csv files converted from SQL tables.

# Pipeline 2:
  - Based on the type of data present in 10 different csv files in bronze, merged them into 3 csv files to silver depending on the importance of the columns
  - Below is how the csv files are merged:
    - Address + CustomerAddress + Customer = customerAndAddressDetails
    - Product + SalesOrderHeader + SalesOrderDetail = productSohSod
    - Customer + SalesOrderHeader + SalesOrderDetail + Product + CustomerAddress + Address = prodCustAddressDetails
  - The SQL queries on how the files are merged are mentioned in the SQL Queries Tab
  - And the above queries are implemented in Azure Data Factory using Data Flow
  - Similar to Pipeline 1 Tumbling Window Trigger of 1 hour is implemented. 

# Pipeline 3:
   - The final pipeline uses Databricks to copy data from Silver Layer and performs Data Cleaning and Data Enrichment and are finally loaded into Gold Layer where it is ready for analysis
   - Similar to the above two pipelines Tumbling Window Trigger of 1 hour is implemented.

# Analytics:
  - As the final step we perform analysis on the clean data using databricks.
