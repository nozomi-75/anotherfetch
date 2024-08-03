PREFIX = /usr/bin

all:
	@echo Run \'make install\' to install Anotherfetch .

install:
	@mkdir -p $(PREFIX)
	@cp -p anotherfetch.sh  $(PREFIX)/anotherfetch 
	@chmod 755 $(PREFIX)/anotherfetch 

uninstall:
	@rm -rf $(PREFIX)/anotherfetch 