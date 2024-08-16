import matplotlib.pyplot as plt

# Data from the previous prompts
dimensions = [64, 128, 256, 512, 1024]

# System Time data
system_time_py_int = [0.022954, 0.17063, 1.32919, 11.820492, 121.910728]
system_time_py_float = [0.020769, 0.163134, 1.302475, 10.883227, 114.112407]
system_time_cpp_int = [0.004612, 0.0315005, 0.1914277, 1.6230697, 14.8837908]
system_time_cpp_float = [0.0028134, 0.024052, 0.2060596, 1.8347737, 20.0175612]

# Multiplication Time data
multiplication_time_py_int = [0.02184, 0.169531, 1.32919, 11.793606, 121.807019]
multiplication_time_py_float = [0.020769, 0.163134, 1.286003, 10.84738, 114.023086]
multiplication_time_cpp_int = [0.0045216, 0.0313255, 0.1910465, 1.6219184, 14.8782566]
multiplication_time_cpp_float = [0.0026935, 0.0237494, 0.2053793, 1.8324665, 20.0057027]

# Proportion data (Multiplication/System)
proportion_py_int = [0.951468154, 0.993559163, 1, 0.997725475, 0.999149304]
proportion_py_float = [1, 1, 0.987353308, 0.996706216, 0.999217254]
proportion_cpp_int = [0.980483997, 0.994444533, 0.998008648, 0.999290665, 0.999628173]
proportion_cpp_float = [0.957382526, 0.987418926, 0.996698528, 0.998742515, 0.999407595]

# Plotting System Time
# plt.figure(figsize=(10, 5))
# plt.plot(dimensions, system_time_cpp_int, 'o-', label='System time int (C++)')
# plt.plot(dimensions, system_time_cpp_float, 'o-', label='System time float (C++)')
# plt.plot(dimensions, system_time_py_int, 'o-', label='System time int (Python)')
# plt.plot(dimensions, system_time_py_float, 'o-', label='System time float (Python)')
# plt.xlabel('Dimension')
# plt.ylabel('System Time (seconds)')
# plt.title('System Time Comparison')
# plt.legend()
# plt.grid(True)
# plt.show()

# Plotting Multiplication Time
# plt.figure(figsize=(10, 5))
# plt.plot(dimensions, multiplication_time_cpp_int, 'o-', label='Multiplication time int (C++)')
# plt.plot(dimensions, multiplication_time_cpp_float, 'o-', label='Multiplication time float (C++)')
# plt.plot(dimensions, multiplication_time_py_int, 'o-', label='Multiplication time int (Python)')
# plt.plot(dimensions, multiplication_time_py_float, 'o-', label='Multiplication time float (Python)')
# plt.xlabel('Dimension')
# plt.ylabel('Multiplication Time (seconds)')
# plt.title('Multiplication Time Comparison')
# plt.legend()
# plt.grid(True)
# plt.show()

# Plotting Proportion (Multiplication/System)
plt.figure(figsize=(10, 5))
plt.plot(dimensions, proportion_cpp_int, 'o-', label='Proportion int (C++)')
plt.plot(dimensions, proportion_cpp_float, 'o-', label='Proportion float (C++)')
plt.plot(dimensions, proportion_py_int, 'o-', label='Proportion int (Python)')
plt.plot(dimensions, proportion_py_float, 'o-', label='Proportion float (Python)')
plt.xlabel('Dimension')
plt.ylabel('Proportion (Multiplication/System)')
plt.title('Proportion Comparison')
plt.legend()
plt.grid(True)
plt.show()
