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

CMD ["nginx -g 'daemon off;'"]

