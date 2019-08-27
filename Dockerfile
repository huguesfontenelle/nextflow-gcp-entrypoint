FROM ubuntu:18.04

RUN apt update && \
  apt install tree

ENTRYPOINT ["tree"]
