<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        schemaVersion="iso" queryBinding="xslt2">

  <title>PEPPOL BIS  T68 bound to UBL</title>

  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2"/>

  <!-- ASSERTING NO ELMENTS ARE EMPTY -->

  <include href="parts/EMPTY.sch"/>
  <include href="../../target/generated/basic.sch"/>
  <include href="parts/BIIRULES-UBL-T68-LOGIC.sch"/>
  <include href="parts/OPENPEPPOL-UBL-T68-LOGIC.sch"/>

</schema>
