index.html: index.md
	pandoc -s --katex=./static/  index.md -o index.html
