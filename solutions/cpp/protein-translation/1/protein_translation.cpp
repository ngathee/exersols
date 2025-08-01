#include "protein_translation.h"

namespace protein_translation {
    vector<string> proteins(string rna) {
        vector<string> p;
        
        for (size_t i = 0; i < rna.size(); i+=3) {
            string codon = rna.substr(i, 3);
            
            if (codon == "AUG") {
                p.push_back("Methionine");
            } else if (codon == "UUU" || codon == "UUC") {
                p.push_back("Phenylalanine");
            } else if(codon == "UUA" || codon == "UUG") {
                p.push_back("Leucine");
            } else if(codon == "UCU" || codon == "UCC" || codon == "UCA" || codon == "UCG") {
                p.push_back("Serine");
            } else if (codon == "UAU" || codon == "UAC") {
                p.push_back("Tyrosine");
            } else if (codon == "UGU" || codon == "UGC") {
                p.push_back("Cysteine");
            } else if (codon == "UGG") {
                p.push_back("Tryptophan");
            } else if (codon == "UAA" || codon == "UAG" || codon == "UGA") {
                break; 
            }
        }

        return p;
    }
}  // namespace protein_translation
