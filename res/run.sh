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
cd ..

echo Generate the أسانيد.html

cd أحاديث
asciidoctor -a stylesheet=../res/main.css أسانيد.adoc
cd ..

echo Generate the فقه.html

cd فقه
asciidoctor -a stylesheet=../res/main.css فقه.adoc
cd ..

echo Generate the فقه.epub

cd فقه
# asciidoctor -r asciidoctor-epub3 -a lang=ar -a epub3-stylesdir=../res/epub-css -b epub3 فقه.adoc
# asciidoctor-epub3 -a lang=ar -a epub3-stylesdir=../res/epub-css -D epub -a ebook-extract فقه.adoc
asciidoctor-epub3 -a lang=ar -a epub3-stylesdir=../res/epub-css فقه.adoc
cd ..

echo Generate the فقه.docbook.html

cd فقه
asciidoctor -a lang=ar -b docbook فقه.adoc
# java -cp ../res/saxon-he-10.6.jar net.sf.saxon.Transform -t -s:./فقه.xml -xsl:../res/withArabic.xsl -o:./فقه.docbook.html
java -jar ../res/docbook-xslTNG-1.6.0/libs/docbook-xslTNG-1.6.0.jar فقه.xml -xsl:../res/withArabic.xsl -o:./فقه.docbook.html
cd ..
