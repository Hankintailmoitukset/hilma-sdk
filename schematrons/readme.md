# Schematrons
## About
The schematron files in this directory are generated automatically (if not stated otherwise) based on data provided 
based on `nationalfields.json` and `nationalrules.json`. See readme.md in nationalValidator directory for more indepth information.

## Usage
We use these schematrons in conjunction with TED-OP schematrons (this can be clearly seen in the `hilma-validation.sch`) to generate the stylesheets used to validate XML.

## Deviation From TED-OP
hilma-validation.sch deviates from TED-OP's validation. hilma-validation.sch splits the validation into two stages.
Which is implemented using schematron phases. This decision was made to reduce file size and increase performance.

### Shared Stage (Schematron Phase)
This shared phase is a collection of all files that are duplicated across every phase. This stage is run at the beginning of every
validation request

### Notice Specific Stage (Schematron Phase)
The notice subtype is used to select the needed phase.

### Merging
This approach produces two reports (shared and notice subtype) which are merged before being returned.

## Translation Validation
All schematron assert elements must have corresponding translations in both English and Finnish. This is automatically validated during CI/CD.

### Translation Files
- `translations/hilma_rule_en.xml` - English translations
- `translations/hilma_rule_fi.xml` - Finnish translations

### Translation Format
Each assert ID in the schematron files must have a matching entry in both translation files:

```xml
<!-- Schematron assert -->
<assert id="FI-1-FI-125-1" role="ERROR" test="...">rule|text|FI-1-FI-125-1</assert>

<!-- Translation entry -->
<entry key="rule|text|FI-1-FI-125-1">FI-1-FI-125-1 - is not allowed.</entry>
```

### Validation Coverage
The GitHub Actions workflow (`validate-schematron.yml`) automatically checks:
- All assert IDs from `schematrons/generated/*.sch`
- All assert IDs from `schematrons/manual/*.sch`
- Cross-references against `translations/hilma_rule_en.xml`
- Cross-references against `translations/hilma_rule_fi.xml`

If any assert ID is missing translations in either language, the workflow will fail and list the missing IDs.

