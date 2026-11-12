# Olist E-Commerce Data Engineering Pipeline

## Project Overview

This project implements an end-to-end data engineering pipeline using the Brazilian Olist E-Commerce dataset.

The objective is to transform raw transactional data into reliable, analytics-ready datasets for business intelligence and reporting.

## Architecture

**Raw CSV Files → Bronze → Silver → Gold → PostgreSQL → Power BI**

Apache Airflow orchestrates the pipeline, while Apache Spark performs distributed-style data processing in a local Docker environment.

### Bronze Layer — Data Ingestion
- Ingestion of 9 source CSV files.
- Storage using Delta Lake.
- Technical metadata: ingestion timestamp, source filename and batch ID.
- Full-load ingestion strategy.

### Silver Layer — Data Transformation
- Data type conversion and standardization.
- Business rule validation.
- Separation of valid and invalid records.
- Quarantine tables for rejected records.
- Data quality and integrity checks.

### Gold Layer — Dimensional Modeling

The analytical model contains two fact tables and four dimensions.

| Fact Tables | Dimension Tables |
|---|---|
| fact_orders | dim_customers |
| fact_order_items | dim_products |
| | dim_sellers |
| | dim_date |

The Gold layer supports analysis of orders, payments, products, customers, sellers and purchasing trends.

## Technologies

| Technology | Purpose |
|---|---|
| Python | Pipeline development |
| Apache Spark / PySpark | Data transformations |
| Delta Lake | Transactional data storage |
| Apache Airflow | Workflow orchestration |
| PostgreSQL | Analytical data serving |
| Power BI | Reporting and visualization |
| Docker | Containerized development |

## Data Quality Results

- 99,441 orders processed.
- 112,650 order items.
- Zero rejected orders in the validated Silver Orders dataset.
- Zero missing references across the six validated Gold relationships.
- 774 calendar dates in the date dimension.

## PostgreSQL and Power BI

Six Gold tables are exported to PostgreSQL and imported into Power BI.

The dashboard includes:
- Total orders.
- Total payments.
- Monthly payment trends.
- Product category analysis.
- Order status distribution.
- Year-based filtering.

## Apache Airflow

Airflow defines task dependencies across ingestion, transformation, validation and publication.

The pipeline uses a manually triggered DAG with sequential task execution.

**Execution status:** Full DAG validation in progress.

## Future Improvements

- Automated data quality reporting.
- Incremental ingestion for newly arriving source files.
- CI/CD integration.
- Production-ready Airflow deployment.
- Automated Power BI refresh.