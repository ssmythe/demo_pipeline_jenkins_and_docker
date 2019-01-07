CID=$(docker ps -a -q -f NAME=hello-apache-stage)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-stage)
