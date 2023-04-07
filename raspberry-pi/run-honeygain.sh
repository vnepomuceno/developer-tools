#!/bin/bash

ENV_YAML='environment.yaml'
RPI_ARCH='linux/amd64'

function verify_binfmt() {
  echo "Verifying support of 'binfmt' for architecture ${RPI_ARCH}..."

  if docker run --privileged --rm tonistiigi/binfmt | jq -e ".supported| contains([\"${RPI_ARCH}\"])" &> /dev/null; then
    echo "Architecture ${RPI_ARCH} is supported ✅"
  else
    echo "Architecture ${RPI_ARCH} not supported, running 'binfmt'..."
    docker run --privileged --rm tonistiigi/binfmt --install all
    echo "Architecture ${RPI_ARCH} is now supported ✅"
  fi
}

function run_honeygain() {
  HONEYGAIN_USERNAME=$(cat $ENV_YAML | yq '.honeygain-username')
  HONEYGAIN_PASSWORD=$(cat $ENV_YAML | yq '.honeygain-password')

  docker run -d --platform linux/amd64 honeygain/honeygain -tou-accept -email $HONEYGAIN_USERNAME -pass $HONEYGAIN_PASSWORD -device raspberry-pi
}


verify_binfmt
run_honeygain