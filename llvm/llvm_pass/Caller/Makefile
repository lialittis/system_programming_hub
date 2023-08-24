OPT=opt
CC=clang

SRC=$(wildcard tests/*.c)			# collect all source files
LLS=$(patsubst tests/%.c, tests/%.ll, $(SRC)) 	# replace the patterns
LLS_AFTER=$(patsubst tests/%.c, tests/%-after.ll, $(SRC))

.PRECIOUS: $(LLS)
.PRECIOUS: $(LLS_AFTER)

.PHONY: clean all build test

all: build

clean: 
	rm -rf build
	cd tests; rm *.ll

build: $(LLS) 
	mkdir -p build
	cd build; cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..; make

test:
	opt -load-pass-plugin ./build/*.so -passes=callee-replace-plugin -S $(LLS) -o $(LLS_AFTER)

.PHONY:
tests/%.ll: tests/%.c
	$(CC) -g -O1 -S -emit-llvm $< -o $@






