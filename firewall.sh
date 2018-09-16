# Pinky's Cloudflare VPS Firewall Script
# Created By @Pink_P4nther <pinkp4nther@protonmail.com>
# This script blocks all traffic except cloudflare ranges and a specified address
# This can help with stopping mass scanners such as shodan and censys

#ALLOW REQUESTS BACK WHEN WE MAKE FIRST REQUEST
iptables -I OUTPUT -o ens3 -d 0.0.0.0/0 -j ACCEPT
iptables -I INPUT -i ens3 -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -I OUTPUT -o ens3 -d ::/0 -j ACCEPT
ip6tables -I INPUT -i ens3 -m state --state ESTABLISHED,RELATED -j ACCEPT

#ALLOW LOCAL TRAFFIC
iptables -I INPUT -s 127.0.0.1 -j ACCEPT

#ALLOW OTHER REMOTE HOSTS
# iptables -I INPUT -s <IP> -j ACCEPT

#HOME IPs
iptables -I INPUT -4 -s ALLOW_ACCESS_IPv4_HERE -j ACCEPT
#ip6tables -I INPUT -6 -s ALLOW_ACCESS_IPv6_HERE -j ACCEPT

#CF IPv4 IPs
iptables -I INPUT -4 -s 103.21.244.0/22 -j ACCEPT
iptables -I INPUT -4 -s 103.22.200.0/22 -j ACCEPT
iptables -I INPUT -4 -s 103.31.4.0/22 -j ACCEPT
iptables -I INPUT -4 -s 104.16.0.0/12 -j ACCEPT
iptables -I INPUT -4 -s 108.162.192.0/18 -j ACCEPT
iptables -I INPUT -4 -s 131.0.72.0/22 -j ACCEPT
iptables -I INPUT -4 -s 141.101.64.0/18 -j ACCEPT
iptables -I INPUT -4 -s 162.158.0.0/15 -j ACCEPT
iptables -I INPUT -4 -s 172.64.0.0/13 -j ACCEPT
iptables -I INPUT -4 -s 173.245.48.0/20 -j ACCEPT
iptables -I INPUT -4 -s 188.114.96.0/20 -j ACCEPT
iptables -I INPUT -4 -s 190.93.240.0/20 -j ACCEPT
iptables -I INPUT -4 -s 197.234.240.0/22 -j ACCEPT
iptables -I INPUT -4 -s 198.41.128.0/17 -j ACCEPT

#CF IPv6 IPs
ip6tables -I INPUT -6 -s 2400:cb00::/32 -j ACCEPT
ip6tables -I INPUT -6 -s 2405:8100::/32 -j ACCEPT
ip6tables -I INPUT -6 -s 2405:b500::/32 -j ACCEPT
ip6tables -I INPUT -6 -s 2606:4700::/32 -j ACCEPT
ip6tables -I INPUT -6 -s 2803:f800::/32 -j ACCEPT
ip6tables -I INPUT -6 -s 2c0f:f248::/32 -j ACCEPT
ip6tables -I INPUT -6 -s 2a06:98c0::/29 -j ACCEPT

#BLOCK EVERYTHING ELSE
iptables -P INPUT DROP
ip6tables -P INPUT DROP
