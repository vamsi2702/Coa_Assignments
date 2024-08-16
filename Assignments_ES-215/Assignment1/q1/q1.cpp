#include <iostream>
#include <chrono>
#include <vector>

using namespace std;

long long fibonacci_recursive(int n) {
    if (n <= 1) return n;
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2);
}

void list_fibonacci_loop(int n) {
    long long fib[50];
    fib[0] = 0;
    fib[1] = 1;
    cout << fib[0] << " " << fib[1] << " ";
    for (int i = 2; i < n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
        cout << fib[i] << " ";
    }
    cout << endl;
}

vector<long long> memo(50, -1);
long long fibonacci_memo_recursive(int n) {
    if (memo[n] != -1) return memo[n];
    if (n <= 1) return n;
    memo[n] = fibonacci_memo_recursive(n - 1) + fibonacci_memo_recursive(n - 2);
    return memo[n];
}

void list_fibonacci_memo_loop(int n) {
    vector<long long> memo(n, -1);
    memo[0] = 0;
    memo[1] = 1;
    cout << memo[0] << " " << memo[1] << " ";
    for (int i = 2; i < n; i++) {
        memo[i] = memo[i - 1] + memo[i - 2];
        cout << memo[i] << " ";
    }
    cout << endl;
}

void measure_time_and_print_fibonacci(int n) {
    chrono::steady_clock::time_point start, end;
    double time_recursive, time_loop, time_memo_recursive, time_memo_loop;

    start = chrono::steady_clock::now();
    for (int i = 0; i < n; i++) {
        cout << fibonacci_recursive(i) << " ";
    }
    cout << endl;
    end = chrono::steady_clock::now();
    time_recursive = chrono::duration<double>(end - start).count();
    cout << "Time taken by recursion: " << time_recursive << " seconds" << endl;

    start = chrono::steady_clock::now();
    list_fibonacci_loop(n);
    end = chrono::steady_clock::now();
    time_loop = chrono::duration<double>(end - start).count();
    cout << "Time taken by loop: " << time_loop << " seconds" << endl;

    start = chrono::steady_clock::now();
    for (int i = 0; i < n; i++) {
        cout << fibonacci_memo_recursive(i) << " ";
    }
    cout << endl;
    end = chrono::steady_clock::now();
    time_memo_recursive = chrono::duration<double>(end - start).count();
    cout << "Time taken by recursion with memoization: " << time_memo_recursive << " seconds" << endl;

    start = chrono::steady_clock::now();
    list_fibonacci_memo_loop(n);
    end = chrono::steady_clock::now();
    time_memo_loop = chrono::duration<double>(end - start).count();
    cout << "Time taken by loop with memoization: " << time_memo_loop << " seconds" << endl;

    cout << "Speedup of loop over recursion: " << time_recursive / time_loop << endl;
    cout << "Speedup of recursion with memoization over recursion: " << time_recursive / time_memo_recursive << endl;
    cout << "Speedup of loop with memoization over recursion: " << time_recursive / time_memo_loop << endl;
}

int main() {
    int n = 50;
    measure_time_and_print_fibonacci(n);
    return 0;
}
