FROM hexpm/elixir:1.13.2-erlang-24.2.1-ubuntu-focal-20211006

LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT 2022-01-31

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

RUN apt-get -qq update && apt-get install -y \
    git \
    unzip \
    build-essential \
    wget \
    sudo
