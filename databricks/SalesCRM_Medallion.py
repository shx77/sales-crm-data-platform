# Sales CRM Medallion notebook
#
# Copy the latest working notebook cells from Azure Databricks here.
#
# Target layers:
#   Bronze -> raw API records + ingestion metadata
#   Silver -> cleaned and deduplicated records
#   Gold   -> account-level sales KPIs
#
# Gold KPI definitions:
#   open_deals = count of deals where stage NOT IN ('won', 'lost')
#   open_deal_value = sum(deal_value) for open deals
#   open_deals_pct = open_deals / total_deals * 100
#
# Important: aggregate deals and touches separately before joining to accounts
# to avoid fan-out.
