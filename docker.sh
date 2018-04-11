#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Docker for Mac
brew cask install docker
# Docker commands will probably fail now. Just start "Docker" app by hand and rerun this script

# Build my custom services
docker build -t elasticsearch-switowski ./docker/es/

# Developer services
#docker pull mongo
docker pull mysql
#docker pull postgres
#docker pull rabbitmq
#docker pull redis
docker swarm init
#docker service create --name redis --publish 6379:6379 redis
#docker service create --name postgres --publish 5432:5432 -e POSTGRES_USER=$USER postgres

# This one I'm actually using for cds-videos, but I disabled it to play with invenio test-instance
#docker service create --name elasticsearch --publish 9200:9200 --publish 9300:9300 elasticsearch-switowski
#docker service create --name mysql --publish 3306:3306 --env MYSQL_ALLOW_EMPTY_PASSWORD=True mysql

