#!/bin/bash

# echo Initially generate the .adoc files in the أحاديث folder
#
# java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:content.xml -xsl:hadith.xslt
#
# echo Initially generate الموطأ.adoc
#
# java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:metadata.xml -xsl:toc.xslt -o:../الموطأ.adoc

echo Generate the الموطأ.html

cd ..
asciidoctor -a stylesheet=./res/main.css الموطأ.adoc

echo Generate the الرجال.html

cd تراجم
dot -Tsvg صلة.gv > صلة.svg
java -jar ../res/plantuml-1.2021.15.jar -tsvg أنساب.puml
asciidoctor -a stylesheet=../res/main.css الرجال.adoc

echo Generate the أسانيد.html

cd ../أحاديث
asciidoctor -a stylesheet=../res/main.css أسانيد.adoc
