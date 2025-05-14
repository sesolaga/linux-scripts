#!/bin/bash

PROXY_PORT=12334
PROXY_ADDR="http://127.0.0.1:$PROXY_PORT/"
NO_PROXY="localhost,127.0.0.1"

enable_proxy() {
    export http_proxy="$PROXY_ADDR"
    export https_proxy="$PROXY_ADDR"
    export ftp_proxy="$PROXY_ADDR"
    export no_proxy="$NO_PROXY"
}

disable_proxy() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset no_proxy
}

proxyctl() {
    case "$1" in
        enable)
            enable_proxy
            echo "✅ Proxy enabled."
            ;;
        disable)
            disable_proxy
            echo "🚫 Proxy disabled."
            ;;
        status)
            if [ -n "$http_proxy" ]; then
                echo "🌐 Proxy is ENABLED: $http_proxy"
            else
                echo "🚫 Proxy is DISABLED."
            fi
            ;;
        *)
            echo "Usage: proxyctl {enable|disable|status}"
            return 1
            ;;
    esac
}
