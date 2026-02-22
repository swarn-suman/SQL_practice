class Solution {
public:
    int threeSumClosest(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());

        int n = nums.size();
        int close_sum = nums[0] + nums[1] + nums[2];

        for(int i=0; i<n-2; i++){
            if(i > 0 && nums[i] == nums[i-1]) {
                continue;
            }

            int left = i+1;
            int right = n-1;

            while(left < right){
                int sum = nums[i] + nums[left] + nums[right];

                if(abs(target - sum) < abs(target - close_sum)) {
                    close_sum = sum;
                }

                else if(sum < target){
                    left++;
                }

                else{
                    right--;
                }
            }
        }
        return close_sum;
    }
};