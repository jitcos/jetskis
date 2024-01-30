FROM quay.io/toolbx/ubuntu-toolbox:22.04 as jestskis

LABEL com.github.containers.toolbox="true" \
    usage="This image is meant to be used with the toolbox or distrobox command" \
    summary="A Ubuntu based container to be used with cabos" \
    maintainer="Joe Ipson" \
    title="Jetskis"

# Add PPAs
RUN add-apt-repository ppa:longsleep/golang-backports -y

# Update apt
RUN apt-get update && apt-get dist-upgrade -y && apt-get upgrade -y

# Install base packages
RUN apt-get install micro mosh tmux apt-transport-https \
    htop awscli ffmpeg git zsh software-properties-common \
    apt-utils dialog golang-go golang-easyjson btop \
    unzip p7zip-full p7zip-rar nano wget gpg curl \
    -y

# Install dev packages
RUN apt-get install build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libxmlsec1-dev \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libffi-dev liblzma-dev \
    -y

RUN ln -fs /bin/sh /usr/bin/sh && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update

