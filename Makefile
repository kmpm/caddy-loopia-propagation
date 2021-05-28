
bindir?=bin
CAPS=cap-bind
ifeq ($(OS),Windows_NT)
EXEEXT=.exe
CAPS=
endif


binfile?=$(bindir)/caddy$(EXEEXT)

.PHONY: all
all: build $(CAPS)

.PHONY: build
build: $(bindir)
	xcaddy build \
		--output $(binfile) \
		--with github.com/caddy-dns/loopia \
		--with github.com/caddyserver/caddy/v2=./caddy \
		--with github.com/caddyserver/certmagic=./certmagic

$(bindir):
	mkdir $@

.PHONY: cap-bind
cap-bind:
	sudo setcap CAP_NET_BIND_SERVICE=+eip $(binfile)

.PHONY: run 
run: $(CAPS)
	$(binfile) run

.PHONY: reset
reset:
	rm -rf $(HOME)/.local/share/caddy
	rm -rf $(HOME)/.config/caddy
