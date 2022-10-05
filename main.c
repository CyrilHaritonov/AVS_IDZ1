#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>

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

int main(int argc, char *argv[]) {
    static struct option longOptions[] = {
            {"iofiles", required_argument, 0, 'f'},
            {"help",    no_argument,       0, 'h'}
    };
    int optionIndex = 0;
    int arg = getopt_long(argc, argv, "hf:", longOptions, &optionIndex);
    switch (arg) {
        case 'h': {
            printf("Keys: -h or --help to see list of keys and arguments,"
                   " -f or --iofiles <input file name>:<output file name>"
                   " to take input file content as A (where first number is the length of A and following are content) and write B to output file."
                   "Run without keys to take input from console or generate random A.\n");
            return 0;
        }
        case 'f': {
            char *file_name = strtok(optarg, ":");
            FILE *file_input = fopen(file_name, "r");
            if (file_input == NULL) {
                printf("Wrong input file name!\n");
                exit(1);
            }
            file_name = strtok(NULL, ":");
            FILE *file_output = fopen(file_name, "w");
            if (file_output == NULL) {
                printf("Wrong output file name!\n");
                exit(1);
            }
            int n;
            fscanf(file_input, "%d", &n);
            long A[n];
            getInputFileContents(A, n, file_input);
            int new_n;
            long min = formatFindMin(A, n, &new_n);
            long B[new_n];
            formatGetB(A, B, n, min);
            outputToFile(B, new_n, file_output);
            fclose(file_input);
            fclose(file_output);
            return 0;
        }
        default: {
            int n;
            inputLength(&n);
            long A[n];
            if (pickTypeOfInput()) {
                inputA(A, n);
            } else {
                generateA(A, n);
            }
            int new_n;
            long min = formatFindMin(A, n, &new_n);
            long B[new_n];
            formatGetB(A, B, n, min);
            output(B, new_n);
            return 0;
        }
    }
}