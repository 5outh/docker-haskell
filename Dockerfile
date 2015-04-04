## Dockerfile for a haskell environment
## Adapted from https://github.com/freebroccolo/docker-haskell
FROM ubuntu:14.04
MAINTAINER Benjamin Kovach <benjamin+@roundsphere.com>

## Install ghc
RUN apt-get update; \
    apt-get install -y haskell-platform build-essential zlib1g-dev;

## Install yesod dependencies
RUN cabal update; \
    cabal install alex happy yesod-bin

## set PATH for tools not installed to /usr/{bin,/local/bin}
ENV PATH /opt/ghc/7.8/bin:$PATH

## run ghci by default unless a command is specified
CMD ["ghci"]
