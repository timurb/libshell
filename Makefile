PREFIX    ?= /usr/local
BINDIR    ?= $(PREFIX)/bin

LIBS := $(wildcard libshell-*)

.PHONY : all install uninstall test

all: test

install: test
	mkdir -p $(BINDIR)
	for LIB in $(LIBS); do \
	  install $$LIB $(BINDIR)/; \
	done

uninstall:
	for LIB in $(LIBS); do \
	  rm -f $(BINDIR)/$$LIB; \
	done

test:
	for TEST in test/*.test; do \
	  $$TEST; \
	  printf "\n"; \
	done


check:
	for LIB in $(LIBS); do \
	  LOCAL="$$(md5sum $$LIB | sed 's, .*$$,,')"; \
	  INSTALLED="$$(md5sum $(BINDIR)/$$LIB 2> /dev/null | sed 's, .*$$,,')"; \
	  [ "$$LOCAL" = "$$INSTALLED" ] && \
	    echo "$$LIB is ok" || \
	    echo "$$LIB is not ok"; \
	done
