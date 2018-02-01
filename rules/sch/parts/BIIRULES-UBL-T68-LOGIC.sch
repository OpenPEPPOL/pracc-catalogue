<?xml version="1.0" encoding="UTF-8"?>
<pattern id="UBL-T68" xmlns="http://purl.oclc.org/dsdl/schematron">
  <rule context="cac:Dimension[cbc:AttributeID = 'HUM']">
    <assert id="BII3-T68-R018"
            test="not(cbc:MinimumMeasure) or not(cbc:MaximumMeasure) or cbc:MinimumMeasure &lt;= cbc:MaximumMeasure"
            flag="fatal">The Handling unit minimum storage humidity MUST be smaller than or equal to the Handling unit maximum storage humidity.</assert>
  </rule>
  <rule context="cac:Dimension[cbc:AttributeID = 'TEM']">
    <assert id="BII3-T68-R019"
            test="not(cbc:MinimumMeasure) or not(cbc:MaximumMeasure) or cbc:MinimumMeasure &lt;= cbc:MaximumMeasure"
            flag="fatal">The Handling unit minimum storage temperature MUST be smaller than or equal to the Handling unit maximum storage temperature.</assert>
  </rule>
  <rule context="cac:AdditionalItemProperty">
    <assert id="BII3-T68-R015"
            test="cbc:Name and cbc:Value"
            flag="fatal">If item property is used, both property name and value MUST be present</assert>
  </rule>
  <rule context="cac:ItemSpecificationDocumentReference/cac:ValidityPeriod">
    <assert id="BII3-T68-R020"
            test="cbc:StartDate &lt;= cbc:EndDate"
            flag="fatal">The Period start date of the Catalogue line validity period MUST be before the Period end date.</assert>
  </rule>
  <rule context="cac:CatalogueLine">
    <assert id="BII3-T68-R022"
            test="not(cbc:MinimumOrderQuantity) or not(cbc:MaximumOrderQuantity) or cbc:MinimumOrderQuantity &lt;= cbc:MaximumOrderQuantity"
            flag="fatal">The Minimum order quantity MUST be smaller than or equal to the Maximum order quantity.</assert>
  </rule>
  <rule context="cac:Price/cac:ValidityPeriod">
    <assert id="BII3-T68-R021"
            test="cbc:StartDate &lt;= cbc:EndDate"
            flag="fatal">The Period start date of the Price validity period MUST be before the Period end date.</assert>
  </rule>
  <rule context="cac:ValidityPeriod">
    <assert id="BII3-T68-R023"
            test="cbc:StartDate &lt;= cbc:EndDate"
            flag="fatal">The Period start date of the Catalogue validity period MUST be before the Period end date.</assert>
  </rule>
</pattern>
