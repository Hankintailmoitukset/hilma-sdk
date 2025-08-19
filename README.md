# Hilma-SDK

---

### About

Hilma-SDK is the version control of our National Validator rules and XML data structure.
For more information about see below.

---

## Table Of Contents

- [National Validator](#national-validator)
  - [About National Validator](#about-national-validator)
  - [Current Usage In Hilma](#current-usage-in-hilma)
  - [National Rules And Fields](#national-rules-and-fields)
  - [How It Works Behind The Scenes](#how-does-it-work)

- [XDS Schemas and National fields](#xml-notice-structure-and-national-specific-fields)
  - [National fields](#national-fields)
  - [XSD and XML structure](#xsd-and-xml-structure)

- [Other](#other)
  - [Glossary](#glossary)
  - [Attributions](#attributions)

---

# National Validator

## About National Validator

The national validator is Hilma's self-hosted XML validator. The national validator unifies our validation logic into an
easily maintainable and transparent set of rules (`national-rules.json` and `national-fields.json`).

## Current Usage In Hilma

National validator is used to validate all notices submitted to Hilma using SDK version 1.13.

## National Rules And Fields

The files described below can be used in conjunction with TED-OP SDK to understand the validation constraints
when using Hilma API.

### nationalRules.json

`nationalRules.json` is a list of "condensed versions" of TED-OP fields.json field object:

```
[
    {
        "id" : < ID of fields matching fields.json >,
        "forbidden" : {
            "constraints" :
            [
                {
                "noticeTypes" : < Array of String >,
                "severity" : "ERROR",
                "value" : true
                },¨
                ....
            ],
        },
        "mandatory" : {
            "constraints" :
            [
                {
                  "noticeTypes" : < Array of String >,
                  "severity" : "ERROR",
                  "value" : true
                },
                ....
            ],
        }
        ....
]
```

### nationalFields.json

`nationalFields.json` is an implementation of TED-OP fields.json, see TED-OP field.json for example field object.

## How does it work

The Validator uses TED-OP schematron files as a base and appends Finnish national rules on top.
This process consists of multiple parts:

- `ted-field`: original field extracted from fields.json
- `national-rule`: ruleset extracted from nationalRules.json
- `national-field`: field extracted from nationalFields.json
- `enriched-fields`: abstract term used to describe the mutated `ted-field` data

This process consists of multiple stages:

- Each `ted-field` gets a `national-field` merged into it.
- Each `national-field` get appended to fields.json

This process results in an end product referred to as `enriched-fields`.
An `enriched-field` is a `ted-field` that has undergone some mutation via the above described process.

After the `enriched-fields` have been produced they are parsed into schematron and then compiled into xsl stylesheets.

The generated xsl stylesheets are hosted on our national validator.

---

# XML Notice Structure And National Specific fields

As noted above, we are not only modifying `fields.json`, we are also appending new fields and the result of this means we need to communicate the new expected data structure (XML) to our users,
for this reason we are including modified xsd files in the `schema` directory.

## National Fields

National Fields refers to any fields that are not native to `fields.json`.
Details regarding these fields can be ascertained from `national-fields.json` and xsd files described below.

The description of the national fields (extensions of TED's notice-types) is currently a WIP.

## XSD and XML structure

The `schemas` directory contains the XSD descriptions of `national notices` (E1, E3 and E4). These XSD files are modified versions
of TED's XSD's. Since `national fields` are currently only accepted on `national notices` we decided to create modified copies of the XSD's'
rather than extend the originals.

The complete XML data structure can be ascertained from the provided XSD files.

---

# Other

## Glossary

- `fields.json`: Is a reference to TED-OP fields.json.
- `national validator`: Hilma's self-hosted XML validator.
- `national rules`: Hilma's national rules.
- `national fields`: Hilma's national fields.
- `national notices`: E1, E3, E4 notice subtypes.

## Attributions

### hilma-validation.sch

hilma-validation-sch is based on work by TED-OP (https://github.com/OP-TED/eForms-SDK) and contains modifications to the
phases and file imports to accomodate Hilma's use case.

### NationalContractNotice.xsd

NationalContractNotice.xsd is based on work by TED-OP (https://github.com/OP-TED/eForms-SDK) and contains modifications to the xsd structure.

### National-PriorInformationNotice-2.3.xsd

National-PriorInformationNotice-2.3.xsd is based on work by TED-OP (https://github.com/OP-TED/eForms-SDK) and contains modifications to the xsd structure.

### National-ContractAwardNotice-2.3.xsd

National-ContractAwardNotice-2.3.xsd is based on work by TED-OP (https://github.com/OP-TED/eForms-SDK) and contains modifications to the xsd structure.

### National-BusinessRegistrationInformationNotice.xsd

National-BusinessRegistrationInformationNotice.xsd is based on work by TED-OP (https://github.com/OP-TED/eForms-SDK) and contains modifications to the xsd structure.

