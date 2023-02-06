#!/bin/bash

./installers.sh
./zsh.sh
./default-apps.sh

# dev
./dev/git.sh
./dev/default-dev.sh
./dev/c.sh
./dev/python.sh
./dev/ruby.sh
./dev/go.sh
./dev/nodejs.sh
./dev/java.sh

# infra
./infra/docker.sh
./infra/kubernetes.sh

# databases
./db-clients.sh

