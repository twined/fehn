FROM phusion/baseimage:0.9.18

LABEL maintainer="mail@twined.net"
ENV REFRESHED_AT 2018-12-11

RUN echo /root > /etc/container_environment/HOME
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /tmp

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "deb http://packages.erlang-solutions.com/ubuntu trusty contrib" >> /etc/apt/sources.list && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list && \
    apt-key adv --fetch-keys http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc && \
    apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3  && \
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
    apt-get -qq update && apt-get install -y \
    esl-erlang \
    git \
    unzip \
    build-essential \
    wget \
    nodejs \
    yarn && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and Install Specific Version of Elixir
WORKDIR /elixir
RUN wget -q https://github.com/elixir-lang/elixir/releases/download/v1.7.4/Precompiled.zip && \
    unzip Precompiled.zip && \
    rm -f Precompiled.zip && \
    ln -s /elixir/bin/elixirc /usr/local/bin/elixirc && \
    ln -s /elixir/bin/elixir /usr/local/bin/elixir && \
    ln -s /elixir/bin/mix /usr/local/bin/mix && \
    ln -s /elixir/bin/iex /usr/local/bin/iex

# Install local Elixir hex and rebar
RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force
