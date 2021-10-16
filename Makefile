#!make

.PHONY: build install run fmt clean cleanBuild

build: install fmt
	@npm run build
	@docker build . -i mylinks/ui

install:
	@npm install

run:
	@npm run dev

fmt:
	@prettier --write --plugin-search-dir=. ./**/*.svelte
	@prettier --write --plugin-search-dir=. ./**/*.html
	@prettier --write --plugin-search-dir=. ./**/*.js

clean: cleanBuild
	@rm -rf node_modules

cleanBuild:
	@rm -rf public/build
