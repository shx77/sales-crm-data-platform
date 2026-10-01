# Data quality

The API intentionally contains realistic problems:

- duplicate records
- missing account IDs / required values
- invalid dates
- negative values
- updated records arriving later

The intended future pattern is:

```text
API
 ↓
ADF validation
 ├── valid → ADLS
 └── invalid → quarantine
```

ADF Mapping Data Flow was investigated for this step. It is not currently presented as a production-complete component.
