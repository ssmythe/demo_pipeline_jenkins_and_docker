CID=$(docker ps -a -q -f NAME=hello-apache-prod)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-prod)
