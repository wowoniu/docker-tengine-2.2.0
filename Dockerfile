FROM alpine
MAINTAINER qiang <zhiqiangvip999@gmail.com>

#更改国内镜像源
RUN echo -e "https://mirrors.ustc.edu.cn/alpine/v3.7/main\nhttps://mirrors.ustc.edu.cn/alpine/v3.7/community\n" > /etc/apk/repositories

ADD tengine-2.2.0.tar.gz /tmp
WORKDIR /tmp/tengine-2.2.0

RUN apk update && apk add --no-cache \
            gcc \
	    g++ \
	    autoconf \
	    automake \
	    openssl-dev  \
            pcre-dev \
            zlib-dev \
	    make && \
	    ./configure --prefix=/home/msoft/tengine/ \
		--with-http_gzip_static_module \
		--with-http_realip_module \
		--with-http_stub_status_module \
		--with-http_concat_module \
		--with-pcre && \
		make && make install && \
	    rm -rf /tmp/tengine-2.2.0/* && \	
	    apk del make autoconf automake gcc g++

EXPOSE 80

ENTRYPOINT ["/home/msoft/tengine/sbin/nginx"]

CMD ["-g","daemon off;"]
