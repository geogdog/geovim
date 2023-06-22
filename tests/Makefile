TAG = $(shell git describe --abbrev=0 --tags)

start_builders:
	docker buildx create --platform linux/arm64,linux/amd64 --use --bootstrap

tag:
	@echo $(TAG)

test-build:
	docker buildx build --platform linux/arm64 \
		-t monkeyswithbuttons/geovim:latest \
		-t monkeyswithbuttons/geovim:$(TAG) \
		$(PWD) \
		--load

build:
	docker buildx build --pull --no-cache --platform linux/arm64,linux/amd64 \
		-t monkeyswithbuttons/geovim:latest \
		-t monkeyswithbuttons/geovim:$(TAG) \
		$(PWD)

build-and-push:
	docker buildx build --pull --no-cache --platform linux/arm64,linux/amd64 \
		-t monkeyswithbuttons/geovim:latest \
		-t monkeyswithbuttons/geovim:$(TAG) \
		$(PWD) \
		--push

shell:
	docker run --pull always --rm -ti monkeyswithbuttons/geovim:latest zsh

run:
	docker run --pull always --rm -ti monkeyswithbuttons/geovim:latest

test-run: test-build
	docker run --pull always --rm -ti monkeyswithbuttons/geovim:latest

lint:
	@checkov --quiet --compact -d $(PWD)
