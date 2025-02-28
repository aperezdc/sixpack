PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin
DESTDIR ?=

all: sixpack

sixpack: sixpack.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -DSIXPACK_MAIN -o $@ $<

clean:
	$(RM) sixpack

install: sixpack
	install -dm755 $(DESTDIR)$(BINDIR)
	install -m755 $< $(DESTDIR)$(BINDIR)

test: sixpack
	@./tools/run-tests

.PHONY: install test
