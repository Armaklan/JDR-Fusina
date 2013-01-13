LATEX = pdflatex
INDEX = makeindex
COMMON = conf/FusinaClass.cls $(wildcard Systeme/*.tex)
IMAGES = $(wildcard MEP/*.eps)

all: force t2t Fusina.pdf

force:
	touch *.tex

%.pdf: %.tex %.aux
	${LATEX} $<
	${LATEX} $<

%.aux %.idx: %.tex
	${LATEX} $<
	${LATEX} $<

%.ind: %.idx %.tex
	$(INDEX) $<
	${INDEX} $<
	
Fusina.pdf: Fusina.tex $(COMMON)

t2t:
	txt2tags -t tex Fusina.t2t

clean:
	rm -rf *.aux *.log *.toc *.out
	rm -rf *.idx *.ilg *.ind
    
cleanwin:
	del *.aux *.log *.toc *.out
	del *.idx *.ilg *.ind
    
mrproper: clean
	rm *.pdf

