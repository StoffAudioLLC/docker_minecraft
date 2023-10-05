FROM ubuntu:latest

ARG JAVAV
ENV JAVAV="$JAVAV"

RUN apt-get update && apt-get install openjdk-"$JAVAV"-jdk

COPY ./Minecraft .

ENTRYPOINT [ "Start.sh" ]