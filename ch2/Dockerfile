FROM ubuntu:16.04

RUN apt-get update && apt-get install -y cowsay fortune
COPY entrypoint.sh /

ENTRYPOINT ["sh","/entrypoint.sh"]
