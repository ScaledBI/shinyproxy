FROM ubuntu:20.04 AS downloader

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y wget

# download shinyproxy jar
ENV SHINYPROXY_VERSION=2.6.1
RUN wget -qO "shinyproxy.jar" "https://github.com/openanalytics/shinyproxy/releases/download/v$SHINYPROXY_VERSION/shinyproxy-$SHINYPROXY_VERSION.jar"

FROM openjdk:11-jre-slim-bullseye

# copy shinyproxy
COPY --from=downloader shinyproxy.jar ./

# copy entrypoint and config
COPY entrypoint.sh application.yml ./

# copy templates
COPY application.yml /layout /layout/

EXPOSE 8443
ENTRYPOINT "./entrypoint.sh"
