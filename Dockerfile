FROM hexpm/elixir:1.12.0-erlang-24.0-ubuntu-focal-20210325

LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT 2021-05-19

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

RUN apt-get -qq update && apt-get install -y \
    git \
    unzip \
    build-essential \
    wget \
    sudo
