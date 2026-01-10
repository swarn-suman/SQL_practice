class Solution {
private:
    unordered_set<int> st;

    void solve(vector<int>& digits, vector<bool>& used, int depth, int num) {
  
        if (depth == 3) {
            int lastDigit = num % 10;
            if (lastDigit % 2 == 0) {
                st.insert(num);
            }
            return;
        }

        for (int i = 0; i < digits.size(); i++) {
            if (used[i]) continue;

            if (depth == 0 && digits[i] == 0) continue;

            used[i] = true;
            solve(digits, used, depth + 1, num * 10 + digits[i]);
            used[i] = false;  
        }
    }

public:
    int totalNumbers(vector<int>& digits) {
        vector<bool> used(digits.size(), false);
        solve(digits, used, 0, 0);
        return st.size();
    }
};
