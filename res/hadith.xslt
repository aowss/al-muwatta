<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
  <xsl:decimal-format name="Arabic" zero-digit="&#x660;"/>

  <xsl:template match="/collection/book">
   <xsl:for-each select="hadith[@index != 0]">
    <xsl:result-document href="../أحاديث/{format-number(@index, '&#x660;&#x660;&#x660;&#x660;', 'Arabic')}.adoc">
= <xsl:text>الحديث رقم </xsl:text> <xsl:value-of select="format-number(@index, '&#x660;', 'Arabic')"/>

[quote.hadith]
----
<xsl:value-of select="@text"/>
----

== الشرح

== الرجال

== اللغة
    </xsl:result-document>
   </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
