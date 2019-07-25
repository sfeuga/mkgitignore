PREFIX ?= /usr/local
BINDIR ?= $(DESTDIR)$(PREFIX)/bin
COMDIR ?= $(DESTDIR)/etc/bash_completion.d
MANDIR ?= $(DESTDIR)$(PREFIX)/share/man/man1
DOCDIR ?= $(DESTDIR)$(PREFIX)/share/doc/mkgitignore

.PHONY: all install uninstall

all:
	@echo Run \'sudo make install\' to install mkGitignore.

install:
	install -m755 -d $(BINDIR)
	install -m755 -d $(COMDIR)
	install -m755 -d $(MANDIR)
	install -m755 -d $(DOCDIR)
	gzip -c mkgitignore.1 > mkgitignore.1.gz
	groff -t -mandoc -Tascii mkgitignore.1 > MANUAL
	install -m755 mkgitignore $(BINDIR)/mkgitignore
	install -m644 mkgitignore-completion $(COMDIR)
	install -m644 mkgitignore.1.gz $(MANDIR)
	install -m644 README.md $(DOCDIR)
	install -m644 MANUAL $(DOCDIR)
	rm -f mkgitignore.1.gz MANUAL

uninstall:
	rm -f $(BINDIR)/mkgitignore
	rm -f $(COMDIR)/mkgitignore-completion
	rm -f $(MANDIR)/mkgitignore.1.gz
	rm -rf $(DOCDIR)
