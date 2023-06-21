TAG = $(shell git describe --abbrev=0 --tags)

start_builders:
	docker buildx create --platform linux/arm64,linux/amd64 --use --bootstrap

tag:
	@echo $(TAG)

build:
	docker buildx build --pull --no-cache --platform linux/arm64 \
		-t monkeyswithbuttons/geovim:main \
		-t monkeyswithbuttons/geovim:$(TAG) \
		$(PWD)

build-and-push:
	docker buildx build --pull --no-cache --platform linux/arm64 \
		-t monkeyswithbuttons/geovim:main \
		-t monkeyswithbuttons/geovim:$(TAG) \
		$(PWD)

shell:
	docker run --pull always --rm -ti monkeyswithbuttons/geovim:main bash

run:
	docker run --pull always --rm -ti monkeyswithbuttons/geovim:main
