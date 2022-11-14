int power(int a, int b) {
    int sum = 1;
    for (int i = 0; i < b; i++) {
        sum *= a;
    }
    return sum;
}


int isPalindromeReq(int n,int length) {
    if (length == 1)return n;
    return ((n%10 * power(10,length-1)) + isPalindromeReq(n/10,length-1));
}

int isPalindrome(int n) {
    int tmp = n, length = 0;
    //get length
    for (; tmp > 0; tmp /= 10) {
        length++;
    }
    return isPalindromeReq(n,length) == n;
}

int isArmstrongReq(int n, int length) {
    if (n == 0)return 0;
    return isArmstrongReq(n / 10, length) + power(n % 10, length);
}

int isArmstrong(int n) {
    int tmp = n, length = 0;

    //get length
    for (; tmp > 0; tmp /= 10) {
        length++;
    }
    return isArmstrongReq(n, length) == n;
}

