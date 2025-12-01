# Hilma-SDK

---

## About

Hilma-SDK provides the resources needed to understand eForms XML data structure and validation rules in Hilma. Hilma SDK extends the eForms data structure defined in TED SDK and therefore cannot be used as a standalone reference for creating valid eForms notices.
 
For more in-depth information see below.

---

## National Rules And Fields

The files described below can be used in conjunction with TED-OP SDK to understand the validation constraints
when using Hilma API.

### nationalRules.json

`nationalRules.json` is an array of national tailorings for fields defined in TED-OP fields.json. These rules override the corresponding rules defined by TED, following a logical priority pattern. National tailorings can only implement stricter rules than originally defined by TED.

For example:
- Hilma can define optional fields as mandatory
- Hilma cannot define mandatory fields as optional

### nationalFields.json

`nationalFields.json` contains the definitions of national fields not defined in TED SDK. The structure is much like the fields.json in TED-OP, it contains both the field XML paths and field validation rules, among other metadata. This file can be used in conjuction with the XML structure below to better understand Hilma's extended eForms notice structure.

---

## XML Notice Structure And National Specific Fields

As noted above, we are not only modifying TEDs `fields.json`, we are also appending new national fields. The xsd files in the `schema` directory are the result of merging TED-OP xsd schemas with Hilma national xsd schema.
- NationalNoticeExtension.xsd (describes the national field nodes)

Below files are based on TED-OP xsd schemas, augmented with NationalNoticeExtension.xsd
- National-BusinessRegistrationInformationNotice.xsd 
- National-ContractAwardNotice-2.3.xsd
- National-PriorInformationNotice-2.3.xsd
- NationalContractNotice.xsd

---

## Hilma API
This chapter describes the relationship between Hilma SDK and Hilma API.

---

## Glossary

- `fields.json`: Is a reference to TED-OP fields.json.
- `national rules`: Hilma's national rules.
- `national fields`: Hilma's national fields.

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

