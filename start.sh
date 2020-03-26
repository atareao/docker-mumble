#!/bin/bash
if [ ! -d /mumble ] || [ ! -f /mumble/mumble-server.ini ]
then
    cp /etc/mumble-server.ini /mumble/mumble-server.ini
    touch /mumble/mumble-server.sqlite
    chown -R mumble:mumble /mumble
    gosu mumble murmurd -ini /mumble/mumble-server.ini -supw $MUMBLE_PASSWORD 
fi
gosu mumble murmurd -ini /mumble/mumble-server.ini -fg
