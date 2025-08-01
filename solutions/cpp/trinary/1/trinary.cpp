#include "trinary.h"
#include <cmath> 
using namespace std; 

namespace trinary {
    int to_decimal(string s) {
        int decimal = 0, n = s.size();
        int pos = n - 1; 
        for (int i = 0; i < n; ++i) {
            int t = s[i] - '0' > 9 ? 0 : s[i] - '0';
            decimal += (t * pow(3, pos));
            pos--;
        }
        return decimal;
    }
}  // namespace trinary
