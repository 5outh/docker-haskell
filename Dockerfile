## Dockerfile for a haskell environment
## Adapted from https://github.com/freebroccolo/docker-haskell
FROM ubuntu:14.04
MAINTAINER Benjamin Kovach <benjamin+@roundsphere.com>

## custom apt-get install options
ENV OPTS_APT        -y --no-install-recommends

## install ghc
RUN apt-get update; \
    apt-get install -y haskell-platform build-essential zlib1g-dev;

## set PATH for tools not installed to /usr/{bin,/local/bin}
ENV PATH /opt/ghc/$MAJOR_GHC$MINOR_GHC/bin:/opt/cabal/$MAJOR_CABAL/bin:$PATH

## run ghci by default unless a command is specified
CMD ["ghci"]
