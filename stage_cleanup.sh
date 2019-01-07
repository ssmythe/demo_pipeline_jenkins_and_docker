CID=$(docker ps -f NAME=hello-apache-stage -q)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-stage)
