sh ./dev-scripts/pandoc.sh && sh ./dev-scripts/convert2pdf.sh
git add 3DLayout-doc-ago-2016.pdf README.html README.md 
git add 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md
git commit -m "doc auto-release"
git push origin master