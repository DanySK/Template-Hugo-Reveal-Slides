FROM alpine:3.22
ARG UID=1000
ARG GID=1000
RUN apk add --no-cache hugo ruby git inotify-tools
RUN mkdir -p /data && chown ${UID}:${GID} /data
WORKDIR /data
COPY --chown=${UID}:${GID} . .
USER ${UID}:${GID}
ENV HUGO_ARGS="--bind=0.0.0.0"
EXPOSE 1313
CMD ["sh", "shared-slides/serve.sh"]
