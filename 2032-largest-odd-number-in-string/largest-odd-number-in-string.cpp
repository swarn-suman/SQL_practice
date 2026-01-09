class Solution {
public:
    string largestOddNumber(string num) {
        int last = -1;
        int i;
        for(i=num.size()-1; i>=0; i--){
            if(num[i] %2 ==1){
                last = i;
                break;
            }
        }

        return num.substr(0,last+1);
    }
};