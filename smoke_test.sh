CID=$(docker ps -a -q -f NAME=hello-apache-smoke-test)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-smoke-test)
docker run -dit --name hello-apache-smoke-test -p 8180:80 hello-apache
curl -sSL localhost:8180 | grep -q -i 'Hello, Apache!'
CID=$(docker ps -a -q -f NAME=hello-apache-smoke-test)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-smoke-test)
