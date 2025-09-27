#!/bin/sh
set -e
pdflatex assignment.tex || true
bibtex assignment || true
pdflatex assignment.tex || true
pdflatex assignment.tex || true
pandoc assignment.md -o SPR_Assignment_Final.docx || true
mv assignment.pdf SPR_Assignment_Final.pdf || true
