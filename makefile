all: client server

clean:
	@rm -r tmp-client | true
	@rm -r bin | true

client: clean
	@mkdir bin | true
	@mkdir tmp-client | true
	@cp -r core/* tmp-client
	@cp -r client/* tmp-client
	@cd tmp-client; zip -r ../bin/mmo.love *; cd ..
	@rm -r tmp-client

server: clean
	@mkdir -p bin/server | true
	@cp -r core/* bin/server
	@cp -r server/* bin/server
