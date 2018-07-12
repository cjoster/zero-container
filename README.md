Zero Container
==============

This is the minimum container possible. It runs and returns zero. Builds to
a 344 byte container. Currently 64-bit x86 only, but will add other
architectures if there are requests to do so. 

Simply clone and run make:

```
[cjoster@here zero-container]$ make
gcc -m64 -s -static -nostdlib -Wl,--build-id=none  -o zero64 zero64.s
gcc -m32 -s -static -nostdlib -Wl,--build-id=none  -o zero32 zero32.s
docker build -t zero --build-arg zerobin=zero64 .
Sending build context to Docker daemon 135.7 kB
Step 1/4 : FROM scratch
 ---> 
Step 2/4 : ARG zerobin=zero64
 ---> Running in c66c8935c006
 ---> b6531da7cc23
Removing intermediate container c66c8935c006
Step 3/4 : ADD ${zerobin} /zero
 ---> a30023010b7f
Removing intermediate container d7e03475a46d
Step 4/4 : CMD /zero
 ---> Running in 55c0289b6190
 ---> c5174ae351d6
Removing intermediate container 55c0289b6190
Successfully built c5174ae351d6
```
```
[cjoster@here zero-container]$ docker images
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
zero                           latest              54f9170e377c        3 seconds ago       352 B
```
You read that correctly. 352 bytes. Or 232 if building the 32-bit version, which you can do by saying `make 32`.


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
rm -f zero32 zero64
docker rmi zero
Untagged: zero:latest
Deleted: sha256:54ec58941c87712f789f3f07b95cbb12a52be79e5a117945c3e8868e2389fae5
Deleted: sha256:f497c5e7bf50977473f343927d5d0b7559305a5988b15da1aedfb90440a3e16f
Deleted: sha256:dc221aa2f8e51366a974a189866a1a8daf34729e4b56a2f135e33c0c1c337a4a
```
