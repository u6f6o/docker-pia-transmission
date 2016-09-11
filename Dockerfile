FROM u6f6o/openvpn-pia:v1.0

MAINTAINER Ulf Gitschthaler

# Uses s6-overlay to supervise services etc. 

# install necessary packages
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache bash transmission-daemon \
	&& rm -rf /var/cache/apk/* 

# copy service init and config scripts
RUN mkdir /etc/services.d/transmission
ADD scripts/service/transmission/ /etc/services.d/transmission/

# copy transmission settings
ADD config/transmission/settings.json /etc/transmission-daemon/

# prepare folders 
RUN mkdir -p /media/transmission/downloads 
RUN mkdir -p /media/transmission/incomplete

