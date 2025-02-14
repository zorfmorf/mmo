all: client server

clean:
	@rm -rf tmp-client | true
	@rm -rf bin | true

client: clean
	@mkdir bin | true
	@mkdir tmp-client | true
	@cp -r core tmp-client
	@cp -r client/* tmp-client
	@cp -r lib tmp-client
	@cd tmp-client; zip -r ../bin/mmo.love *; cd ..
	@rm -rf tmp-client

server: clean
	@mkdir -p bin/server | true
	@cp -r core bin/server/
	@cp -r server/* bin/server
	@cp -r lib bin/server

