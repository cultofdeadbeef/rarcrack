CC=gcc
PREFIX=/usr
DOCDIR=${PREFIX}/share/doc/rarcrack

all:
	${CC} -pthread rarcrack.c `xml2-config --libs --cflags` -O2 -o rarcrack
clean:
	rm -f *.o rarcrack
install:
	install -D rarcrack $(DESTDIR)${PREFIX}/bin/rarcrack
	-mkdir -p $(DESTDIR)${DOCDIR}
	chmod 755 $(DESTDIR)${DOCDIR}
	install -m 644 -t $(DESTDIR)${DOCDIR} CHANGELOG LICENSE README README.html RELEASE_NOTES
uninstall:
	-rm -f $(DESTDIR)${PREFIX}/bin/rarcrack
	rm -rf $(DESTDIR)${DOCDIR}

