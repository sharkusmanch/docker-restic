FROM alpine

ARG VERSION

COPY ./install.sh /tmp/install.sh

RUN apk add --no-cache curl mariadb-client bash tzdata unzip fuse bzip2 && \
    export RESTIC_VERSION="${VERSION}" && \
    bash /tmp/install.sh && \
    rm /tmp/install.sh && \
    adduser --disabled-password restic && \
    curl https://rclone.org/install.sh | bash && \
    apk del unzip bash curl bzip2 jq

USER restic

ENTRYPOINT [ "restic" ]
