FROM hexpm/elixir:1.20.4-erlang-28.5.0.8-ubuntu-noble-20260930.1

LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT 2024-09-20

RUN apt-get -qq update && apt-get install -y \
    ca-certificates \
    git \
    unzip \
    build-essential \
    wget \
    sudo

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force
