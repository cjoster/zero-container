all: zero
	docker build -t zero .

zero: zero.s
	gcc -s -static -nostdlib -Wl,--build-id=none -o zero zero.s

clean:
	rm -f zero
	docker rmi zero
