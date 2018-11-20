pandoc -f markdown_github -t html5 --include-in-header=./doc_templates/fonts.js --css ./doc_templates/pandoc.css -o doc.html 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md 5-changelog.md

pandoc -f markdown_github -t html5 --include-in-header=./doc_templates/fonts.js -s -S --toc --include-in-header=./doc_templates/header_toc.html --css pandoc.css -o README.html 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md 5-changelog.md

pandoc --from html --to markdown_github -o README.md README.html
