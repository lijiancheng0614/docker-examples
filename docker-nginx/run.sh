docker build -t docker-nginx .
docker run --name docker-nginx -d -p 8080:80 docker-nginx
