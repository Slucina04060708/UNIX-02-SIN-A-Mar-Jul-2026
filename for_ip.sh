#!/bin/bash

for ip_address in "$@"; do
echo "Taking some action on IP address ${ip_address}"
ping -c 1 "${ip_address}"
done

# ip that worked
# 127.0.0.1
# 0.0.0.0
# 172.17.0.1