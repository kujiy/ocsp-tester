all: build run

.PHONY: build
build:
	docker build . -t ocsp

.PHONY: run
D := example.com 
run:
	docker run --rm --env DOMAIN=$(D) ocsp

.PHONY: clean
clean: 
	rm *.pem individual-*
