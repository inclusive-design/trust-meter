# Generate documents in the desired output formats.

# Identify source and target files.
exclusions:=README.md
sources:=$(filter-out $(exclusions), $(wildcard *.md))
html_targets:=$(sources:.md=.html)
pdf_targets:=$(sources:.md=.pdf)
docx_targets:=$(sources:.md=.docx)

# Options
pandoc_options:=-s -N

# Implicit rules
%.html : %.md
	pandoc $(pandoc_options) $< -o $@
%.pdf : %.md
	pandoc $(pandoc_options) $< -o $@
%.docx : %.md
	pandoc $(pandoc_options) $< -o $@

# Targets
.PHONY: all html pdf docs clean
all: html pdf docx
html: $(html_targets)
pdf: $(pdf_targets)
docx: $(docx_targets)
clean:
	rm -f $(html_targets) $(pdf_targets) $(docx_targets)

