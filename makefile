# Generar PDF

depends:
	sudo pacman -S texlive-most
	
pdf:
	pdflatex delaunay.tex	
