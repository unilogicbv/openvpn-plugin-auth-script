INCLUDE ?= /usr/include/openvpn/

CC ?= cc
CFLAGS ?= -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2
CFLAGS += -std=c99 -D_POSIX_C_SOURCE=200809L
LDFLAGS += -fPIC -shared

SRC 	= $(wildcard *.c)
OUT	= $(SRC:%.c=%.so)

%.so: %.c
	$(CC) $(CFLAGS) -I$(INCLUDE) $(LDFLAGS) -o $@ $<

all: plugin

plugin: $(OUT)

clean:
	rm -f *.so
