FROM ubuntu:16.04

RUN useradd eddi
RUN mkdir /data && touch /data/eddi_works.txt
RUN chown -R eddi:eddi /data
VOLUME /data
