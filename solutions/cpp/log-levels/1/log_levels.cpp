#include <string>

namespace log_line {
    std::string message(std::string line) {
        // return the message
        return line.substr(line.find(":") + 2); 
    }
    
    std::string log_level(std::string line) {
        // return the log level
        int start = line.find("[") + 1;
        int end = line.find("]"); 
        return line.substr(start, end - start); 
    }
    
    std::string reformat(std::string line) {
        // return the reformatted message
        return message(line) + " (" + log_level(line) + ")";
    }
}  // namespace log_line
