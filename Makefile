.PHONY: test clean

build:
	docker build -t protoc .

test: clean
	./test.sh

clean:
	rm -rf out
