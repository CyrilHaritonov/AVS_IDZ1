#include <stdio.h>
#include <stdlib.h>

void inputLength(int *n) {
    printf("Enter the length of A: ");
    scanf("%d", n);
    if (*n <= 0) {
        printf("Unacceptable length value!");
        exit(1);
    }
}

void inputA(long *A, int n) {
    printf("Now enter the elements of array A separated with spaces or new lines: ");
    for (int i = 0; i < n; ++i) {
        scanf("%ld", &A[i]);
    }
}

long formatFindMin(const long *A, int n, int *new_n) {
    long minimum = A[0];
    int amount = 1;
    for (int i = 1; i < n; ++i) {
        if (minimum > A[i]) {
            minimum = A[i];
            amount = 1;
        } else if (minimum == A[i]) {
            amount++;
        }
    }
    *new_n = n - amount;
    return minimum;
}

void formatGetB(const long *A, long *B, int n, long minimum) {
    int j = 0;
    for (int i = 0; i < n; ++i) {
        if (A[i] != minimum) {
            B[j++] = A[i];
        }
    }
}

void output(long *B, int n) {
    printf("This is array B: ");
    for (int i = 0; i < n; ++i) {
        printf("%ld ", B[i]);
    }
}

void generateA(long *A, int n) {
    printf("This is randomly generated A: ");
    for (int i = 0; i < n; ++i) {
        A[i] = rand();
        printf("%ld ", A[i]);
    }
    printf("\n");
}

int pickTypeOfInput() {
    printf("Enter 1 to manually input A, enter 0 to generate A randomly: ");
    int choice;
    scanf("%d", &choice);
    if (choice != 1 && choice != 0) {
        printf("Wrong value of choice!");
        exit(1);
    }
    return choice;
}

void getInputFileContents(long *A, int n, FILE *file_name) {
    for (int i = 0; i < n; ++i) {
        fscanf(file_name, "%ld", &A[i]);
    }
}

void outputToFile(long *B, int n, FILE *file_name) {
    for (int i = 0; i < n; ++i) {
        fprintf(file_name, "%ld ", B[i]);
    }
}