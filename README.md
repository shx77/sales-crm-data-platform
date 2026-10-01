# Sales CRM Data Platform

A small end-to-end cloud data engineering project built to demonstrate API ingestion, incremental loading, data transformation, and analytics.

## Simple explanation

> A FastAPI CRM API provides sales data. Azure Data Factory pulls only new or changed records and stores them in Azure Data Lake. Databricks cleans the data and builds Bronze, Silver, and Gold layers for reporting.

```text
FastAPI API
    ↓
Azure Data Factory
    ↓
ADLS Gen2
    ↓
Databricks
 ┌── Bronze
 ├── Silver
 └── Gold
```

## What I built

- FastAPI CRM source API (kept in a separate repository)
- Azure Data Factory incremental pipeline
- SQL watermark table for incremental loading
- ADLS Gen2 raw storage
- Databricks Bronze / Silver / Gold processing
- Gold sales metrics

## ADF pipeline

The main working pipeline is:

`PL_SalesCRM_Incremental`

It does:

1. Set a run cutoff.
2. Loop through each CRM entity.
3. Read the last successful watermark from Azure SQL.
4. Request records updated since that watermark.
5. Write the API response to ADLS Gen2.
6. Update the watermark only after the load succeeds.

Raw data is stored like:

`raw/deals/load_date=<timestamp>/data.json`

## Databricks

### Bronze
Raw API records with ingestion metadata.

### Silver
Cleaned records with normalized dates and duplicate removal.

### Gold
Account-level sales summary.

Target metrics:

- total deals
- open deals
- open pipeline value
- % open deals
- won deals / value
- lost deals / value
- touch count

Open pipeline value:

`SUM(deal_value)` where stage is not `won` or `lost`.

% open deals:

`open_deals / total_deals * 100`

Deals and touches are aggregated separately before joining to avoid join fan-out.

## Data quality

The source API intentionally contains some bad data such as duplicate records, missing values, invalid dates, and negative values. This gives the project realistic data-quality cases to discuss.

ADF-native validation/quarantine was investigated as a next step, but is not presented as production-complete.

## Source API

The FastAPI source is maintained separately.

Repository: `https://github.com/shx77/sales-crm-api` (update if the repository URL changes).

## Azure services

- Azure App Service
- Azure Data Factory
- Azure Data Lake Storage Gen2
- Azure SQL Database
- Azure Databricks

## Important

No passwords, access keys, connection strings, or tokens belong in this repository.
