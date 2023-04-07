#!/bin/bash

# Set path for Honeygain credentials file
ENV_YAML="environment.yaml"

# TODO: Install yq first

function install_docker() {
  echo 'Installing Docker'
  # Install Docker if it's not already installed
  if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl restart docker
    rm get-docker.sh
  fi
}

function install_python() {
  # Install Python if it's not already installed
  if ! command -v python &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y python
  fi
}

function check_install_yq() {
  if ! which yq >/dev/null; then
    sudo apt-get update
    sudo apt-get install snapd
    sudo snap install yq
  fi
}

function install_cronjob() {
  # Set up a cron job to start the container every day if it doesn't already exist
  if ! crontab -l | grep -q 'docker start my-container'; then
    (crontab -l 2>/dev/null; echo "30 5 * * * docker start my-container") | crontab -
  fi
}

function run_container() {
  # Run a Docker container with the Python script and redirect the logs to a file
  docker run -d --name my-container my-image python /path/to/my-script.py >> /path/to/my-log-file.log 2>&1

  # Note: Replace my-image with the name of the Docker image you want to use,
  # /path/to/my-script.py with the path to your Python script inside the container,
  # /path/to/my-log-file.log with the path to the local log file you want to use, and
  # 30 5 * * * with the cron schedule you want to use.
}

function install_earnapp() {
  # Pull the EarnApp Docker image
  docker pull earnapp/earnapp

  # Run the EarnApp container
  docker run -d --restart=always --name earnapp earnapp/earnapp
}



# Install Docker and Python if they're not already installed
install_docker
install_python

# Install dependencies
check_install_yq

## Install the cron job if it doesn't already exist
install_cronjob

## Install EarnApp using Docker
install_earnapp

## Run the Docker container with the Python script
run_container