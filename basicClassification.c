
int factorial(int n){
    int ans = 1;
    for (int i = 2; i <=n ; ++i) {
        ans *= i;
    }
    return ans;
}

int isPrime(int n){
    for (int i = 2; i <= n/2 ; ++i) {
        if (n % i == 0) return 0;
    }
    return 1;
}
int isStrong(int n){
    int sum =0;
    int tmp = n;
    while (n>0){
        sum += factorial(n%10);
        n/=10;
    }
    return (sum == tmp);
}
