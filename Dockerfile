FROM alpine:3.24
ARG UID=1000
ARG GID=1000
# set by docker buildx to the architecture of the image being built (amd64, arm64)
ARG TARGETARCH
# Hugo and Dart Sass are installed from the official releases, matching the versions used in CI:
# Hugo >= 0.170 has no built-in Sass compiler, and Alpine does not ship Dart Sass in its stable repositories
# renovate: datasource=github-releases depName=gohugoio/hugo
ARG HUGO_VERSION=0.170.1
# renovate: datasource=github-releases depName=sass/dart-sass
ARG DART_SASS_VERSION=1.108.2
RUN apk add --no-cache ruby git inotify-tools
RUN case "${TARGETARCH:-amd64}" in \
        amd64) SASS_ARCH=x64 ;; \
        arm64) SASS_ARCH=arm64 ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
    esac \
    && wget -qO- "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-${TARGETARCH:-amd64}.tar.gz" \
        | tar -xz -C /usr/local/bin hugo \
    && wget -qO- "https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-${SASS_ARCH}-musl.tar.gz" \
        | tar -xz -C /opt \
    && ln -s /opt/dart-sass/sass /usr/local/bin/sass \
    && hugo version && sass --version
RUN mkdir -p /data && chown ${UID}:${GID} /data
WORKDIR /data
COPY --chown=${UID}:${GID} . .
USER ${UID}:${GID}
ENV HUGO_ARGS="--bind=0.0.0.0"
EXPOSE 1313
CMD ["sh", "shared-slides/serve.sh"]
