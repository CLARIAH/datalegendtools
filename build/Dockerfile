FROM wettyoss/wetty:latest
MAINTAINER Xander Wilcke "w.x.wilcke@vu.nl"

ARG VERSION_COW=2.0.0
ARG VERSION_BURGERLINKER=v0.7

# update repositories
RUN apk update && apk add curl git openjdk17-jre-headless bash py3-pip shadow && rm -rf /var/cache/apk/*

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

RUN mkdir shared

# clone COW release
RUN mkdir ~/.cow
RUN curl -L "https://codeload.github.com/CLARIAH/COW/tar.gz/refs/tags/$VERSION_COW" | tar xz -C ~/.cow --strip-components=1
WORKDIR /home/datalegend/.cow
RUN pip3 install . && pip cache purge

WORKDIR /home/datalegend

# clone Hypodisc
RUN git clone --recurse-submodules https://gitlab.com/wxwilcke/hypodisc.git
WORKDIR /home/datalegend/.hypodisc
RUN pip3 install . && pip cache purge

WORKDIR /home/datalegend

# clone Burgerlinker release
RUN mkdir ~/.burgerlinker
RUN curl -OL "https://github.com/CLARIAH/burgerLinker/releases/download/$VERSION_BURGERLINKER/burgerLinker.jar" --output-dir ~/.burgerlinker

RUN echo "[[ -f ~/.bashrc ]] && . ~/.bashrc" > .bash_profile
RUN echo "export PATH=$PATH:$HOME/.local/bin" >> .bash_profile
RUN echo "PS1='\[\e[0;32m\][\[\e[0;37m\]\u\[\e[0;32m\]] \[\e[0;33m\]\W \[\e[0;37m\]\$ '" > .bashrc
RUN echo "alias burgerlinker='java -jar $HOME/.burgerlinker/burgerLinker.jar'" >> .bashrc
RUN echo "alias hypodisc='cd $HOME/.hypodisc && python3 ./hypodisc/run.py ; cd -'" >> .bashrc

USER root

RUN chown -R datalegend:users /home/datalegend/shared

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
