#!/bin/bash

# echo Generate the .adoc files in the أحاديث folder

# java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:content.xml -xsl:hadith.xslt

echo Generate the كتاب.adoc files

java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:metadata.xml -xsl:presentation.xslt

echo Generate the presentation files per book

./asciidoctor-revealjs ./presentation/*.adoc
