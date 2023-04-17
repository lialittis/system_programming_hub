CC=gcc
CFALGS=-std=c++17 -fomit-frame-pointer -fverbose-asm -S
OPTFLAGS=-O3

.PHONY: all clean

all: directlyReturn directlyReturnOpt mul addition additionOpt floatingPoint floatingPointOpt containerOpt inlineOpt aliasPointersOpt

directlyReturn: directlyReturn.cpp
	${CC} ${CFALGS} -o tmp/$@.S $^

directlyReturnOpt: directlyReturn.cpp
	${CC} ${OPTFLAGS} ${CFALGS} -o tmp/$@.S $^

mul: mul.cpp
	${CC} ${CFALGS} -o tmp/$@.S $^

addition: addition.cpp
	${CC} ${CFALGS} -o tmp/$@.S $^

additionOpt: addition.cpp
	${CC} ${OPTFLAGS} ${CFALGS} -o tmp/$@.S $^

floatingPoint: floatingPoint.cpp
	${CC} ${CFALGS} -o tmp/$@.S $^

floatingPointOpt: floatingPoint.cpp
	${CC} ${OPTFLAGS} ${CFALGS} -o tmp/$@.S $^

containerOpt: container.cpp
	${CC} ${OPTFLAGS} ${CFALGS} -o tmp/$@.S $^

inlineOpt: inline.cpp
	${CC} ${OPTFLAGS} ${CFALGS} -o tmp/$@.S $^

aliasPointersOpt: aliasPointers.cpp
	${CC} ${OPTFLAGS} ${CFALGS} -o tmp/$@.S $^

clean:
	rm -f ./tmp/*
