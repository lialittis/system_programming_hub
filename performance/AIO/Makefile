CC=gcc
CFLAGS=-g
BINS=async_io sync_io

all: $(BINS)

%: %.c
	$(CC) $(CFLAGS) -o $@ $^ -lrt

clean:
	rm -rf *.dSYM $(BINS)
