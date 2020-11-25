CFLAGS=-s -static -nostdlib -Wl,--build-id=none 

all: container

container: zero
	docker build -t zero --build-arg zerobin=zero .

container64: zero64
	docker build -t zero --build-arg zerobin=zero .

container32: zero32
	docker build -t zero --build-arg zerobin=zero .

zero:
	gcc ${CFLAGS} -o zero zero.S

zero32: zero.S
	gcc -m32 ${CFLAGS} -o zero zero.S

zero64: zero.S
	gcc -m64 ${CFLAGS} -o zero zero.S

clean:
	rm -f zero
	docker rmi zero || true
