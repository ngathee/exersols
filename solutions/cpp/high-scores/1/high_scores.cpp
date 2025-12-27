#include "high_scores.h"

#include <algorithm>

namespace arcade {

std::vector<int> HighScores::list_scores() {
    return scores;
}

int HighScores::latest_score() {
    return scores.back();
}

int HighScores::personal_best() {
    std::vector<int>::iterator max_e  = std::max_element(scores.begin(), scores.end());
    return *max_e;
}

std::vector<int> HighScores::top_three() {
    std::vector<int> ts{scores.begin(), scores.end()};
    std::sort(ts.rbegin(), ts.rend());
    std::vector<int> ans{};
    ts.size() > 3 ? ans.assign(ts.begin(), ts.begin() + 3) : ans.assign(ts.begin(), ts.end());
    return ans;
}

}  // namespace arcade
