FROM debian:12-slim

ENV TRACCAR_VERSION 6.5

WORKDIR /opt/traccar

RUN set -ex; \
    apt-get update; \
    TERM=xterm DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
      openjdk-17-jre-headless \
      unzip \
      wget; \
    wget -qO /tmp/traccar.zip https://traccar.nyc3.digitaloceanspaces.com/builds/traccar-other-preview.zip; \
    unzip -qo /tmp/traccar.zip -d /opt/traccar; \
    apt-get autoremove --yes unzip wget; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["java", "-Xms1g", "-Xmx1g", "-Djava.net.preferIPv4Stack=true"]

CMD ["-jar", "tracker-server.jar", "conf/traccar.xml"]