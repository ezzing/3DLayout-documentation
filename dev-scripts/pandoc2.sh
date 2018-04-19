# generate section's toc
pandoc -f markdown_github -t html5 --toc --include-in-header=./doc_templates/header_toc_sections.html -o 1-Introduction-toc.html 1-Introduction.md
pandoc -f markdown_github -t html5 --toc --include-in-header=./doc_templates/header_toc_sections.html -o 2-Integration-toc.html 2-Integration.md
pandoc -f markdown_github -t html5 --toc --include-in-header=./doc_templates/header_toc_sections.html -o 3-Communication-toc.html 3-Communication.md
pandoc -f markdown_github -t html5 --toc --include-in-header=./doc_templates/header_toc_sections.html -o 4-Customization-toc.html 4-Customization.md
# pandoc -f markdown_github -t html5 --toc --include-in-header=./doc_templates/header_toc_sections.html -o 5-changelog-toc.html 5-changelog.md

# convert sections with toc to markdown_github
pandoc --from html --to markdown_github -o 1-Introduction-toc.md 1-Introduction-toc.html
pandoc --from html --to markdown_github -o 2-Integration-toc.md 2-Integration-toc.html
pandoc --from html --to markdown_github -o 3-Communication-toc.md 3-Communication-toc.html
pandoc --from html --to markdown_github -o 4-Customization-toc.md 4-Customization-toc.html
# pandoc --from html --to markdown_github -o 5-changelog-toc.md 5-changelog-toc.html

cp 1-Introduction-header.md 1-Introduction-header-toc.md
cat 1-Introduction-toc.md >> 1-Introduction-header-toc.md

cp 2-Integration-header.md 2-Integration-header-toc.md
cat 2-Integration-toc.md >> 2-Integration-header-toc.md

cp 3-Communication-header.md 3-Communication-header-toc.md
cat 3-Communication-toc.md >> 3-Communication-header-toc.md

cp 4-Customization-header.md 4-Customization-header-toc.md
cat 4-Customization-toc.md >> 4-Customization-header-toc.md

# generate main TOC
pandoc -f markdown_github -t html5 --include-in-header=./doc_templates/fonts.js --css ./doc_templates/pandoc.css -o doc.html 1-Introduction-header-toc.md 2-Integration-header-toc.md 3-Communication-header-toc.md 4-Customization-header-toc.md 5-changelog.md

# convert
pandoc -f markdown_github -t html5 --include-in-header=./doc_templates/fonts.js -s -S --toc --include-in-header=./doc_templates/header_toc.html --css pandoc.css -o README.html 1-Introduction-header-toc.md 2-Integration-header-toc.md 3-Communication-header-toc.md 4-Customization-header-toc.md 5-changelog.md

pandoc --from html --to markdown_github -o README.md README.html

rm *-toc.html
rm *-toc.md
rm doc.html
