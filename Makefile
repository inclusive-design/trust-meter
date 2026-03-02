# Generate documents in the desired output formats.

# Identify source and target files.
exclusions=README.md
sources=$(filter-out $(exclusions), $(wildcard *.md))
html_targets=$(sources:.md=.html)
pdf_targets=$(sources:.md=.pdf)
docx_targets=$(sources:.md=.docx)

# Options
style_options=-N

# Implicit rules
%.html : %.md
	pandoc -s $(style_options) $< -o $@
%.pdf : %.md
	pandoc -s $(style_options) $< -o $@
%.docx : %.md
	pandoc -s $(style_options) $< -o $@

# Targets
all: html pdf docx
html: $(html_targets)
pdf: $(pdf_targets)
docx: $(docx_targets)
clean:
	rm -f $(html_targets) $(pdf_targets) $(docx_targets)

