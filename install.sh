#!/bin/bash

./installers.sh
./zsh.sh
./default.sh

# dev
./dev/git.sh
./dev/default.sh
./dev/c.sh
./dev/python.sh
./dev/ruby.sh
./dev/go.sh
./dev/nodejs.sh
./dev/java.sh

# infra
./infra/docker.sh
./infra/kubernetes.sh
./infra/aws.sh

# databases
./clients.sh

