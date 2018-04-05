Zero Container
==============

This is the minimum container possible. It runs and returns zero. Builds to
a 344 byte container. Currently 64-bit x86 only, but will add other
architectures if there are requests to do so. 

Simply clone and run make:

```
[cjoster@here zero-container]$ make
gcc -s -static -nostdlib -o zero zero.s
docker build -t zero .
Sending build context to Docker daemon 80.38 kB
Step 1/3 : FROM scratch
 ---> 
Step 2/3 : ADD zero /zero
 ---> f497c5e7bf50
Removing intermediate container 77bfe0ee301b
Step 3/3 : CMD /zero
 ---> Running in 243c26b46fc7
 ---> 54ec58941c87
Removing intermediate container 243c26b46fc7
Successfully built 54ec58941c8
```
```
[cjoster@here zero-container]$ docker images
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
zero                           latest              54f9170e377c        3 seconds ago       344 B
```
You read that correctly. 344 bytes.


```
[cjoster@here zero-container]$ docker run -it --rm zero
[cjoster@here zero-container]$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS               NAMES
63244cb6e60a        zero                "/zero"                  4 seconds ago       Exited (0) 3 seconds ago                       fugly_dude
[cjoster@here zero-container]$ docker rm fugly_dude
fugly_dude
```

```
[cjoster@here zero-container]$ make clean
rm -f zero
docker rmi zero
Untagged: zero:latest
Deleted: sha256:54ec58941c87712f789f3f07b95cbb12a52be79e5a117945c3e8868e2389fae5
Deleted: sha256:f497c5e7bf50977473f343927d5d0b7559305a5988b15da1aedfb90440a3e16f
Deleted: sha256:dc221aa2f8e51366a974a189866a1a8daf34729e4b56a2f135e33c0c1c337a4a
```
