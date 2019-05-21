all: pdf/main.pdf 


pdf/main.pdf: main.tex sample.bib
	pdflatex -output-directory pdf main.tex

clean: 
	rm pdf/*
