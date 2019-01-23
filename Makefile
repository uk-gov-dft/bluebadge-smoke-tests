.PHONY: gen
gen:
	pandoc -f markdown_github-pipe_tables -t html5 public-apis.md --columns 1000 --template template.html --css template.css --self-contained --toc --toc-depth 2 > public-apis.html
 
