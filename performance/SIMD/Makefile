CPP=g++
CPPFLAGS=-g

.PHONY: all clean

all: add_base add_sse

add_base: add_base.cpp
	${CPP} ${CPPFLAGS} -o $@ $^

add_sse: add_sse.cpp
	${CPP} ${CPPFLAGS} -o $@ $^

clean:
	rm -f add_sse add_base

