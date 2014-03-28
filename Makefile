# To actually build, change Yourdata to the actual package.

things=$(wildcard src/*.Rnw src/*.bib etc/*.tex)

all: build
	#@curl http://Yourdata.tar.gz.md5 -o build/Yourdata.tar.gz.md5.new
	#[ $(cat build/Yourdata.tar.gz.md5.new) $(cat build/Yourdata.tar.gz.md5) ] && mv build/Yourdata.tar.gz.md5.new build/Yourdata.tar.gz.md5 || true
	make build/acm_sigproc.pdf

build/acm_sigproc.pdf: $(things) build/data/Yourdata.tar.gz
	cp etc/* build
	cp src/*.Rnw build
	cp src/*.bib build
	cd build; Rscript -e "require(knitr); knit('paper.Rnw', encoding='UTF-8');"
	cd build; ../bin/latexmk -pdf acm_sigproc.tex

build/Yourdata.tar.gz.md5:
	#curl http://Yourdata.tar.gz.md5 -o build/Yourdata.tar.gz.md5
	touch build/Yourdata.tar.gz.md5

build/data/Yourdata.tar.gz: build/Yourdata.tar.gz.md5 | build build/data
	rm -rf build/cache
	make instr

instr: | build build/data
	#curl  http://Yourdata.tar.gz -o build/data/Yourdata.tar.gz
	#cd build/data; cat *.tar.gz| gzip -dc | tar -xvpf - ; R CMD INSTALL Yourdata

build build/data:
	mkdir -p build/data

clean:
	rm -rf build/*

makepaper:
	 pdftk build/acm_sigproc.pdf cat 1-10 output result.pdf
	 pdftk result.pdf fig/refs.pdf output paper.pdf


