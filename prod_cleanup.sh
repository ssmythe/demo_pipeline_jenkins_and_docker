CID=$(docker ps -f NAME=hello-apache-prod -q)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-prod)
