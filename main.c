
#include <stdio.h>
#include "NumClass.h"

int main() {

    int start;
    int end;
    scanf("%d", &start);
    scanf("%d", &end);
    if (start <= 0 || end <= 0) {
        printf("error: numbers must be positive integer\n");
        return 1;
    }

    printf("The Armstrong numbers are:");
    for (int i = start; i < end; i++) {
        if (isArmstrong(i)) {
            printf(" %d", i);
        }
    }
    printf("\nThe Palindromes are:");
    for (int i = start; i < end; i++) {
        if (isPalindrome(i)) {
            printf(" %d", i);
        }
    }

    printf("\nThe Prime numbers are:");
    for (int i = start; i < end; i++) {
        if (isPrime(i)) {
            printf(" %d", i);
        }

    }
    printf("\nThe Strong numbers are:");
    for (int i = start; i < end; i++) {
        if (isStrong(i)) {
            printf(" %d", i);
        }
    }
    printf("\n");
    return 0;
}