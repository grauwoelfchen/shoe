#!/bin/sh

HOST="shoe.localhost"
DIR="`dirname ${0}`/log"
#echo ${0}
#echo $DIR
wget http://$HOST/resources/downloads/status -O $DIR/status
