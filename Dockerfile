FROM alpine

ARG VERSION
ARG VERSION_R='r0'

RUN apk add --no-cache curl mariadb-client restic=${VERSION}-${VERSION_R} bash tzdata unzip fuse && \
    adduser --disabled-password restic && \
    curl https://rclone.org/install.sh | bash && \
    apk del unzip bash curl

USER restic

ENTRYPOINT [ "restic" ]