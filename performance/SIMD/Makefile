CPP=g++
CPPFLAGS=-g -Wall

.PHONY: all clean

all: add_base add_sse shuffle_sse

add_base: add_base.cpp
	${CPP} ${CPPFLAGS} -o $@ $^

add_sse: add_sse.cpp
	${CPP} ${CPPFLAGS} -o $@ $^

shuffle_sse: shuffle_sse.cpp
	${CPP} ${CPPFLAGS} -o $@ $^

clean:
	rm -f add_sse add_base

