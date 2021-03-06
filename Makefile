# Sean R. Lang

.PHONY: all cleanup submission sections secs TODO todo used_cites force push check fc

all: paper submission

submission: SeanLang_MS_thesis.pdf

SeanLang_MS_thesis.pdf: paper.pdf
	@cp -v $^ $@

check:
	# just makes sure that all stuff compiles in LaTeX without taking the full
	# time to actually run all runs which takes a long enough time
	pdflatex paper.tex

force:
	touch paper.tex
	@make paper

paper: paper.pdf
	
paper.pdf: paper.tex *.bib\
			sections/*.tex\
			sections/*/*.tex\
			sections/*/*/*.tex\
			sections/*/*/*/*.tex\
			appendices/*.tex\
			algs/*.tex
	pdflatex paper.tex
	bibtex paper.aux
	pdflatex paper.tex
	pdflatex paper.tex

wc: sections/*.sec.tex\
		sections/*/*.tex\
		sections/*/*/*.tex\
		sections/*/*/*/*.tex
	@cat $^ | sed -e 's/^%.*//' | sed -e 's/^\\.*//' | wc -w

lc: sections/*.sec.tex\
		sections/*/*.tex\
		sections/*/*/*.tex\
		sections/*/*/*/*.tex
	@cat $^ | sed -e 's/^%.*//' | sed -e 's/^\\.*//' | wc -l

lca: sections/*.sec.tex\
		sections/*/*.tex\
		sections/*/*/*.tex\
		sections/*/*/*/*.tex
	@cat $^ | wc -l

fc:
	@find . -iname "*.tex" | wc -l

clean:
	@rm -v paper.{aux,bbl,blg,pdf,toc}
	@rm -v sections/*.aux

secs: sections

sections:
	@cat paper.tex | grep section

used_cites: paper.tex\
		sections/*.tex\
		sections/*/*.tex\
		sections/*/*/*.tex\
		sections/*/*/*/*.tex
	@grep -oh "cite{.*}" $^ | awk '{print $1}' | sort | uniq

todo: TODO

TODO: paper.tex\
		sections/*.sec.tex\
		sections/*/*.tex\
		sections/*/*/*.tex\
		appendices/*.tex
	@grep TODO $^

push:
	@./push.sh
