#!/bin/bash
# description: shadowsocks+v2ray server

# Source function library.
. $CONFIG_PATH/.config.env

start() {
    v2ray -server -host $V2RAY_DOMAIN -localAddr 0.0.0.0 -localPort 80 -remoteAddr 127.0.0.1 -remotePort 8443 -loglevel none &
}

stop() {
    pkill v2ray
}

status() {
    lsof -i -P -n | grep v2ray
}

case "$1" in 
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
       stop
       start
       ;;
    status)
       status
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 