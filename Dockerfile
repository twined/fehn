FROM hexpm/elixir:1.17.2-erlang-27.0.1-ubuntu-focal-20240530

LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT 2024-08-29

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

RUN apt-get -qq update && apt-get install -y \
    git \
    unzip \
    build-essential \
    wget \
    sudo
