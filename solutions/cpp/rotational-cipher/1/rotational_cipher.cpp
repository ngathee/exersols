#include "rotational_cipher.h"

namespace rotational_cipher {
    string rotate(string s, int n) {
        string enciphered = "";
        unordered_map<char, char> lookupTable{genRotXTable(n)}; 
        
        for (const auto c : s) {
            if (lookupTable.count(c) == 1) {
                enciphered += lookupTable[c];
            } else {
                enciphered += c; 
            }
        }
        
        return enciphered; 
    }

    unordered_map<char, char> genRotXTable(int x) {
        unordered_map<char, char> table{};

        for (int i = 0; i < 26; ++i) {
            table.insert({i + 'a', (i + x) % 26 + 'a'});
            table.insert({i + 'A', (i + x) % 26 + 'A'});
        }

        return table; 
    }
}  // namespace rotational_cipher
