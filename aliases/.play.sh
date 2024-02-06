#!/usr/bin/env bash

# check if file exists in current or parent directory
if [ -f "docker-compose.yml" ]; then
  echo 'Inside docker-compose project'
else
  echo 'Not inside docker-compose project'
fi
