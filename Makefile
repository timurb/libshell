PREFIX    ?= /usr/local
BINDIR    ?= $(PREFIX)/bin

LIBS ?= $(wildcard libshell-*)

.PHONY : all install install-only uninstall test check

all: test

install: test install-only

install-only: 
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
	  printf "\n"; \
	  $$TEST; \
	done


check:
	ERROR=0
	for LIB in $(LIBS); do \
	  LOCAL="$$(md5sum $$LIB | sed 's, .*$$,,')"; \
	  INSTALLED="$$(md5sum $(BINDIR)/$$LIB 2> /dev/null | sed 's, .*$$,,')"; \
	  if [ "$$LOCAL" = "$$INSTALLED" ]; then \
	    echo "$$LIB is ok"; \
	  else \
	    ERROR=1; \
	    echo "$$LIB is not ok"; \
	  fi; \
	done; \
	exit $$ERROR
