Caddy Loopia Propagation
========================

This project is just to help out to build a version of caddy
that works with https://github.com/caddy-dns/loopia until
https://github.com/caddyserver/caddy/issues/4177 is fixed.

It will need go, and xcaddy installed.


```shell
git clone -- recurse-submodules https://github.com/kmpm/caddy-loopia-propagation
cd caddy-loopia-propagation
make
```


## Debug DNS
```shell
sudo tcpdump -w dns.pcap -i wlan0 not port 22
tcpdump -n -t -t -r dns.pcap port 53
`` 