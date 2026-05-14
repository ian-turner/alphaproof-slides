MAIN   := slides
BUILDDIR := build
PDF    := $(BUILDDIR)/$(MAIN).pdf

LATEXMK := latexmk
LATEXMK_FLAGS := -lualatex -bibtex -interaction=nonstopmode -outdir=$(BUILDDIR) -shell-escape

.PHONY: all clean

all: $(PDF)

$(PDF): $(MAIN).tex refs.bib | $(BUILDDIR)
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN).tex

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

clean:
	$(LATEXMK) -C -outdir=$(BUILDDIR) $(MAIN).tex
	rm -rf $(BUILDDIR)
