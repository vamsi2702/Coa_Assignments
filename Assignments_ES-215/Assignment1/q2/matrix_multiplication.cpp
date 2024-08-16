#include <iostream>
#include <vector>
#include <ctime>
#include <iomanip>

using namespace std;

// Function to multiply integer matrices
void multiplyIntegerMatrices(const vector<vector<int>>& mat1, const vector<vector<int>>& mat2, vector<vector<int>>& result, int size) {
    for (int i = 0; i < size; ++i) {
        for (int j = 0; j < size; ++j) {
            result[i][j] = 0;
            for (int k = 0; k < size; ++k) {
                result[i][j] += mat1[i][k] * mat2[k][j];
            }
        }
    }
}

// Function to multiply floating-point matrices
void multiplyFloatingPointMatrices(const vector<vector<double>>& mat1, const vector<vector<double>>& mat2, vector<vector<double>>& result, int size) {
    for (int i = 0; i < size; ++i) {
        for (int j = 0; j < size; ++j) {
            result[i][j] = 0.0;
            for (int k = 0; k < size; ++k) {
                result[i][j] += mat1[i][k] * mat2[k][j];
            }
        }
    }
}

// Function to print elapsed time
void printElapsedTime(const struct timespec& start, const struct timespec& end, const string& label) {
    double elapsed = (end.tv_sec - start.tv_sec) * 1e9;
    elapsed = (elapsed + (end.tv_nsec - start.tv_nsec)) * 1e-9;
    cout << label << fixed << elapsed << setprecision(9) << " seconds" << endl;
}

int main() {
    int sizes[] = {64, 128, 256, 512, 1024};
    
    for (int size : sizes) {
        struct timespec startSys, endSys, startCpu, endCpu;

        // Record system and CPU start times
        clock_gettime(CLOCK_MONOTONIC, &startSys);
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &startCpu);

        vector<vector<int>> matInt1(size, vector<int>(size, 1));
        vector<vector<int>> matInt2(size, vector<int>(size, 1));
        vector<vector<int>> resultInt(size, vector<int>(size, 0));

        struct timespec startMult, endMult;

        clock_gettime(CLOCK_MONOTONIC, &startMult);

        // Perform integer matrix multiplication
        multiplyIntegerMatrices(matInt1, matInt2, resultInt, size);

        clock_gettime(CLOCK_MONOTONIC, &endMult);

        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &endCpu);
        clock_gettime(CLOCK_MONOTONIC, &endSys);

        cout << "Size=" << size << ", Integer Matrix Multiplication: " << endl;
        printElapsedTime(startSys, endSys, "System Time: ");
        printElapsedTime(startCpu, endCpu, "CPU Time: ");
        printElapsedTime(startMult, endMult, "Multiplication Time: ");

        double propMultSys = (endMult.tv_sec - startMult.tv_sec) * 1e9;
        propMultSys = (propMultSys + (endMult.tv_nsec - startMult.tv_nsec)) * 1e-9;
        double systemTime = (endSys.tv_sec - startSys.tv_sec) * 1e9;
        systemTime = (systemTime + (endSys.tv_nsec - startSys.tv_nsec)) * 1e-9;
        cout << "Proportion (Multiplication/System): " << fixed << setprecision(9) << (propMultSys / systemTime) << endl;

        clock_gettime(CLOCK_MONOTONIC, &startSys);
        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &startCpu);

        vector<vector<double>> matFloat1(size, vector<double>(size, 1.0));
        vector<vector<double>> matFloat2(size, vector<double>(size, 1.0));
        vector<vector<double>> resultFloat(size, vector<double>(size, 0.0));

        clock_gettime(CLOCK_MONOTONIC, &startMult);

        // Perform floating-point matrix multiplication
        multiplyFloatingPointMatrices(matFloat1, matFloat2, resultFloat, size);

        clock_gettime(CLOCK_MONOTONIC, &endMult);

        clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &endCpu);
        clock_gettime(CLOCK_MONOTONIC, &endSys);

        cout << "Size=" << size << ", Floating-Point Matrix Multiplication: " << endl;
        printElapsedTime(startSys, endSys, "System Time: ");
        printElapsedTime(startCpu, endCpu, "CPU Time: ");
        printElapsedTime(startMult, endMult, "Multiplication Time: ");

        propMultSys = (endMult.tv_sec - startMult.tv_sec) * 1e9;
        propMultSys = (propMultSys + (endMult.tv_nsec - startMult.tv_nsec)) * 1e-9;
        systemTime = (endSys.tv_sec - startSys.tv_sec) * 1e9;
        systemTime = (systemTime + (endSys.tv_nsec - startSys.tv_nsec)) * 1e-9;
        cout << "Proportion (Multiplication/System): " << fixed << setprecision(9) << (propMultSys / systemTime) << endl;
    }

    return 0;
}
