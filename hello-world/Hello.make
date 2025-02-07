# Hello.make
#
# Invoked by the main Makefile (via "make -f ../Hello.make").
# Here we simply build our hello program from main.c.

all:
	$(CC) $(CFLAGS) -o hello main.c
