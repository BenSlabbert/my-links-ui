#!make

.PHONY: npmBuild dockerBuild install run fmt clean cleanBuild

npmBuild: install fmt
	@npm run build

dockerBuild:
	@docker build . -t mylinks/ui

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
