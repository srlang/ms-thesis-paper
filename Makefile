# Sean R. Lang

.PHONY: all cleanup submission sections secs TODO todo used_cites force

all: paper submission

submission: SeanLang_MS_thesis.pdf

SeanLang_MS_thesis.pdf: paper.pdf
	@cp -v $^ $@

force:
	touch paper.tex
	@make paper

paper: paper.pdf
	
paper.pdf: paper.tex *.bib\
			sections/*.sec.tex\
			sections/*/*.sub.sec.tex\
			sections/*/*/*.sub.sub.sec.tex\
			appendices/*.tex
	pdflatex paper.tex
	bibtex paper.aux
	pdflatex paper.tex
	pdflatex paper.tex

wc: sections/*.sec.tex\
		sections/subsections/*.sub.sec.tex\
		sections/subsections/subsubsections/*.sub.sub.sec.tex
	@cat $^ | sed -e 's/^%.*//' | sed -e 's/^\\.*//' | wc -w

clean:
	@rm -v paper.{aux,bbl,blg,pdf,toc}
	@rm -v sections/*.aux

secs: sections

sections:
	@cat paper.tex | grep section

used_cites: paper.tex\
		sections/*.sec.tex\
		sections/subsections/*.sub.sec.tex\
		sections/subsections/subsubsections/*.sub.sub.sec.tex
	@grep -oh "cite{.*}" $^ | awk '{print $1}' | sort | uniq

todo: TODO

TODO: paper.tex\
		sections/*.sec.tex\
		sections/*/*.sub.sec.tex\
		sections/*/*/*.sub.sub.sec.tex\
		appendices/*.tex
	@grep TODO $^
