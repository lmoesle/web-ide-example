.PHONY: help
help:	## Show this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_.-]+:.*?##/ { printf "  \033[36m%-38s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: build
build: ## build eclipse theia docker container
	docker build . -t lmoesle/web-ide-example

.PHONY: pull
pull: ## pull eclipse theia image from dockerhub
	docker pull lmoesle/web-ide-example

.PHONY: start
start: ## start eclipse theia ide
	docker-compose up -d

.PHONY: stop
stop: ## stop eclipse theia ide
	docker-compose down
