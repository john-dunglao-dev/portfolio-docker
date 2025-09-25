SHELL := ./makefiles/wrapper.sh # Use a custom shell script to wrap commands
.ONESHELL: # All commands in a target are run in the same shell instance

include ./makefiles/assistance.mk
include ./makefiles/common.mk
include ./makefiles/docker.mk
