#include "armstrong_numbers.h"
#include <cmath>
#include <vector>
using namespace std; 

namespace armstrong_numbers {
    bool is_armstrong_number(int number) {
        vector<int> digits;
        number = abs(number);
        auto copy{number};
        if (copy == 0) 
            digits.push_back(0);
    
        while (copy > 0) {
            digits.push_back(copy % 10);
            copy /= 10; 
        }
    
        auto n = digits.size();
        int sum{0};
        for (const auto d : digits) {
            sum += pow(d, n);
        }
    
        return sum == number;        
    }
}  // namespace armstrong_numbers
