## Build and update hub image

The image is amd64, so build it on an amd64 host rather than an Apple Silicon
laptop. Set `DOCKER_HOST` to whichever build machine you use — florist configs
currently point at `manhattan`.

Releases link the build image's glibc and OpenSSL, so build on the same Ubuntu
release the server runs. Each version comes in two variants:

| Tag | Ubuntu | glibc | OpenSSL | For servers on |
|---|---|---|---|---|
| `4.2`, `4.2-noble` | 24.04 | 2.39 | 3.0 | Ubuntu 24.04 |
| `4.2-jammy` | 22.04 | 2.35 | 3.0 | Ubuntu 22.04 |

hexpm no longer publishes Ubuntu 20.04 (focal) images for current Elixir and
Erlang, so there is no focal variant.

```
$ DOCKER_HOST=manhattan DOCKER_BUILDKIT=1 docker build -t twined/fehn:4.2 -t twined/fehn:4.2-noble .
$ DOCKER_HOST=manhattan DOCKER_BUILDKIT=1 docker build -t twined/fehn:4.2-jammy \
    --build-arg BASE=1.20.4-erlang-28.5.0.8-ubuntu-jammy-20260930 .
$ for t in 4.2 4.2-noble 4.2-jammy; do DOCKER_HOST=manhattan docker push twined/fehn:$t; done
```

Then bump the `FROM twined/fehn:<version>` line in each site's Dockerfile.
Sites do not float on a tag, so a new image reaches nothing until they do.

## Ubuntu versions

```
1.3 and below - Ubuntu 14.04
1.4 and up    - Ubuntu 16.04
2.X           - Ubuntu 18.04
3.X           - Ubuntu 20.04
4.X           - Ubuntu 24.04
```

## Example Dockerfile

```

FROM --platform=linux/amd64 twined/fehn:4.2

LABEL maintainer="Univers Agency <mail@univers.agency>"

WORKDIR /opt/app
ENV MIX_ENV prod

# build deps
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# build app
COPY lib lib
COPY test test
COPY rel rel
COPY priv/gettext priv/gettext
COPY priv/repo priv/repo
RUN mix compile

COPY --from=frontend_builder /opt/app/priv/static/ priv/static/
COPY --from=backend_builder /opt/app/priv/static/ priv/static/

RUN mix phx.digest
RUN mix distillery.release
```
