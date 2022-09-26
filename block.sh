#!/bin/sh
iptables -I FORWARD -m string --algo kmp --string "BitTorrent" -j DROP
iptables -I FORWARD -m string --algo kmp --string "BitTorrent protocol" -j DROP
iptables -I FORWARD -m string --algo kmp --string "peer_id=" -j DROP
iptables -I FORWARD -m string --algo kmp --string ".torrent" -j DROP
iptables -I FORWARD -m string --algo kmp --string "announce.php?passkey=" -j DROP
iptables -I FORWARD -m string --algo kmp --string "torrent" -j DROP
iptables -I FORWARD -m string --algo kmp --string "announce" -j DROP
iptables -I FORWARD -m string --algo kmp --string "info_hash" -j DROP
iptables -A OUTPUT -p udp --dport 1024:65534 -j DROP
iptables -A OUTPUT -p tcp --dport 6881:6889 -j DROP
apt install iptables-persistent -y
iptables-save > /etc/iptables/rules.v4