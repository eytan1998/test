
#include <stdio.h>
#include "NumClass.h"

int main() {

    int start;
    int end;
    scanf("%d", &start);
    scanf("%d", &end);
    if (start <= 0 || end <= 0){
        printf("error: numbers must be positive integer\n");
        return 1;
    }
    int flagToPrint = 1;

    for (int i = start; i < end; i++) {
        if (isArmstrong(i)) {
            if (flagToPrint) {
                printf("The Armstrong numbers are:");
                flagToPrint = 0;
            }
            printf(" %d", i);
        }
    }
    flagToPrint = 1;
    for (int i = start; i < end; i++) {
        if (isPalindrome(i)) {
            if (flagToPrint) {
                printf("\nThe Palindromes are:");
                flagToPrint = 0;
            }
            printf(" %d", i);
        }
    }
    flagToPrint = 1;
    for (int i = start; i < end; i++) {
        if (isPrime(i)) {
            if (flagToPrint) {
                printf("\nThe Prime numbers are:");
                flagToPrint = 0;
            }
            printf(" %d", i);
        }
    }
    flagToPrint = 1;
    for (int i = start; i < end; i++) {
        if (isStrong(i)) {
            if (flagToPrint) {
                printf("\nThe Strong numbers are:");
                flagToPrint = 0;
            }
            printf(" %d", i);
        }
    }
    printf("\n");
    return 0;
}