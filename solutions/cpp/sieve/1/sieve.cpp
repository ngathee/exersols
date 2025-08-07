#include "sieve.h"

namespace sieve {
    vector<int> primes(const int n) {
        vector<int> ans{}, nums{};
        if (n < 2) return ans;
        
        for (int i = 2; i <= n; ++i) {
            nums.push_back(i);
        }

        for (size_t i = 0; i < nums.size() - 1; ++i) {
            if (!nums[i]) continue;
            for (size_t j = i + 1; j < nums.size(); ++j) {
                if (nums[j] % nums[i] == 0) 
                    nums[j] = 0;
            }
        }

        for (auto num : nums) 
            if (num) ans.push_back(num);

        return ans;
    }
}  // namespace sieve
