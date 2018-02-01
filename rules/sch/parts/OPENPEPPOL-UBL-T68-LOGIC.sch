<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
  <!--
    EUGEN-T68-R0** Document level
      00X - Document in general
      01X - Document level rules
      02X - Referenced contract on document level.
      03X - Transport
      04X - Party identifiers
      05X - Allowance/Charge
      06X - Certificate
    EUGEN-T68-R2** Catalogue line level
      22X - References
    EUGEN-T68-R3** Catalogue line item level
  -->

  <rule context="cac:ComponentRelatedItem">
    <let name="componentRelatedItemId" value="normalize-space(cbc:ID)"/>

    <assert id="EUGEN-T68-R220"
            test="count(//cac:SellersItemIdentification/cbc:ID[normalize-space(.) = $componentRelatedItemId]) = 1"
            flag="fatal">Referenced item must exist once in the catalogue.</assert>
  </rule>

  <rule context="cac:CatalogueLine">
    <assert id="EUGEN-T68-R202"
            test="normalize-space(cbc:OrderableIndicator) = 'false' or cbc:OrderableUnit"
            flag="fatal">Orderable unit MUST be provided for orderable catalogue lines.</assert>
  </rule>
</pattern>
