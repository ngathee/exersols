#include "atbash_cipher.h"
#include <algorithm> 

namespace atbash_cipher {
	const string P{"abcdefghijklmnopqrstuvwxyz"};
	const string C{"zyxwvutsrqponmlkjihgfedcba"}; 

    string encode(string s) {
        string encoded{""};
        int count{0};
        size_t i{0};
        transform(s.begin(), s.end(), s.begin(), ::tolower);
        s.erase(remove(s.begin(), s.end(), ' '), s.end());
        s.erase(remove(s.begin(), s.end(), '.'), s.end());
        s.erase(remove(s.begin(), s.end(), ','), s.end());

        for(const char c : s) {
            auto index = P.find(c);
            if (index != string::npos) {
                encoded += C[index];
            } else {
                encoded += c; 
            }
            count++, i++; 
            if (count >= 5 && i < s.size()) {
                encoded += " ";
                count = 0; 
            }
        }
        
        return encoded;
    }

    string decode(string s) {
        string decoded{""};
        s.erase(remove(s.begin(), s.end(), ' '), s.end());
        
        for (const char c : s) {
            auto index = C.find(c);
            if (index != string::npos) {
                decoded += P[index];
            } else {
                decoded += c; 
            }
        }
        
        return decoded;
    }

}  // namespace atbash_cipher
