# docker-asciidoctor-pdf

[![Build Status](https://travis-ci.org/madduci/docker-asciidoctor-pdf.svg?branch=master)](https://travis-ci.org/madduci/docker-asciidoctor-pdf)

Dockerized version of Asciidoctor-PDF, useful to generate PDFs from Asciidoc files, including themes, exposing `asciidoctor-pdf` as entrypoint and `/document` as mounted volume where to build the file

To build your own documents as PDF, simply run the container as:

`docker run --rm -v /path/to/your/document/directory:/document madduci/docker-asciidoctor-pdf /document/your_document.adoc`

Note that it is important to include /document ahead of your_document.adoc even though that may look strange on account of your document not being in that directory on your machine. That is how Docker knows how to access your file.

Upon completion, the PDF will reside in the /path/to/your/document/directory.

If you want to use some custom styles, just run it as

`docker run --rm -v /path/to/your/document/directory:/document madduci/docker-asciidoctor-pdf -a pdf-stylesdir=/document/resources/themes -a pdf-style=your_style -a pdf-fontsdir=/document/resources/fonts /document/your_document.adoc`

If your styles are in another directory, then pointing to /document/resources/themes won't work. To accommodate styles in another directory, add another volume, like this

`docker run --rm -v /path/to/your/document/directory/:/document/ -v /path/to/your/themes/directory:/themes madduci/docker-asciidoctor-pdf -a pdf-stylesdir=/themes -a pdf-style=your_style -a pdf-fontsdir=/themes/resources/fonts /document/your_document.adoc`
