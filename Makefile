PREFIX ?= /usr/local
BINDIR ?= $(DESTDIR)$(PREFIX)/bin
BASHCOMDIR ?= $(DESTDIR)/etc/bash_completion.d
ZSHCOMPDIR ?= $(DESTDIR)/usr/share/zsh/site-functions
MANDIR ?= $(DESTDIR)$(PREFIX)/share/man/man1
DOCDIR ?= $(DESTDIR)$(PREFIX)/share/doc/mkgitignore
LOCALTEMPLATE ?= $(DESTDIR)$(PREFIX)/share/applications/mkgitignore

.PHONY: all install uninstall

all:
	@echo Run \'sudo make install\' to install mkGitignore.

install:
	@install -m755 -d $(BINDIR)
	@install -m755 -d $(BASHCOMDIR)
	@install -m755 -d $(ZSHCOMPDIR)
	@install -m755 -d $(MANDIR)
	@install -m755 -d $(DOCDIR)
	@install -m755 -d $(LOCALTEMPLATE)
	@gzip -c mkgitignore.1 > mkgitignore.1.gz
	@groff -t -mandoc -Tascii mkgitignore.1 > MANUAL
	@install -m755 mkgitignore $(BINDIR)/mkgitignore
	@install -m644 mkgitignore.bash $(BASHCOMDIR)/mkgitignore
	@install -m644 mkgitignore.zsh $(ZSHCOMPDIR)/_mkgitignore
	@install -m644 mkgitignore.1.gz $(MANDIR)
	@install -m644 README.md $(DOCDIR)
	@install -m644 MANUAL $(DOCDIR)
	@unzip -q -d $(LOCALTEMPLATE) templates.zip
	@rm -f mkgitignore.1.gz MANUAL
	@echo "Install done."

uninstall:
	@rm -f $(BINDIR)/mkgitignore
	@rm -f $(BASHCOMDIR)/mkgitignore
	@rm -f $(ZSHCOMPDIR)/_mkgitignore
	@rm -f $(MANDIR)/mkgitignore.1.gz
	@rm -rf $(DOCDIR)
	@rm -rf $(LOCALTEMPLATE)
	@echo "Uninstall done."
