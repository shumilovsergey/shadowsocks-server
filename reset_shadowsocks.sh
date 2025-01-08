#!/bin/bash

iptables -A INPUT -p tcp --dport 8388 -j DROP
iptables -A INPUT -p udp --dport 8388 -j DROP
sleep 2  

iptables -D INPUT -p tcp --dport 8388 -j DROP
iptables -D INPUT -p udp --dport 8388 -j DROP

pkill ss-server
ss-server -s 0.0.0.0 -p 8388 -k Hi25012016 -m chacha20-ietf-poly1305 -t 60
