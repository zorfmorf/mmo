clean:
	rm -r tmp*
	rm -r bin

client: clean
	mkdir tmp-client
	mkdir bin
	cp -r core/* tmp-client
	cp -r client/* tmp-client
	zip bin/mmo.lua tmp-client/*

server: clean
	mkdir tmp-server
	cp -r core/* tmp-server
	cp -r server/* tmp-server

all: client server
