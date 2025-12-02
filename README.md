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

Hilma API Portal: https://hns-hilma-prod-apim.developer.azure-api.net/

### Notice validation

The eForm notices submitted to Hilma via Hilma API are validated against validation rules defined by Hilma SDK, which themselves are an extension of validation rules defined by TED. When backwards incompatible changes to validation rules are introduced in Hilma, a new major version pre-release of Hilma SDK is published. 

In order to test the Hilma SDK pre-release validation rules, you can target the pre-release version validation rules by adding the ```hilmaSdkVersion``` query parameter to your Hilma API requests. For example:

```
?hilmaSdkVersion=v2
```

The version number should only include the major version part of the Hilma SDK release version, e.g. ```1.13.0-v2``` or ```1.13.0-v2.1``` should be targeted as ```v2```.

Examples of Hilma API endpoints that support the ```hilmaSdkVersion``` query parameter are:
- [Publish notice](https://hns-hilma-prod-apim.developer.azure-api.net/api-details#api=ets-write-eforms-api&operation=post-external-write-v1-procedure-procedureid-notice-etsidentifier)
- [Validate notice](https://hns-hilma-prod-apim.developer.azure-api.net/api-details#api=ets-write-eforms-api&operation=post-external-write-v1-validate)

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

