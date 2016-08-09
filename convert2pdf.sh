html2pdf --page-offset 1 --margin-right 25mm --margin-left 25mm --margin-top 25mm --margin-bottom 30mm --header-html ./doc_templates/header.html --header-spacing 15 --footer-html ./doc_templates/footer.html README_styles.html toc 3DLayout-doc.pdf
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=3DLayout-doc-ago.pdf ./doc_templates/portada.pdf 3DLayout-doc.pdf
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=3DLayout-doc-ago-2016.pdf 3DLayout-doc-ago.pdf ./doc_templates/contraportada.pdf
rm 3DLayout-doc.pdf
rm 3DLayout-doc-ago.pdf

