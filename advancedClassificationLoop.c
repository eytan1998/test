
int power(int a, int b){
    int sum =1;
    for (int i = 0; i < b; i++) {
        sum *= a;
    }
    return sum;
}
int isPalindrome(int n) {
    int tmp = n;
    int pali = 0;
    while (n > 0) {
        pali = (pali * 10) + (n % 10);
        n /= 10;
    }
    return tmp == pali;
}

int isArmstrong(int n) {
    int sum = 0, tmp = n, length=0;

    //get length
    for (; tmp > 0; tmp /= 10) {
        length++;
    }
    tmp = n;
    for (; tmp > 0; tmp /= 10) {
        sum += power(tmp%10,length);
    }
    return n == sum;
}