#include "prime_factors.h"

namespace prime_factors {
    std::vector<long long> of(long num) {
        std::vector<long long> factors;

        while (num % 2 == 0) {
            factors.push_back(2);
            num /= 2;
        }

        for (auto i = 3; i * i <= num; i += 2) {
            while (num % i == 0) {
                factors.push_back(i);
                num /= i;
            }
        }

        if (num > 1) {
            factors.push_back(num);
        }
        
        return factors; 
    }
}  // namespace prime_factors
