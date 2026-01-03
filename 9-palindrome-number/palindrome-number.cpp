class Solution {
public:
    int reverse(int x){
        if(x > 0 && x < 10){
            return x;
        }

        long long reversed = 0;
        while(x > 0){
            int digit = x % 10;
            reversed = 10 * reversed + digit;
            x = x/10;
        }
        return reversed;
    }

    bool isPalindrome(int x) {
        if(x == reverse(x)){
            return true;
        }
        return false;
        
    }
};