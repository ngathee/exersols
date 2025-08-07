#include "matching_brackets.h"
#include <stack> 
namespace matching_brackets {
    bool check(const string& s) {
        stack<char> brackets;

        for (const char c : s) {
            switch(c) {
                case '(': 
                case '[':
                case '{':
                    brackets.push(c);
                    break;
                case ')':
                    if (brackets.empty() || brackets.top() != '(' ){
                        return false;
                    }
                    brackets.pop();
                    break;
                case ']':
                    if (brackets.empty() || brackets.top() != '[' ){
                        return false;
                    }
                    brackets.pop();
                    break;
                case '}':
                    if (brackets.empty() || brackets.top() != '{' ){
                        return false;
                    }
                    brackets.pop();
                    break; 
                default:
                    break; 
            }
        }

        return brackets.empty();
    }
}  // namespace matching_brackets
