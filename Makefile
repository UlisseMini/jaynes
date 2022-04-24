all: index.html solutions.html

%.html: %.md
	pandoc -s --katex=./static/  $< -o $@

