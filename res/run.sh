#!/bin/bash

echo Generate the .adoc files in the أحاديث folder

java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:content.xml -xsl:hadith.xslt

echo Generate الموطأ.adoc

java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:metadata.xml -xsl:toc.xslt -o:../الموطأ.adoc

echo Generate the الموطأ.html

cd ..
asciidoctor -a stylesheet=./res/main.css الموطأ.adoc

echo Generate the الرجال.html

cd تراجم
asciidoctor -a stylesheet=../res/main.css الرجال.adoc
