<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

  <title>PEPPOL BIS  T68 bound to UBL</title>

  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"/>

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

  <!-- ASSERTING NO ELMENTS ARE EMPTY -->
  <pattern>
    <rule context="cbc:*">
      <assert id="EUGEN-T68-R001"
              test="normalize-space(.) != ''"
              flag="fatal">Document MUST not contain empty elements.</assert>
    </rule>
    <rule context="cac:*">
      <assert id="EUGEN-T68-R002"
              test="count(*) != 0"
              flag="fatal">Document MUST not contain empty elements.</assert>
    </rule>
    <rule context="/*">
      <assert id="EUGEN-T68-R003"
              test="not(@*:schemaLocation)"
              flag="fatal">Document MUST not contain schema location.</assert>
    </rule>
  </pattern>

  <!-- BUSINESS RULES -->
  <pattern>
    <rule context="/ubl:Catalogue">
      <assert id="EUGEN-T68-R010"
              test="cbc:UBLVersionID = '2.1'"
              flag="fatal">UBL version MUST be '2.1'.</assert>
      <assert id="EUGEN-T68-R020"
              test="cac:ReferencedContract"
              flag="fatal">A referenced contract must be specified.</assert>
    </rule>

    <rule context="cac:ReferencedContract">
      <assert id="EUGEN-T68-R021"
              test="cbc:ContractTypeCode"
              flag="fatal">A referenced contract must have a type code specified.</assert>
    </rule>

    <rule context="cbc:EndpointID">
      <assert id="EUGEN-T68-R030"
              test="@schemeID"
              flag="fatal">An endpoint identifier MUST have a schemeID attribute.</assert>
    </rule>

    <rule context="cac:PartyIdentification/cbc:ID">
      <assert id="EUGEN-T68-R040"
              test="@schemeID"
              flag="fatal">A party identifier MUST have a schemeID attribute.</assert>
    </rule>

    <rule context="cac:ComponentRelatedItem">
      <let name="componentRelatedItemId" value="normalize-space(cbc:ID)"/>

      <assert id="EUGEN-T68-R220"
              test="count(//cac:SellersItemIdentification/cbc:ID[normalize-space(.) = $componentRelatedItemId]) = 1"
              flag="fatal">Referenced item must exist once in the catalogue.</assert>
    </rule>

    <rule context="cac:AllowanceCharge">
      <assert id="EUGEN-T68-R050"
              test="cbc:ChargeIndicator"
              flag="fatal">Charge indicator MUST be present when allowance/charge is provided.</assert>
      <assert id="EUGEN-T68-R051"
              test="cbc:AllowanceChargeReason"
              flag="fatal">Allowance/charge reason MUST be present when allowance/charge is provided.</assert>
      <assert id="EUGEN-T68-R052"
              test="cbc:Amount"
              flag="fatal">Amount MUST be present when allowance/charge is provided.</assert>
    </rule>

    <rule context="cac:Certificate">
      <assert id="EUGEN-T68-R060"
              test="cbc:CertificateTypeCode"
              flag="fatal">Item label type MUST be present when certificate is provided.</assert>
      <assert id="EUGEN-T68-R061"
              test="cbc:CertificateType"
              flag="fatal">Item label name MUST be present when certificate is provided.</assert>
      <assert id="EUGEN-T68-R062"
              test="cac:IssuerParty/cac:PartyName/cbc:Name"
              flag="fatal">Label issuer party name MUST be present when certificate is provided.</assert>
    </rule>

    <rule context="cbc:ContentUnitQuantity | cbc:MinimumOrderQuantity | cbc:MaximumOrderQuantity | cbc:Quantity | cbc:BatchQuantity | cbc:ConsumerUnitQuantity | cbc:PackQuantity | cbc:Measure | cbc:MinimumMeasure | cbc:MaximumMeasure">
      <assert id="EUGEN-T68-R200"
              test="@unitCode"
              flag="fatal">Unit code MUST be specified.</assert>
    </rule>

    <rule context="cac:CatalogueLine">
      <assert id="EUGEN-T68-R201"
              test="cbc:OrderableIndicator"
              flag="fatal">Orderable indicator MUST be provided for catalogue lines.</assert>
      <assert id="EUGEN-T68-R202"
              test="normalize-space(cbc:OrderableIndicator) = 'false' or cbc:OrderableUnit"
              flag="fatal">Orderable unit MUST be provided for orderable catalogue lines.</assert>
    </rule>
  </pattern>

  <!-- CODE LISTS -->
  <pattern>
    <let name="icd_endpoint" value="tokenize('FR:SIRENE SE:ORGNR FR:SIRET FI:OVT DUNS GLN DK:P IT:FTI NL:KVK IT:SIA IT:SECETI DIGST DK:CPR DK:CVR DK:SE DK:VANS IT:VAT IT:CF NO:ORGNR HU:VAT EU:REID AT:VAT AT:GOV IS:KT IBAN AT:KUR ES:VAT IT:IPA AD:VAT AL:VAT BA:VAT BE:VAT BG:VAT CH:VAT CY:VAT CZ:VAT DE:VAT EE:VAT GB:VAT GR:VAT HR:VAT IE:VAT LI:VAT LT:VAT LU:VAT LV:VAT MC:VAT ME:VAT MK:VAT MT:VAT NL:VAT PL:VAT PT:VAT RO:VAT RS:VAT SI:VAT SK:VAT SM:VAT TR:VAT VA:VAT NL:OIN SE:VAT BE:CBE FR:VAT', '\s')"/> <!-- Removed: NO:VAT ZZZ -->
    <let name="icd_party" value="tokenize('FR:SIRENE SE:ORGNR FR:SIRET FI:OVT DUNS GLN DK:P IT:FTI NL:KVK IT:SIA IT:SECETI DIGST DK:CPR DK:CVR DK:SE DK:VANS IT:VAT IT:CF NO:ORGNR NO:VAT HU:VAT EU:REID AT:VAT AT:GOV IS:KT IBAN AT:KUR ES:VAT IT:IPA AD:VAT AL:VAT BA:VAT BE:VAT BG:VAT CH:VAT CY:VAT CZ:VAT DE:VAT EE:VAT GB:VAT GR:VAT HR:VAT IE:VAT LI:VAT LT:VAT LU:VAT LV:VAT MC:VAT ME:VAT MK:VAT MT:VAT NL:VAT PL:VAT PT:VAT RO:VAT RS:VAT SI:VAT SK:VAT SM:VAT TR:VAT VA:VAT NL:OIN SE:VAT BE:CBE FR:VAT ZZZ', '\s')"/>

    <rule context="cbc:EndpointID[@schemeID]">
      <assert id="OP-T68-R001"
              test="some $code in $icd_endpoint satisfies $code = @schemeID"
              flag="fatal">SchemeID for endpoint identifier MUST be from PEPPOL Policy for identifiers, policy 8.</assert>
    </rule>

    <rule context="cac:PartyIdentification/cbc:ID[@schemeID]">
      <assert id="OP-T68-R002"
              test="some $code in $icd_party satisfies $code = @schemeID"
              flag="fatal">SchemeID for party identifier MUST be from PEPPOL Policy for identifiers, policy 8.</assert>
    </rule>

    <rule context="cac:ReferencedContract/cbc:ContractTypeCode">
      <assert id="OP-T68-R003"
              test="normalize-space(.) = '311'"
              flag="fatal">A reference contract type code must be '311'.</assert>
    </rule>
  </pattern>

  <include href="../../target/generated/basic.sch"/>

</schema>
