#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <sys/time.h>

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
    struct timeval start, end;
    static struct option longOptions[] = {
            {"iofiles", required_argument, 0, 'f'},
            {"help",    no_argument,       0, 'h'},
            {"random", required_argument, 0, 'r'}
    };

    int optionIndex = 0;
    int arg = getopt_long(argc, argv, "hf:r:", longOptions, &optionIndex);
    switch (arg) {
        case 'h': {
            printf("Keys:\n -h or --help to see list of keys and arguments\n"
                   " -f or --iofiles <input file name>:<output file name>"
                   " to take input file content as A (where first number is the length of A and following are content)"
                   " and write B to output file\n -r or --random <length> to generate an array A of specified length with random content\n"
                   "Run without keys to take A content from console standard input.\n");
            gettimeofday(&start, NULL);
            gettimeofday(&end, NULL);
            break;
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
            gettimeofday(&start, NULL);
            int new_n;
            long min = formatFindMin(A, n, &new_n);
            long B[new_n];
            formatGetB(A, B, n, min);
            gettimeofday(&end, NULL);
            outputToFile(B, new_n, file_output);
            fclose(file_input);
            fclose(file_output);
            break;
        }
        case 'r': {
            int n = (int) strtol(strtok(optarg, " "), NULL, 10);
            gettimeofday(&start, NULL);
            long A[n];
            generateA(A, n);
            int new_n;
            long min = formatFindMin(A, n, &new_n);
            long B[new_n];
            formatGetB(A, B, n, min);
            gettimeofday(&end, NULL);
            output(B, new_n);
            break;
        }
        default: {
            int n;
            inputLength(&n);
            long A[n];
            inputA(A, n);
            gettimeofday(&start, NULL);
            int new_n;
            long min = formatFindMin(A, n, &new_n);
            long B[new_n];
            formatGetB(A, B, n, min);
            gettimeofday(&end, NULL);
            output(B, new_n);
            break;
        }
    }
    double time_taken =  (double) (end.tv_sec - start.tv_sec) * 1e6;
    time_taken = (time_taken + (double) (end.tv_usec - start.tv_usec)) * 1e-6;
    printf("\nTime taken to execute this program: %f", time_taken);
    return 0;
}