FROM alpine:latest
ARG UID=1000
ARG GID=1000
RUN apk add --no-cache inotify-tools
RUN apk add --no-cache hugo 
RUN apk add --no-cache ruby
VOLUME [ "/data" ]
USER $UID:$GID
ENV HUGO_ARGS="--bind=0.0.0.0"
WORKDIR /data
