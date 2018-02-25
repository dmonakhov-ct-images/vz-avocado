REGISTRY ?= dev.qa.sw.ru:30500
IMG_NAME ?= vz-avocado
IMG_TAG  ?= latest

PHONY := all build push

all: build push

build:
	docker build --rm -t $(REGISTRY)/$(IMG_NAME):$(IMG_TAG) . -f Dockerfile
push: 
	docker push $(REGISTRY)/$(IMG_NAME):$(IMG_TAG)

