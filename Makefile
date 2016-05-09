#	Makefile for RedPen documentation
#	

#	You can set these variables from the command line.
BUILDDIR       = build
ASCIIDOCTOR   = asciidoctor
ASCIIDOCTOR   = asciidoctor-pdf
.PHONY: help clean html pdf

clean:
	-rm -rf $(BUILDDIR)/*
  
html:
	mkdir -p $(BUILDDIR)/*
	cp source/*.jpg source/*.png source/*.txt source/*.xml source/*.java $(BUILDDIR)/html/
	$(ASCIIDOCTOR) -a source-highlighter=coderay -a target-version=1.4 -d book -b html5 source/index_ja.adoc -D$(BUILDER)/html
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html"

pdf:
	mkdir -p $(BUILDDIR)/pdf
	$(ASCIIDOCTOR_PDF) -a pdf-stylesdir=source/pdf -a pdf-fontsdir=source-highlighter=coderay -a target-version=1.4 -d book source/index_ja.adoc -D$(BUILDDIR)/pdf
	@echo "Build finished. The PDF file is in $(BUILDDIR)/pdf"

check:
	redpen -f asciidoc source/*.adoc
