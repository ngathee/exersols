#include "darts.h"
#include <cmath> 
using namespace std; 

namespace darts {
    int score(float x, float y) {
        float radius = sqrt((x * x + y * y));

        if (radius > 10.0) {
            return 0; 
        } else if (radius > 5.0) {
            return 1;
        } else if (radius > 1.0) {
            return 5;
        } else {
            return 10;
        }
    }
}  // namespace darts