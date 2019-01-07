CID=$(docker ps -f NAME=hello-apache-stage -q)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-stage)
docker run -dit --name hello-apache-stage -p 8280:80 hello-apache
curl -sSL localhost:8280 | grep -q -i 'Hello, Apache!'
