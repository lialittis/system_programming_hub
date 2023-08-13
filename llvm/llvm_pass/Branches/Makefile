all: plugin erase1 erase2

plugin:
	mkdir -p build
	cd build; cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
	ninja -Cbuild

test:
	opt -load-pass-plugin ./build/*.so -passes=branches-plugin -S tests/input1.ll

erase1:
	mkdir -p bin
	clang++ -g -O3 -std=c++11 `llvm-config --cxxflags --ldflags --system-libs --libs core` erase_instruction.cpp -o bin/erase_instruction

erase2:
	mkdir -p bin
	clang++ -g -O3 -std=c++11 `llvm-config --cxxflags --ldflags --system-libs --libs core` erase_block.cpp -o bin/erase_block

.PHONY clean:
	rm -rf build target bin
