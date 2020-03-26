FROM ubuntu:18.04
MAINTAINER Lorenzo Carbonell <a.k.a. atareao>

ARG UID=1000
ARG GID=1000

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends mumble-server gosu  libssl1.0-dev && \
    rm -rf /var/lib/apt/lists

RUN groupadd -g $GID mumble 
RUN useradd -r -s /bin/false -u $UID -g $GID mumble
RUN mkdir /mumble && chown -R mumble:mumble /mumble

# Copy configuration
ADD ./mumble-server.ini /etc/mumble-server.ini
ADD ./start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 64738
VOLUME ["/mumble"]

ENTRYPOINT ["/start.sh"]
