#!/bin/bash

# Source the proxy functions
source ~/scripts/proxy-functions.sh

# Check if hiddify proxy is active
PROXY_PORT=12334

if nc -z 127.0.0.1 $PROXY_PORT; then
    enable_proxy
else
    disable_proxy
fi

# Launch kitty
exec kitty
