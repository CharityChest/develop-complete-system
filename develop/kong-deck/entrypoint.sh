#!/bin/sh

/wait && deck --kong-addr "$KONG_ADMIN_URL" gateway sync /deck/kong.yaml