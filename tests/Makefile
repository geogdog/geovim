build:
	docker buildx build -t mwb/geovim . --load

shell: build
	docker run --rm -ti mwb/geovim bash

run: build
	docker run --rm -ti mwb/geovim
