# docker-tengine-2.2.0
tengine2.2.0(1.8.1)

#克隆下来后可自行构建

docker build -t tengine:2.2.0 ./

#启动容器（默认配置文件 参见nginx.conf）

docker run -p 80:80 -d -v XXX/nginx.conf:/home/msoft/tengine/conf/nginx.conf tengine:2.2.0
