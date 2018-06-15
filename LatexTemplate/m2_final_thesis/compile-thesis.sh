#!/bin/bash
# A script to compile the PhD Thesis - Krishna Kumar 
# Distributed under GPLv2.0 License

compile="compile";
clean="clean";

filename=${2:-thesis};
cmd=${1:-compile}
if [[ $cmd = $clean ]]; then
	echo "Cleaning please wait ..."
	rm -f *~
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.blg
	rm -rf *.d
	rm -rf *.fls
	rm -rf *.ilg
	rm -rf *.ind
	rm -rf *.toc*
	rm -rf *.lot*
	rm -rf *.lof*
	rm -rf *.log
	rm -rf *.idx
	rm -rf *.out*
	rm -rf *.nlo
	rm -rf *.nls
	rm -rf $filename.pdf
	rm -rf $filename.ps
	rm -rf $filename.dvi
	rm -rf *#* 
	echo "Cleaning complete!"
	exit
elif [[ $cmd = $compile ]]; then
	echo "Compiling your PhD Thesis...please wait...!"
	pdflatex -interaction=nonstopmode $filename.tex
	bibtex $filename 
	pdflatex -interaction=nonstopmode $filename.tex	
	pdflatex -interaction=nonstopmode $filename.tex	
	makeindex $filename.aux
	makeindex $filename.idx
	makeindex $filename.nlo -s nomencl.ist -o $filename.nls
	pdflatex -interaction=nonstopmode $filename.tex
	makeindex $filename.nlo -s nomencl.ist -o $filename.nls
	pdflatex -interaction=nonstopmode $filename.tex
	echo "Success!"
	exit
fi
