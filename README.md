# mmo
A basic mmo to practice writing optimized, authorative-server multiplayer network code

## setup
* Make sure lua 5.1 and luajit is installed
* Install luarocks with lua version 5.1
** Compiing own version with LUA_VERSION=5.1 ./configure might be necessary 
** cd /usr/local/share/lua/5.1/
** sudo chmod a+r *
* Install luasocket (using luarocks)
* Install enet (using luarocks), make sure enet sys lib is installed

make (server|client)
