class Solution {
public:
    vector<int> findDuplicates(vector<int>& nums) {


        unordered_map<int,int> mp;
        vector<int> ans;

        for(auto i:nums){
            mp[i]++;
        }


        for(auto element:mp){
            if(element.second == 2){
                ans.push_back(element.first);
            }
        }
        return ans;
    }
};