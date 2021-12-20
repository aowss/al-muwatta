<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:db="http://docbook.org/ns/docbook"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="db xs"
  version="3.0">

  <xsl:variable xmlns:v="http://docbook.org/ns/docbook/variables"
                name="v:locales" as="xs:string+" static="yes"
                select="('en', 'ar')"/>

  <xsl:import href="docbook-xslTNG-1.6.0/xslt/docbook.xsl"/>

</xsl:stylesheet>
