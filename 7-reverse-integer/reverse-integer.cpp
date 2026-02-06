class Solution {
public:
  int reverse(int x) {
    long long n = x;
    long long rev = 0;

    while (n != 0) {
      int last = n % 10;
      rev = rev * 10 + last;
      n /= 10;
    }

    if (rev > INT_MAX || rev < INT_MIN){
        return 0;
    }
    return (int)rev;
  }
};