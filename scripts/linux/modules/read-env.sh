#!/bin/bash

function readEnv() {
  CONF_FILE="$1"
  while IFS= read -r line
  do
      IFS='=' read -ra data <<< "$line"
      # shellcheck disable=SC2046
      export "${data[0]}"=$(echo -en "${data[1]}" | tr -d '\r')
  done < "$CONF_FILE"
}
