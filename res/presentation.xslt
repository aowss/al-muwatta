<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">

  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
  <xsl:decimal-format name="Arabic" zero-digit="&#x660;"/>

  <xsl:template match="/collection/books">
   <xsl:for-each select="book">
    <xsl:result-document href="./presentation/{@name}.adoc">
= <xsl:value-of select="@name"/>
:revealjsdir: https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.9.0
:revealjs_rtl: true
:customcss: ./presentation.css
:revealjs_theme: black
      <xsl:apply-templates/>
    </xsl:result-document>
   </xsl:for-each>
  </xsl:template>

  <xsl:template match="chapter">
== <xsl:value-of select="@name"/>

    <xsl:apply-templates select=".[@starthadith]" mode="hadith">
      <xsl:with-param name="current" select="@starthadith"/>
      <xsl:with-param name="count" select="@hadiths"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="chapter" mode="hadith">
    <xsl:param name="current" as="xs:integer"/>
    <xsl:param name="count" as="xs:integer"/>

    <xsl:if test="$count > 0">
include::../../أحاديث/<xsl:value-of select="format-number($current, '&#x660;&#x660;&#x660;&#x660;', 'Arabic')"/>.adoc[leveloffset=+2]
      <xsl:apply-templates select="." mode="hadith">
        <xsl:with-param name="current" select="$current + 1"/>
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:apply-templates>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
