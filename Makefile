# leave these lines alone
.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

.yrl.erl:
	erlc -W $<

ERL = erl -boot start_clean 

# Here's a list of the erlang modules you want compiling
# If the modules don't fit onto one line add a \ character 
# to the end of the line and continue on the next line

# Edit the lines below
MODS = main

# The first target in any makefile is the default target.
# If you just type "make" then "make all" is assumed (because
#   "all" is the first target in this makefile)

all: compile

compile: ${MODS:%=%.beam} subdirs

subdirs:
	cd message_cb;make
	cd message_pack;make
	cd proto;make
	cd server;make
	
# remove all the code

clean:	
	rm -rf *.beam erl_crash.dump
	cd message_cb;make clean
	cd message_pack;make clean
	cd proto;make clean
	cd server;make clean
