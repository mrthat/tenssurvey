.DELETE_ON_ERROR:
.PHONY: all clean
.DEFAULT_GOAL := all

PAPER := main
FINAL := tens-survey
BIBDIR = $(HOME)/Documents/bibs/mendeley
BIBSRCS = $(BIBDIR)/library.bib

PDF_FINAL := $(FINAL).pdf

PDF := $(PAPER).pdf
TEX := $(PAPER).tex intro.tex background.tex appendix.tex
BIBS := tensbib.bib
FIGS := 
#SVG := $(addsuffix .svg, ... )
#VIEWSVG := geeqie # or rsvg-view, etc...

all: $(PDF_FINAL)

$(PDF_FINAL): $(PDF)
	cp $< $@

$(PDF): $(TEX) $(BIBS) $(FIGS)
	pdflatex $(PAPER)
	-bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

rvbib:
	cat $(BIBSRCS) > tensbib.bib


clean:
	rm -f core *~ $(SVG) $(PDF) \
	  $(PAPER).aux \
	  $(PAPER).bbl \
	  $(PAPER).blg \
	  $(PAPER).log \
	  $(PAPER).out

# eof
