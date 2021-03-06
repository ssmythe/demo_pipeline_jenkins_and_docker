CID=$(docker ps -a -q -f NAME=hello-apache-stage)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-stage)
docker run -dit --name hello-apache-stage -p 8280:80 hello-apache
curl -sSL localhost:8280 | grep -q -i 'Hello, Apache!'
