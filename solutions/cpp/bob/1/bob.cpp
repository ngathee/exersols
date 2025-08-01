#include "bob.h"
#include<algorithm> 

using namespace std; 

namespace bob {
    bool isQuestion(const string& msg) {
        return msg.back() == '?';
    }

    bool lettersAreCaps(const string& msg) {
        int capsCount{0};
        for (const char c : msg) {
            if (isalpha(c)) {
                if (!isupper(c)) 
                    return false;
                else 
                    capsCount++;
            } else {
                continue; 
            }
        }
        
        return (capsCount > 0);
    }

    bool isSilence(const string& msg) {
        if (msg.empty()) return true;
        for (const char c : msg) {
            if (!isspace(c)) return false;
        }
        return true; 
    }

    string hey(string msg) {
        msg.erase(msg.find_last_not_of(" \t\n\r\f\v") + 1);
        string answer{"Whatever."};
        
        if (isSilence(msg)) {
            return "Fine. Be that way!";
        }
        
        if (lettersAreCaps(msg)) {
            if (isQuestion(msg))
                return "Calm down, I know what I'm doing!";
            else 
                return "Whoa, chill out!";
        }
        
        if (isQuestion(msg)) {
            return "Sure.";
        }
        
        return answer; 
    }

}  // namespace bob
