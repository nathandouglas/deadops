#!/bin/bash
# Shoutout to: https://gist.github.com/stanislavb/6634fc35b3d1655201a93d2dd2c3a366

# Do not run if removal already in progress.
pgrep "docker rm" && exit 0

# Remove Dead and Exited containers.
docker rm $(docker ps -a | grep "Dead\|Exited" | awk '{print $1}'); true

# It will fail to remove images currently in use.
# docker rmi $(docker images -qf dangling=true); true

# Clean up unused docker volumes
# docker volume rm $(docker volume ls -qf dangling=true); true
