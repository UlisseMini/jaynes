index.html: index.md
	pandoc -s --katex=./static/ -f markdown+latex_macros+tex_math_dollars index.md -o index.html
