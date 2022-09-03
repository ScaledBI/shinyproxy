FROM ubuntu:20.04 AS downloader

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y wget

# download shinyproxy jar
ENV SHINYPROXY_VERSION=2.6.1
RUN wget -qO "shinyproxy.jar" "https://github.com/openanalytics/shinyproxy/releases/download/v$SHINYPROXY_VERSION/shinyproxy-$SHINYPROXY_VERSION.jar"

FROM openjdk:11-jre-slim-bullseye

RUN groupadd -r shinyproxy && useradd --no-log-init -r -g shinyproxy shinyproxy
USER shinyproxy

# copy shinyproxy
COPY --from=downloader shinyproxy.jar ./

# copy entrypoint and config
COPY entrypoint.sh application.yml ./

EXPOSE 8443
ENTRYPOINT "./entrypoint.sh"
