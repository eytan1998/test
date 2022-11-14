
#include <stdio.h>
#include "NumClass.h"

int main(){
    int start,end;
    printf("\ngive first :");
    scanf("%d",&start);
    printf("give second :");
    scanf("%d",&end);
    for (int i = start; i <end ; i++) {
        int flag = 0;
        if(isPrime(i)) flag =1;
        else if(isStrong(i)) flag =1;
        else if(isPalindrome(i)) flag =1;
        else if(isArmstrong(i)) flag =1;
        if(flag==1)printf("%d\n",i);
    }
    return 1;
}