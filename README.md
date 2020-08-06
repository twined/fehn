## Build and update hub image

```
$ docker build -t twined/fehn:2.5 .
$ docker push twined/fehn:2.5
```

## Ubuntu versions

```
1.3 and below - Ubuntu 14.04
1.4 and up    - Ubuntu 16.04
2.X           - Ubuntu 18.04
```

## Example Dockerfile

```

FROM twined/fehn:2.5

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
