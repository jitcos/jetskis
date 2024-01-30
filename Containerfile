FROM quay.io/toolbx/ubuntu-toolbox:22.04 as jestskis

LABEL com.github.containers.toolbox="true" \
  usage="This image is meant to be used with the toolbox or distrobox command" \
  summary="A Ubuntu based container to be used with cabos" \
  maintainer="Joe Ipson" \
  title="Jetskis"

# Update apt
RUN apt-get update && apt-get dist-upgrade -y && apt-get upgrade -y

# Install prerequisite pacakges
RUN apt-get install software-properties-common apt-transport-https apt-utils -y

# Add PPAs
RUN add-apt-repository ppa:longsleep/golang-backports -y

# Install base packages
RUN apt-get install micro mosh tmux curl \
  htop awscli ffmpeg git zsh nano wget \
  dialog golang-go golang-easyjson btop \
  unzip p7zip-full p7zip-rar gpg -y

# Install dev packages
RUN apt-get install build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev libxmlsec1-dev \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libffi-dev liblzma-dev \
  -y

RUN ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman

