#!/bin/sh

function startEnvironment() {

  SUB_MODULE_PATH=$1
  ENVIRONMENT=$2
  ACTION=$3
  OPTION=$4

  COMMAND="docker-compose -f \"$SUB_MODULE_PATH/$ENVIRONMENT/docker-compose.yml\" $ACTION $OPTION"

  eval "$COMMAND"
}