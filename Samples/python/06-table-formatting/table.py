a1, a2, a3, a4 = 1, 2, 3, 4

# More on String formatting: https://docs.python.org/3/library/string.html#format-string-syntax
print(
    f"{'a':>10} {'a^2':<10} {'a^3':<10}\n"
    f"{a1:10} {a1 * a1:<10} {a1 ** 3:<10}\n"
    f"{a2:10} {a2 * a2:<10} {a2 ** 3:<10}\n"
    f"{a3:10} {a3 * a3:<10} {a3 ** 3:<10}\n"
    f"{a4:10} {a4 * a4:<10} {a4 ** 3:<10}"
)