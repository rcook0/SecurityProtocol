.PHONY: all pdf docx clean

all: pdf docx

pdf:
	pdflatex assignment.tex
	bibtex assignment
	pdflatex assignment.tex
	pdflatex assignment.tex
	mv assignment.pdf SPR_Assignment_Final.pdf || true

docx:
	pandoc assignment.md -o SPR_Assignment_Final.docx --reference-doc=reference.docx || pandoc assignment.md -o SPR_Assignment_Final.docx

clean:
	rm -f *.aux *.log *.bbl *.blg assignment.pdf SPR_Assignment_Final.pdf SPR_Assignment_Final.docx