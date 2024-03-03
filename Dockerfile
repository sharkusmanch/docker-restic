FROM debian

ARG VERSION="0.16.3"

COPY ./install.sh /tmp/install.sh

RUN apt-get update -y && apt-get install curl mariadb-client tzdata unzip fuse bzip2 -y && \
    export RESTIC_VERSION="${VERSION}" && \
    bash /tmp/install.sh && \
    rm /tmp/install.sh && \
    adduser --disabled-password restic && \
    curl https://rclone.org/install.sh | bash && \
    apt-get remove unzip curl bzip2 jq -y && \
    apt autoremove -y

USER restic

ENTRYPOINT [ "restic" ]
