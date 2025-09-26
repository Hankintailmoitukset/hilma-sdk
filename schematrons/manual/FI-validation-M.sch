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
    <rule context="//efac:LotResult[.//efbc:AssetCategoryCode[@listName='vehicle-category'] = 'm3' and $noticeSubType = ('29', '30')]">
        <let name="requiredVehicles" value="('vehicles', 'vehicles-zero-emission', 'vehicles-clean')"/>
        <let name="actualVehicles" value=".//efac:StrategicProcurementStatistics/efbc:StatisticsCode[@listName='vehicles']/normalize-space()"/>
        <let name="missingVehicles" value="$requiredVehicles[not(. = $actualVehicles)]"/>
        <assert id="FI-M-FI-0003" test="empty($missingVehicles)">
            rule|text|FI-M-FI-0003 [Missing vehicle stats: <value-of select="string-join($missingVehicles, ', ')"/>]
        </assert>
    </rule>
        <rule context="//efac:LotResult[.//efbc:AssetCategoryCode[@listName='vehicle-category'] = ('m1-m2-n1', 'n2-n3') and $noticeSubType = ('29', '30')]">
        <let name="requiredVehicles" value="('vehicles', 'vehicles-clean')"/>
        <let name="actualVehicles" value=".//efac:StrategicProcurementStatistics/efbc:StatisticsCode[@listName='vehicles']/normalize-space()"/>
        <let name="missingVehicles" value="$requiredVehicles[not(. = $actualVehicles)]"/>
        <assert id="FI-M-FI-0004" test="empty($missingVehicles)">
            rule|text|FI-M-FI-0004 [Missing vehicle stats: <value-of select="string-join($missingVehicles, ', ')"/>]
        </assert>
        <assert id="FI-M-FI-0005" test="not('vehicles-zero-emission' = $actualVehicles)">
            rule|text|FI-M-FI-0005 [Forbidden vehicle stat used: vehicles-zero-emission]
        </assert>
    </rule>
</pattern>