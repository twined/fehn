FROM hexpm/elixir:1.11.1-erlang-23.1.1-ubuntu-focal-20200703
LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT 2020-10-25

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

RUN apt-get -qq update && apt-get install -y \
    git \
    unzip \
    build-essential \
    wget \
    sudo
