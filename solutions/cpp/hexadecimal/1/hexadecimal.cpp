#include "hexadecimal.h"
#include <vector>
#include <cmath>
using namespace std; 

namespace hexadecimal {
    int convert(string hex) {
        int decimal{0};
        string hexMap{"0123456789abcdef"};

        for (int i = hex.length() - 1, j = 0; i >= 0; --i, ++j) {
            auto c = hex[i];
            auto index = hexMap.find(c);
            if (index == string::npos) {
                return 0; 
            } else {
                decimal += (index * pow(16, j));
            }
        }
        
        return decimal;
    }
}  // namespace hexadecimal
