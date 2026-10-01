# Pipeline design

```text
FastAPI
  ↓ HTTPS
ADF
  ↓ incremental request using updated_since
ADLS Gen2
  ↓
Databricks Bronze
  ↓
Databricks Silver
  ↓
Databricks Gold
```

The watermark is stored in Azure SQL.

The watermark is updated after the entity load succeeds, so a failed load does not advance the checkpoint.
