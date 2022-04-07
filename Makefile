.PHONY: all build clean

all: clean build

build:
	docker build -t irace --build-arg UID=$$(id -u) --build-arg GID=$$(id -g) --build-arg UNAME=$$(whoami) .

clean:
	docker rm irace