#include <string>
#include <vector>

namespace election {

// The election result struct is already created for you:

struct ElectionResult {
    std::string name{};
    int votes{};
};

int vote_count(ElectionResult& election_result) {
    return election_result.votes; 
}

void increment_vote_count(ElectionResult& election_results, int votes) {
    election_results.votes += votes;
}

ElectionResult& determine_result(std::vector<ElectionResult>& final_count) {
    ElectionResult* winner = &final_count[0];
    
    for(auto& candidate : final_count) {
        if (candidate.votes > winner->votes) {
            winner = &candidate; 
        }
    }
    
    winner->name = "President " + winner->name; 
    return *winner;
}

}  // namespace election