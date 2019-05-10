# For instalators
pandoc -f gfm -t html5 --include-in-header=./doc_templates/fonts.js --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation for users" -o doc-userDoc.html 0-Index-userDoc.md 1-Introduction.md 5-changelog.md

pandoc -f gfm-smart -t html5 --include-in-header=./doc_templates/fonts.js --toc --include-in-header=./doc_templates/header_toc-userDoc.html --css pandoc.css --metadata title="3DLayout Documentation for users" -o README-userDoc.html 1-Introduction.md 5-changelog.md

pandoc --from html --to gfm -o README-userDoc.md README-userDoc.html

# Complete
pandoc -f gfm -t html5 --include-in-header=./doc_templates/fonts.js --css ./doc_templates/pandoc.css --metadata title="3DLayout Documentation" -o doc.html 0-Index.md 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md 5-changelog.md

pandoc -f gfm-smart -t html5 --include-in-header=./doc_templates/fonts.js --toc --include-in-header=./doc_templates/header_toc.html --css pandoc.css --metadata title="3DLayout Documentation" -o README.html 1-Introduction.md 2-Integration.md 3-Communication.md 4-Customization.md 5-changelog.md

pandoc --from html --to gfm -o README.md README.html
