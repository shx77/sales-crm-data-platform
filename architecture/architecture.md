# Architecture

```text
                 FastAPI CRM
                     │
                     ▼
             Azure Data Factory
                     │
             incremental load
                     │
                     ▼
                ADLS Gen2
                     │
                     ▼
              Databricks Bronze
                     │
                     ▼
              Databricks Silver
                     │
                     ▼
                Databricks Gold
                     │
                     ▼
               BI / Reporting
```
