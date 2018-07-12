all: zero
	docker build -t zero .

zero: zero.s
	gcc -s -static -nostdlib -Wl,--build-id=none -o zero zero.s

zero32: zero.s
	gcc -m32 -s -static -nostdlib -Wl,--build-id=none -o zero zero.s
	docker build -t zero .

zero64: zero.s
	gcc -m64 -s -static -nostdlib -Wl,--build-id=none -o zero zero.s
	docker build -t zero .

clean:
	rm -f zero
	docker rmi zero
