CXX=g++
CXXFLAGS=-std=c++17 -Wall -g
LDFLAGS=-pthread

.PHONY: all clean

all : sample_mul_threads sample_lambda_mt

sample_mul_threads : sample_mul_threads.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

sample_lambda_mt : sample_lambda_mt.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f sample
