import time

def multiply_matrices_int(matrix_a, matrix_b, n):
    result = [[0 for _ in range(n)] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            for k in range(n):
                result[i][j] += matrix_a[i][k] * matrix_b[k][j]
    return result

def multiply_matrices_double(matrix_a, matrix_b, n):
    result = [[0.0 for _ in range(n)] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            for k in range(n):
                result[i][j] += matrix_a[i][k] * matrix_b[k][j]
    return result

sizes = [64, 128, 256, 512, 1024]

for n in sizes:
    # Integer matrix multiplication timing
    start_sys_time = time.time()
    start_cpu_time = time.process_time()
    int_matrix_a = [[1 for _ in range(n)] for _ in range(n)]
    int_matrix_b = [[1 for _ in range(n)] for _ in range(n)]
    mult_start_time = time.time()
    int_result_matrix = multiply_matrices_int(int_matrix_a, int_matrix_b, n)
    mult_end_time = time.time()
    end_cpu_time = time.process_time()
    end_sys_time = time.time()
    
    print(f"Size={n}, Integer Matrix Multiplication:")
    print(f"System Time: {end_sys_time - start_sys_time:.9f} seconds")
    print(f"CPU Time: {end_cpu_time - start_cpu_time:.9f} seconds")
    print(f"Multiplication Time: {mult_end_time - mult_start_time:.9f} seconds")
    
    # Double matrix multiplication timing
    start_sys_time = time.time()
    start_cpu_time = time.process_time()
    double_matrix_a = [[1.0 for _ in range(n)] for _ in range(n)]
    double_matrix_b = [[1.0 for _ in range(n)] for _ in range(n)]
    mult_start_time = time.time()
    double_result_matrix = multiply_matrices_double(double_matrix_a, double_matrix_b, n)
    mult_end_time = time.time()
    end_cpu_time = time.process_time()
    end_sys_time = time.time()
    
    print(f"Size={n}, Double Matrix Multiplication:")
    print(f"System Time: {end_sys_time - start_sys_time:.9f} seconds")
    print(f"CPU Time: {end_cpu_time - start_cpu_time:.9f} seconds")
    print(f"Multiplication Time: {mult_end_time - mult_start_time:.9f} seconds")
