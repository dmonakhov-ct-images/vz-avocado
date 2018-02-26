REGISTRY ?= dev.qa.sw.ru:30500
IMG_NAME ?= vz-avocado
IMG_TAG  ?= latest

PHONY := all build push

all: build push jenkins-lint

build:
	docker build --rm -t $(REGISTRY)/$(IMG_NAME):$(IMG_TAG) . -f Dockerfile
push: 
	docker push $(REGISTRY)/$(IMG_NAME):$(IMG_TAG)

jenkins-lint:
	jenkins-cli declarative-linter < Jenkinsfile

jenkins-build: jenkins-lint
	jenkins-cli build vz-avocado/master

