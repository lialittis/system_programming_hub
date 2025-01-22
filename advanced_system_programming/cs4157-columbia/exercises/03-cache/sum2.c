#include <stdio.h>

#define M 4096
#define N 4096
double a[M][N] = {{0}};

int main(int argc, char **argv) {
    double sum = 0;

    for (int j = 0; j < N; j++) {
        for (int i = 0; i < M; i++) {
            sum += a[i][j];
        }
    }

    printf("sum = %g\n", sum);
    return 0;
}
