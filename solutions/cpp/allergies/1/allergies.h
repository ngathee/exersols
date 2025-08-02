#pragma once
#include <string>
#include <unordered_set> 
#include <unordered_map> 
using namespace std; 

namespace allergies {
    class Allergy {
        public:    
            Allergy(int score); 
            bool is_allergic_to(const string& allergen);
            unordered_set<string>  get_allergies();
    
        private:     
            int score{0};
            const unordered_map<string, int> ALLERGIES{{"eggs", 1}, {"peanuts", 2},
                            {"shellfish", 4}, {"strawberries", 8}, {"tomatoes", 16},
                            {"chocolate", 32}, {"pollen", 64}, {"cats", 128}}; 
            unordered_set<string> allergies{}; 
    };
    
    Allergy allergy_test(int);
}  // namespace allergies
