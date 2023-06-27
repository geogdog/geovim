TAG = $(shell git describe --abbrev=0 --tags)

start_builders:
	docker buildx create --platform linux/arm64,linux/amd64 --use --bootstrap

tag:
	@echo $(TAG)

test-build:
	docker buildx build --platform linux/arm64 \
		-t geogdog/geovim:latest \
		-t geogdog/geovim:$(TAG) \
		$(PWD) \
		--load

build:
	docker buildx build --pull --no-cache --platform linux/arm64,linux/amd64 \
		-t geogdog/geovim:latest \
		-t geogdog/geovim:$(TAG) \
		$(PWD)

build-and-push:
	docker buildx build --pull --no-cache --platform linux/arm64,linux/amd64 \
		-t geogdog/geovim:latest \
		-t geogdog/geovim:$(TAG) \
		$(PWD) \
		--push

shell:
	docker run --pull always --rm -ti geogdog/geovim:latest zsh

run:
	docker run --pull always --rm -ti geogdog/geovim:latest

test-run: test-build
	docker run --pull missing --rm -ti geogdog/geovim:latest https://github.com/geogdog/geovim

lint:
	@checkov --quiet --compact --framework dockerfile -d $(PWD)
