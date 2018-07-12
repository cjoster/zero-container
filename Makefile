CFLAGS=-s -static -nostdlib -Wl,--build-id=none -o zero zero.s

all: zero
	docker build -t zero .

zero: zero.s
	gcc ${CFLAGS}

zero32: zero.s
	gcc -m32 ${CFLAGS}
	docker build -t zero .

zero64: zero.s
	gcc -m64 ${CFLAGS}
	docker build -t zero .

clean:
	rm -f zero
	docker rmi zero
