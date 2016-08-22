docker build -t nginx .
docker run --name nginx -d -p 8080:80 nginx
