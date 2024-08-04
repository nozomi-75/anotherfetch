PREFIX = /usr/bin

all:
	@echo Run \'make install\' to install Anotherfetch.

install:
	@mkdir -p $(PREFIX)
	@cp -p anotherfetch.sh  $(PREFIX)/af 
	@chmod 755 $(PREFIX)/af 

uninstall:
	@rm -rf $(PREFIX)/af 
