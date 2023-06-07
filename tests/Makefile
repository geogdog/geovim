TAG := $(command git describe --abbrev=0 --tags)
version:
	echo $(TAG)

build:
	docker buildx build --pull --no-cache --platform linux/arm64 -t monkeyswithbuttons/geovim:latest \
		-t . monkeyswithbuttons/geovim:$(TAG) --push

shell: build
	docker run --rm -ti monkeyswithbuttons/geovim bash

run: build
	docker run --rm -ti monkeyswithbuttons/geovim
