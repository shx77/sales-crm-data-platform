# Interview explanation

## 30-second version

I built a small sales CRM data platform. A FastAPI service acts as the source. Azure Data Factory handles incremental ingestion using a SQL watermark, and writes the API data to ADLS Gen2. Databricks then processes the data through Bronze, Silver, and Gold layers. The Gold layer produces account-level sales KPIs.

## Why a watermark?

Instead of downloading all records every run, the pipeline remembers the last successful update time and asks the API for records changed after that point.

## Why Bronze / Silver / Gold?

- Bronze: keep the incoming data close to the source.
- Silver: clean and prepare it.
- Gold: make it useful for reporting.

## How did you avoid fan-out?

I aggregate deals to account level and touches to account level separately, then join the aggregates to accounts.

## What would I improve next?

I would add a fully tested ADF validation/quarantine step and stronger production monitoring and alerting.

## Honest positioning

This is a portfolio project and my first clearly titled Data Engineering role. I have hands-on experience with the pieces, while some Azure services such as advanced Databricks/ADF features are areas I am continuing to deepen.
