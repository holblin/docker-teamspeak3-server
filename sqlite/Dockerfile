# Teamspeak 3 server
#
# VERSION               3.0.11.4

FROM debian:jessie

MAINTAINER holblin

## Set some variables for override.
# Download Link of TS3 Server
ENV TEAMSPEAK_VERSION 3.0.11.4
ENV TEAMSPEAK_SHA1 09e7fc2cb5dddf84f3356ddd555ad361f5854321

VOLUME /data

# copy the entrypoint script
COPY docker-entrypoint.sh /entrypoint.sh

# Download TS3 file and extract it into /app.
# inside the process, we install wget, use it untar gz file, remove wget, remove unused teamspeak3 ressources, clean aptitude
RUN mkdir -p /app \
  && apt-get update \
  && apt-get install -y wget --no-install-recommends \
  && wget -O ts3_server.tar.gz http://dl.4players.de/ts/releases/${TEAMSPEAK_VERSION}/teamspeak3-server_linux-amd64-${TEAMSPEAK_VERSION}.tar.gz \
  && echo "${TEAMSPEAK_SHA1} *ts3_server.tar.gz" | sha1sum -c - \
  && tar -C /app -xzf ts3_server.tar.gz --strip-components=1 \
  && rm ts3_server.tar.gz \
  && rm -R /app/doc /app/serverquerydocs /app/tsdns /app/ts3server_minimal_runscript.sh /app/ts3server_startscript.sh /app/redist \
  && apt-get purge -y wget \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -r /var/lib/apt/lists/*

# set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

CMD ["ts3server"]

# Expose the Standard TS3 port.
EXPOSE 9987/udp

# for files
EXPOSE 30033

# for ServerQuery
EXPOSE 10011
