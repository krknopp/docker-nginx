FROM ubuntu:16.04

RUN apt-get update && apt-get install -y -q --no-install-recommends \
	software-properties-common \
	apt-transport-https \
	ca-certificates \
	&& apt-get clean \
	&& rm -r /var/lib/apt/lists/*

RUN add-apt-repository ppa:nginx/stable \
	&& apt-get update \
	&& apt-get install -y -q --no-install-recommends \
	nginx-full \
	&& apt-get clean \
	&& rm -r /var/lib/apt/lists/*

RUN rm -f /etc/nginx/sites-enabled/*

COPY default.conf /etc/nginx/conf.d/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD nginx -g 'daemon off;'

