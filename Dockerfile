FROM hexpm/elixir:1.20.4-erlang-28.5.0.8-ubuntu-noble-20260930.1

LABEL maintainer="Univers Agency <mail@univers.agency>"
ENV REFRESHED_AT=2026-10-17

RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       git \
       build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force
