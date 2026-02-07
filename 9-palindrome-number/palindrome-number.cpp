class Solution {
public:
    long long reverse_number (long long n){
        long long reverse = 0;

        while(n > 0){
            int digit = n % 10;
            reverse = reverse * 10 + digit;
            n = n/10;
        }
        return reverse;
    }

    bool isPalindrome(int x) {
        long long n = x;

        if(n == 0){
            return true;
        }

        if(n < 0){
            return false;
        }

        if(x == reverse_number (n)){
            return true;
        }
        return false;

    }
};