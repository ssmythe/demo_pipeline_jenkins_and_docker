CID=$(docker ps -f NAME=hello-apache-prod -q)
test -z "$CID" || (docker kill $CID; docker rm hello-apache-prod)
docker run -dit --name hello-apache-prod -p 8380:80 hello-apache
curl -sSL localhost:8380 | grep -q -i 'Hello, Apache!'
