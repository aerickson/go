.PHONY: build run browse

image_name='aje/go'

run:
	docker run -v `pwd`:/app -it -P ${image_name}

build:
	docker build -t ${image_name} .

browse:
	./util/open_browser.sh ${image_name}
