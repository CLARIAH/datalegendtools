FROM wettyoss/wetty:latest
MAINTAINER Xander Wilcke "w.x.wilcke@vu.nl"

ARG VERSION_COW=1.20
ARG VERSION_BURGERLINKER=v0.6

# update repositories
RUN apk update && apk add curl git openjdk17-jre-headless bash py3-pip && rm -rf /var/cache/apk/*

# update motd
COPY "./motd" "/etc/motd"

# add new user to install applications under
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home /home/datalegend \
    --ingroup users \
    --shell /bin/bash \
    datalegend

RUN echo "datalegend:datalegend" | chpasswd

USER datalegend
WORKDIR /home/datalegend

RUN mkdir shared && chown datalegend:users ./shared

# clone COW release
RUN mkdir ~/.cow
RUN curl -L "https://codeload.github.com/CLARIAH/COW/tar.gz/refs/tags/$VERSION_COW" | tar xz -C ~/.cow --strip-components=1
WORKDIR /home/datalegend/.cow
RUN pip3 install . && pip cache remove *

WORKDIR /home/datalegend

# clone Burgerlinker release
RUN mkdir ~/.burgerlinker
RUN curl -OL "https://github.com/CLARIAH/burgerLinker/releases/download/$VERSION_BURGERLINKER/burgerLinker.jar" --output-dir ~/.burgerlinker

RUN echo "[[ -f ~/.bashrc ]] && . ~/.bashrc" > .bash_profile
RUN echo "export PATH=$PATH:$HOME/.local/bin" >> .bash_profile
RUN echo "PS1='\[\e[0;32m\][\[\e[0;37m\]\u\[\e[0;32m\]] \[\e[0;33m\]\W \[\e[0;37m\]\$ '" > .bashrc
RUN echo "alias burgerlinker='java -jar $HOME/.burgerlinker/burgerLinker.jar'" >> .bashrc

USER root
WORKDIR /usr/src/app
