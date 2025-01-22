#include <stdio.h>

#define N 2000
double a[N][N] = {{0}};
double b[N][N] = {{0}};
double c[N][N] = {{0}};

int main(int argc, char **argv) {
    double r = 0;

    for (int k = 0; k < N; k++) {
        for (int j = 0; j < N; j++) {
            r = b[k][j];
            for (int i = 0; i < N; i++) {
                c[i][j] += a[i][k] * r;
            }
        }
    }
}
