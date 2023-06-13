#include <iostream>     // io stream
#include <fstream>      // file stream
#include <ostream>
#include <string>

void extract_json_values(const std::string& file_path)
{
    std::ifstream file(file_path);      // read file into ifstream
    if(!file.is_open()){
        std::cout<< "Failed to open the file." << std::endl;
        return;
    }

    std::string line;
    while(std::getline(file, line)){    // get lines one by one
        // Skip empty lines or lines containing only white spaces
        if (line.empty() || line.find_first_not_of(' ') == std::string::npos ){
            continue;
        }

        // Ignore lines starting with "//" as comments
        if (line.find("//") == 0) {
            continue;
        }

        // Check if the line represents a property
        size_t colon_pos = line.find(":");
        if(colon_pos != std::string::npos) {
            std::string key = line.substr(0, colon_pos);
            std::string value = line.substr(colon_pos + 1);

            // Remove leading/trailing whitespace and quotes from the value
            value.erase(0, value.find_first_not_of(" \""));
            value.erase(value.find_last_not_of(" \",") + 1);

            // Remove leading/trailing whitespace and quotes from the key
            key.erase(0, key.find_first_not_of(" \""));
            key.erase(key.find_last_not_of(" \"") + 1);

            std::cout << key << ":" << value<<std::endl;

            // string
            // number
            // array
            // nested structure

        }
    }
}

int main()
{
    extract_json_values("./simple.json");
    return 0;
}
