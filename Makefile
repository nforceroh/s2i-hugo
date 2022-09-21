IMAGE_NAME = golang-alpine

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .
