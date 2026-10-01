# Azure Data Factory

## Main pipeline

`PL_SalesCRM_Incremental`

Simple flow:

`Watermark → API → ADLS → Update Watermark`

The pipeline loops through accounts, deals, touches, and deal history.

The API request uses `updated_since` so the pipeline does not need to reload everything every night.
