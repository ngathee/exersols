#pragma once

#include <string>
#include <unordered_map> 
using namespace std; 

namespace rotational_cipher {
    string rotate(string, int);
    unordered_map<char, char> genRotXTable(int); 
}  // namespace rotational_cipher
