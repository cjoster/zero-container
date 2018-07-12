CFLAGS=-s -static -nostdlib -Wl,--build-id=none 

all: container64

32: container32

container64: zero
	docker build -t zero --build-arg zerobin=zero64 .

container32: zero
	docker build -t zero --build-arg zerobin=zero32 .

zero: zero64 zero32

zero32: zero32.s
	gcc -m32 ${CFLAGS} -o zero32 zero32.s

zero64: zero64.s
	gcc -m64 ${CFLAGS} -o zero64 zero64.s

clean:
	rm -f zero32 zero64
	docker rmi zero
