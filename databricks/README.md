# Databricks

The notebook implements a simple medallion architecture.

```text
ADLS JSON
   ↓
Bronze: raw + metadata
   ↓
Silver: cleaned + deduplicated
   ↓
Gold: account sales summary
```

The Gold layer should calculate open deals and open pipeline value, as well as won/lost metrics and touch count.
