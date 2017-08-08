all: build

build:
	docker build -t dexafree/ghostbin .

run_attach:
	docker run --rm -it --entrypoint="/bin/sh" -p 8619:8619 -v $(shell pwd)/logs:/logs -v $(shell pwd)/data:/data dexafree/ghostbin

run:
	docker run --rm -it -p 8619:8619 -v $(shell pwd)/logs:/logs -v $(shell pwd)/data:/data dexafree/ghostbin

clean_logs:
	rm -rf $(shell pwd)/logs/*
