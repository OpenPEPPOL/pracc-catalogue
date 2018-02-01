<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">

  <rule context="cac:ComponentRelatedItem">
    <let name="componentRelatedItemId" value="normalize-space(cbc:ID)"/>

    <assert id="EUGEN-T68-R011"
            test="count(//cac:SellersItemIdentification/cbc:ID[normalize-space(.) = $componentRelatedItemId]) = 1"
            flag="fatal">Referenced item MUST exist once in the catalogue.</assert>
  </rule>

  <rule context="cac:CatalogueLine">
    <assert id="EUGEN-T68-R010"
            test="normalize-space(cbc:OrderableIndicator) = 'false' or cbc:OrderableUnit"
            flag="fatal">Orderable unit MUST be provided for orderable catalogue lines.</assert>
  </rule>

  <rule context="cac:ProviderParty | cac:ReceiverParty | cac:SellerSupplierParty/cac:Party | cac:ContractorCustomerParty/cac:Party">
    <assert id="EUGEN-T68-R012"
            test="cac:PartyIdentification or cac:PartyName"
            flag="fatal">Either party identification or party name MUST be provided for parties.</assert>
  </rule>

  <rule context="cac:LineValidityPeriod">
    <assert id="EUGEN-T68-R013"
            test="cbc:StartDate &gt;= ../../cac:ValidityPeriod/cbc:StartDate and cbc:EndDate &lt;= ../../cac:ValidityPeriod/cbc:EndDate"
            flag="fatal">Catalogue line validity period MUST be within catalogue validity period.</assert>
  </rule>

  <rule context="cac:CatalogueLine[cac:LineValidityPeriod]/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod">
    <assert id="EUGEN-T68-R014"
            test="cbc:StartDate &gt;= ../../../cac:LineValidityPeriod/cbc:StartDate and cbc:EndDate &lt;= ../../../cac:LineValidityPeriod/cbc:EndDate"
            flag="fatal">Price validity period MUST be within catalogue line validity period.</assert>
  </rule>
  <rule context="cac:CatalogueLine/cac:RequiredItemLocationQuantity/cac:Price/cac:ValidityPeriod">
    <assert id="EUGEN-T68-R015"
            test="cbc:StartDate &gt;= ../../../../cac:ValidityPeriod/cbc:StartDate and cbc:EndDate &lt;= ../../../../cac:ValidityPeriod/cbc:EndDate"
            flag="fatal">Price validity period MUST be within catalogue validity period.</assert>
  </rule>

</pattern>
