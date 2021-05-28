
bindir?=bin
ifeq ($(OS),Windows_NT)
EXEEXT=.exe
endif


binfile?=$(bindir)/caddy$(EXEEXT)

.PHONY: all

all: build


.PHONY: build
build: $(bindir)
	xcaddy build \
		--output $(binfile) \
		--with github.com/caddy-dns/loopia \
		--with github.com/caddyserver/caddy/v2=./caddy \
		--with github.com/caddyserver/certmagic=./certmagic


$(bindir):
	mkdir $@


.PHONY: run
run:
	$(binfile) run
