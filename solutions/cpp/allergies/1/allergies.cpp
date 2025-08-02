#include "allergies.h"

namespace allergies {
    Allergy::Allergy(int score) : score(score) {
        for(const auto& pair : ALLERGIES)
            if ((score & pair.second) == pair.second) 
                allergies.emplace(pair.first);
    }
    
    bool Allergy::is_allergic_to(const string& allergen) {
        return allergies.count(allergen);
    }
    
    unordered_set<string>  Allergy::get_allergies() {
        return allergies; 
    }
    
    Allergy allergy_test(int score) {
        return Allergy{score};
    }
}  // namespace allergies
