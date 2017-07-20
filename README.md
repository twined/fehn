## Build and update hub image

```
$ docker build -t twined/fehn:1.0 .
$ docker push twined/fehn:1.0
```

## Ubuntu versions

```
1.3 and below - Ubuntu 14.04
1.4 and up    - Ubuntu 16.04
```

## Example Dockerfile

```
FROM twined/fehn:1.3.4

MAINTAINER Twined Networks <mail@twined.net>

COPY . /opt/app
WORKDIR /opt/app

ENV MIX_ENV prod

RUN mix clean
RUN mix deps.clean --all
RUN mix deps.get
RUN mix deps.compile

COPY package.json yarn.lock /opt/app/
RUN yarn --pure-lockfile
RUN node_modules/.bin/brunch build -p

RUN mix phoenix.digest
RUN mix compile
RUN mix release --verbosity=verbose
```
