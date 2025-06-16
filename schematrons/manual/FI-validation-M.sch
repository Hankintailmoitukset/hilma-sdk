<?xml version="1.0" encoding="UTF-8"?>
<!-- Manual validation rules -->
<pattern id="FI-validation-M" xmlns="http://purl.oclc.org/dsdl/schematron">
    <rule context="/*" >
        <assert id="FI-M-FI-0001" test="count(hilma:NationalExtension/hilma:ProcurementProject) or not($noticeSubType = ('E1', 'E3', 'E4'))">rule|text|FI-M-FI-0001</assert>
    </rule>

    
    <rule context="/*/cac:TenderingTerms/cac:TendererQualificationRequest[$noticeSubType = ('14', '15', '16', '17', '19', '20', '21', '23', '24') and cac:SpecificTendererRequirement/cbc:TendererRequirementTypeCode[@listName='exclusion-ground']]">
        <let name="grounds" value="('exg-crim-part','exg-crim-corrpt','exg-crim-fraud','exg-crim-terror','exg-crim-laund','exg-crim-traffick','exg-pmt-bre-tax','exg-pmt-bre-ssc','exg-natl')"/>
        <let name="actual" value="cac:SpecificTendererRequirement/cbc:TendererRequirementTypeCode[@listName='exclusion-ground']/normalize-space()"/>
        <let name="missing" value="$grounds[not(. = $actual)]"/>
        <assert id="FI-M-FI-0002" test="empty($missing)">
            rule|text|FI-M-FI-0002 [<value-of select="string-join($missing, ', ')"/>]
        </assert>
    </rule>
</pattern>