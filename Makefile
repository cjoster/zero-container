all: zero
	docker build -t zero .

zero: zero.s
	gcc -s -static -nostdlib -o zero zero.s

clean:
	rm -f zero
	docker rmi zero
