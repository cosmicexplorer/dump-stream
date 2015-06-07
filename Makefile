.PHONY: all

NPM_DIR = node_modules

NPM_BIN := $(shell npm bin)
COFFEE_BIN := $(NPM_BIN)/coffee

OBJ := dump-stream.js

all: $(OBJ)

%.js: %.coffee $(NPM_DIR)
	$(COFFEE_BIN) -bc --no-header $<

$(NPM_DIR):
	npm install
