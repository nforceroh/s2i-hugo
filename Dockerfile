FROM docker.io/golang:alpine

MAINTAINER the Digital Garage <support@thedigitalgarage.io>

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i

EXPOSE 8080

RUN mkdir -p /opt/app-root/src/static && \
    chmod -R og+rwx /opt/app-root && \
    chown -R 1001:0 /opt/app-root && \
    mkdir -p /usr/libexec/s2i && \
    cd /opt/app-root/src && \
    git clone https://github.com/digitalcraftsman/hugo-material-docs.git themes/hugo-material-docs

WORKDIR /opt/app-root/src

RUN apk add --update git hugo

COPY ./s2i/* /usr/libexec/s2i/
RUN chmod +x /usr/libexec/s2i/*

USER 1001