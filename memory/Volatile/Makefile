CC=gcc

CFLAGS=-save-temps

all:
	mkdir -p build
	$(CC) const.c -o ./build/const $(CFLAGS)
	$(CC) -O3 const.c -o ./build/const_opt $(CFLAGS)
	$(CC) -O3 volatile.c -o ./build/volatile $(CFLAGS)

.PHONY: clean

clean:
	rm -rf build
