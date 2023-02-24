FROM hexpm/elixir:1.14.3-erlang-25.2.3-ubuntu-focal-20221130

LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT 2023-02-24

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

RUN apt-get -qq update && apt-get install -y \
    git \
    unzip \
    build-essential \
    wget \
    sudo
