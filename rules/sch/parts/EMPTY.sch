<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
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
</pattern>