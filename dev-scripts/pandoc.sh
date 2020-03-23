# For instalators
# with simplified static toc for pdf (needs to update 0-Index-userDoc.md file)
pandoc -f gfm -t html5 --include-in-header=./doc_templates/fonts.js --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation for users" -o doc-userDoc.html 0-Index-userDoc.md 1-Introduction-userDoc.md 5-Changelog.md

# with full auto-generated TOC for pdf:
#pandoc -f gfm -t html5 --include-in-header=./doc_templates/fonts.js --toc --include-in-header=./doc_templates/header_toc.html --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation" -o doc.html 1-Introduction.md 5-Changelog.md


pandoc -f gfm+smart -t html5 --include-in-header=./doc_templates/fonts.js --toc --include-in-header=./doc_templates/header_toc-userDoc.html --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation for users" -o README-userDoc.html 1-Introduction-userDoc.md 5-Changelog.md

pandoc --from html --to gfm+smart -o README-userDoc.md README-userDoc.html

# Complete
# with simplified static toc for pdf (needs to update 0-Index.md file)
pandoc -f gfm -t html5 --include-in-header=./doc_templates/fonts.js --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation" -o doc.html 0-Index.md 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md 5-Changelog.md

# with full auto-generated TOC for pdf:
#pandoc -f gfm -t html5 --include-in-header=./doc_templates/fonts.js --toc --include-in-header=./doc_templates/header_toc.html --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation" -o doc.html 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md 5-Changelog.md

pandoc -f gfm+smart -t html5 --include-in-header=./doc_templates/fonts.js --toc --include-in-header=./doc_templates/header_toc.html --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation" -o README.html 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md 5-Changelog.md

pandoc --from html --to gfm+smart -o README.md README.html