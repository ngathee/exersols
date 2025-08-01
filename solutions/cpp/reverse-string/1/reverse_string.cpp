#include "reverse_string.h"

namespace reverse_string {
    std::string reverse_string(std::string s) {
        std::string reversed{""};
        for (int i = s.size()  - 1; i >= 0; --i) {
            reversed += s[i];
        }
        return reversed; 
    }
}  // namespace reverse_string
