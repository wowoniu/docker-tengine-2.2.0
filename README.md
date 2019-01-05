# docker-tengine-2.2.0
tengine2.2.0(1.8.1)

#克隆下来后可自行构建

docker build -t tengine:2.2.0 ./

#启动容器

docker run -p 80:80 -d tengine:2.2.0
