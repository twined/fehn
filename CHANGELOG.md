## 4.2 (2026-10-17)

- Ubuntu 24.04 (noble-20260930.1)
- Elixir 1.20.4
- Erlang 28.5.0.8
- Slimmer: only ca-certificates, git and build-essential, without
  recommended packages or apt lists (572 MB → 484 MB). Drops wget, unzip
  and sudo, which no site's Dockerfile uses.
- Two variants: `4.2`/`4.2-noble` (Ubuntu 24.04) and `4.2-jammy` (Ubuntu
  22.04, glibc 2.35, OpenSSL 3.0). Build on the server's Ubuntu release.

Matches the toolchain sites pin in `.mise.toml`. Releases were still being
compiled on the 4.0 image (Elixir 1.17.3), three minor versions behind
development. Stays on Erlang 28 rather than 29: no site has been compiled on
29 yet.

## 4.1 (2026-09-21)

- Ubuntu 24.04
- Elixir 1.18.1
- Erlang 27.2

Prepared 2024-12-29 but never built, so it is published now under its original
version number.

## 4.0 (2024-09-20)

- Ubuntu 24.04
- Elixir 1.17.2
- Erlang 27.1

## 3.10 (2024-08-29)

- Elixir 1.17.2
- Erlang 27.0.1

## 3.9 (2023-09-11)

- Elixir 1.15.5
- Erlang 26.0.2

## 3.8 (2023-02-24)

- Elixir 1.14.3
- Erlang 25.2.3

## 3.7 (2022-10-31)

- Elixir 1.14.1
- Erlang 25.1.2

## 3.6 (2022-09-06)

- Elixir 1.14.0
- Erlang 25.0.2

## 3.5 (2022-01-31)

- Elixir 1.13.2
- Erlang 24.2.1

## 3.4 (2021-11-12)

- Elixir 1.13.0-rc.1
- Erlang 24.1

## 3.3 (2021-11-12)

- Elixir 1.12.3
- Erlang 24.1
- Set linux/amd64

## 3.2 (2021-05-19)

- Elixir 1.12
- Erlang 24.0

## 3.1 (2020-10-25)

- Elixir 1.11.1
- Erlang 23.1.1

## 3.0 (2020-08-27)

- Ubuntu 20.04


For 2.X or 1.X changes, see appropriate git branches.