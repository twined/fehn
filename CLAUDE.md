# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Fehn is a Docker base image for Elixir development, providing a standardized runtime environment with Elixir, Erlang, and essential build tools on Ubuntu. This is not an application codebase but a Docker image repository.

## Architecture

- **Base Image**: Built on hexpm/elixir with specific Elixir/Erlang/Ubuntu versions
- **Purpose**: Provides a consistent base for Elixir applications with pre-installed Mix, Hex, and Rebar
- **Versioning**: Follows semantic versioning tied to Ubuntu LTS releases (4.x = Ubuntu 24.04, 3.x = Ubuntu 20.04, etc.)

## Development Commands

### Building the Docker Image
```bash
DOCKER_BUILDKIT=1 docker build -t twined/fehn:<version> .
```

### Publishing to Registry
```bash
DOCKER_BUILDKIT=1 docker push twined/fehn:<version>
```

### Testing Locally
```bash
docker run --rm -it twined/fehn:<version> bash
```

## Version Information
- Check CHANGELOG.md for current Elixir/Erlang versions and release history
- Each major version corresponds to an Ubuntu LTS release
- Dockerfile contains the current base image and package versions

## Usage in Projects
This image serves as a base for Elixir applications. See README.md for example Dockerfile usage patterns with multi-stage builds.