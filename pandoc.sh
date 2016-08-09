pandoc -f markdown_github -t html5 --include-in-header=fonts.js --css pandoc.css -o doc.html 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md

pandoc -f markdown_github -t html5 --include-in-header=fonts.js -s -S --toc --include-in-header=./doc_templates/header_toc.html --css pandoc.css -o README.html 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md