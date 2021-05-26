
.PHONY: build
build: caddy
	xcaddy build \
		--with github.com/caddy-dns/loopia \
		--with github.com/caddyserver/caddy/v2=./caddy



caddy:
	git clone https://github.com/kmpm/caddy
	cd caddy & git checkout --track origin/caddyfile-propagation
