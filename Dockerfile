FROM hexpm/elixir:1.15.5-erlang-26.0.2-ubuntu-focal-20230126

LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT 2023-09-11

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

RUN apt-get -qq update && apt-get install -y \
    git \
    unzip \
    build-essential \
    wget \
    sudo
