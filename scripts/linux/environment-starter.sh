#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

ROOT_PATH="$SCRIPT_DIR/../.."

MODULES_PATH="$SCRIPT_DIR/modules"

READ_ENV_MODULE_FILE="$MODULES_PATH/read-env.sh"

START_ENVIRONMENT_MODULE_FILE="$MODULES_PATH/start-environment.sh"

CC_BACKEND_PATH="$ROOT_PATH/cc-backend"

CC_ROOT_CONSOLE_PATH="$ROOT_PATH/cc-root-console"

CC_BACKENG_GO_VARIABLES_FILE="$CC_BACKEND_PATH/docker/.go_configuration.env"
CC_ROOT_CONSOLE_NODE_VARIABLES_FILE="$CC_ROOT_CONSOLE_PATH/docker/.node_configuration.env"

# shellcheck disable=SC1090
source "$READ_ENV_MODULE_FILE"
# shellcheck disable=SC1090
source "$START_ENVIRONMENT_MODULE_FILE"

readEnv "$CC_BACKENG_GO_VARIABLES_FILE"

readEnv "$CC_ROOT_CONSOLE_NODE_VARIABLES_FILE"

# Check if a parameter was provided
if [ -z "$1" ]; then
    echo "No environment parameter provided. Please provide the parameter."
    exit 1
fi

# Check if a parameter was provided
if [ -z "$2" ]; then
    echo "No action parameter provided. Please provide the parameter."
    exit 1
fi

case $1 in
    develop|production)
        ENVIRONMENT="$1"
        ;;
    *)
        echo "Invalid environment parameter. Please provide a valid parameter (develop, production)."
        exit 1
        ;;
esac

case $2 in
    up|down|build)
        ACTION="$2"
        ;;
    *)
        echo "Invalid action parameter. Please provide a valid parameter (up, down, or build)."
        exit 1
        ;;
esac

OPTION=""

if [ -n "$3" ]; then
    case $3 in
        -d|--no-cache)
            OPTION="$3"
            ;;
        *)
            echo "Invalid option parameter. Please provide a valid parameter (-d, or --no-cache)."
            exit 1
            ;;
    esac
fi

startEnvironment "$ROOT_PATH" "$ENVIRONMENT" "$ACTION" "$OPTION"