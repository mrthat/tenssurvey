.DEFAULT_GOAL := all

DRAFT_BUILD_DIR = draft

all: draft-build-dir $(DRAFT_BUILD_DIR)/sig-alternate.pdf

.PHONY: draft-build-dir
draft-build-dir:
	test -d $(DRAFT_BUILD_DIR)/ || mkdir -p $(DRAFT_BUILD_DIR)

.PHONY: $(DRAFT_BUILD_DIR)/sig-alternate.pdf
$(DRAFT_BUILD_DIR)/sig-alternate.pdf:
	latexmk -f -pdf -output-directory=$(DRAFT_BUILD_DIR)/ main.tex

clean:
	rm -rf $(DRAFT_BUILD_DIR)/ *~ core

# eof
