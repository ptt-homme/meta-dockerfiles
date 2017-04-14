#!/bin/bash
set -e

set -x
cd docker-base
docker build -t studiometa/base .
dgoss run -it studiometa/base