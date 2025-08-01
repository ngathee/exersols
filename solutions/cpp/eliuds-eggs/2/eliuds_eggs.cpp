#include "eliuds_eggs.h"

namespace chicken_coop {
    int positions_to_quantity(int pos) {
        int quantity{0};
        while (pos) {
            if (pos % 2 == 1)
                quantity++;
            pos /= 2;
        }
        return quantity; 
    }
}  // namespace chicken_coop
