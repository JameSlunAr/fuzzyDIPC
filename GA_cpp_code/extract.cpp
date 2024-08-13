#include <iostream>
#include <fstream>
#include <vector>

int main() {
    std::ifstream input("input.txt");
    if (!input.is_open()) {
        std::cerr << "Error opening input.txt\n";
        return 1;
    }

    // Open output files
    std::ofstream output1("output1.txt");
    if (!output1.is_open()) {
        std::cerr << "Error opening output1.txt\n";
        return 1;
    }

    std::ofstream output2("output2.txt");
    if (!output2.is_open()) {
        std::cerr << "Error opening output2.txt\n";
        return 1;
    }

    // Process each set of k and cost
    while (!input.eof()) {
        std::vector<double> k_values;
        double cost;

        for (int i = 0; i < 6; ++i) {
            double value;
            if (!(input >> value)) {
                break;  // Reached end of file
            }
            k_values.push_back(value);
        }

        if (k_values.size() == 6) {
            if (!(input >> cost)) {
                std::cerr << "Error reading cost from input.txt\n";
                return 1;
            }

            // Write to output1.txt
            for (const auto& k : k_values) {
                output1 << k << ' ';
            }
            output1 << cost << '\n';

            // Write to output2.txt
            output2 << cost << '\n';
        }
    }

    // Close files
    input.close();
    output1.close();
    output2.close();

    std::cout << "Files written successfully.\n";

    return 0;
}
