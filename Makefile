.PHONY: build run

build:
	docker build -t aje/go .

run:
	docker run -v `pwd`:/app -it -P aje/go
