# docker-ktbs
A docker image for kTBS (https://github.com/ktbs/ktbs)

# Usage
Launch a kTBS and make it accessible on the host's localhost:8003 :

```$ docker build -t docker-ktbs .```

```$ docker run -it -p 8003:8002 docker-ktbs```
