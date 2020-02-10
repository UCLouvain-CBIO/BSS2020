all:
	make ./docs/index.html
	make ./docs/installation.html
	make ./docs/installation.R

./docs/index.html: index.md
	generate-md --layout mixu-bootstrap-2col --input index.md --output ./docs
	echo >> docs/assets/css/style.css
	cat table.css >> docs/assets/css/style.css

./docs/installation.html: installation.Rmd
	Rscript -e "knitr::knit('installation.Rmd')"
	generate-md --layout mixu-bootstrap-2col --input installation.md --output ./docs
	rm installation.md

./docs/installation.R: installation.Rmd
	Rscript -e "knitr::purl('installation.Rmd')"
	mv installation.R ./docs


# pda:
# 	generate-md --layout mixu-bootstrap-2col --input pda.md --output ./docs
# 	generate-md --layout mixu-bootstrap-2col --input tutorialsMsqRob.md --output ./docs

