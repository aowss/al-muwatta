# الرحلة الكاشفة عمّا في موطإ إمام دار الهجرة

These are my notes on the above-mentioned book by محمد أيوب ليسور الفرنسي.

Note that you can use the following git command `git config core.path off` so that the Arabic file names are displayed correctly when using commands like `git status`.

## Information

The [`content.xml`](./res/content.xml) and [`metadata.xml`](./res/metadata.xml) files were downloaded from [IslamSource.info](http://islamsource.azurewebsites.net/host.aspx?Page=hadithsource&hadithcollection=7&hadithtranslation=en-aisha_abdarahman_attarjumana_yaqub_johnson&hadithdisplay=Display).

These files are then modified to correct eventual mistakes or change small details.

## Pre-requisites

* [Saxon XSLT Processor](https://www.saxonica.com/welcome/welcome.xml) to process the [`content.xml`](./res/content.xml) and [`metadata.xml`](./res/metadata.xml) files

You need to [download](https://sourceforge.net/projects/saxon/files/Saxon-HE/10/Java/SaxonHE10-6J.zip/download) the Saxon jar and copy it in the `res` directory.  
For the rest of this documentation, the jar name is assumed to be `saxon-he-10.6.jar`.

* [PlantUML](https://plantuml.com) to process the `puml` files

You need to [download](https://github.com/plantuml/plantuml/releases/download/v1.2021.15/plantuml-1.2021.15.jar) the PlantUML jar in the `res` directory.  
For the rest of this documentation, the jar name is assumed to be `plantuml-1.2021.15.jar`.

* Java to run Saxon and PlantUML

You need to follow the [instructions](https://www.oracle.com/java/technologies/downloads/) to install Java so that you can run the `java -cp saxon-he-10.6.jar net.sf.saxon.Transform` and the `java -jar ../res/plantuml-1.2021.15.jar` commands

* [Asciidoctor](https://asciidoctor.org/) to convert the `adoc` files to `html`

You need to follow the [instructions](https://docs.asciidoctor.org/asciidoctor/latest/install/) to globally install [Asciidoctor](https://asciidoctor.org/) so that you can run the `asciidoctor` command

* [Asciidoctor revealjs](https://github.com/asciidoctor/asciidoctor-reveal.js) to convert the `adoc` files to `html` presentations

You need to follow the [instructions](https://docs.asciidoctor.org/reveal.js-converter/latest/setup/standalone-executable/) to install [Asciidoctor revealjs](https://github.com/asciidoctor/asciidoctor-reveal.js) in the `res` directory so that you can run the `./asciidoctor-revealjs` command

* [Asciidoctor EPUB3](https://github.com/asciidoctor/asciidoctor-epub3) to convert the `adoc` files to `epub`

You need to follow the [instructions](https://docs.asciidoctor.org/epub3-converter/latest/#getting-started) to globally install [Asciidoctor EPUB3](https://github.com/asciidoctor/asciidoctor-epub3) so that you can run the `asciidoctor-epub3` command

* [Graphviz](https://graphviz.org/) to process the `gv` files

You need to follow the [instructions](https://graphviz.org/download/) to globally install [Graphviz](https://graphviz.org/) so that you can run the `dot` command

## HTML

* The `.adoc` files in the [`أحاديث`](./أحاديث) folder are **initially** generated based on the [`content.xml`](./res/content.xml) file using this command from the `res` directory:

> `java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:content.xml -xsl:hadith.xslt`

* The [`الموطأ.adoc`](./الموطأ.adoc) file is **initially** generated using this command from the `res` directory:

> `java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:metadata.xml -xsl:toc.xslt -o:../الموطأ.adoc`

* The [`الموطأ.html`](./الموطأ.html) file is generated using this command from the root directory:

> `asciidoctor -a stylesheet=./res/main.css الموطأ.adoc`

* The [`صلة.svg`](./تراجم/صبة.svg) file is generated using this command from the `تراجم` directory:

> `dot -Tsvg صلة.gv > صلة.svg`

* The [`أنساب.svg`](./تراجم/أنساب.svg) file is generated using this command from the `تراجم` directory:

> `java -jar ../res/plantuml-1.2021.15.jar -tsvg أنساب.puml`

* The [`الرجال.html`](./تراجم/الرجال.html) file is generated using this command from the `تراجم` directory:

> `asciidoctor -a stylesheet=../res/main.css الرجال.adoc`

* The [`أسانيد.html`](./أحاديث/أسانيد.html) file is generated using this command from the `أحاديث` directory:

> `asciidoctor -a stylesheet=../res/main.css أسانيد.adoc`

* The [`فقه.html`](./فقه/فقه.html) file is generated using this command from the `فقه` directory:

> `asciidoctor -a stylesheet=../res/main.css فقه.adoc`

When one of the `.adoc` file in the [`أحاديث`](./أحاديث), [`تراجم`](./تراجم) or [`فقه`](./فقه) folder is updated, the [`الموطأ.html`](./الموطأ.html) file needs to be re-generated.

### Customization

The [`main.css`](./res/main.css) stylesheet is used to:
- right-align,
- set the text direction to be right to left,
- right-indent the list,
- add some styles.

The [Localization and numbering attributes](https://docs.asciidoctor.org/asciidoc/latest/attributes/document-attributes-ref/#builtin-attributes-i18n) are used to using arabic-indic numbers for footnotes, tables, ... and to set Arabic titles for ToC, ...

## EPUB 3

The [`فقه.epub`](./فقه/فقه.epub) file is generated using this command from the `فقه` directory:

> `asciidoctor-epub3 -a lang=ar -a epub3-stylesdir=../res/epub-css فقه.adoc`

or

> `asciidoctor -r asciidoctor-epub3 -a lang=ar -a epub3-stylesdir=res/epub-css -b epub3 الموطأ.adoc`

## Presentation

The presentation files per book are generated using these commands from the the `res` directory:

> `java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:metadata.xml -xsl:presentation.xslt`  
> `./asciidoctor-revealjs ./presentation/*.adoc`

## Using Docbook

> `java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:../فقه/أوقات\ الصلاة.xml -xsl:withArabic.xsl -o:./أوقات\ الصلاة.html`  
> `java -jar ./docbook-xslTNG-1.6.0/libs/docbook-xslTNG-1.6.0.jar ../فقه/أوقات\ الصلاة.xml -o:./أوقات\ الصلاة.html`
