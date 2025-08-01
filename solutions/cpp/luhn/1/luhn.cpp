#include "luhn.h"

#include <vector>

namespace luhn {
    bool valid(std::string s) {
        std::vector<int> nums;
        for (const char c : s) {
            if (c == ' ') continue;
            if (isdigit(c))
                nums.push_back(c - '0');
            else 
                return false;
        }

        if (nums.size() <= 1) return false; 

        for (int i = nums.size() - 2; i >= 0; i -= 2) {
            nums[i] = (nums[i] * 2 > 9 ? nums[i] * 2 - 9: nums[i] * 2);
        }

        int sum{0};
        for (auto num : nums) sum += num;

        return sum % 10 == 0; 
    }
}  // namespace luhn
