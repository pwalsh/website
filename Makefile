.PHONY: help install-backend install-frontend install build-frontend build-backend build watch serve deploy test

.DEFAULT_GOAL := help

help: # http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort |\
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install-backend: ## Install the Clojure backend dependencies.
	lein deps

install-frontend: ## Install the JavaScript frontend dependencies.

install: install-backend install-frontend ## Install all dependencies.

build-backend: ## Export the static website files with stasis.
	lein build

build-frontend: ## Build the frontend assets with webpack.
	npx webpack --display errors-only

build: build-frontend build-backend ## Export the static website files with stasis.

watch: ## Build frontend assets and watch for changes.
	npx webpack --watch --debug --progress --colors

serve: ## Serve as an application for local development.
	lein serve

deploy: ## Deploy static website assets to a Google Cloud Storage bucket.
	gsutil -d -r output gs://pwalsh.me

test: ## Run the tests.
	lein test
