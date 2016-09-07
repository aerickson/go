#!/usr/bin/env bash

set -e

docker run -v `pwd`:/app -it aje/go
docker run -v `pwd`:/app -it aje/go zsh
#docker run -it aje/go zsh
