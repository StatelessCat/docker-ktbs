# docker-ktbs
A docker image for kTBS (https://github.com/ktbs/ktbs)

# Usage
Launch a kTBS and make it accessible on the host's localhost:8002 :
`$ docker build -t docker-ktbs .`
`$ docker run -it -p 8002:8001 docker-ktbs`

