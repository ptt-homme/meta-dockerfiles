# VERSION:        1.0.0
# DESCRIPTION:    Create a base image container
# AUTHOR:         Thomas Bailly <thomas@studiometa.fr>
# COMMENTS:
#  	NC
# USAGE:
#
#   # Build Composer image
#   docker build -t youralias/image .

FROM ubuntu:16.04

MAINTAINER Thomas Bailly <thomas@studiometa.fr>

# Change language to French.
RUN locale-gen fr_FR.UTF-8

# Set environment variables.
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LC_ALL fr_FR.UTF-8
ENV USER studiometa
ENV HOME "/home/${USER}"
ENV TERM "xterm-256color"

# Install utils packages.
RUN apt-get update \
    && apt-get install -y apt-utils curl dialog git htop rsync software-properties-common tmux unzip vim zip zsh \
    	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# Add Oh My Zsh config.
COPY src/.zshrc "${HOME}/"

# Add a non ROOT user & use zsh as Shell.
RUN addgroup --gid 1000 "${USER}" \
	&& useradd -u 1000 -g "${USER}" -d "${HOME}" "${USER}" \
	&& chsh -s /bin/zsh "${USER}"

# Install Oh My Zsh.
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git "${HOME}/.oh-my-zsh" \
	&& chown -R "${USER}":"${USER}" "${HOME}"

USER studiometa

ENTRYPOINT ["/bin/zsh"]
