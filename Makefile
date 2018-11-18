ARTEFACT_PDF=out/Eschede-Derailment.pdf

all: pdf
pdf: $(ARTEFACT_PDF)

init:
	mkdir -pv out
	rm -rfv out/*.pdf

$(ARTEFACT_PDF): init
	cat content/00-metadata.yml content/*.md | \
	  pandoc -o $(ARTEFACT_PDF) \
           --pdf-engine=xelatex \
           --from markdown+yaml_metadata_block \
           --standalone \
           --toc \
           --filter pandoc-wrapfig.py \
           --filter pandoc-crossref \
           --filter pandoc-citeproc \
           --bibliography content/biblio.bib
