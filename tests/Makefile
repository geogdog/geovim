TAG = $(shell git describe --abbrev=0 --tags)

build:
	docker buildx build --pull --no-cache --platform linux/arm64 -t monkeyswithbuttons/geovim:latest \
		-t monkeyswithbuttons/geovim:$(TAG) ${PWD} --push

shell: build
	docker run --rm -ti monkeyswithbuttons/geovim bash

run: build
	docker run --rm -ti monkeyswithbuttons/geovim
