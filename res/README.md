# Information

The [`content.xml`](./content.xml) and [`metadata.xml`](./metadata.xml) files were downloaded from [IslamSource.info](http://islamsource.azurewebsites.net/host.aspx?Page=hadithsource&hadithcollection=7&hadithtranslation=en-aisha_abdarahman_attarjumana_yaqub_johnson&hadithdisplay=Display).

## Pre-requisites

* [Saxon XSLT Processor](https://www.saxonica.com/welcome/welcome.xml) to process the [`content.xml`](./content.xml) and [`metadata.xml`](./metadata.xml) files

We copied the [Saxon jar](./saxon-he-10.4.jar) in this directory

* [Asciidoctor](https://asciidoctor.org/) to convert the `adoc` files to `html`

You need to follow the [instructions](https://docs.asciidoctor.org/asciidoctor/latest/install/) to install Asciidoctor so that you can run the `asciidoctor` command

* [Asciidoctor revealjs](https://github.com/asciidoctor/asciidoctor-reveal.js) to convert the `adoc` files to `html` presentations

You need to follow the [instructions](https://docs.asciidoctor.org/reveal.js-converter/latest/setup/standalone-executable/) to install Asciidoctor revealjs in this folder so that you can run the `./asciidoctor-revealjs` command

## HTML

The `.adoc` files in the `أحاديث` folder are initially generated using this command:

> java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:content.xml -xsl:hadith.xslt

The `الموطأ.adoc` file is initially generated using this command:

> java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:metadata.xml -xsl:toc.xslt -o:../الموطأ.adoc

The `الموطأ.html` file is generated using this command:

> cd ..
> asciidoctor -a stylesheet=./res/main.css الموطأ.adoc

The `الرجال.html` file is generated using this command:

> cd تراجم
> asciidoctor -a stylesheet=../res/main.css الرجال.adoc

## Presentation

The presentation files per book are generated using these commands:

> cd ../res
> java -cp saxon-he-10.6.jar net.sf.saxon.Transform -t -s:metadata.xml -xsl:presentation.xslt
> ./asciidoctor-revealjs ../*.adoc
