#!/bin/bash
# Force company (10.8.x.x) traffic to use the main routing table
ip rule add to 10.8.0.0/16 lookup main 2>/dev/null || true
ip route flush cache
